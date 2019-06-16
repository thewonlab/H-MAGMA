# H-MAGMA
Nancy Sey and Hyejung Won, 06/14/2019

## H_MAGMA.sh
* This file is XXX. 
   - magma/1.07b/bin/magma: We used MAGMA version 1.07b, downloaded from XXX
   - --bfiile g1000_eur: Reference file for European population, downloaded from XXX 
   - --pval disorder1_GWAS.txt: P-values from GWAS summary statistics, see below. 
   - use=rsid,P: use rsid and P columns in GWAS summary statistics for SNP IDs and P-values, respectively.
   - ncol=N: use N column in GWAS summary statistics for the sample size
   - --gene-annot FB.genes.annot: Hi-C based gene-SNP pairs in the fetal brain (provided in this repository as    FB_wointron.genes.annot.csv.zip).
   - --gene-annot AB.genes.annot: Hi-C based gene-SNP pairs in the adult brain (provided in this repository as AB_wointron.genes.annot.csv.zip).
   - --out disorder1_FB: output file name

## GWAS summary statistics

## H_MAGMA_output.xlsx 
* Output files from H_MAGMA.sh

## RRHO.R
* This file is to XXX

## Pleiotropic_genes.R


## Reference
Please cite this paper: Sey et al., 2019 bioRxiv (Connecting gene regulatory relationships to neurobiological mechanisms of brain disorders) -> check Methods when we said we put something in the repository. 

Adult brain Hi-C: Wang, D. et al. Comprehensive functional genomic resource and integrative model for the human brain. Science 362, eaat8464 (2018)

Fetal brain Hi-C: Won, H. et al. Chromosome conformation elucidates regulatory relationships in developing human brain. Nature 538, 523–527 (2016).





