Install Apache Kafka:

wget https://downloads.apache.org/kafka/3.4.0/kafka-3.4.0-src.tgz

cp kafka-3.4.0-src.tgz /home/ubuntu/datamaking/softwares/

cd /home/ubuntu/datamaking/softwares/

tar -xvzf kafka/3.4.0/kafka-3.4.0-src.tgz

/home/ubuntu/datamaking/softwares/kafka-3.4.0

export KAFKA_HOME=/home/ubuntu/datamaking/softwares/kafka-3.4.0
export PATH=$PATH:$KAFKA_HOME/bin

cd /home/ubuntu/datamaking/softwares/kafka-3.4.0/config

nano server.properties or vi server.properties

	delete.topic.enable = true

sudo nano /etc/systemd/system/zookeeper.service

	[unit]
	Require=network.target remote-fs.target
	After=network.target remote-fs.target

	[Service]
	Type=simple
	User=datamaking
	Environment=JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
	ExecStart=/home/ubuntu/datamaking/softwares/kafka-3.4.0/bin/zookeeper-server-start.sh /home/ubuntu/datamaking/softwares/
	kafka-3.4.0/bin/zookeeper.properties
	ExecStop=/home/ubuntu/datamaking/softwares/kafka-3.4.0/bin/zookeeper-server-stop.sh
	Restart=on-abnormal

	[Install]
	WantedBy=multi-user.target

sudo nano /etc/systemd/system/kafka.service

	[unit]
	Require=zookeeper.service
	After=zookeeper.service

	[Service]
	Type=simple
	User=ubuntu
	Environment=JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
	ExecStart=/bin/sh -c '/home/ubuntu/datamaking/softwares/kafka-3.4.0/bin/kafka-server-start.sh /home/ubuntu/datamaking/softwares/
	kafka-3.4.0/config/server.properties /home/ubuntu/datamaking/softwares/kafka-3.4.0/logs/kafka.log 2>&1'
	ExecStop=/home/ubuntu/datamaking/softwares/kafka-3.4.0/bin/kafka-server-stop.sh
	Restart=on-abnormal

	[Install]
	WantedBy=multi-user.target

checking the status of the kafka service:
---------------------------------------------
sudo systemctl  status kafka
sudo systemctl  start kafka
sudo systemctl  stop kafka

netstat -an |grep 2181
netstat -an |grep 9092

jps
checking the status of the Zookeeper service:
---------------------------------------------

sudo systemctl  status zookeeper
sudo systemctl  start zookeeper
sudo systemctl  stop zookeeper

command to create kafka topic:
----------------------------

kafka-topics.sh --create --topic test-topic--bootstrap-server localhost:9092 
kafka-topics.sh --create --topic output-topic--bootstrap-server localhost:9092

Describe kafka topic:
------------------------
kafka-topics.sh --describe --topic test-topic--bootstrap-server localhost:9092

list the kafka topic:
-----------------
kafka-topics.sh --list --bootstrap-server localhost:9092

kafka-topics.sh --bootstrap-server localhost:9092 --topic output-topic --delete 

commandline kafka producer:
---------------------------
kafka-console-producer.sh --topic test-topic--bootstrap-server localhost:9092 

commandline kafka consumer:
---------------------------
kafka-console-consumer.sh --topic test-topic--from-beginning --bootstrap-server localhost:9092 

kafka-console-consumer.sh --topic output-topic--from-beginning --bootstrap-server localhost:9092 





















