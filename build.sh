#!/bin/sh

# Install utils
yum install -y wget tar sudo bzip2 rpm-build logrotate git

# Fix for sudo
sed -i "s/requiretty/\!requiretty/" /etc/sudoers

# Clone Orion repository
mkdir -p /home/vagrant
git clone https://github.com/telefonicaid/fiware-orion.git /home/vagrant/fiware-orion

# Checkout latest version
cd /home/vagrant/fiware-orion
git checkout 0.20.0

# Run build scripts
sh ./scripts/bootstrap/centos65.sh

# Build Orion
make install

# Cleaning
cd /root
rm -rf /home/vagrant
yum clean all