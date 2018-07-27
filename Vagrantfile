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

  config.vm.provision "shell", args: [config_file["git"]["name"], config_file["git"]["email"]], inline: <<-SHELL
    echo "Setting secure permissions on git private key"
    chmod u=rw,go= /home/vagrant/.ssh/id_rsa

    echo "Installing dependencies"
    apt-get update
    apt-get install -y git vim

    echo "Setting timezone to US Central"
    ln -fs /usr/share/zoneinfo/US/Central /etc/localtime

    echo "Configuring git"
    su - vagrant -c "git config --global user.name '$1'"
    su - vagrant -c "git config --global user.email '$2'"
    su - vagrant -c "git config --global push.default current"
    echo "*.swp" > /home/vagrant/.gitignore_global
    su - vagrant -c "git config --global core.excludesfile /home/vagrant/.gitignore_global"

    echo "Changing login directory to /home/vagrant/workspace"
    touch /home/vagrant/.bash_profile
    if ! grep "cd /home/vagrant/workspace" /home/vagrant/.bash_profile
    then
      echo "cd /home/vagrant/workspace" >> /home/vagrant/.bash_profile
    fi
  SHELL
end
