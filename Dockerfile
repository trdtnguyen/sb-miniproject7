FROM python:3.7
RUN apt-get update && apt-get -y install build-essential
RUN pip install  apache-airflow[mysql,celery]==1.10.12 --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-1.10.12/constraints-3.7.txt"
RUN pip install  pandas
RUN pip install  yfinance
RUN pip install  mysql-connector-python

WORKDIR /root/airflow/

COPY setup.sh /root/airflow/setup.sh
RUN chmod +x setup.sh

COPY mysqlconnect.py /root/airflow/mysqlconnect.py

COPY dags /root/airflow/dags
