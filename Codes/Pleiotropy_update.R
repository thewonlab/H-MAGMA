options(stringsAsFactors = F)
load("/proj/hyejunglab/chr/geneAnno_allgenes.rda")
outputdir = "/proj/hyejunglab/crossdisorder/MAGMA/RRHO/Neuro/"

sharedlist = c("/proj/hyejunglab/crossdisorder/MAGMA/RRHO/Neuro/RRHO_GO_MostUpregulatedADHD_VS_ASD.csv",
               "/proj/hyejunglab/crossdisorder/MAGMA/RRHO/Neuro/RRHO_GO_MostUpregulatedADHD_VS_Bipolar.csv",
               "/proj/hyejunglab/crossdisorder/MAGMA/RRHO/Neuro/RRHO_GO_MostUpregulatedADHD_VS_Schizophrenia.csv",
               "/proj/hyejunglab/crossdisorder/MAGMA/RRHO/Neuro/RRHO_GO_MostUpregulatedADHD_VS_MDD.csv",
               "/proj/hyejunglab/crossdisorder/MAGMA/RRHO/Neuro/RRHO_GO_MostUpregulatedASD_VS_Bipolar.csv",
               "/proj/hyejunglab/crossdisorder/MAGMA/RRHO/Neuro/RRHO_GO_MostUpregulatedASD_VS_Schizophrenia.csv",
               "/proj/hyejunglab/crossdisorder/MAGMA/RRHO/Neuro/RRHO_GO_MostUpregulatedASD_VS_MDD.csv",
               "/proj/hyejunglab/crossdisorder/MAGMA/RRHO/Neuro/RRHO_GO_MostUpregulatedBipolar_VS_Schizophrenia.csv",
               "/proj/hyejunglab/crossdisorder/MAGMA/RRHO/Neuro/RRHO_GO_MostUpregulatedBipolar_VS_MDD.csv",
               "/proj/hyejunglab/crossdisorder/MAGMA/RRHO/Neuro/RRHO_GO_MostUpregulatedSchizophrenia_VS_MDD.csv")
discomb = unlist(lapply(strsplit(sharedlist,split="/"),'[[',8))
discomb = gsub("RRHO_GO_MostUpregulated","",discomb)
discomb = gsub(".csv","",discomb)
discomb = gsub("_VS_","|",discomb)

sharedgene = c()
for (i in 1:(length(sharedlist)-1)){
    for (j in (i+1):length(sharedlist)){
        dis1 = unlist(read.csv(sharedlist[i], header=F))
        dis1name = discomb[i]
        dis2 = unlist(read.csv(sharedlist[j], header=F))
        dis2name = discomb[j]
        
        genes2add = data.frame(genes=intersect(dis1, dis2), dis=paste(dis1name, dis2name, sep="|"))
        
        sharedgene = rbind(sharedgene, genes2add)
        print(paste(discomb[i],discomb[j]))
    }
}
dim(sharedgene)
sharedagg = aggregate(sharedgene, by=list(sharedgene$genes), unique)
sharedis = sharedagg$dis
sharedis = lapply(sharedis, function(x){paste(unique(unlist(strsplit(x,split="[|]"))),collapse="|")})
sharedis = lapply(sharedis, function(x){gsub("Schizophrenia", "SCZ", x)})
sharedis = lapply(sharedis, function(x){gsub("Bipolar", "BD", x)})

sharedagg$dis = sharedis
pleiotropicgenes = sharedagg[,2:3]
colnames(pleiotropicgenes) = c("ENSGID","Disorders")
pleiotropicgenes$Disorders = unlist(pleiotropicgenes$Disorders)
pleiotropicgenes$HGNC = geneAnno1[match(pleiotropicgenes$ENSGID,geneAnno1$ensembl_gene_id),"hgnc_symbol"]
pleiotropicgenes = data.frame(pleiotropicgenes)
write.csv(pleiotropicgenes, file="/proj/hyejunglab/crossdisorder/MAGMA/RRHO/Neuro/pleiotropic_genes.csv")
