#!/usr/bin/env sh

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

echo "(load-file \"`pwd`/emacs.d/custom.el\")" > ~/.emacs

sudo ln -sf `pwd`/run.sh /usr/bin/emacs
