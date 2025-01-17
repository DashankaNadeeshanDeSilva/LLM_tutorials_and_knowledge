## There are multiple ways to serve a model

### General Workflow:
1. Setup an application (FastAPI or/and Docker) or use a tool/framework (MLflow) to serve the model.
2. Deploy the app (containing the model inference) to cloud instance (or remote server) and expose via endpoint (e.g., `http://<server-ip>:8000/predict`)
3. Perform inference from your appliation (user/client) by seding a http POST request to the served model.







### Use FastAPI application to serve the model remotely (cloud or remote server)

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
