# Simple Static Website Deployment with Docker and Kubernetes

This project demonstrates a simple way to deploy a static website using Docker containers orchestrated by Kubernetes. It includes instructions for setting up the project, building the Docker image, deploying to Kubernetes, and accessing the website.

## Prerequisites

Before you begin, ensure you have the following installed:

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Kubernetes (optional, for deployment): [Install Minikube](https://minikube.sigs.k8s.io/docs/start/)
- kubectl: [Install kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

## Getting Started

### 1. Clone the Repository

```bash
git clone <repository-url>
cd <repository-name>
```
### 2. Create your HTML and CSS File

Create an HTML and CSS file (e.g., index.html) with the content you want to display on your website.

### 3. Create DockerFile

Create a Dockerfile in the project directory with the following content:
```bash
# Use NGINX base image
FROM nginx:latest

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy HTML and CSS files to NGINX default public directory
COPY index.html .
# COPY styles.css .    # If you have a separate CSS file

# Expose port 80
EXPOSE 80
```

### 4. Build Docker Image
Build the Docker image using the following command:
```bash
docker build -t my-static-website .
```

### 5. Run Docker Container (Optional)
Run a Docker container from the built image to test if your website is working locally:
```bash
docker run -d -p 8080:80 my-static-website
```
Now you can access your website locally at http://localhost:8080.

### 6. Deploy to Kubernetes (Optional)
If you want to deploy your application to Kubernetes, follow these steps:

Create a Kubernetes Deployment YAML file (e.g., deployment.yaml) and a Service YAML file (e.g., service.yaml) using the provided templates in the project.
Apply the Kubernetes manifests using the following commands:
```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

### 7. Access Your Website
Once deployed, you can access your website using the appropriate endpoint based on your Kubernetes service type:

- NodePort: Access your website using any node's IP address and the allocated NodePort.
- ClusterIP: Use port forwarding or create a proxy to access your website locally.

### 8. Troubleshooting
If you encounter any issues during deployment, here are some common troubleshooting tips:

- Docker Build Fails: Ensure your Dockerfile is correctly configured and all necessary files are present in the build context.
- Kubernetes Deployment Errors: Check the logs of your Kubernetes pods for any error messages that might indicate deployment issues.
- Accessing the Website: If you're unable to access your website, ensure that your service is running and properly exposed.

### 9. Contributing
Contributions are welcome! Here are some guidelines on how to contribute effectively to the project:

- Fork the repository and create a new branch for your feature or bug fix.
- Make your changes and ensure they follow the project's coding standards and conventions.
- Write tests for your changes if applicable.
- Submit a pull request detailing the changes you made and any relevant information.
