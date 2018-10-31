#!/bin/bash
apt-get update
apt-get install build-essential tcl -y &&\
cd /tmp && curl -O http://download.redis.io/redis-stable.tar.gz &&\
tar xzvf redis-stable.tar.gz &&\
cd /tmp/redis-stable && make && make install &&\
mkdir /etc/redis &&\
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
systemctl start redis@6379
systemctl start redis@6380
systemctl enable redis@6379
systemctl enable redis@6380
    
