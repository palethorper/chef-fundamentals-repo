
knife client list

knife cookbook upload -a
knife cookbook upload apache

knife upload data_bags

knife role from file base.rb web.rb

#Static code rule anaylsis
foodcritic cookbooks/apache
foodcritic cookbooks/apache -t ~FC003 -t ~FC009

# Create new cook book
# The "create version is going to be depricated"
knife generate cookbook blah
