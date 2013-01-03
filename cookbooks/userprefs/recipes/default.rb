

execute "set_window_double_click" do
	command "defaults write #{ENV['HOME']}/Library/Preferences/.GlobalPreferences.plist AppleMiniaturizeOnDoubleClick -bool TRUE"
end
