#!/bin/sh

DOWNLOAD_DIR="$HOME/Downloads"
REPO_URL="https://github.com/joshuagrisham/samsung-galaxybook-extras.git"
DRIVER_DIR="samsung-galaxybook-extras/driver"

cd $DOWNLOAD_DIR
git clone $REPO_URL
cd $DRIVER_DIR

make -C /lib/modules/$(uname -r)/build M=$PWD
sudo make -C /lib/modules/$(uname -r)/build M=$PWD modules_install
sudo depmod
sudo modprobe samsung-galaxybook debug=true

cd ..
sudo ./install-extras.sh
