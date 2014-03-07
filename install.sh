sudo apt-get install -y curl git mc vim-nox php5 php5-xdebug php5-sqlite php5-xsl graphviz ant
wget -q -O - http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key | sudo apt-key add -
echo "deb http://pkg.jenkins-ci.org/debian-stable binary/" > jenkins.list
sudo cp jenkins.list /etc/apt/sources.list.d/
sudo apt-get update
sudo apt-get install -y jenkins
sudo mkdir -p /var/lib/jenkins/tools/
sudo cp /vagrant/composer.json /var/lib/jenkins/tools
sudo chown -Rf jenkins /var/lib/jenkins/tools
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo -u jenkins sh -c "cd /var/lib/jenkins && composer config -g github-oauth.github.com 30b53e9c1cda60503574196c86b17f47cfd95546"
sudo -u jenkins sh -c "cd /var/lib/jenkins/tools && composer install"