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
  
   config.vm.provision "shell", path: "bootstrap.sh"
   config.vm.provision "file", source: "6379.conf", destination: "/etc/redis/6379.conf"
   config.vm.provision "file", source: "6380.conf", destination: "/etc/redis/6380.conf"
   config.vm.provision "file", source: "redis.service", destination: "/etc/systemd/system/redis@.service"   

end
