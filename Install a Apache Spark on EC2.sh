Install Apache Spark:
wget https://archive.apache.org/dist/spark/spark-3.0.3/spark-3.0.3-bin-hadoop2.7.tgz

ls

cp spark-3.0.3-bin-hadoop2.7.tgz /home/ubuntu/datamaking/softwares

tar -xvzf spark-3.0.3-bin-hadoop2.7.tgz

add the SPARK_HOME path in the bash file (.bashrc)

nano ~/.bashrc

export SPARK_HOME=/home/ubuntu/datamaking/softwares/spark-3.0.3/spark-3.0.3-bin-hadoop2.7.tgz
export PATH=＄PATH:$SPARK_HOME/bin:＄SPARK_HOME/sbin

source ~/.bashrc

spark-shell

spark-submit --version

comeout from session --------->exit() or :quit

--------------------------------------------------
Install Anaconda Python:
wget https://repo.anaconda.com/archive/Anaconda3-2023.03-Linux-x86_64.sh

mv Anaconda3-2023.03-Linux-x86_64.sh /home/ubuntu/datamaking/softwares

cd /home/ubuntu/datamaking/softwares

sha256sum Anaconda3-2023.03-Linux-x86_64.sh

mkdir /home/ubuntu/datamaking/softwares/anaconda

If required,

sudo chmod -R 777 /home/ubuntu/datamaking/softwares/anaconda

bash Anaconda3-2023.03-Linux-x86_64.sh

/home/ubuntu/datamaking/softwares/anaconda3

ls /home/ubuntu/datamaking/softwares/anaconda3

nano ~/.bashrc

export PATH=/home/ubuntu/datamaking/softwares/anaconda/anaconda3/bin:$PATH

source ~/.bashrc