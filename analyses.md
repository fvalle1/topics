# Download the data and run hsbm

## Get data from TCGA

[TCGA_GetManifest.ipynb](TCGA_GetManifest.ipynb)

[Table_Creation.ipynb](Table_Creation.ipynb)

## Get data from GTex and run hSBM
[run_graph.ipynb](run_graph.ipynb)

## Run hierarchical, LDA, WGCNA, and Topic Mapping
[alternative_clustering.ipynb](alternative_clustering.ipynb)

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

Algorithms that are hierarchical have multiple files changing *lavel_##*

# Analyse output
## clusters
[hSBM_clusters.ipynb](hSBM_clusters.ipynb)

## topics
[hSBM_topics.ipynb](hSBM_topics.ipynb)

# mixtures
[hSBM_topic-dist.ipynb](hSBM_topic-dist.ipynb)
