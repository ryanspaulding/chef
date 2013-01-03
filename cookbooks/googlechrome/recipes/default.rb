directory "#{ENV['HOME']}/Applications"

case node['platform_family']
when "mac_os_x"
	dmg_package "Google Chrome" do
		destination "#{ENV['HOME']}/Applications"
		source "https://dl-ssl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg"
		action :install
	end
else
	package "chrome" do
		action :install
	end
end
