#!/bin/bash

apt-get update -y
apt-get upgrade -y
apt-get install -y sudo
adduser rmbug
echo 'rmbug  ALL=(ALL:ALL) ALL' >> /etc/sudoers

apt-get install -y git-core postfix

apt-get install -y wget curl gcc checkinstall libxml2-dev libxslt-dev sqlite3 libsqlite3-dev libcurl4-openssl-dev libc6-dev libssl-dev libmysql++-dev make build-essential zlib1g-dev libicu-dev redis-server

apt-get install -y openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libyaml-dev libxml2-dev libxslt-dev autoconf ncurses-dev automake libtool bison subversion

apt-get install -y mysql-server

apt-get install -y python-dev python-pip libicu-dev

apt-get install -y libpcre3-dev nginx

rm /etc/nginx/sites-enabled/default
mysql_secure_installation


sudo -u rmbug -H ssh-keygen -t rsa


adduser git --disabled-password
usermod -a -G git rmbug

cp /home/rmbug/.ssh/id_rsa.pub /home/git/rails.pub
cd /home/git
sudo -u git -H git clone git://github.com/rmbug/gitolite /home/git/gitolite
sudo -u git -H /home/git/gitolite/src/gl-system-install
sudo -u git -H sh -c "PATH=/home/git/bin:$PATH; gl-setup ~/rails.pub"
sudo rm /home/git/rails.pub
chmod 750 /home/git/
sudo chmod -R g+rwX /home/git/repositories/
sudo chown -R git:git /home/git/repositories/
sed -i -e 's/0077/0007/g' /home/git/.gitolite.rc

pip install pygments

wget https://raw.github.com/mario/rmbug/master/doc/install/stage2_debian6.sh
mv stage2_debian6.sh /home/rmbug
chown rmbug.rmbug /home/rmbug/stage2_debian6.sh
chmod +x /home/rmbug/stage2_debian6.sh
cd /home/rmbug
sudo -u rmbug -H /home/rmbug/stage2_debian6.sh $1
