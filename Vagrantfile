# -*- mode: ruby -*-
# vi: set ft=ruby :

# This file describes a virtual machine that can be used for testing
# nginx configs. See https://www.vagrantup.com/ for more info.

Vagrant.configure(2) do |config|
  config.vm.define "vagrant-dev"
  config.vm.box = "ubuntu/bionic64"

  config.vm.provider "virtualbox" do |vm|
    vm.memory = 2048
    vm.cpus = 2
    if Vagrant::Util::Platform.windows? then
      # see https://github.com/joelhandwell/ubuntu_vagrant_boxes/issues/1
      # and https://github.com/hashicorp/vagrant/issues/8604 - prevent
      # RawFile#0 failed to create the raw output file VERR_PATH_NOT_FOUND
      vm.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
    end
  end

  config.vm.network :forwarded_port, guest: 80,   host: 8080
  config.vm.network :forwarded_port, guest: 8000, host: 8000
  config.vm.network :forwarded_port, guest: 8001, host: 8001
  config.vm.network :forwarded_port, guest: 8002, host: 8002
  config.vm.network :forwarded_port, guest: 8003, host: 8003

  config.vm.synced_folder "./configs/sites-available", "/etc/nginx/sites-available"
  config.vm.synced_folder "./configs/sites-enabled", "/etc/nginx/sites-enabled"

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "ansible-setup.yml"
  end
end
