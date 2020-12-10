#!/bin/bash

yum -y install https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm

yum -y install rubygems rubygem-bundler rubygem-rake

sudo -u vagrant -i <<_X_
cd /home/vagrant
gem install serverspec
gem install highline
_X_
