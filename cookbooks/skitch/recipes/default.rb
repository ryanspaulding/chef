directory "#{ENV['HOME']}/Applications"

dmg_package "Skitch" do
	destination "#{ENV['HOME']}/Applications"
  	source "Skitch.dmg"
	action :install
end
