#!/bin/sh

# lucid for 10.04, maverick for 10.10
UBUNTU_VERSION=lucid

sudo apt-get install python-software-properties # so we can call add-apt-repository
sudo add-apt-repository "deb http://archive.canonical.com/ $UBUNTU_VERSION partner"
sudo apt-get update   
sudo apt-get install sun-java6-jre sun-java6-plugin
sudo update-alternatives --config java