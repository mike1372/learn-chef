default['chef-server']['url'] = 'https://packages.chef.io/stable/el/6/chef-server-core-12.10.0-1.el6.x86_64.rpm'
package_url = node['chef-server']['url']
package_name = ::File.basename(package_url)
