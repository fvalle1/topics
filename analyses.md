# Download the data and run hsbm

# Clone this repo
```bash
git clone https://github.com/Biophys-Turin/topics
```

## Get data from GTex and run hSBM
[run_graph.ipynb](run_graph.ipynb)

Use this notebook to download all the data from GTEx

## Get unified data and run hSBM
[run_unified.ipynb](unified/run_unified.ipynb)

Download the [unified dataset](https://figshare.com/articles/Data_record_3/5330593) and merge the data

## Run hierarchical, LDA, WGCNA, and Topic Mapping
[alternative_clustering.ipynb](alternative_clustering.ipynb)

Fit all the algorithms described in the paper

### storing convention
every algorithm has its own folder with:
- {alg}_level_0_clusters.csv
every column contains samples-id grouped by clusters. Header contains clusters' names (*Cluster 1*, *Cluster 2*...)

- {alg}_level_0_topics.csv
every column contains genes-id grouped by topic. Header contains topics' names (*Topic 1*, *Topic 2*...)

- {alg}_level_0_topic-dist.csv
every row contains $P(topic | sample)$. Every row is a sample. Header is in the form of *doc*, *i_doc*, *Topic 1*, *Topic 2*..

- {alg}_level_0_word-dist.csv
every columns contains $P(gene | topic)$. Every column is a topic. Header is in the form of *gene*, *Topic 1*, *Topic 2*..

Algorithms that are hierarchical have multiple files changing the *level_##* number.

Examples of a directory tree:
```
|gtex
|____files.dat
|____mainTable.csv
|____clustersizes.txt
|____topicsizes.txt
|____hierarchical-log
| |____hierarchical-log_level_0_clusters.csv
| |____hierarchical-log_level_1_clusters.csv
|____lda
| |____lda_level_0_clusters.csv
| |____lda_level_0_topic-dist.csv
| |____lda_level_0_topics.csv
| |____lda_level_0_word-dist.csv
| |____lda_level_1_clusters.csv
| |____lda_level_1_topic-dist.csv
| |____lda_level_1_topics.csv
| |____lda_level_1_word-dist.csv
|____tm
| |____tm_level_0_clusters.csv
| |____tm_level_0_topic-dist.csv
| |____tm_level_0_topics.csv
| |____tm_level_0_word-dist.csv
|____topsbm
| |____graph.xml.gz
| |____topsbm_level_0_clusters.csv
| |____topsbm_level_0_topic-dist.csv
| |____topsbm_level_0_topics.csv
| |____topsbm_level_0_topics.tsv
| |____topsbm_level_0_word-dist.csv
| |____topsbm_level_1_clusters.csv
| |____topsbm_level_1_topic-dist.csv
| |____topsbm_level_1_topics.csv
| |____topsbm_level_1_topics.tsv
| |____topsbm_level_1_word-dist.csv
|____wgcna
| |____wgcna_level_0_clusters.csv
| |____wgcna_level_0_labels.csv
| |____wgcna_level_0_topic-dist.csv
| |____wgcna_level_0_topics.csv
| |____wgcna_level_0_word-dist.csv
| |____wgcna_level_1_clusters.csv
| |____wgcna_level_1_labels.csv
|____wgcna-block.1.RData
```

#### hierarchical Stochastic Block Model

hSBM save the adjacency matrix of the network in a *.xml.gz* format file. This files are provided and are called *graph.xml.gz*.

They can be loaded as following
```python
model = sbmtm()
model.load_graph("graph.xml.gz")
```

The fitted model is stored with **pickle** usually in a file called *topsbm.pkl*.   
```python
with open("topsbm.pkl","rb") as file:
  model = pickle.loads(file)
```

# Analyse output
Please choose the setting and the algorithm inside each notebook
```python 
algorithm = "topsbm"
directory = "/home/user/jovyan/topics/datasets/gtex10"
```
*algorithm* can be one of: *topsbm*, *lda*, *tm*, *wgcna*, *hierarchical-log*
*directory* can be: */path/to/gtex10*, */path/to/gtexhk*, */path/to/gtexall*, */path/to/unified*

Seee the paper for a detailed description of the different settings


## clusters
[hSBM_clusters.ipynb](hSBM_clusters.ipynb)

This notebook reproduces the bar plots with all the samples, estimates, normalises and plots the *NMI* scores.

Use this notebook to create *algorithm_labels.csv*, *clustersizes.txt*, *topicsizes.txt* when necessary or required by other algorithms.

## topics
[hSBM_topics.ipynb](hSBM_topics.ipynb)

This notebook is useful to investigate topics using GSEA

## mixtures
[hSBM_topic-dist.ipynb](hSBM_topic-dist.ipynb)

This notebook reproduces the plots of $P(sample|topic)$ distribution and the box plots of the centered version of $P(sample|topic)$

## Plot tree
[tree_plotter/plot_tree.ipynb](tree_plotter/plot_tree.ipynb)

Use this repository to reproduce the tree in output.
This notebook needs a *algorithm_labels.csv* file created in during the clusters analysis.

# Predict unseen samples
[predictor.ipynb](predictor.ipynb)

This notebooks follows the last part of our paper. Notebook are runned using [Google Colaboratory](https://colab.research.google.com/).

That Notebook was run on Colab, the results are at:
- predicting status (**health** / **tumor**) [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://drive.google.com/file/d/1vS3aAG-2falzRHuqnzyVL53vUzkAC31-/view?usp=sharing)

- predicting **sites** [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1cIO0u92uZ6sp95ceRlBFA4ccBWZWN95g?usp=sharingg)

- predicting **all primary sites** [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://drive.google.com/file/d/15zFmuDNSHkorUaIymIH8P5PtUbFq5XaF/view?usp=sharing)

(You may need to click *Open in colaboratory*)

# Single cell
In a revised version of this work we introduced a single-cell pipeline.

## Dataset
All the necessary data can be downloaded from https://figshare.com/articles/dataset/MCA_DGE_Data/5435866

## Run
The notebbok [single_cell.ipynb](single_cell.ipynb) provides the necessary steps to run all the models

## Scoring
In the notebook [scoring.ipynb](datasets/single-cell/scoring.ipynb) we provide all the necessary steps to reproduce the additional figures.