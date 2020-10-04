# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.ssh.insert_key = false
  config.vbguest.auto_update = true
  config.vm.box_check_update = true

  config.vm.network :private_network, ip:  "192.168.33.10"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.synced_folder ".", "/vagrant", :mount_options => ['dmode=755', 'fmode=644']

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "provision/playbook.yml"
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "provision/cleanup.yml"
  end
end
