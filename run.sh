#!/bin/bash

# Define the image name and tag
image_name="quay.io/jclaret/prompt-eng"
tag="v1.0"

# Pull the image from the Quay repository
echo "Pulling image from Quay repository..."
podman pull $image_name:$tag

# Check if the pull was successful
if [ $? -eq 0 ]; then
    echo "Image pulled successfully."
else
    echo "Failed to pull image. Please check the output for errors."
    exit 1
fi

# Run the Podman container
echo "Running Podman container..."
podman run -p 8888:8888 -e OPENAI_API_KEY=$OPENAI_API_KEY $image_name:$tag

# Check if the container started successfully
if [ $? -eq 0 ]; then
    echo "Container started successfully."
else
    echo "Failed to start container. Please check the output for errors."
    exit 1
fi
