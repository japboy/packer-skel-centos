#!/usr/bin/env bash

##
# Initial settings

# Disable requiretty
sudo sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers


##
# Vagrant

mkdir -pm 700 /home/vagrant/.ssh
curl -L https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -o /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh


##
# VirtualBox

cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$(cat /home/vagrant/.vbox_version).iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions_*.iso


##
# Clean up

if grep -q -i "release 6" /etc/redhat-release
then
  rm /etc/udev/rules.d/70-persistent-net.rules
fi

rm -rf /dev/.udev/
sed -i "/^HWADDR/d" /etc/sysconfig/network-scripts/ifcfg-enp0s3

yum -y clean all

rm -rf /tmp/*
