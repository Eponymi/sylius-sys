include_recipe "apache2"
include_recipe "priestjim-php::apache2"

apache_site "default" do
  enable false
end

# maybe unnecessary due to shared folder via nfs, see Vagrantfile
directory "#{node['symfony2']['apache2']['path']}" do
  mode 00755
  action :create
end

web_app "#{node['symfony2']['apache2']['server_name']}" do
  template 'site.conf.erb'
  docroot node['symfony2']['apache2']['docroot']
  server_name "#{node['symfony2']['apache2']['server_name']}"
end