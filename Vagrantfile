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

  config.vm.provision "file", source: config_file["git"]["key"], destination: "/home/vagrant/.ssh/id_rsa"

  config.vm.provision "shell", path: "provision/secure_ssh_key.sh"
  config.vm.provision "shell", path: "provision/install_dependencies.sh"
  config.vm.provision "shell", path: "provision/set_timezone.sh"
  config.vm.provision "shell", path: "provision/configure_git.sh", args: [config_file["git"]["name"], config_file["git"]["email"]]
  config.vm.provision "shell", path: "provision/set_login_directory.sh"
end
