cookbook_file "/usr/local/bin/chefme.sh" do
	source "chefme.sh"
	mode 0755
	owner "root"
	group "root"
end
