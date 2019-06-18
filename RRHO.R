library(RRHO)
library(gplots)
setwd("~/files/")
ADHD = read.csv("~/files/ADHD_FB.csv", header = TRUE)
ASD = read.csv("~/files/ASD_FB.csv", header = TRUE)
ADHD_ordered= ADHD[order(ADHD$ZSTAT),] #H-MAGMA output for ADHD was ordered by Z-scores 
ASD_ordered = ASD[order(ASD$ZSTAT),]  #ASD H-MAGMA output for ASD was ordred by Z-scores
RRHO.example = RRHO(ADHD,ASD, outputdir= "~/output/", alternative="enrichment",labels=c("ADHD", "ASD"), BY=TRUE, log10.ind=TRUE, plot= TRUE)
  hypermat = apply(t(RRHO.example[[4]]),1,rev)
  heatmap.2(hypermat, Rowv=FALSE, symm=TRUE, col=blue2green2red(maxnum), trace="none",  labCol=FALSE)
