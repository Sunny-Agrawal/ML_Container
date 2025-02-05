#!/bin/bash

# Ensure necessary directories exist
mkdir -p /opt/venv
mkdir -p /usr/local/ML_Repo/public_datasets
mkdir -p /usr/local/ML_Repo/base_models
mkdir -p /usr/local/ML_Repo/custom_models
mkdir -p /usr/local/ML_Repo/custom_datasets

# Check if the virtual environment exists
if [ ! -d "/opt/venv/bin" ]; then
    echo "Virtual environment does not exist. Creating..."
    python3 -m venv /opt/venv
    source /opt/venv/bin/activate
    echo "Installing dependencies from requirements.txt..."
    pip install --upgrade pip
    pip install --no-cache-dir -r /tmp/requirements.txt
else
    echo "Virtual environment exists. Activating..."
    source /opt/venv/bin/activate
    echo "Checking for dependency updates..."
    pip install --no-cache-dir -r /tmp/requirements.txt
fi

# Pass control to CMD or keep container running
exec "$@"
