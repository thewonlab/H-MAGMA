# H-MAGMA
Nancy Sey and Hyejung Won, 06/14/2019

## H_MAGMA.sh
* This file is to run Hi-C coupled MAGMA or H-MAGMA to assign non-coding SNPs to cognate genes. Follow the detailed script below to run H-MAGMA for fetal brain, adult brain and iPSC derived neurons and astrocyte.
   - magma/1.07b/bin/magma: We used MAGMA version 1.07b, downloaded from [MAGMA v1.07b (https://ctg.cncr.nl/software/magma)]
   - --bfiile g1000_eur: Reference file for European population, downloaded from [Reference data (https://ctg.cncr.nl/software/magma)]
   - --pval disorder1_GWAS.txt: P-values from GWAS summary statistics, see below. 
   - use=rsid,P: use rsid and P columns in GWAS summary statistics for SNP IDs and P-values, respectively.
   - ncol=N: use N column in GWAS summary statistics for the sample size
   - --gene-annot FB.genes.annot: gene-SNP pairs based on the fetal brain Hi-C (provided in this repository in Input_Files folder as FB_wointron.genes.annot).
   - --gene-annot AB.genes.annot: gene-SNP pairs based on the adult brain Hi-C (provided in this repository in Input_Files folder as AB_wointron.genes.annot.).
   - --gene-annot Neuron.genes.annot: gene-SNP pairs based on the neuronal Hi-C (provided in this repository in Input_Files folder as Neuro_wointron.genes.annot.).
  - --gene-annot Astro.genes.annot: gene-SNP pairs based on the astrocytic brain Hi-C (provided in this repository in Input_Files folder as Astro_wointron.genes.annot.).
   - --out disorder1_FB: output file name

## GWAS summary statistics
* GWAS Reference
   - Attention deficit/hyperactivity disorder (ADHD): Demontis, D. et al.(2019) PMID:30478444

   - Autism spectrum disorder (ASD): Grove, J. et al.(2019) PMID: 30804558 

   - Bipolar disorder (BD): Stahl, E. et al.(2019) PMID: 31043756

   - Schizophrenia (SCZ): Pardiñas, A. F. et al.(2018) PMID: 29483656 

   - Major depressive disorder (MDD): Howard, D. M. et al.(2019) PMID: 30718901 

   - Alzheimer’s disease (AD): Jansen, I. E. et al.(2019) PMID: 30617256
 
   - Parkinson’s disease (PD): Nalls, M. A. et al.(2019) bioRxiv 388165 doi:10.1101/388165

   - Multiple sclerosis (MS): Andlauer, T. F. M. et al.(2016) PMID: 27386562

   - Amyotrophic lateral sclerosis (ALS): van Rheenen, W. et al.(2016) PMID: 27455348


## MAGMA output files 
* Output files from H_MAGMA.sh are provided in Output_Files folder as H-MAGMA_FB_AB_output.xlsx.
* Output files from cMAGMA.sh are provided in Output_Files folder as cMAGMA_output.xlsx.
* Output files from Neuro.sh and Astro.sh are provided in Output_Files folder as H-MAGMA_Neuron_Astro_output.xlsx.
* Columns
   - GENE: Gene ID
   - CHR: Chromosomal location
   - START: Chromosomal start location of gene
   - STOP: Chromosomal stop location of gene
   - NSNPS: Number of SNPS annotated to gene
   - NPARAM: Number of relevant parameters used in the model
   - N: Sample size
   - ZSTAT: Z-scores derived from P-values
   - P: Gene level P-values 
   
   
## RRHO.R
* This script runs gene-level overlap between two disorders based on Z-scores from H-MAGMA outputs. 
* Here we provide an example code using fetal brain Hi-C MAGMA outputs for ADHD and ASD. 
* Input files are provided as H-MAGMA_ADHD.FB.csv and H-MAGMA_ASD.FB.csv respectively.
   -  alternative="enrichment" : One sided test 
   -  BY=TRUE : P-value corrected by the Benjamini and Yekutieli procedure
   -  log10.ind=TRUE : P-value plotted in -log10

## Pleiotropic_genes.R
* This file is to identify a set of genes shared among at least 4 disorders. 
* To use this file, first run RRHO between pairs of disorders (e.g. ADHD vs ASD/BD/SCZ/MDD; ASD vs BD/SCZ/MDD; BD vs SCZ/MDD; SCZ vs MDD) to obtain most upregulated genes for each comparison. Then intersect gene lists to obtain pleiotropic genes (defined as genes shared in >3 disorder). 
   - sharedlist : Most upregulated genes from RRHO. This list gives significantly associated genes in both disorders.
   - HGNC : We have provided geneAnno_allgenes.rda as an input file to convert ENSEMBL gene IDs to HGNC symbols. 
               
## Reference
Please cite this paper: Sey et al., 2019 bioRxiv (Connecting gene regulatory relationships to neurobiological mechanisms of brain disorders) -> check Methods when we said we put something in the repository. 

Adult brain Hi-C: Wang, D. et al. Comprehensive functional genomic resource and integrative model for the human brain. Science 362, eaat8464 (2018)

Fetal brain Hi-C: Won, H. et al. Chromosome conformation elucidates regulatory relationships in developing human brain. Nature 538, 523–527 (2016).

iPSC derived neurons and astrocyte : Rajarajan, P. et al. Neuron-specific Signatures in the Chromosomal Connectome Are Associated with Schizophrenia Risk. Science (80-. ). Accepted f, eaat4311 (2018).




