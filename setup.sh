#!/usr/bin/env sh

#set -x

HASH=`md5sum -c MD5SUM 2> /dev/null`

if [ "emacs-24.5.tar.xz: OK" != "$HASH" ]
then
    wget -v -O emacs-24.5.tar.xz https://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.xz
fi

sudo apt-get install build-essential
sudo apt-get -y build-dep emacs24

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
    USER=$(getent passwd $UID1 | cut -d: -f1)
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
