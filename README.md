# Implementation for Improving Clinical Outcome Predictions Using Convolution over Medical Entities with Multimodal Learning

## Prerequisites
1. Setup your conda virtual environment with the following environment information:

    Use `environments.yaml` to generate the dependencies for the conda environment (jupyter notebooks, tensorflow, spacy, gensim...)

    Run the below

    `conda env create --name your_env_name_here --file=environments.yaml`

1. If you are having issues installing any of the packages via the conda command above use the directory `package-installer-helpers` to aid in installing:
    * _install-all.sh_ used to install dependencies manually without the `environments.yaml` file
        * This file encompasses all of the commands from the below files
    * _install-biobert-embedding.sh_ used to install biobert embedding model dependency
    * _install-glove.sh_ used to install the glove dependency
    * _install-pip-dependencies.sh_ used to install the pip dependencies



## Training Code

### Pre-requisites to start training code

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

### Actual Training Code

### The below notebook files perform training and writing evaluative results to the hard drive. 

1. Run `05-Represent-Entities-With-Different-Embeddings.ipynb` . This notebook will do the following things
    a) To convert medical entities into word representations.
    b) Prepare the timeseries data to fed through GRU / LSTM.
    c) Run multimodal baseline to predict 4 different clinical tasks

1. Run `07-Timeseries-Baseline.ipynb` to run timeseries baseline model to predict 4 different clinical tasks.

1. Run `09-Proposed-Model.ipynb` to run proposed model to predict 4 different clinical tasks.

## Evaluation Code

### The below notebook files perform training and writing evaluative results to the hard drive. However step 3 is critical to evaluate the results of the trained models.

1. Run `07-Timeseries-Baseline.ipynb` to run timeseries baseline model to predict 4 different clinical tasks.

1. Run `09-Proposed-Model.ipynb` to run proposed model to predict 4 different clinical tasks.

1. Run `10-Summary.ipynb` to display results of each model.


## Pretrained Models

`pretrained-models` is the directory for the models that we generated plus maybe the models we used </br>
The models are in the format of: 
* (GRU|LSTM)-(128|256)-problem_type-best_model.hdf5: These are the models generated from `07-TimeseriesBaseline.ipynb`
    * 128|256 denotes the GRU|LSTM size
    * problem_type: mort_hosp, mort_icu, los_3, los_7
* avg-(fasttext|concat|biobert|word2vec)-problem_type-best_model.hdf5: These are models generated from `08-Multimodal-Baseline.ipynb`
    * problem_type: mort_hosp, mort_icu, los_3, los_7
* 64-basiccnn1d-(fasttext|concat|biobert|word2vec)-problem_type-best_model.hdf5: These are the models generated from `09-Proposed-Model.ipynb`
    * 64 denotes the max height of the CNN image size
    * problem_type: mort_hosp, mort_icu, los_3, los_7 

## References

Download the MIMIC-III dataset via https://mimic.physionet.org/

MIMIC-Extract implementation: https://github.com/MLforHealth/MIMIC_Extract

med7 implementation: https://github.com/kormilitzin/med7

Download Pre-trained Word2Vec & FastText embeddings: https://github.com/kexinhuang12345/clinicalBERT

Preprocessing Script: https://github.com/kaggarwal/ClinicalNotesICU

Biobert embedding repo: https://github.com/Overfitter/biobert_embedding