directory "#{ENV['HOME']}/Applications"

case node['platform_family']
when "mac_os_x"
	dmg_package "virtualbox-osx" do
		destination "#{ENV['HOME']}/Applications"
		source "http://download.virtualbox.org/virtualbox/4.2.6/VirtualBox-4.2.6-82870-OSX.dmg"
		type "mpkg"
	end
else
	package "virtualbox" do
		action :install
	end
end
