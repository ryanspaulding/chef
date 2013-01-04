directory "#{ENV['HOME']}/Applications"

dmg_package "Dropbox" do
	destination "#{ENV['HOME']}/Applications"
	volumes_dir "Dropbox Installer"
  	source "http://www.dropbox.com/download?plat=mac"
	action :install
end
