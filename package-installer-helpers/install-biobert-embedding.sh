#!/bin/bash 

echo "intalling bio-bert"

# this file is only necessary if you're having issues install biobert-embedding
# we had issues with intalling the biobert embedding model and info directly
# due to package collision as shown here: https://github.com/Overfitter/biobert_embedding/pull/4/files

# install the required pip3 local publishing tools
pip3 install setuptools wheel
pip3 install tqdm
pip3 install --upgrade twine

# download the biobert embedding repo
git clone https://github.com/helxplatform/biobert_embedding.git; \
cd biobert_embedding; \
python setup.py bdist_wheel; \
cd .. ;\
pip3 install ./biobert_embedding/dist/biobert_embedding-0.1.2-py3-none-any.whl