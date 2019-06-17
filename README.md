# H-MAGMA
Nancy Sey and Hyejung Won, 06/14/2019

## H_MAGMA.sh
* This file is to run Hi-C coupled MAGMA or H-MAGMA to assign non-coding SNPs to cognate genes.Follow the detailed script below to run H-MAGMA
   - magma/1.07b/bin/magma: We used MAGMA version 1.07b, downloaded from [MAGMA (https://ctg.cncr.nl/software/magma)]
   - --bfiile g1000_eur: Reference file for European population, downloaded from XXX 
   - --pval disorder1_GWAS.txt: P-values from GWAS summary statistics, see below. 
   - use=rsid,P: use rsid and P columns in GWAS summary statistics for SNP IDs and P-values, respectively.
   - ncol=N: use N column in GWAS summary statistics for the sample size
   - --gene-annot FB.genes.annot: Hi-C based gene-SNP pairs in the fetal brain (provided in this repository as    FB_wointron.genes.annot.csv.zip).
   - --gene-annot AB.genes.annot: Hi-C based gene-SNP pairs in the adult brain (provided in this repository as AB_wointron.genes.annot.csv.zip).
   - --out disorder1_FB: output file name

## GWAS summary statistics
* GWAS	Reference
   - Attention deficit/hyperactivity disorder (ADHD): Demontis, D. et al.(2019) PMID:30478444	

   - Autism spectrum disorder (ASD): Grove, J. et al.(2019) PMID: 31116379 

   - Bipolar disorder (BD): Stahl, E. et al.(2018)bioRxiv 173062 (2018). doi:10.1101/173062

   - Schizophrenia (SCZ):Pardiñas, A. F. et al.(2018) PMID: 29483656 

   - Major depressive disorder (MDD): Howard, D. M. et al.(2019) PMID: 30718901 

   - Alzheimer’s disease (AD): Jansen, I. E. et al.(2019) PMID: 30617256
 
   - Parkinson’s disease (PD): Nalls, M. A. et al.(2019) bioRxiv 388165 (2019). doi:10.1101/388165

   - Multiple sclerosis (MS): Andlauer, T. F. M. et al.(2016) PMID: 27386562

   - Amyotrophic lateral sclerosis (ALS): van Rheenen, W. et al.(2016) PMID: 27455348	



## H_MAGMA_output.xlsx 
Example Output file from H_MAGMA.sh for ADHD is provided in this repository as H_MAGMA_Output.xlsx

## RRHO.R
* This file is to identify gene-level overlap between two disorders using Z-scores from H-MAGMA outputs.
   - install.packages("gplots")
   - library(RRHO)
   - library(gplots)
   -  RRHO <Ranked gene list 1>, <Ranked gene list 2> : Ordered Z-scores from disease 1, ordered Z-scores from disease 2
   -  outputdir= <output directory> : output file name and directory
   - alternative="enrichment" : One sided test 
   -  BY=TRUE, log10.ind=TRUE : P-value plotted in -log10

## Pleiotropic_genes.R


## Reference
Please cite this paper: Sey et al., 2019 bioRxiv (Connecting gene regulatory relationships to neurobiological mechanisms of brain disorders) -> check Methods when we said we put something in the repository. 

Adult brain Hi-C: Wang, D. et al. Comprehensive functional genomic resource and integrative model for the human brain. Science 362, eaat8464 (2018)

Fetal brain Hi-C: Won, H. et al. Chromosome conformation elucidates regulatory relationships in developing human brain. Nature 538, 523–527 (2016).





