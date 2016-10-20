case node['platform']
when "ubuntu"
  default['mailx']['mailx-package'] = "mailutils"
when "centos"
  default['mailx']['mailx-package'] = "mailx"
end
