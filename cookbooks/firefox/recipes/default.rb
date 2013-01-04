directory "#{ENV['HOME']}/Applications"

get_latest = Mixlib::ShellOut.new("curl -q -X GET http://download.cdn.mozilla.net/pub/mozilla.org/firefox/releases/latest/mac/en-US/ | grep '.dmg' | sed 's/^.*\=\"Fire/Fire/' | sed 's/.dmg\">.*$/.dmg/g'")

firefox_latest = get_latest.run_command

log firefox_latest

dmg_package "Firefox" do
	destination "#{ENV['HOME']}/Applications"
  	source "http://download.cdn.mozilla.net/pub/mozilla.org/firefox/releases/latest/mac/en-US/#{firefox_latest}"
	action :install
end
