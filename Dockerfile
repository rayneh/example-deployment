# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Set SHELL option to handle failures in piped commands
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install required packages with pinned versions and avoid additional packages
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    curl=7.74.0-1.3+deb11u2 \
    git=1:2.30.2-1 \
    unzip=6.0-26 \
    bash=5.1-2+deb11u1 \
    jq=1.6-2 \
    && rm -rf /var/lib/apt/lists/*

# Install Helm
RUN curl -fsSL https://get.helm.sh/helm-v3.9.4-linux-amd64.tar.gz | tar xzf - && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    rm -rf linux-amd64

# Install AWS CLI
RUN curl -fsSL "https://d1uj6qtbmh3dt5.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm awscliv2.zip

# Install yamllint with pinned version
RUN pip install --no-cache-dir yamllint==1.26.3

# Set working directory
WORKDIR /workspace

# Default command
CMD [ "bash" ]
