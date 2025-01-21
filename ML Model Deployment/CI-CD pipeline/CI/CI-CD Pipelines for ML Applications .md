## CI/CD pipelines for ML Applications

CI/CD pipline basically handles intergration of data piepline, models and applications, and deploy to desired environmnet while handling infrastructure so the ML application can run smoothly according to requirements defined without manual involvement of integration and deployment steps.

### Continoues Integration (CI)

CI process includes automating code, data, model and piplines. Compared to traditional CI, ML CI process involves handling data, features and model evaluations.

- Version control of codes & scripts, data and features. 
    - Data processing: track and validate datasets changes (schema, anomalities, data contracts and distribution shifts), abd database connections. 
    - Feature engineering: track feature engineering changes and manage feature store.
- Verify/validate changes
    - Unit tests: Test individual fucntions and components of running scripts.
    - Integration tests: Ensure various ML pipeline stages work together and validate end-to-end workflow functionality.
    - Data processing tests: Data transformation and feature engineering.
    - Model tests:  Model evaluation (metrics) and comparison with baseline models (check model degration).
- Prepare for deployment:
    - ML application containerization and ochestrating.
    - Run intergration testing on the staging API to validate funtionality after containrization (optional).

Best practises: reproducability, testing, monitoring and collabarion 

### Continous Deployment (CD)

CD handles deploying the application (inclduing model and other components) to serving infrastructure or prduction enviromnet while maintaining scalability. Furthermore, ML applications demand additional infrastructure requiruemnts like computational resources managament and performance monitering for efficient and scalable deployment.

- Deploymnet stratergies: Batch inference, real-time inference and edge (device) deployment.
- Infrastructure: 
    - Local/inhouse servers (for sensitive data) or Cloud based like AWS (EC2, Lambda and Sagemaker).
    - Hardware: Computational requirements and demand over scale for ML applications.
    - Infrastructure as Code (IaC): Automate infrastructure provisoning and configaration for consisting deployment, scalability (resources) and reproducability (over environmnets). (e.g. Terraform)
    - Orchestration and scaling to handle workloads and load balancing (Kubernetes).
    - Monitering the application and model using metrics and visualization (Prometheus and Grafana).


### CI/CD Workflow File
This defines the steps, jobs, and configurations required to automate the process of building, testing, and deploying applications.​

​

#### 01. Workflow Metadata​

Name: Provide a descriptive name for the workflow (e.g., "CI/CD Pipeline").​
Trigger Events:​ Define events that trigger the workflow, such as:​

- `push`: Trigger on code commits.​
- `pull_request`: Trigger on PR creation or updates.​
- `schedule`: Trigger on a defined schedule (e.g., nightly builds).​
- `manual`: Allow manual execution of the workflow.​

- Environment Setup​

#### 02. Define Runners:​

- Specify the platform (e.g., ubuntu-latest, windows-latest) where the workflow will run.​

- Use self-hosted runners for more control over the execution environment.​

- Dependencies:​ Install required dependencies, such as Python packages, Node.js libraries, or system-level tools.​


#### 3. Workflow Jobs​

- Build Job:​ 
    - Compile the application or build Docker containers.​
    - Run linting and formatting checks.​
    - Cache dependencies for faster subsequent builds.​

- Test Job:​
    - Run unit tests, integration tests, and API tests.​
    - Include test reports for success/failure metrics.​
    - Perform security checks (e.g., SAST, dependency scanning).​

- Deploy Job:​
    - Define deployment steps (e.g., push Docker images, deploy to cloud services).​
    - Use environment variables for secrets like API keys or cloud credentials.​
    - Set up conditional execution (e.g., deploy only on the main branch or after manual approval).​


#### 4. Job Dependencies​

- Sequential Execution:​
    - Use needs to define dependencies between jobs (e.g., test depends on build).​
    - Parallel Execution:​
    - Allow independent jobs to run in parallel for efficiency.​

​

#### 5. Security and Secrets Management​

- Secrets:​
    - Use environment-specific secrets for sensitive information (e.g., AWS keys, database credentials).​
    - Mask secrets in workflow logs for security.​

- Security Scans:​
    - Integrate tools for static code analysis, dependency vulnerability scanning, and container image scanning.​

​

