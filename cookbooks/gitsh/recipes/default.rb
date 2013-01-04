
execute "install git-sh" do
	command "~/homebrew/bin/brew install git-sh" 
	not_if "~/homebrew/bin/brew list | grep -q git-sh"
end
