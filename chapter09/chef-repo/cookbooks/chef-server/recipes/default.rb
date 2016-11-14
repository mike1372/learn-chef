# Copyright (C) 2014
#
#
#

chef_server_url = node['chef-server']['url']
chef_server_name = ::File.basename(chef_server_url)
chef_server_local_path = "#{Chef::Config[:file_cache_path]}/#{chef_server_name}"

chef_manage_url = node['chef-manage']['url']
chef_manage_name = ::File.basename(chef_manage_url)
chef_manage_local_path = "#{Chef::Config[:file_cache_path]}/#{chef_manage_name}"

# Download the Chef Server
remote_file chef_server_local_path do
  source chef_server_url
end

# Download the Chef Management Console
remote_file chef_manage_local_path do
  source chef_manage_url
end

# Install the Chef Server
package chef_server_name do
  source chef_server_local_path
  provider Chef::Provider::Package::Rpm
  notifies :run, 'execute[chef server reconfigure]', :immediately
end

# Install the Chef Management Console
package chef_manage_name do
  source chef_manage_local_path
  provider Chef::Provider::Package::Rpm
  notifies :run, 'execute[chef server reconfigure]', :immediately
end

# Reconfigure the installation - needed after installing things
execute 'chef server reconfigure' do
  command 'chef-server-ctl reconfigure'
  action :nothing
end
