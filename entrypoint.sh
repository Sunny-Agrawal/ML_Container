#!/bin/bash

# Ensure Conda is initialized for this session
source /opt/conda/etc/profile.d/conda.sh

# Ensure ./env and ./data directories exist
mkdir -p /opt/conda/envs
mkdir -p /usr/local/ML_Repo/public_datasets
mkdir -p /usr/local/ML_Repo/base_models
mkdir -p /usr/local/ML_Repo/custom_models
mkdir -p /usr/local/ML_Repo/custom_datasets

# Check if the Conda environment exists
if [ ! -d "/opt/conda/envs/ml_env" ]; then
    echo "Conda environment 'ml_env' does not exist. Creating..."
    conda env create -f /tmp/environment.yml -p /opt/conda/envs/ml_env
else
    echo "Conda environment 'ml_env' exists. Updating..."
    conda env update -f /tmp/environment.yml -p /opt/conda/envs/ml_env
fi

# Activate the Conda environment
echo "Activating Conda environment 'ml_env'..."
conda activate /opt/conda/envs/ml_env

# Pass control to CMD or keep container running
exec "$@"
