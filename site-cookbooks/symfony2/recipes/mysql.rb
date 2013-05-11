include_recipe "mysql::client"
include_recipe "mysql::server"
include_recipe "mysql::ruby"

mysql_database node['symfony2']['mysql']['database'] do
  connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
  action :create
end

mysql_database_user node['symfony2']['mysql']['db_username'] do
  connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
  password node['symfony2']['mysql']['db_password']
  database_name node['symfony2']['mysql']['database']
  privileges [:select,:update,:insert,:create,:delete,:alter]
  action :grant
end