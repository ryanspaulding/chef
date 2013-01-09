directory "#{ENV['HOME']}/bin"


if node.run_list.role_names.to_s =~ /linuxbox/ or node.run_list.role_names.to_s =~ /macbox/ 
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
