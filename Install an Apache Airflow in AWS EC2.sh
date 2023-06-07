# check python version
python --version

# create virtual environment
conda create -n datamaking python=3.9 anaconda

#active 
source activate datamaking

pip install apache-airflow

airflow db init

ls

pwd

airflow webserver -p 8070

#backround
airflow webserver -p 8070 -D

airflow users  create --role Admin --username admin --email admin --firstname admin --lastname admin --password admin

source activate datamaking

airflow scheduler

airflow scheduler -D

airflow dag list



