options(stringsAsFactors=F)
library(gProfileR)
library(ggplot2)
library(GenomicRanges)
library(data.table)
library(stringr)
load(<Annotation for all genes>)
celltype = ""
outputdir = <output filename and directory>

sharedlist = c()
sharedgene = c()

for (i in 1:(length(sharedlist)-1)){
    for (j in (i+1):length(sharedlist)){
        dis1 = unlist(read.csv(sharedlist[i], header=F))
        dis2 = unlist(read.csv(sharedlist[j], header=F))
        sharedgene = unique(c(sharedgene, intersect(dis1, dis2)))
        print(paste(sharedlist[i],sharedlist[j]))
    }
}
length(sharedgene)

goresult = gprofiler(sharedgene, organism="hsapiens", ordered_query=F, significant=T, 
                     max_p_value=0.05, min_set_size=15, max_set_size=600,
                     min_isect_size=5, correction_method="fdr",custom_bg=rownames(dismat),
                     hier_filtering="strong",  include_graph=T, src_filter="GO")

save(goresult, file=paste0(outputdir, "GO_pleiotropy_genes.rda"))
