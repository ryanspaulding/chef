#!/bin/bash

# need to get the system setup enough to get chef solo to do the 
OS="ubuntu" # default
pkg_mger="apt-get"
# Figure out the OS type, for now it is either Ubuntu or CentOS
if [ -e "/usr/bin/lsb_release" ]
then
	lsb_release -a | grep -qi ubuntu
	is_ubuntu=$?
	if [ "${is_ubuntu}" -eq 0 ]
	then
		for i in `dpkg --get-selections | grep grub | grep install`
		do
			echo "$i hold" | dpkg --set-selections
		done
	fi

elif [ -e "/etc/centos-release" ]
then
	OS="centos"
	pkg_mger="yum"
fi

# update the box 
echo "Updating the box..."
if [ "$OS" == "ubuntu" ]
then
	echo "OS is $OS"
	#${pkg_mger} -y upgrade
elif [ "$OS" == "centos" ]
then
	echo "OS is $OS"
	#${pkg_mger} -y update
fi

# install ruby gems
if [ ! -e "/usr/bin/gem" ]
then
	echo "Installing ruby gems"
	${pkg_mger} -y install rubygems
else
	echo "Ruby Gems already installed"
fi

# install git 
if [ ! -e "/usr/bin/git" ]
then
	echo "Installing git"
	${pkg_mger} -y install git
else
	echo "Git already installed"
fi

# install chef 
gem list | grep -q chef
has_chef=$?
if [ "${has_chef}" -eq 1 ]
then
	echo "Installing chef"
	gem install -y chef
else
	echo "Chef already installed"
fi

# setup chef

test -e /etc/chef || mkdir /etc/chef

# create /etc/chef/solo.rb
cat << 'SOLO' > /etc/chef/solo.rb
file_cache_path "/var/chef-solo"
cookbook_path "/var/chef-solo/cookbooks"
role_path "/var/chef-solo/roles"
SOLO

if [ ! -e "/var/chef-solo" ]
then
	git clone https://github.com/ryanspaulding/chef.git /var/chef-solo
	cd /var/chef-solo && git submodule init && git submodule update
else
	cd /var/chef-solo && git pull origin master && git submodule update
fi

# create run_list (chef.json) under /var/chef-solo/
cat << 'RUN' > /var/chef-solo/runlist.json
{ "run_list": "role[devbox]" }
RUN

# run chef 
chef-solo -j /var/chef-solo/runlist.json

