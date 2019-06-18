# H-MAGMA
Nancy Sey and Hyejung Won, 06/14/2019

## H_MAGMA.sh
* This file is to run Hi-C coupled MAGMA or H-MAGMA to assign non-coding SNPs to cognate genes. Follow the detailed script below to run H-MAGMA
   - magma/1.07b/bin/magma: We used MAGMA version 1.07b, downloaded from [MAGMA v1.07b (https://ctg.cncr.nl/software/magma)]
   - --bfiile g1000_eur: Reference file for European population, downloaded from [Reference data (https://ctg.cncr.nl/software/magma)]
   - --pval disorder1_GWAS.txt: P-values from GWAS summary statistics, see below. 
   - use=rsid,P: use rsid and P columns in GWAS summary statistics for SNP IDs and P-values, respectively.
   - ncol=N: use N column in GWAS summary statistics for the sample size
   - --gene-annot FB.genes.annot: gene-SNP pairs based on the fetal brain Hi-C (provided in this repository as    FB.genes.annot.gz).
   - --gene-annot AB.genes.annot: gene-SNP pairs based on the adult brain Hi-C (provided in this repository as AB.genes.annot.gz).
   - --out disorder1_FB: output file name

## GWAS summary statistics
* GWAS Reference
   - Attention deficit/hyperactivity disorder (ADHD): Demontis, D. et al.(2019) PMID:30478444	

   - Autism spectrum disorder (ASD): Grove, J. et al.(2019) PMID: 31116379 

   - Bipolar disorder (BD): Stahl, E. et al.(2018) PMID: 31043756

   - Schizophrenia (SCZ): Pardiñas, A. F. et al.(2018) PMID: 29483656 

   - Major depressive disorder (MDD): Howard, D. M. et al.(2019) PMID: 30718901 

   - Alzheimer’s disease (AD): Jansen, I. E. et al.(2019) PMID: 30617256
 
   - Parkinson’s disease (PD): Nalls, M. A. et al.(2019) bioRxiv 388165 doi:10.1101/388165

   - Multiple sclerosis (MS): Andlauer, T. F. M. et al.(2016) PMID: 27386562

   - Amyotrophic lateral sclerosis (ALS): van Rheenen, W. et al.(2016) PMID: 27455348


## H_MAGMA_output.xlsx 
Output files from H_MAGMA.sh for Neuropsychiatric (ADHD;ASD;BD;SCZ;MDD) and Neurodegenerative (AD;MS;PD;ALS) disorders  are provided in this repository as Neuropsyc_H-MAGMA_Output.AB.xlsx.gz; Neuropsyc_H_MAGMA_Output.FB.xlsx.gz; Neurodegenerative_H-MAGMA_Output.AB.xlsx.gz; Neurodegenerative_H-MAGMA_Output.FB.xlsx.gz
* MAGMA
   - GENE: Gene ID
   - CHR: Chromosomal location
   - START: Chromosomal start location of gene
   - STOP: Chromosomal stop location of gene
   - NSNPS: Number of SNPS annotated to gene
   - NPARAM: Number of relevant parameters used in the model
   - N: Sample size
   - ZSTAT: Z- value derived from P- value
   - P: Gene P-value 
   - FB: Denotes fetal brain Hi-C data
   - AB: Denotes adult brain Hi-C data

## RRHO.R
* This script runs gene-level overlap between two disorders based on Z-scores from H-MAGMA outputs.
   -  RRHO <Ranked gene list 1>, <Ranked gene list 2> : Ordered Z-scores from disease 1, ordered Z-scores from disease 2
   -  outputdir= <output directory> : Output file name and directory
   - alternative="enrichment" : One sided test 
   -  BY=TRUE, log10.ind=TRUE : P-value plotted in -log10

## Pleiotropic_genes.R
* This file is to identify a set of genes shared among at least 3 disorders.To use this file, first run RRHO between pairs of disorders(e.g. ADHD vs ASD/BD/SCZ/MDD; ASD vs BD/SCZ/MDD; BD vs SCZ/MDD; SCZ vs MDD)  to obtain most upregulated genes for each comparison. 
   - outputdir = "~/output/"> : Output file name and directory
   - sharedlist = c("files/RRHO_GO_MostUpregulatedADHD_VS_ASD.csv",
               "files/RRHO_GO_MostUpregulatedADHD_VS_Bipolar.csv",
               "files/RRHO_GO_MostUpregulatedADHD_VS_Schizophrenia.csv,
               "files/RRHO_GO_MostUpregulatedADHD_VS_MDD.csv",
               "files/RRHO_GO_MostUpregulatedASD_VS_Bipolar.csv",
               "files/RRHO_GO_MostUpregulatedASD_VS_Schizophrenia.csv",
               "files/RRHO_GO_MostUpregulatedASD_VS_MDD.csv",
               "files/RRHO_GO_MostUpregulatedBipolar_VS_Schizophrenia.csv",
               "files/RRHO_GO_MostUpregulatedBipolar_VS_MDD.csv",
               "files/RRHO_GO_MostUpregulatedSchizophrenia_VS_MDD.csv"): Input files from RRHO most upregulated genes 
               
   - sharedgene = c(): Creating shared genes
   -  for (i in 1:(length(sharedlist)-1)){
          for (j in (i+1):length(sharedlist)){
        dis1 = unlist(read.csv(sharedlist[i], header=F))
        dis2 = unlist(read.csv(sharedlist[j], header=F))
        sharedgene = unique(c(sharedgene, intersect(dis1, dis2)))
        print(paste(sharedlist[i],sharedlist[j]))
    } : Comparing csv files from sharedlist to generate pleiotropy genes
  - save(sharedlist, file="pleiotropygenes.rda") = Save pleiotropy genes
   
   

## Reference
Please cite this paper: Sey et al., 2019 bioRxiv (Connecting gene regulatory relationships to neurobiological mechanisms of brain disorders) -> check Methods when we said we put something in the repository. 

Adult brain Hi-C: Wang, D. et al. Comprehensive functional genomic resource and integrative model for the human brain. Science 362, eaat8464 (2018)

Fetal brain Hi-C: Won, H. et al. Chromosome conformation elucidates regulatory relationships in developing human brain. Nature 538, 523–527 (2016).





