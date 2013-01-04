directory "#{ENV['HOME']}/Applications"

# note when you open Sequel Pro the first time it will want to patch itself

dmg_package "Sequel Pro" do
	destination "#{ENV['HOME']}/Applications"
  	source "http://sequel-pro.googlecode.com/files/Sequel_Pro_0.9.9.1.dmg"
	volumes_dir "Sequel Pro 0.9.9.1"
	action :install
end
