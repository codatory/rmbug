#!/bin/bash
bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> /home/rmbug/.bashrc

source .profile
rvm install 1.9.3
rvm use 1.9.3 --default

ssh-keyscan -H localhost >> ~/.ssh/known_hosts
git config --global user.email "admin@rmbug.com"
git config --global user.name "rmBug Admin User"

gem install bundler
mkdir app
cd app
git clone git://github.com/mario/rmbug.git
cd rmbug
sed -i -e 's/replacemehere/$1/g' config/nginx.conf.example
sudo cp config/nginx.conf.example /etc/nginx/nginx.conf
bundle install --without development test
cd config
mv rmbug.yml.example rmbug.yml
sed -i -e 's/rmbug.com/$1/g' rmbug.yml
# Change things you might need to change in rmbug.yml
mv database.yml.example database.yml
sed -i -e 's/example/$2/g' database.yml
mv unicorn.conf.rb.example unicorn.conf.rb
# Change things you might want/need to change
cd ..
bundle exec rake db:setup RAILS_ENV=production
bundle exec rake db:seed_fu RAILS_ENV=production
./resque.sh
cd ~
gem install bluepill
sudo mkdir /var/run/bluepill
sudo chown rmbug.rmbug /var/run/bluepill
bluepill load /home/rmbug/app/rmbug/config/bluepill/unicorn.pill --no-privileged
#bluepill start unicorn --no-privileged
sudo /etc/init.d/nginx restart


