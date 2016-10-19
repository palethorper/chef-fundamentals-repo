default_action :create

action :create do 
	puts "\n\nMy name is #{new_resource.name}\n\n"
end
