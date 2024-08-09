# CI/CD Pipeline with GitHub Actions and Helm

## Overview

This repository contains a setup for a CI/CD pipeline using GitHub Actions, Docker, and Helm. The pipeline includes steps for linting, packaging, and deploying Helm charts to AWS. It is designed to streamline the deployment process and ensure consistency across environments.

## Project Structure

```plaintext
.github/
└── workflows/
    ├── build-docker.yml
    ├── lint.yml
    ├── package.yml
    ├── deploy-redis.yml
    ├── deploy-vote.yml
    ├── deploy-result.yml
    └── deploy-worker.yml
Dockerfile
my-redis-chart/
my-vote-chart/
my-result-chart/
my-worker-chart/
```

## Required CI/CD Variables and Secrets

### Docker Hub Credentials

- **`DOCKER_USERNAME`**: Your Docker Hub username.
- **`DOCKER_PASSWORD`**: Your Docker Hub password or access token.

### Helm Chart Repository Credentials

- **`HELM_REPO_URL`**: URL of the Helm chart repository.
- **`HELM_REPO_USERNAME`**: Username for Helm repository authentication (if required).
- **`HELM_REPO_PASSWORD`**: Password or token for Helm repository authentication (if required).

### AWS Credentials

- **`AWS_ACCESS_KEY_ID`**: AWS access key ID.
- **`AWS_SECRET_ACCESS_KEY`**: AWS secret access key.
- **`AWS_REGION`**: AWS region where the resources are deployed (e.g., `us-east-1`).

### Kubernetes Configuration

- **`KUBECONFIG`**: Base64-encoded Kubernetes configuration file (optional if kubectl is set up on the runner).

### GitHub Actions (for workflows)

- **`GITHUB_TOKEN`**: Automatically provided by GitHub Actions for interacting with the GitHub API (e.g., to push changes or create releases).

### Additional Environment Variables

- **`ENVIRONMENT`**: Environment variable to indicate the environment (e.g., `development`, `staging`, `production`).
