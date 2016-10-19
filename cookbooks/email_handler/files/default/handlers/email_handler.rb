require 'rubygems'
require 'pony'

module MyCompany
	class EmailMe < Chef::Handler

		def initialize(from_address, to_address)
			@from_address = from_address
			@to_address = to_address
		end

		def report
			status = success? ? "Successful" : "Failed"

			subject = "#{status} Chef run report from #{node.name}"

			body = ""
			if run_status.updated_resources.empty?
				body += "No resources changed by chef-client\n"
			else
				# get some info about all the changed resources!
				run_status.updated_resources.each do |r|
					body += "The resource #{r.name} was changed in cookbook
					#{r.cookbook_name} at #{r.source_line}\n"
				end
			end

			Pony.mail(:to => @to_address,
				:from => @from_address,
				:subject => subject,
				:body => body)
			
		end

	end
end
