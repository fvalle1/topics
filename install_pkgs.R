if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager", dependencies=TRUE, repos='http://cran.rstudio.com/')

BiocManager::install("edgeR")
BiocManager::install('DESeq2')

install.packages("clustree", dependencies=TRUE, repos='http://cran.rstudio.com/')

BiocManager::install("WGCNA")
BiocManager::install("GO.db")
BiocManager::install("AnnotationDbi")
BiocManager::install("org.Hs.eg.db")
BiocManager::install("biomaRt")


