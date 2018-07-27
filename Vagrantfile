# -*- mode: ruby -*-
# vi: set ft=ruby :

config_file = YAML.load_file('config.yaml')

if !config_file["do_not_force_cachier"] && !Vagrant.has_plugin?("vagrant-cachier")
  puts 'If you would like to cache packages and save time and bandwidth when rebuilding'
  puts 'this Vagrant box, please install this plugin:'
  puts
  puts '  vagrant plugin install vagrant-cachier'
  puts
  puts 'This is not required, just strongly advised. If you would like to ignore this'
  puts 'check, add the following line to your config.yaml:'
  puts
  puts '  do_not_force_cachier: true'
  puts
  puts '(Exiting now!)'
  puts
  exit 0
end

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"

  config.vm.synced_folder config_file["workspace_path"], "/home/vagrant/workspace"

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y git vim

    touch /home/vagrant/.bash_profile
    if ! grep "cd /home/vagrant/workspace" /home/vagrant/.bash_profile
    then
      echo "cd /home/vagrant/workspace" >> /home/vagrant/.bash_profile
    fi
  SHELL
end
