directory "#{ENV['HOME']}/bin"

case node['platform']
when "mac_os_x"
	template "#{ENV['HOME']}/bin/chefme.sh" do
		source "chefme.erb"
		mode 0755
		variables(:chefhome => "#{ENV['HOME']}/chef-solo")
	end
		
else
	template "/usr/local/bin/chefme.sh" do
		source "chefme.erb"
		mode 0755
		owner "root"
		group "root"
		variables(:chefhome => "/var/chef")
	end
end
