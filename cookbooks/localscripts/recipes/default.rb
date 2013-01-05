directory "#{ENV['HOME']}/bin"

cookbook_file "#{ENV['HOME']}/bin/lock_file.sh" do
	mode 0755	
end

cookbook_file "#{ENV['HOME']}/bin/show_pass.sh" do
	mode 0755	
end

cookbook_file "#{ENV['HOME']}/bin/unlock_file.sh" do
	mode 0755	
end
