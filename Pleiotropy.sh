options(stringsAsFactors=F)
library(data.table)
library(stringr)
outputdir = "~/output/"

sharedlist = c() ##??
sharedgene = c()

for (i in 1:(length(sharedlist)-1)){
    for (j in (i+1):length(sharedlist)){
        dis1 = unlist(read.csv(sharedlist[i], header=F))
        dis2 = unlist(read.csv(sharedlist[j], header=F))
        sharedgene = unique(c(sharedgene, intersect(dis1, dis2))
    }
}

save(sharedlist, file="pleiotropygenes.rda")
