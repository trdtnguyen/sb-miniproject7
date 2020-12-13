INIT_FILE=.airflowinitialized
if [ ! -f $INIT_FILE ]; then
    # Setup the DB for airflow
    #python mysqlconnect.py
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
