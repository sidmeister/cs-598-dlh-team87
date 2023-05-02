#!/bin/bash 

# this file is necessary if you're not setting up the conda environment from the environments.yaml file located at root repo

echo "Starting..."
echo "Installing baseline requirements"
pip3 install --upgrade pip
pip3 install -U tensorflow
pip3 install --upgrade --force-reinstall --no-cache-dir jupyter
apt install jupyter-core
pip3 install -U spacy
pip3 install pandas
pip3 install gensim
pip3 install -U scikit-learn scipy matplotlib