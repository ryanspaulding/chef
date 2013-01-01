#/bin/bash

echo "Updating cookbooks and roles..."
cd /var/chef-solo && git pull origin master && git submodule update
echo "Chefing...."
chef-solo -j /var/chef-solo/runlist.json
