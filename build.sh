#!/bin/bash

# Make sure you are logged in to Quay with "podman login quay.io" with your username
podman login quay.io -u jclaret
if [ $? -eq 0 ]; then
    echo "Login successfully."
else
    echo "Login failed. Please check the output for errors."
    exit 1
fi

# Define the image name and tag
image_name="quay.io/jclaret/prompt-eng"
tag="v1.0"


# Build the Podman image
echo "Building Podman image..."
podman build --build-arg OPENAI_API_KEY=$OPENAI_API_KEY -t $image_name:$tag .

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Image built successfully."
else
    echo "Image build failed. Please check the output for errors."
    exit 1
fi

# Push the image to the Quay repository
echo "Pushing image to Quay repository..."
podman push $image_name:$tag

# Check if the push was successful
if [ $? -eq 0 ]; then
    echo "Image pushed successfully."
else
    echo "Failed to push image. Please check the output for errors."
    exit 1
fi

