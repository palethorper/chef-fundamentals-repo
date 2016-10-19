default_action :create

action :create do 
	log "\n\nMy name is #{new_resource.name}\n\n"
end
