flowchart TD
    subgraph "Local Development"
        A[Developer Machine] -->|git push| B[Git Repository]
    end

    subgraph "CI/CD Pipeline"
        B -->|trigger| C[Build Stage]
        C -->|success| D[Test Stage]
        D -->|success| E[Deploy Stage]
    end

    subgraph "AWS Infrastructure"
        E -->|deploy frontend| F[S3 + CloudFront]
        E -->|deploy backend| G[ECR + ECS]
    end

    style Local fill:#e6f3ff
    style "CI/CD Pipeline" fill:#fff3e6
    style "AWS Infrastructure" fill:#e6ffe6