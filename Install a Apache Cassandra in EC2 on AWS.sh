Install the apt-transport-https Package

sudo apt install apt-transport-https

add apache Cassandra Repository and Import GPG Key

echo "ded https://www.apache.org/dist/cassandra/debian 39x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list

ls /etc/apt/sources.list.d/

sudo apt install curl

--not working 
sudo curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -

#you are now ready to install Cassandra on Ubuntu

sudo apt-get update

sudo apt-get install cassandra

If key error occurs. use this

sudo apt-key adv --keyserver pool.sks-keyservers.net --recv-key A278B781FE4B2BDA

sudo apt-get update

sudo apt-get install cassandra

curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -

cd /etc/apt/sources.list.d/

sudo apt-get update

sudo apt-get install cassandra

nodetool status

sudo systemctl status cassandra

sudo systemctl start cassandra

sudo systemctl stop cassandra

sudo systemctl enable cassandra

sudo cqlsh

describe keyspaces

describe tables




