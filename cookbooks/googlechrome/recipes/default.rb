directory "#{ENV['HOME']}/Applications"

dmg_package "Google Chrome" do
	destination "#{ENV['HOME']}/Applications"
	source "https://dl-ssl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg"
	action :install
end
