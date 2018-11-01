# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  
  config.vm.define "vm1" do |vm1|
    vm1.vm.network "private_network", ip: "192.168.30.10"
    vm1.vm.hostname = "vm1"
  end
  
    config.vm.define "vm2" do |vm2|
    vm2.vm.network "private_network", ip: "192.168.30.20"
    vm2.vm.hostname = "vm2"
  end

  config.vm.define "vm3" do |vm3|
    vm3.vm.network "private_network", ip: "192.168.30.30"
    vm3.vm.hostname = "vm3"
  end

  config.ssh.private_key_path = ["~/.ssh/id_rsa", "~/.vagrant.d/insecure_private_key"]
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/authorized_keys"


end
