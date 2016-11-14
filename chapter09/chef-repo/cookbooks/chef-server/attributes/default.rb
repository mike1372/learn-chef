default['chef-server']['url'] = 'https://packages.chef.io/stable/el/6/chef-server-core-12.10.0-1.el6.x86_64.rpm'
chef_server_url = node['chef-server']['url']
chef_server_name = ::File.basename(chef_server_url)

default['chef-manage']['url'] = 'https://packages.chef.io/stable/el/6/chef-manage-2.4.4-1.el6.x86_64.rpm'
chef_manage_url = node['chef-manage']['url']
chef_manage_name = ::File.basename(chef_manage_url)
