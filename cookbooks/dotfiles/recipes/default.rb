
cookbook_file "#{ENV['HOME']}/.bash_profile" do
	source "bash_profile"
	mode 0755	
end

cookbook_file "#{ENV['HOME']}/.bashrc" do
	source "bashrc"
	mode 0755	
end

cookbook_file "#{ENV['HOME']}/.vimrc" do
	source "vimrc"
	mode 0755	
end

cookbook_file "#{ENV['HOME']}/bin/git-completion.bash" do
	mode 0755	
end

template "#{ENV['HOME']}/.gitconfig" do
	source "gitconfig.erb"
	variables(:gitname => node.gitname, :gitemail => node.gitemail)	
end

if node.run_list.role_names.to_s =~ /macbox/ 
	cookbook_file "#{ENV['HOME']}/.ssh/config" do
		source "mac_ssh_config"
		mode 700 
	end
end
