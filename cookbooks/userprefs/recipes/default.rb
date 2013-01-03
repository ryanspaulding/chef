

execute "set_window_double_click" do
	command "defaults write #{ENV['HOME']}/Library/Preferences/.GlobalPreferences.plist AppleMiniaturizeOnDoubleClick -bool TRUE"
	not_if "defaults read ~/Library/Preferences/.GlobalPreferences.plist AppleMiniaturizeOnDoubleClick | grep -q 1"
end
