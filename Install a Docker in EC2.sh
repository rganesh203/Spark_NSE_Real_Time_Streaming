ubuntu 18.04
1. update the apt package index and install package to allow apt use a repository overHTTPS:
sudo apt-get update

sudo apt-get install \
apt-transport-https \
ca-certificate \
curl \
gnupg \
lsb-release

2. Add dockers officail GPG key:
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg |sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

3. use the following command to set up the stable repository.

echo \
  "deb [arch=amd63 singed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  "$(lsb_release -cs) stable" sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

ls /etc/apt/source.list.d/

4. update the apt package index, and install the latest version of Docker Engine and Contained
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo docker --version

5. verify the Docker Engine is installed by running the hello-world image
sudo docker run hello-world

sudo docker images

sudo docker ps

sudo usermod -aG docker ubuntu
[system restart may be required]

Install Docker Compose:
-----------------------
1. Run this command to download the current stable release of Docker compose

sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

2. Apply executable permissions to the binary:
sudo chmod +x /usr/local/bin/docker-compose

3. you can also create a symbolic link
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

4. Test the Installation
docker-compose --version