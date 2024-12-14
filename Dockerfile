# Use official Python runtime as the base image
FROM python:3.12-slim

# Set working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt \
    apache-airflow \
    mlflow \
    gunicorn

# Copy the rest of the application code
COPY . .

# Create necessary directories for Airflow
RUN mkdir -p /app/airflow/dags /app/airflow/logs /app/airflow/plugins
ENV AIRFLOW_HOME=/app/airflow
ENV AIRFLOW__CORE__DAGS_FOLDER=/app/airflow/dags
ENV AIRFLOW__CORE__LOAD_EXAMPLES=False

# Initialize Airflow database
RUN airflow db init

# Create default Airflow user
RUN airflow users create \
    --username admin \
    --password admin \
    --firstname Admin \
    --lastname User \
    --role Admin \
    --email admin@example.com

# Expose ports for Airflow webserver and MLflow
EXPOSE 8888 5555

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    MLFLOW_TRACKING_URI=http://airflow-mlflow:5555

# Copy the startup script
COPY start-services.sh .
RUN chmod +x start-services.sh

# Run the services
CMD ["./start-services.sh"]
