1. AWS account
2. EC2 Instance Ubuntu Free tier
3. present working directory: pwd
4. update ubuntu: sudo apt update
5. java install: sudo apt install openjdk-8-jdk
6. ls /usr/lib/jvm/java-8-openjdk-amd64/bin
7. env: nano ~/.bashrc
 	insert: press i
	paste: Alt+6
	export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
	export PATH=$PATH:$JAVA_HOME/bin
	save: ctl+o
	and Press Enter key
	Exit: ctl+x
8. check java: java -version
9. make a directory: mkdir datamaking
10. make a directory: mkdir softwares
11. go to home directory: cd /home/ubuntu
12. open ssh and open client: sudo apt-get install openssh-server openssh-client
13. password less login different nodes:
	ssh-keygen -t rsa -p ""
	inside there is private key: ls /home/ubuntu/.ssh
14. The 'cat' command with double greater than sign (>>) append (add something in the last of a file) something in your already existing file.
	cat /home/ubuntu/.ssh >> /home/ubuntu/.ssh/authorized_keys
15. ssh localhost
16. install hadoop: wget https://archive.apache.org/dist/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz
17. mv hadoop-3.3.1.tar.gz /home/ubuntu/datamaking/softwares
18. cd /home/ubuntu/datamaking/softwares
17. ls
18. sudo tar -xzvf hadoop-3.3.1.tar.gz
19. sudo nano ~/.bashrc
Hadoop environment setup:
	export HADOOP_HOME=/home/ubuntu/datamaking/softwares/hadoop-3.3.1
	export PATH=$PATH:$HADOOP_HOME/bin
	export PATH=$PATH:$HADOOP_HOME/sbin
	export HADOOP_MAPRED_HOME=$HADOOP_HOME
	export HADOOP_COMMON_HOME=$HADOOP_HOME
	export HADOOP_HDFS_HOME=$HADOOP_HOME
	export YARN_HOME=$HADOOP_HOME
	export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
	export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
	export HADOOP_OPTS=”-Djava.library.path=$HADOOP_HOME/lib”
	export HADOOP_OPTS='-Djava.library.path=$HADOOP_HOME/lib/native'
Save: ctr+o or ctl+s
	enter
Exit: ctl+x
20. sourse ~/.bashrc
21. hadoop version
22. sudo nano /home/ubuntu/datamaking/softwares/hadoop-3.3.1/etc/hadoop/hadoop-env.sh
23. export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
24. sudo mkdir -p /home/ubuntu/datamaking/softwares/hadoop_data/tmp (With the help of mkdir -p command you can create sub-directories of a directory.)
25. cd /home/ubuntu/datamaking/softwares/hadoop-3.3.1/etc/hadoop
26. sudo nano core-site.xml
	
<configuration>
        <property>
                <name>hadoop.tmp.dir</name>
                <value>/home/ubuntu/datamaking/softwares/hadoop_data/tmp</value>
                <description>parent directory for other temporay directories.</description>
        <property>
        <property>
                <name>fs.defaultFS</name>
                <value>hdfs://localhost:9000</value>
                <description>The name of the default file system. </description>
        <property>
</configuration>

27.  sudo mkdir -p /home/ubuntu/datamaking/softwares/hadoop_data/namenode 

28. sudo mkdir -p /home/ubuntu/datamaking/softwares/hadoop_data/datanode

29. sudo chown -R ubuntu:ubuntu /home/ubuntu/datamaking/softwares

30. sudo nano hdfs-site.xml
	
<configuration>
        <property>
                <name>dfsnamenode.name.dir</name>
                <value>/home/ubuntu/datamaking/softwares/hadoop_data/namenode</value>
        <property>
        <property>
                <name>dfs.datanode.data.dir</name>
                <value>home/ubuntu/datamaking/softwares/hadoop_data/namenode</value>
        <property>
        <property>
                <name>dfs.deplication</name>
                <value>1</alue>
        <property>
</configuration>

31. sudo nano hdfs-site.xml
<configuration>
 		<property>
                <name>mapreduce.framework.name</name>
                <value>yarn</value>
  		<property>
</configuration>

32.  sudo nano yarn-site.xml
<configuration>
<!--site specific YARN configuration properties-->
        <property>
                <name>yarn.nodemanager.aux-services</name>
                <value>mapreduce_shuffle</value>
        <property>
        <property>
                <name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
                <value>org.apache.hadoop.mapred.ShuffleHnadler</value>
	  <property>
        <property>
                <name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
                <value>org.apache.hadoop.mapred.ShuffleHnadler</value>
        <property>
        <property>
                <name>yarn.resourcemanager.webapp.address</name>
                <value>localhost:8088</alue>
        <property>
</configuration>

33. sudo chown -R ubuntu:ubuntu /home/ubuntu/datamaking/softwares

34. hdfs namenode -format

35. jps

36. start-dfs.sh

37. start-yarn.sh

38. goto aws ec2 ---->add security group ---->in edit bound 

39. copy the ec2 instance hadoop publice ip address paste it in yarn.





