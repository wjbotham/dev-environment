# -*- mode: ruby -*-
# vi: set ft=ruby :

unless File.exists?('config.yaml')
  puts "Couldn't find `config.yaml`, which is required to run this script. See `config.yaml.example` for its structure."
  exit
end

config_file = YAML.load_file('config.yaml')

unless config_file["git"]
  puts "No git configuration provided. See `config.yaml.example`."
  exit
end

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.synced_folder config_file["workspace_path"], "/home/vagrant/workspace"

  config.vm.provision "file", source: config_file["ssh"]["keys"]["private"], destination: "/home/vagrant/.ssh/id_rsa"
  config.vm.provision "file", source: config_file["ssh"]["keys"]["public"], destination: "/home/vagrant/.ssh/id_rsa.pub"
  if config_file["bash_aliases_path"]
    config.vm.provision "file", source: config_file["bash_aliases_path"], destination: "/home/vagrant/.bash_aliases"
  end
  if config_file["ssh"]["config"]
    config.vm.provision "file", source: config_file["ssh"]["config"], destination: "/home/vagrant/.ssh/config"
  end

  config.vm.provision "shell", path: "provision/secure_ssh_keys.sh"
  config.vm.provision "shell", path: "provision/link_config_files.sh"
  config.vm.provision "shell", path: "provision/install_dependencies.sh"
  config.vm.provision "shell", path: "provision/set_timezone.sh"
  config.vm.provision "shell", path: "provision/configure_git.sh", args: config_file["git"].values_at("name", "email")
end
