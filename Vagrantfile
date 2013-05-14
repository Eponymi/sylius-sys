# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'rubygems'
require 'json'

def load_user_lib( filename )
  File.open( filename, "r" ) do |f|
    JSON.load( f )
  end
end

projectvars = File.expand_path("../Projectvars", __FILE__)
load projectvars

#Vagrant.require_plugin "vagrant-aws"
Vagrant.require_plugin "vagrant-omnibus"

Vagrant.configure("2") do |config|

  if !File.directory?("cookbooks")
    puts "Run `librarian-chef install` first to bring down the cookbooks."
    exit 1
  end

	config.omnibus.chef_version = :latest

	config.vm.define :dev do |dev|
		dev.vm.box = "official-ubuntu-12.10"
  		dev.vm.box_url = "http://cloud-images.ubuntu.com/quantal/current/quantal-server-cloudimg-vagrant-amd64-disk1.box"
  		dev.vm.hostname = $dev_vmname
  		dev.vm.network :private_network, ip: $ip
  	
  		#dev.vm.network :forwarded_port, guest: 80, host: 8080
  		dev.vm.synced_folder "../sylius-proj", "/var/www/" + $dev_vmname, :nfs => true
  	
  		dev.vm.provider :virtualbox do |vb|
  			vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
  		
  			#dev.vbguest.no_remote = false
  			#dev.vbguest.no_install = false

  			DEV_JSON = load_user_lib(Pathname(__FILE__).dirname.join('nodes','localdev.json'))
  		
  			dev.vm.provision :chef_solo do |chef|
    			chef.cookbooks_path = ["site-cookbooks", "cookbooks"]
    			chef.roles_path = "roles"
    			chef.data_bags_path = "data_bags"
    			chef.provisioning_path = "/tmp/vagrant-chef"
    			chef.json = DEV_JSON
    			chef.run_list = DEV_JSON['run_list']
  			end
  		
  		end #end virtualbox provider
	end
end #end Vagrant config
