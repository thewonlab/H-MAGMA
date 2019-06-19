library(RRHO)
library(gplots)
setwd("~/files/")

ADHD = read.csv("H-MAGMA_ADHD_FB.csv", header = TRUE)
ASD = read.csv("H-MAGMA_ASD_FB.csv", header = TRUE)

RRHO.example = RRHO(ADHD,ASD, outputdir= "~/output/", alternative="enrichment",labels=c("ADHD", "ASD"), BY=TRUE, log10.ind=TRUE, plot=TRUE)
hypermat = apply(t(RRHO.example[[4]]),1,rev)
heatmap.2(hypermat, Rowv=FALSE, symm=TRUE, trace="none", labCol=FALSE)
