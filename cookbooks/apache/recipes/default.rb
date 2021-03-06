#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd" do
  action :install
end

ruby_block "randomly_choose_language" do
  block do
    node.run_state['scripting_language'] = Random.rand > 0.5 ? "php" : "perl"
  end
end

# This allows dynamic setting of the package name at runtime (via the run_state)
package "scripting_language" do
  package_name lazy {
    # puts "Run language selected : #{node.run_state['scripting_language']}"
    node.run_state['scripting_language']
  }
  action :install
end

# Disable the default virtual host
apache_vhost "welcome" do
  action :remove
  notifies :restart, "service[httpd]"
end

# Iterate over the apache sites
node["apache"]["sites"].each do |site_name, site_data|
  # Enable and apache virtual host
  apache_vhost site_name do
    site_port site_data["port"]
    action :create
    notifies :restart, "service[httpd]"
  end
end

service "httpd" do
  action [:enable, :start]
end
