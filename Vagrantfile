# -*- mode: ruby -*-
# vi: set ft=ruby :

config_file = YAML.load_file('config.yaml')

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.synced_folder config_file["workspace_path"], "/home/vagrant/workspace"

  config.vm.provision "file", source: config_file["git"]["key"], destination: "/home/vagrant/.ssh/id_rsa"

  if config_file["bash_aliases_path"]
    config.vm.provision "file", source: config_file["bash_aliases_path"], destination: "/home/vagrant/.bash_aliases"
  end

  config.vm.provision "shell", path: "provision/secure_ssh_key.sh"
  config.vm.provision "shell", path: "provision/install_dependencies.sh"
  config.vm.provision "shell", path: "provision/set_timezone.sh"
  config.vm.provision "shell", path: "provision/configure_git.sh", args: config_file["git"].values_at("name", "email")
  config.vm.provision "shell", inline: "cp /vagrant/files/.bash_profile /home/vagrant/.bash_profile"
  config.vm.provision "shell", inline: "cp /vagrant/files/.vimrc /home/vagrant/.vimrc"
end
