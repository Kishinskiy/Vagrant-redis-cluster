# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  
  config.vm.define "vm1" do |vm1|
    vm1.vm.network "private_network", ip: "192.168.30.10"
  end
  
    config.vm.define "vm2" do |vm2|
    vm2.vm.network "private_network", ip: "192.168.30.20"
  end

  config.vm.define "vm3" do |vm3|
    vm3.vm.network "private_network", ip: "192.168.30.30"
  end
  
   config.vm.provision "shell", inline: <<-SHELL
     apt-get update
     apt-get install build-essential tcl -y &&\
     cd /tmp && curl -O http://download.redis.io/redis-stable.tar.gz &&\
     tar xzvf redis-stable.tar.gz &&\
     cd /tmp/redis-stable && make && make install &&\
     mkdir /etc/redis &&\
     cp /tmp/redis-stable/redis.conf /etc/redis/6379.conf  &&\ 
     sed -i '/^#\|^$/d' /etc/redis/6379.conf &&\
     cp /etc/redis/6379.conf /etc/redis/6380.conf &&\
     adduser --system --group --no-create-home redis &&\
     mkdir /var/lib/redis &&\
     chown -R redis:redis /var/lib/redis &&\
     chmod 770 /var/lib/redis &&\
     mkdir /var/log/redis &&\
     touch /var/log/redis/6379.log && touch /var/log/redis/6380.log &&\
     chown -R redis:redis /var/log/redis &&\
     chmod 770 /var/log/redis &&\
     install -d -o redis -g redis -m 0750 /var/lib/redis/6379 &&\
     install -d -o redis -g redis -m 0750 /var/lib/redis/6380 &&\
     echo "[Unit]
Description=Redis
After=network.target
PartOf=redis.target
[Service]
Type=simple
User=redis
Group=redis
PrivateTmp=true
PIDFile=/var/run/redis/%i.pid
ExecStart=/usr/local/bin/redis-server /etc/redis/%i.conf
Restart=on-failure
[Install]
WantedBy=multi-user.target redis.target" > /etc/systemd/system/redis@.service
    

   SHELL
end
