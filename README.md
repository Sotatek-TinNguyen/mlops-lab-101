# MLOps Training Pipeline

A complete MLOps pipeline that integrates data collection, feature engineering, model training, and evaluation using Apache Airflow and MLflow.

## Project Structure
```
.
├── dags/                   # Airflow DAG definitions
├── src/                    # Source code
│   ├── data/              # Data collection and generation scripts
│   ├── features/          # Feature engineering
│   ├── training/          # Model training
│   └── evaluation/        # Model evaluation
├── docker/                # Docker configuration files
├── requirements.txt       # Python dependencies
├── Dockerfile            # Docker image definition
├── docker-compose.yml    # Docker services configuration
└── start-services.sh     # Services startup script
```

## Features

- Automated ML pipeline using Apache Airflow
- Model tracking and versioning with MLflow
- Containerized environment using Docker
- Modular code structure
- Automated feature engineering
- Model evaluation metrics tracking

## Prerequisites

- Docker
- Docker Compose
- Python 3.12+

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd <repository-name>
```

2. Build and start the services:
```bash
docker-compose up --build
```

## Services

- Airflow Webserver: http://localhost:8888
- MLflow Tracking Server: http://localhost:5555

## Usage

1. Access Airflow UI at http://localhost:8888
   - Username: admin
   - Password: admin

2. The DAG 'model_retraining_pipeline' will be available in the Airflow UI
3. Track experiments in MLflow UI at http://localhost:5555

## Pipeline Steps

1. Data Collection
   - Collects and validates raw data
   - Saves to data/raw directory

2. Feature Engineering
   - Processes raw data
   - Creates engineered features
   - Saves to data/processed directory

3. Model Training
   - Trains Random Forest model
   - Logs parameters and metrics to MLflow
   - Saves model to models directory

4. Model Evaluation
   - Evaluates model performance
   - Logs metrics to MLflow
   - Saves evaluation results

## Directory Structure

- `src/data/`: Data collection and generation scripts
- `src/features/`: Feature engineering code
- `src/training/`: Model training code
- `src/evaluation/`: Model evaluation code
- `dags/`: Airflow DAG definitions
- `docker/`: Docker configuration files

## Environment Variables

- `AIRFLOW_HOME`: /app/airflow
- `AIRFLOW__CORE__DAGS_FOLDER`: /app/airflow/dags
- `MLFLOW_TRACKING_URI`: http://airflow-mlflow:5555

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details. 