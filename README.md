# sb-miniproject7
Airflow DAG scheduling to get stock data from Yahoo! Finance, save to csv files, fetch csv file to database and query.

## What the project does
* Download the daily price data for stock symbols `AAPL` and `TSLA`. 
* The workflow should be scheduled to run at 6 PM on every weekday (Mon-Fri)
* Save the datasets into CSV file and load them into HDFS
* Run customer query on the downloaded datasets

## Prerequisites
* Airflow is installed
* package yfinance installed (`pip install yfinance`)
* pandas (`pip install pandas`)
