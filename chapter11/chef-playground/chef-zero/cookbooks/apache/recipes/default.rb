#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Install apache
package 'httpd'

# Get the service up and running
service 'httpd' do
  action [:enable, :start]
end

# Add a template for Apache virtual host configuration
template '/etc/httpd/conf.d/custom.conf' do
  source 'custom.erb'
  mode '0644'
  variables(
    :document_root => node['apache']['document_root'],
    :port => node['apache']['port']
  )
  notifies :restart, 'service[httpd]'
end

# Set the document root
document_root = node['apache']['document_root']

# Add a directory resource to create the document_root
directory document_root do
  mode '0755'
  recursive true
end

# Add the index page
template "#{document_root}/index.html" do
  source 'index.html.erb'
  mode '0644'
  variables(
    :message => node['motd']['message'],
    :port => node['apache']['port']
  )
end
