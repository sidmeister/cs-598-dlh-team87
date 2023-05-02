# Implementation for Improving Clinical Outcome Predictions Using Convolution over Medical Entities with Multimodal Learning

## Prerequisites
1. Setup your conda virtual environment with the following environment information:

    `environments.yaml`

    `conda env create --name your_env_name_here --file=environments.yaml`

1. If you are having issues installing any of the packages via the conda command above use the directory `package-installer-helpers` to aid in installing:
    * _install-all.sh_ used to install dependencies manually without the `environments.yaml` file
        * This file encompasses all of the commands from the below files
    * _install-biobert-embedding.sh_ used to install biobert embedding model dependency
    * _install-glove.sh_ used to install the glove dependency
    * _install-pip-dependencies.sh_ used to install the pip dependencies

## Usage

1. Clone the code to local.   
```
https://github.com/sidmeister/cs-598-dlh-team87.git
cd cs-598-dlh-team87
```
2. Run MIMIC-Extract Pipeline as explained in https://github.com/MLforHealth/MIMIC_Extract.   

2. Copy the output file of MIMIC-Extract Pipeline named `all_hourly_data.h5` to `data` folder.

2. Run `01-Extract-Timseries-Features.ipnyb` to extract first 24 hours timeseries features from MIMIC-Extract raw data.

2. Copy the `ADMISSIONS.csv`, `NOTEEVENTS.csv`, `ICUSTAYS.csv` files into `data` folder.

2. Run `02-Select-SubClinicalNotes.ipynb` to select subnotes based on criteria from all MIMIC-III Notes.

2. Run `03-Prprocess-Clinical-Notes.ipnyb` to prepocessing notes.

2. Run `04-Apply-med7-on-Clinical-Notes.ipynb` to extract medical entities. 

2. Unzip embeddings.zip into `embeddings` folder 

2. Run `05-Represent-Entities-With-Different-Embeddings.ipynb` . This notebook will do the following things
    a) To convert medical entities into word representations.
    b) Prepare the timeseries data to fed through GRU / LSTM.
    c) Run multimodal baseline to predict 4 different clinical tasks

2. Run `07-Timeseries-Baseline.ipynb` to run timeseries baseline model to predict 4 different clinical tasks.

2. Run `09-Proposed-Model.ipynb` to run proposed model to predict 4 different clinical tasks.

2. Run `10-Summary.ipynb` to display results of each model.

## References

Download the MIMIC-III dataset via https://mimic.physionet.org/

MIMIC-Extract implementation: https://github.com/MLforHealth/MIMIC_Extract

med7 implementation: https://github.com/kormilitzin/med7

Download Pre-trained Word2Vec & FastText embeddings: https://github.com/kexinhuang12345/clinicalBERT

Preprocessing Script: https://github.com/kaggarwal/ClinicalNotesICU

