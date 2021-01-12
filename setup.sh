INIT_FILE=.airflowinitialized
if [ ! -f $INIT_FILE ]; then
    # Setup the DB for airflow
    # Create all Airflow configuration files
    airflow initdb
    # remove SQLite database
    rm /root/airflow/airflow.db

    # Wait until the DB is ready
    apt update && apt install -y netcat
    while ! nc -z airflow-backend 3306; do
        sleep 1
    done
    apt remove -y netcat

    # Setup the DB
    python mysqlconnect.py
    airflow initdb

    # This configuration is done only the first time
    touch $INIT_FILE
fi

# Run the Airflow webserver and scheduler. Disable this to run manually
#airflow scheduler &
#airflow webserver &
#wait

#Disable this to use airflow scheduler
tail -f /dev/null
