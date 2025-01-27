#!/bin/bash

# Exit on error
set -e

# Update package list
echo "Updating package list..."
sudo apt update

# Install prerequisites
echo "Installing prerequisites..."
sudo apt install -y software-properties-common

# Add deadsnakes PPA for Python 3.8
echo "Adding deadsnakes PPA..."
sudo add-apt-repository -y ppa:deadsnakes/ppa

# Update package list again
echo "Updating package list after adding PPA..."
sudo apt update

# Install Python 3.8 and venv module
echo "Installing Python 3.8 and venv module..."
sudo apt install -y python3.8 python3.8-venv

# Verify Python 3.8 installation
echo "Verifying Python 3.8 installation..."
python3.8 --version

# Create a virtual environment using Python 3.8
if [ ! -d "venv" ]; then
    echo "Creating virtual environment with Python 3.8..."
    python3.8 -m venv venv
else
    echo "Virtual environment already exists."
fi

# Activate the virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Verify Python version in the virtual environment
echo "Verifying Python version in the virtual environment..."
python --version

# Upgrade pip, setuptools, and wheel
echo "Upgrading pip, setuptools, and wheel..."
pip install --upgrade pip setuptools wheel

# Install dependencies from requirements.txt
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies from requirements.txt..."
    pip install -r requirements.txt
else
    echo "Error: requirements.txt not found!"
    exit 1
fi

echo "#####################################"
echo "Setup complete. The virtual environment is ready to use!"
echo "#####################################"

# Activate the virtual environment again (for good measure)
source venv/bin/activate
echo "Virtual Environment Activated"