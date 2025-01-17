## CI/CD pipeline for ML Applications

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

CD handles deploying the application (inclduing model and other components) to serving infrastructure or prduction enviromnet like AWS (EC2 instand or Lambda) while maintaining scalability. Furthermore, ML applications demand additional infrastructure requiruemnts like computational resources managament and performance monitering for efficient and scalable deployment.