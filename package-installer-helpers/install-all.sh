#!/bin/bash 

# run this file only if you want to install dependencies manually without installing
# via conda envionrments.yaml file

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


echo "installing glove"
apt-get update && apt-get install -y gcc
apt-get install -y build-essential

git clone https://github.com/7Puentes/glove-python.git
cd glove-python
cd glove
pip install cython
cython glove_cython.pyx
cythonize glove_cython.pyx
cython metrics/accuracy_cython.pyx
cythonize metrics/accuracy_cython.pyx
cython --cplus corpus_cython.pyx
cythonize corpus_cython.pyx
cd ../
python setup.py install
cd ../
rm -rf glove-python


echo "intalling bio-bert"
pip3 install setuptools wheel
pip3 install tqdm
pip3 install --upgrade twine

git clone https://github.com/helxplatform/biobert_embedding.git; \
cd biobert_embedding; \
python setup.py bdist_wheel; \
cd .. ;\
pip3 install ./biobert_embedding/dist/biobert_embedding-0.1.2-py3-none-any.whl
