execute "set timezone" do
	command "cp #{node.timezone} /etc/localtime"
end
