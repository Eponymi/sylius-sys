include_attribute "symfony2::default"
default["symfony2"]["mysql"]["database"] = "#{node['symfony2']['project_name']}"
default["symfony2"]["mysql"]["db_username"] = "#{node['symfony2']['project_name']}"
default["symfony2"]["mysql"]["db_password"] = "thisisnotsecretandshouldbechanged"
