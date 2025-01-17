## Deplying ML model

### General Workflow:
1. Setup an application (FastAPI or/and Docker) or use a tool/framework (MLflow) to serve the model.
2. Deploy the app (containing the model inference) to cloud instance (or remote server) and expose via endpoint (e.g., `http://<server-ip>:8000/predict`)
3. Perform inference from your appliation (user/client) by seding a http POST request to the served model.


### 01. Use FastAPI application to serve the model remotely (cloud or remote server)

#### Case 1: FastAPI app

- Write a REST APi app (FastAPI) application to inference 
- Setup the cloud environmnet" AWS/GCP/Azure (free tiers available) and Huggingface Spaces (almost free)
- Example case on AWS: Launch and EC2 instance, SSH into the instance and deploy the app by running directly or via docker container.
- Configure firewal or security group to allow incoming traffic to the defined port (can be tested via Postman)
- Hosted/Deployed model can be accessed by sending a (http) POST request from the application for inference the model.

    ```python
    import requests

    url = "http://<server-ip>:8000/predict"
    data = {"input": [1.0, 2.0, 3.0]}
    response = requests.post(url, json=data)

    if response.status_code == 200:
        print("Prediction:", response.json())
    else:
        print("Error:", response.status_code, response.text)
    ```

#### Case 2: FastAPI app with Docker

- Setup and test the FastAPI app for model serving
- Deploy the app in cloud instance (AWS EC2 instance) by building the Docker image from the FastAPI app and running the Docker container. (In case of multiple containers like user application and served model use Docker-compose to ochestrate).
- Inference the served model by seding a http POST request.

### 02. Using MLflow to serve ML model 

MLflow provides built-in functionality to serve ML model via REST API (use minimal codes). Advantages: MLflow simpliifies the model versioning and expermiment tracking and supports remote model deployment (AWS). Limitations: MLflow model serving cannot be handled with additional processing logic and limited customization (compared to FastAPI).

- Train the ML model and log the experiment in MLflow (experiment tracking and model versioning)
- Register model in MLflow: Organize (versioning and manage) and store trained models artifacts (use model name and version) in Model Regisrty and transition of the model to a specific stage in the ML lifecycle (e.g. prodcution)
- Serve/deploy the model using `MLflow model serve` in local/remote server and expose the mode via REST API endpoint (e.g. `http://<server-ip>:5000/invocations`)
    ```bash 
    mlflow models serve -m "models:/MyModel/1" --host 0.0.0.0 --port 5000
    ```
- Inferenc the model from MLflow endpoint in user/client application (FastAPI) using a POST request
    ```python
    from fastapi import FastAPI
    import requests

    app = FastAPI()

    MLFLOW_SERVER_URL = "http://<mlflow-server-ip>:5000/invocations"

    @app.post("/predict")
    async def predict(input_data: dict):
        response = requests.post(MLFLOW_SERVER_URL, json=input_data)
        return response.json()
    ```
    In this example, MLflow handles the model lifecycle (logging, versioning, serving) and the FastAPI app handles business logic, pre/post processing.

- Deploying MLflow in cloud to serve model:
    - Use Docker to containerize MLflow model serving: includes model artifact transferring and running model serve command in docker file (e.g. `CMD ["mlflow", "models", "serve", "-m", "models:/MyModel/1", "--host", "0.0.0.0", "--port", "5000"]`).
    - Deploy the container on cloud (build and run) and expose the `/invocation` endpoint for extrenal access (inference with a client app).



