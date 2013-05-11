include_attribute "symfony2::default"
default["symfony2"]["apache2"]["path"] = "/var/www/#{node['symfony2']['project_name']}"
default["symfony2"]["apache2"]["docroot"] = "#{node['symfony2']['apache2']['path']}/web"
default["symfony2"]["apache2"]['server_name'] = "#{node['symfony2']['project_name']}"