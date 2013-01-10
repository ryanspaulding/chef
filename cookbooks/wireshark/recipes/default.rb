
execute "install wireshark" do
	command "~/homebrew/bin/brew install wireshark" 
	not_if "~/homebrew/bin/brew list | grep -q wireshark"
end
