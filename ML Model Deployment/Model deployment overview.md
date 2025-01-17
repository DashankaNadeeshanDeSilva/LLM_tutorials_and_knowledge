There are multiple ways to serve a model

1. Use FastAPI application to serve the model remotely (cloud or remote server)
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
