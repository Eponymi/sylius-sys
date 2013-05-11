#
# Cookbook Name:: symfony2
# Recipe:: default
#
# Copyright 2013, Dylan Johnson
#

include_recipe "jolicode-php::composer"

# install vendors if they're missing
# TO-DO: add a directory check
jolicode_php_composer "Install Vendors" do
  	cwd     node['symfony2']['apache2']['path']
  	directory     node['symfony2']['apache2']['path']
  	options node['symfony2']['composer']['options']
  	action  :install
end

# create project if there's nothing in the web root
if(Dir.entries("#{node['symfony2']['apache2']['path']}") - %w{ . .. }).empty?
	jolicode_php_composer "Create Project" do
  		cwd     node['symfony2']['apache2']['path']
  		directory     node['symfony2']['apache2']['path']
  		options node['symfony2']['composer']['options']
  		package node['symfony2']['composer']['package_name']
  		version node['symfony2']['composer']['package_version']
  		env_vars node['symfony2']['composer']['env_vars']
  		action  :create_project
	end
end
