RRHO(<Ranked gene list 1>, <Ranked gene list 2>, outputdir=<output directory>, alternative="enrichment", BY=TRUE, log10.ind=TRUE)
hypermat = apply(t(RRHO.example[[4]]),1,rev)
heatmap.2(hypermat, Rowv=FALSE, symm=TRUE, col=blue2green2red(maxnum), trace="none",  labCol=FALSE, scale="none")
