directory "#{ENV['HOME']}/Applications"

case node['platform_family']
when "mac_os_x"
	cookbook_file "~/bin/chefme.sh" do
		source "chefme.sh"
		mode 0755
		owner "root"
		group "root"
	end
		
else
	cookbook_file "/usr/local/bin/chefme.sh" do
		source "chefme.sh"
		mode 0755
		owner "root"
		group "root"
	end
end
