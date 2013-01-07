directory "#{ENV['HOME']}/bin"

cookbook_file "#{ENV['HOME']}/.bash_profile" do
	source "bash_profile"
	mode 0755	
end

cookbook_file "#{ENV['HOME']}/.bashrc" do
	source "bashrc"
	mode 0755	
end

