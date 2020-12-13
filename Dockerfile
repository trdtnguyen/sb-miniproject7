FROM python:3.7
RUN apt-get update && apt-get -y install build-essential
RUN pip install  apache-airflow==1.10.12 --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-1.10.12/constraints-3.7.txt"
RUN pip install  pandas
RUN pip install  yfinance

WORKDIR /root/airflow/

COPY setup.sh /root/airflow/setup.sh
RUN chmod +x setup.sh

COPY dags /root/airflow/dags
