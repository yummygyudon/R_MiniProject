library(ggplot2)
Spec <- read.csv("output/spec/IT.500_Ent_Spec.csv", encoding = "utf-8")
load("C:/R_Mini/RData/Total_Percent.RData")




lbls <- colnames(total.ratio)
### 토익 유무
#전체
rownames(total.ratio)[1]

#par(mfrow=c(1,1))
for (i in 1:nrow(total.ratio)){
    png(filename=paste0("output/spec/",rownames(total.ratio)[i],".png"))
    data <- total.ratio[i,]
    pct100 <- as.numeric(data)  


    pie(pct100,
        labels = paste0(lbls,"(",pct100,"%)"),
        main = gsub(".pct","",rownames(total.ratio)[i]),
        col = c("#3366ff", "#99ccff")
    )
    dev.off()
}

