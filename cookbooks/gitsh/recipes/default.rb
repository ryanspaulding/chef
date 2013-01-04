
execute "install git-sh" do
	command "~/homebrew/bin/brew instsall git-sh" 
	not_if "~/homebrew/bin/brew list | grep -q git-sh"
end
