#Prerequisites

#java should be installed

#java -version 

Step 1: Download NiFi
---------------------

https://nifi.apache.org/download.html

wget https://downloads.apache.org./nifi/1.14.0-bin.tar.gz

mv nifi-1.14.0-bin.tar.gz /home/ubuntu/datamaking/softwares/


step 2: Extract NiFi
--------------------

cd /home/ubuntu/datamaking/softwares/

tar -xvzf nifi-1.14.0-bin.tar.gz

step 3: Start NiFi process

cd nifi-1.9.2

bin/nifi.sh start

FYI.

bin/nifi.sh run -launches the application to run in the foreground

bin/nifi.sh status - launches the application to run the background

bin/nifi.sh status -check the status

bin/nifi.sh stop - shutdown the application

step4: Access NiFi

http://public_ip_sddress:8090/nifi

ls
cd logs/
ls
ls -lrt
tail -n 100 nifi-app.log

-->security group--> add new rule---> 8443cd 

conf/

nano bootstrap.conf
bootstarp.conf
ls

nano nifi.properties

private ip_address

cd ..

bin/nifi.sh start

nano conf/nifi.properties
change ip address

cd conf/
ls
cd ..
cd logs/
ls -lrt
tail -n 100 nifi-app.log
cd ..
bin/nifi.sh stop
nano nano conf/nifi.properties
comment
bin/nifi.sh start
tail -n 100 conf/nifi-app.log
cd conf
cd ..
tail -n 100 logs/nifi-app.log
nano nano conf/nifi.properties

change ip address







