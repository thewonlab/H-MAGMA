library(RRHO)
library(gplots)
setwd("~/files/")

ADHD = read.csv("H-MAGMA_ADHD_FB.csv", header = TRUE)
ASD = read.csv("H-MAGMA_ASD_FB.csv", header = TRUE)

convert <- function(x){
    # x is the name of the disorder
    x = x[,c("GENE","P")];
    x$P = -log10(x$P)
    
    return(x)
}
ADHD_convert = convert(ADHD)
ASD_convert = convert(ASD)

RRHO.example = RRHO(ADHD_convert,ASD_convert, outputdir= "~/output/", alternative="enrichment",labels=c("ADHD", "ASD"), BY=TRUE, log10.ind=TRUE, plot=TRUE)
hypermat = apply(t(RRHO.example[[4]]),1,rev)
heatmap.2(hypermat, Rowv=FALSE, symm=TRUE, trace="none", labCol=FALSE)
