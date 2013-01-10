#!/bin/bash

ruby_version="1.9.3-p362"

# ssh key setup 
if [ ! -e ~/.ssh/id_rsa ]
then
	echo "Generating ssh key pair"
	ssh-keygen -t rsa
else
	echo "ssh key pair present"
fi

# brew installed
if [ ! -e ~/homebrew/bin/brew ]
then
	echo "Installing brew"
	mkdir homebrew && curl -L https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C homebrew
else
	echo "brew already installed"
fi

export PATH=~/homebrew/bin/:${PATH}

grep -q 'homebrew/bin' ~/.bashrc
has_brew_path=$?
if [ "${has_brew_path}" -eq 1 ]
then
	echo "export PATH=~/homebrew/bin/:${PATH}" >> ~/.bashrc
fi

grep -qa '~/bin' ~/.bashrc
has_bin_path=$?
if [ "${has_bin_path}" -eq 1 ]
then
	echo 'export PATH=~/bin:${PATH}' >> ~/.bashrc
fi

# get git installed
if [ ! -e ~/homebrew/bin/git ]
then
        if [ ! -e /usr/bin/git ]
        then
                echo "Installing git.."
                brew install git
        else
                echo "Git already installed"
        fi
else
        echo "Git already installed"
fi

# get rbenv installed
if [ ! -e ~/homebrew/bin/rbenv ]
then
	echo "Installing rbenv"
	brew install rbenv
	echo "export PATH=~/.rbenv/bin:${PATH}" >> ~/.bashrc
	echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bashrc
	export PATH=~/.rbenv/bin:${PATH}
	eval "$(rbenv init -)"
else
	echo "rbenv already installed"
fi

# install ruby-build via brew
if [ ! -e ~/homebrew/bin/ruby-build ]
then
	echo "Installing ruby-build"
	brew install ruby-build
else 
	echo "ruby-build already installed"
fi

# install ruby 
if [ ! -e ~/.rbenv/shims/ruby ]
then 
	echo "Installing ruby $ruby_version"
	rbenv install "${ruby_version}"
	rbenv global "${ruby_version}"
	rbenv rehash
else
	echo "ruby $ruby_version is already installed"
fi

# install chef 
if [ ! -e ~/.rbenv/shims/chef-solo ]
then
	echo "Installing chef"
	gem install -y chef
	rbenv rehash
else
	echo "Chef already installed"
fi

# run chef? 
if [ ! -e ~/chef-solo ]
then
	git clone https://github.com/ryanspaulding/chef.git ~/chef-solo
	cd ~/chef-solo && git submodule init && git submodule update
else
	cd ~/chef-solo && git pull origin master && git submodule update
fi

echo "file_cache_path \"$HOME/chef-solo\"" > ~/chef-solo/solo.rb
echo "cookbook_path \"$HOME/chef-solo/cookbooks\"" >> ~/chef-solo/solo.rb
echo "role_path \"$HOME/chef-solo/roles\"" >> ~/chef-solo/solo.rb
echo "file_backup_path \"$HOME/chef-solo/backups\"" >> ~/chef-solo/solo.rb
echo "cache_type \"BasicFile\"" >> ~/chef-solo/solo.rb
echo "cache_options({ :path => \"$HOME/chef-solo/cache/checksums\", :skip_expires => true })" >> ~/chef-solo/solo.rb

cat << 'RUN' > ~/chef-solo/runlist.json
{ "run_list": "role[macbox]" }
RUN

# run chef
chef-solo -j ~/chef-solo/runlist.json -c ~/chef-solo/solo.rb
