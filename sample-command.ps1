
knife client list

knife cookbook upload -a
knife cookbook upload apache

#Static code rule anaylsis
foodcritic cookbooks/apache
foodcritic cookbooks/apache -t ~FC003 -t ~FC009

