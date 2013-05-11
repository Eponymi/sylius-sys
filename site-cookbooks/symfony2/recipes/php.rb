#
# Cookbook Name:: symfony2
# Recipe:: default
#
# Copyright 2013, Dylan Johnson
#
# All rights reserved - Do Not Redistribute
#

include_recipe "jolicode-php"
include_recipe "jolicode-php::ext-pdo"
include_recipe "jolicode-php::ext-mysql"
include_recipe "jolicode-php::ext-apc"
include_recipe "jolicode-php::ext-curl"
include_recipe "jolicode-php::ext-gd"
include_recipe "jolicode-php::ext-intl"
include_recipe "jolicode-php::ext-mbstring"
include_recipe "jolicode-php::ext-mcrypt"
include_recipe "priestjim-php::module_xml"

# install libicu for jolicode-php-intl
# TO-DO: clean this up; look for libicu in other dirs; add to jolicode-php intl module recipe?
libicu_pkg = value_for_platform_family(
    [ "rhel", "fedora" ] => "libicu-dev",
    "debian" => "libicu-dev"
)

package libicu_pkg do
  action :install
end
