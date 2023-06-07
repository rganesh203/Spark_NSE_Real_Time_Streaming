1. ls

2. pwd

3. - wget https://downloads.apache.org/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz

4. ls

5. ls /home/ubuntu/datamaking/softwares/

6. mv apache-hive-3.1.2-bin.tar.gz /home/ubuntu/datamaking/softwares/

7. ls /home/ubuntu/datamaking/softwares/

8. cd /home/ubuntu/datamaking/softwares/

9. tar xzf apache-hive-3.1.2-bin.tar.gz

10. ls /home/ubuntu/datamaking/softwares/apache-hive-3.1.2-bin

11. ls

12. nano ~/.bashrc

export HIVE_HOME= /home/ubuntu/datamaking/softwares/apache-hive-3.1.2-bin
export HIVE_CONF_DIR=/home/ubuntu/datamaking/softwares/apache-hive-3.1.2-bin/conf
export PATH=$HIVE_HOME/bin:$PATH

13. source ~/.bashrc

14. create "Datawarehouse" directory in HDFC
use below HDFC commands to cretae /tmp/ and /user/hive/warehouse (aka hive.metastore.warehouse.dir) and set them chmod 777 before you can create a table in HIVE.

15. jps

16. hdfs dfs -mkdir /tmp

17. hdfs dfs -mkdir -p /user/hive/warehouse

18. hdfc dfs -chmod 777 /user/hive/warehouse

19. configure Hive with Mysql as Metastore

#install Mysql

#update repository index
sudo apt-get update

#install mysql server with apt-get
sudo apt-get install mysql-server

#verify installation (optional)
systemctl is-active mysql
mysql --version

# set password for root user using below command
sudo mysql_secure_installation

#configuring root to use mysql shell
sudo mysql


#set the root password to
ALTER USER 'root'@'localhost'
IDENTIFIED WITH mysql_native_password BY 'Radharam@203';
FLUSH PRIVILEGES;
SELECT user,authentationa_string,plugin,host FROM mysql.user;

exit;

sudo systemctl status mysql
sudo systemctl stop mysql
sudo systemctl starts mysql
sudo systemctl status mysql

mysql -u root -p
CREATE DATABASE metastore;
CREATE USER 'hive'@'%' Identified with GRANT OPTION;
FLUSH PRIVILEGES;
exit;

sudo nano hive-site.xml

configuration> 
   <property> 
      <name>javax.jdo.option.ConnectionURL</name> 
      <value>jdbc:mysql://localhost/metastore?createDatabaseIfNotExist=true</value> 
      <description>metadata is stored in a MySQL server</description> 
   </property> 
   <property> 
      <name>javax.jdo.option.ConnectionDriverName</name> 
      <value>com.mysql.jdbc.Driver</value> 
      <description>MySQL JDBC driver class</description> 
   </property> 
   <property> 
      <name>javax.jdo.option.ConnectionUserName</name> 
      <value>hiveuser</value> 
      <description>user name for connecting to mysql server</description> 
   </property> 
   <property> 
      <name>javax.jdo.option.ConnectionPassword</name> 
      <value>password</value> 
      <description>hivepassword for connecting to mysql server</description> 
   </property> 
</configuration>

#Installing the Mysql JDBC Driver
# Download the Mysql JDBC driver from https://dev.mysql.com/downloads/file/?id=519143
wget https://downloads.mysql.com/archives/get/p/3/file/mysql-connector-java-6.0.6.tar.gz
ls -lrt
tar -xvzf mysql-connector-jaa-6.0.6.tar.gz

copy the JDBC driver, renamde, to /usr/share/java/.
If the target directory does not yet exist, create it. 
for exampl:

sudo mkdir -p /usr/share/java/

cd mysql-connector-java-6.0.6

sudo cp mysql-connector-java-6.0.6.jar /usr/share/java/mysql-connector-java.jar

sudo cp mysql-connector-java-6.0.6.jar /home/ubuntu/datamaking/softwares/apache-hive-3.1.2-bin/lib/mysql-connector-java.jar

source ~/.bashrc
#Create Hive schema(Mysql)
ls
${HIVE_HOME}/bin/schematool -initSchema -dtype mysql

some errors

to fix the issue, find guava installed with haddop and hive

find /home/ubuntu/datamaking/sofwates/hadoop-3.2.1/ -type f -name "guava-*jar"

/home/ubuntu/datamaking/sofwates/hadoop-3.2.1/share/hadoop/hdfs/lib/guava-27.0-jre.jar

find /home/ubuntu/datamaking/softwares/apache-hive-3.1.2-bin/ -type f -name "guava-*jar"

mv /home/ubuntu/datamaking/sofwates/hadoop-3.2.1/lib/guava-19.jar /home/ubuntu/datamaking/softwares/apache-hive-3.1.2-bin/lib/guava-19.0.jar.bak

cp /home/ubuntu/datamaking/sofwates/hadoop-3.2.1/share/hadoop/hdfs/lib/guava-27.0-jre.jar /home/ubuntu/datamaking/softwares/apache-hive-3.1.2-bin/lib/

cd ${HIVE_HOME}/bin/schematool -initSchema -dtype mysql

------------------
nohup hive --service metastore &
nohup hive --service hiveserver2 &
verify port no
netstat -an |grep 9083
sudo apt install net-tools
open Hive CLI
hive
show databases;
show tables;
Hiveserevr2 Web UI:
http://localhost:10002/

public id:

























