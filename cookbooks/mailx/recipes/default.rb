#
# Cookbook Name:: mailx
# Recipe:: default
#
# Copyright 2016, Dimension Data
#
# All rights reserved - Do Not Redistribute
#

package node['mailx']['mailx-package'] do
  action :install
end
