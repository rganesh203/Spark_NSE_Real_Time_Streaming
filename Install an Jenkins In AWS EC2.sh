# install jenkins in AWS EC2

step 1: add jenkins repository key
sudo wget -q -o -https://pkg.jenkins.io/debian/jenkins.io.key |sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

step 2: install jenkins on Ubuntu

sudo apt-get update
sudo apt-get install jenkins 

====================
# import key if any issue occurs
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys _________
====================
sudo systemctl start jenkins
sudo systemctl status jenkins

step 3: add firewall rule

#add the port no. 8080 in firewall rule

sudo ufw status 8080
sudo ufw status

step 4: Configure jenkins
#If your Ubuntu firewall is inactive use below command to active it
sudo ufw allow OpenSSH sudo ufw enable
sudo ufw enable

sudo ufw status

sudo cat /var/lib/jenkins/secrets/initialAdminPassword





