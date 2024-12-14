#!/bin/bash

# Ensure correct permissions for the Airflow directories
chmod -R 777 /app/airflow/dags
chmod -R 777 /app/airflow/logs
chmod -R 777 /app/airflow/plugins

# Start Airflow webserver in the background
airflow webserver -p 8888 &

# Start MLflow server in the background
mlflow server --host 0.0.0.0 --port 5555 &

# Start Airflow scheduler in the foreground (to keep container running)
airflow scheduler 