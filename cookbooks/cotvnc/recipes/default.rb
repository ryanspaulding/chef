directory "#{ENV['HOME']}/Applications"

dmg_package "Chicken of the VNC" do
	destination "#{ENV['HOME']}/Applications"
  	source "cotvnc-20b4.dmg"
	action :install
end
