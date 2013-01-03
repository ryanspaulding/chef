directory "#{ENV['HOME']}/bin"

case node['platform']
when "mac_os_x"
	cookbook_file "#{ENV['HOME']}/bin/chefme.sh" do
		source "chefme.sh"
		mode 0755
	end
		
else
	cookbook_file "/usr/local/bin/chefme.sh" do
		source "chefme.sh"
		mode 0755
		owner "root"
		group "root"
	end
end
