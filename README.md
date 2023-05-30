# Jupyter Notebook with OpenAI GPT-3

This project sets up a Jupyter notebook server in a container with access to the OpenAI GPT-3 API. The server is set up using Podman and the image is stored in a Quay repository.

## Prerequisites

- Podman
- An account on Quay
- OpenAI API key

## Setup

```bash
# Clone this repository:
git clone https://github.com/yourusername/my-jupyter-notebook.git
cd my-jupyter-notebook

# Log in to Quay:
podman login quay.io

# Set your OpenAI API key as an environment variable:
export OPENAI_API_KEY=your-openai-api-key

# To build the Podman image and push it to your Quay repository, run the build.sh script:
./build.sh

# To pull the image from the Quay repository and run the container, use the run.sh script:
./run.sh
