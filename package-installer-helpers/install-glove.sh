#!/bin/bash 

# this file is necessary if conda/pip cannot resolve glove for you
# install glove manually

echo "installing glove"

# grab the gcc compiler
apt-get update && apt-get install -y gcc

# grab the g++ compiler
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