options(stringsAsFactors=F)
outputdir = "~/output/"
sharedlist = c("files/RRHO_GO_MostUpregulatedADHD_VS_ASD.csv",
               "files/RRHO_GO_MostUpregulatedADHD_VS_Bipolar.csv",
               "files/RRHO_GO_MostUpregulatedADHD_VS_Schizophrenia.csv,
               "files/RRHO_GO_MostUpregulatedADHD_VS_MDD.csv",
               "files/RRHO_GO_MostUpregulatedASD_VS_Bipolar.csv",
               "files/RRHO_GO_MostUpregulatedASD_VS_Schizophrenia.csv",
               "files/RRHO_GO_MostUpregulatedASD_VS_MDD.csv",
               "files/RRHO_GO_MostUpregulatedBipolar_VS_Schizophrenia.csv",
               "files/RRHO_GO_MostUpregulatedBipolar_VS_MDD.csv",
               "files/RRHO_GO_MostUpregulatedSchizophrenia_VS_MDD.csv") ##??
sharedgene = c()

for (i in 1:(length(sharedlist)-1)){
    for (j in (i+1):length(sharedlist)){
        dis1 = unlist(read.csv(sharedlist[i], header=F))
        dis2 = unlist(read.csv(sharedlist[j], header=F))
        sharedgene = unique(c(sharedgene, intersect(dis1, dis2))
    }
}

save(sharedlist, file="pleiotropygenes.rda")
