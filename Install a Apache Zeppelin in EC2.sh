step 1:
download zeppelin
# Download the Zeppelin binary to the home directory.
cd ~
wget http://mirror.cogentco.com/pub/apache/zeppelin/zeppelin-0.8.0/zeppelin-0.8.0-bin-all.tgz
 
mv zeppelin-0.8.0-bin-all.tgz /home/ubuntu/datamaking/softwares/

step 2: extract Zepplin

tar -xvzf zeppelin-0.8.0-bin-all.tgz

cd zeppelin-0.8.0-bin-all

ls bin/

step 3: Starting Apache zepplin from the command line
bin/zeppelin-daemon.sh start

FYI.
bin/zeppelin-daemon.sh status

bin/zeppelin-daemon.sh stop
step 4:

#After Zepplin has started successfully,

go to http://localhodt:8080 with your web browser.

http://localhost:8080

security groups--------> edit inbound rules----> port range 8080------->custom 0.0.0.0/0

ls
cd logs/
ls -lrt
tail-n 100 zeppelin-ubuntu-ip-172-31-41-188.out
cd..
cd conf/
ls
cp zepplein-site.xml.template zeppelin-site.xml
nano zeppelin-site.xml

<property>
  <name>zeppelin.server.server.addr</name>
  <value>private_ip_address</value>
  <description>Serverbinding address</description>
</property>

<property>
  <name>zeppelin.server.port</name>
  <value>8090</value>
  <description>Server port.</description>
</property>

<property>
  <name>zeppelin.cluster.addr</name>
  <value></value>
  <description>Path to truststore relative to Zeppelin configuration directory. Defaults to the keystore path</description>
</property>

ctrl+o  enter
ctl+x

cd ..
bin/zeppelin-daemon.sh stop

bin/zeppelin-daemon.sh start

security group --------->add new range group:8090







