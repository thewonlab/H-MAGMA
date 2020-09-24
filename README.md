# H-MAGMA
Authors: Nancy Sey and Hyejung Won
Created: 06/14/2019 
Updated: 09/15/2020 

## H_MAGMA.sh
* We updated the code and results using the updated version of MAGMA (MAGMA v.1.08) that better controls for the type I error rate inflation. Initial results were generated from MAGMA v.1.07b. Both versions of MAGMA can be downloaded from: https://ctg.cncr.nl/software/magma. 
* This file is to run Hi-C coupled MAGMA or H-MAGMA to assign non-coding SNPs to cognate genes. Follow the detailed script below to run H-MAGMA for fetal brain, adult brain and iPSC derived neurons and astrocyte.
   - magma/1.07b/bin/magma: using MAGMA version 1.07b 
   - magma/1.08/bin/magma: using MAGMA version 1.08
   - --bfiile g1000_eur: Reference file for European population, downloaded from [Reference data (https://ctg.cncr.nl/software/magma)]
   - --pval disorder1_GWAS.txt: P-values from GWAS summary statistics, see below. 
   - use=rsid,P: use rsid and P columns in GWAS summary statistics for SNP IDs and P-values, respectively.
   - ncol=N: use N column in GWAS summary statistics for the sample size
   - --gene-annot Fetal_brain.genes.annot: gene-SNP pairs based on the fetal brain Hi-C (provided in this repository in Input_Files folder as Fetal_brain.genes.annot).
   - --gene-annot Adult_brain.genes.annot: gene-SNP pairs based on the adult brain Hi-C (provided in this repository in Input_Files folder as Adult_brain.genes.annot).
   - --gene-annot Neuron.genes.annot: gene-SNP pairs based on the neuronal Hi-C (provided in this repository in Input_Files folder as Neuro.genes.annot).
   - --gene-annot Astro.genes.annot: gene-SNP pairs based on the astrocytic brain Hi-C (provided in this repository in Input_Files folder as Astro.genes.annot).
   - --gene-annot MAGMA.genes.annot: gene-SNP pairs based on conventional MAGMA (provided in this repository in Input_Files folder as MAGMAdefault.genes.annot.gz)
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
* Output files from H_MAGMA_v1.07.sh are provided in Output_Files/H-MAGMAv1.07.
* Output files from H_MAGMA_v1.08.sh are provided in Output_Files/H-MAGMAv1.08.
* Output files from MAGMAdefault_v1.07.sh are provided in Output_Files/MAGMAdefault.
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
* Input files are provided in RRHO_example_input folder as H-MAGMA_ADHD.FB.csv and H-MAGMA_ASD.FB.csv respectively.
   -  alternative="enrichment" : One sided test 
   -  BY=TRUE : P-value corrected by the Benjamini and Yekutieli procedure
   -  log10.ind=TRUE : P-value plotted in -log10

## Pleiotropic_genes.R
* This file is to identify a set of genes shared among at least 4 disorders. 
* To use this file, first run RRHO between pairs of disorders (e.g. ADHD vs ASD/BD/SCZ/MDD; ASD vs BD/SCZ/MDD; BD vs SCZ/MDD; SCZ vs MDD) to obtain most upregulated genes for each comparison. Then intersect gene lists to obtain pleiotropic genes (defined as genes shared in >3 disorder). 
   - sharedlist : Most upregulated genes from RRHO. This list gives significantly associated genes in both disorders.
   - HGNC : We have provided geneAnno_allgenes.rda as an input file to convert ENSEMBL gene IDs to HGNC symbols. 
               
## Reference
Please cite this paper: Sey, N.Y.A., Hu, B., Mah, W. et al. A computational tool (H-MAGMA) for improved prediction of brain-disorder risk genes by incorporating brain chromatin interaction profiles. Nat Neurosci (2020). https://doi.org/10.1038/s41593-020-0603-0

* MAGMA
   - MAGMA: de Leeuw, C. A., Mooij, J. M., Heskes, T. & Posthuma, D. MAGMA: generalized gene-set analysis of GWAS data. PLoS Comput. Biol. 11, e1004219 (2015).
   - MAGMA update: de Leeuw, C. A., Sey, N.Y.A., Posthuma, D., Won, H. A response to Yurko et al: H-MAGMA, inheriting a shaky statistical foundation, yields excess false positives. bioRxiv (2020).

* Hi-C
   - Adult brain Hi-C: Wang, D. et al. Comprehensive functional genomic resource and integrative model for the human brain. Science 362, eaat8464 (2018).
   - Fetal brain Hi-C: Won, H. et al. Chromosome conformation elucidates regulatory relationships in developing human brain. Nature 538, 523–527 (2016).
   - iPSC derived neurons and astrocytes: Rajarajan, P. et al. Neuron-specific Signatures in the Chromosomal Connectome Are Associated with Schizophrenia Risk. Science 362, eaat4311 (2018).

