#!/usr/bin/env bash

set -e

if [[ $EUID -ne 0 ]]
then
    echo "This script must be run as root." 1>&2
    exit 1
fi

if [ -f emacs-24.5.tar.xz ]
then
    HASH=$(md5sum -c MD5SUM 2> /dev/null)
fi

if [ "emacs-24.5.tar.xz: OK" != "$HASH" ]
then
    wget -v -O emacs-24.5.tar.xz https://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.xz
fi


# # Novell SuSE---> /etc/SuSE-release
# # Red Hat--->/etc/redhat-release, /etc/redhat_version
# # Fedora-->/etc/fedora-release
# # Slackware--->/etc/slackware-release, /etc/slackware-version
# # Old Debian--->/etc/debian_release, /etc/debian_version
# # New Debian--->/etc/os-release
# # Mandrake--->/etc/mandrake-release
# # Yellow dog-->/etc/yellowdog-release
# # Sun JDS--->/etc/sun-release
# # Solaris/Sparc--->/etc/release
# # Gentoo--->/etc/gentoo-release

if [ -f /etc/fedora-release ]
then
    PACKAGE_MANAGER=dnf
    BUILDDEP=builddep
    BUILDESSENTIAL=@development-tools
    EMACS=emacs
elif [ -f /etc/lsb-release ]
then
    PACKAGE_MANAGER=apt-get
    BUILDDEP=build-dep
    BUILDESSENTIAL=build-essential
    EMACS=emacs24
fi

sudo $PACKAGE_MANAGER -y install $BUILDESSENTIAL tar
sudo $PACKAGE_MANAGER -y $BUILDDEP $EMACS


tar xvf emacs-24.5.tar.xz
cd emacs-24.5
./configure
make -j 4
sudo make install
cd ..

TOP_DIR=$(pwd)
UID_LIST=$(cut -d: -f3 /etc/passwd)

for UID1 in $UID_LIST
do
    entry="$(getent passwd $UID1)"
    if [ "${entry##*bash}" ]
    then
        continue
    fi
    USER=$(echo $entry | cut -d: -f1)
    sudo su $USER -c '
        if [ -n "$HOME" ]
        then
            echo "(load-file \"$(pwd)/emacs.d/custom.el\")" > $HOME/.emacs
        fi
    '
done

sudo ln -sf $TOP_DIR/run.sh /usr/bin/emacs
sudo ln -sf $TOP_DIR/run.sh /usr/local/bin/emacs

sudo ln -sf $TOP_DIR/kill_emacs.sh /etc/init.d/kill_emacs
sudo ln -sf /etc/init.d/kill_emacs /etc/rc0.d/K99kill_emacs
sudo ln -sf /etc/init.d/kill_emacs /etc/rc6.d/K99kill_emacs

#if [ $(grep "alias killemacs=" ~/.bashrc) -eq 0 ]
#then
#    echo "alias killemacs='emacsclient -e \"(kill-emacs)\"'" >> ~/.bashrc
#else
#    echo "Else: "
#    grep "alias killemacs=" ~/.bashrc
#fi
