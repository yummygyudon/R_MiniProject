##전체
Spec <- read.csv("output/spec/IT.500_Ent_Spec.csv", encoding = "utf-8")
load("C:/R_Mini/Highschool_var.RData")
load("C:/R_Mini/College_var.RData")
load("C:/R_Mini/Universe_var.RData")
load("C:/R_Mini/Graduate_var.RData")
library(fmsb)
library(RColorBrewer)
library(scales)
library(showtext)
library(dplyr)
showtext_auto() 
font_add(family = "godic", regular = "font/210 옴니고딕 030.ttf")


samsung <- Spec %>% filter(company == "삼성전자(주)")
samsung.stat <- NULL
  
lg <-Spec %>% filter(company == 'LG전자(주)')
lg.stat <- NULL

lg_cns <-Spec %>% filter(company == '주식회사엘지씨엔에스')
lg_cns.stat <- NULL
  
kt <-Spec %>% filter(company == '(주)케이티')
kt.stat <- NULL
  
nc <-Spec %>% filter(company == '(주)엔씨소프트')
nc.stat <- NULL

total.stat <- NULL
  
###########################################
#삼성
score <- strsplit(samsung$score, "/")
score <- unlist(score)
score <- gsub("4.5","",score)
score <- as.double(score)
score <- score[!is.na(score)]
score.mean <- round(mean(score),2)
samsung.stat <- append(samsung.stat,score.mean)

samsung$TOEIC <- gsub("[-]|[점]","",samsung$TOEIC)
samsung$TOEIC <- as.numeric(samsung$TOEIC)
TOEIC <- samsung$TOEIC[!is.na(samsung$TOEIC)]
TOEIC.mean <- round(mean(TOEIC),0)
samsung.stat <- append(samsung.stat,TOEIC.mean)

samsung$language <- gsub("[-]|[개]","",samsung$language)
samsung$language <- as.numeric(samsung$language)
language <- samsung$language[!is.na(samsung$language)]
language.mean <- round(mean(language),1)
samsung.stat <- append(samsung.stat,language.mean)

samsung$cert.ea_mean<- gsub("[-]|[개]","",samsung$cert.ea_mean)
samsung$cert.ea_mean <- as.numeric(samsung$cert.ea_mean)
cert.ea_mean <- samsung$cert.ea_mean[!is.na(samsung$cert.ea_mean)]
cert.ea_mean.mean <- round(mean(cert.ea_mean),1)
samsung.stat <- append(samsung.stat,cert.ea_mean.mean)

samsung$overseas_exp<- gsub("[-]|[회]","",samsung$overseas_exp)
samsung$overseas_exp <- as.numeric(samsung$overseas_exp)
overseas_exp <- samsung$overseas_exp[!is.na(samsung$overseas_exp)]
overseas_exp.mean <- round(mean(overseas_exp),1)
samsung.stat <- append(samsung.stat,overseas_exp.mean)

samsung$intern<- gsub("[-]|[회]","",samsung$intern)
samsung$intern <- as.numeric(samsung$intern)
intern <- samsung$intern[!is.na(samsung$intern)]
intern.mean <- round(mean(intern),1)
samsung.stat <- append(samsung.stat,intern.mean)

samsung$prize<- gsub("[-]|[회]","",samsung$prize)
samsung$prize <- as.numeric(samsung$prize)
prize <- samsung$prize[!is.na(samsung$prize)]
prize.mean <- round(mean(prize),1)
samsung.stat <- append(samsung.stat,prize.mean)

samsung$CSS<- gsub("[-]|[회]","",samsung$CSS)
samsung$CSS <- as.numeric(samsung$CSS)
CSS <- samsung$CSS[!is.na(samsung$CSS)]
CSS.mean <- round(mean(CSS),1)
samsung.stat <- append(samsung.stat,CSS.mean)



################################################
#엘지
score <- strsplit(lg$score, "/")
score <- unlist(score)
score <- gsub("4.5","",score)
score <- as.double(score)
score <- score[!is.na(score)]
score.mean <- round(mean(score),2)
lg.stat <- append(lg.stat,score.mean)

lg$TOEIC <- gsub("[-]|[점]","",lg$TOEIC)
lg$TOEIC <- as.numeric(lg$TOEIC)
TOEIC <- lg$TOEIC[!is.na(lg$TOEIC)]
TOEIC.mean <- round(mean(TOEIC),0)
lg.stat <- append(lg.stat,TOEIC.mean)

lg$language <- gsub("[-]|[개]","",lg$language)
lg$language <- as.numeric(lg$language)
language <- lg$language[!is.na(lg$language)]
language.mean <- round(mean(language),1)
lg.stat <- append(lg.stat,language.mean)

lg$cert.ea_mean<- gsub("[-]|[개]","",lg$cert.ea_mean)
lg$cert.ea_mean <- as.numeric(lg$cert.ea_mean)
cert.ea_mean <- lg$cert.ea_mean[!is.na(lg$cert.ea_mean)]
cert.ea_mean.mean <- round(mean(cert.ea_mean),1)
lg.stat <- append(lg.stat,cert.ea_mean.mean)

lg$overseas_exp<- gsub("[-]|[회]","",lg$overseas_exp)
lg$overseas_exp <- as.numeric(lg$overseas_exp)
overseas_exp <- lg$overseas_exp[!is.na(lg$overseas_exp)]
overseas_exp.mean <- round(mean(overseas_exp),1)
lg.stat <- append(lg.stat,overseas_exp.mean)

lg$intern<- gsub("[-]|[회]","",lg$intern)
lg$intern <- as.numeric(lg$intern)
intern <- lg$intern[!is.na(lg$intern)]
intern.mean <- round(mean(intern),1)
lg.stat <- append(lg.stat,intern.mean)

lg$prize<- gsub("[-]|[회]","",lg$prize)
lg$prize <- as.numeric(lg$prize)
prize <- lg$prize[!is.na(lg$prize)]
prize.mean <- round(mean(prize),1)
lg.stat <- append(lg.stat,prize.mean)

lg$CSS<- gsub("[-]|[회]","",lg$CSS)
lg$CSS <- as.numeric(lg$CSS)
CSS <- lg$CSS[!is.na(lg$CSS)]
CSS.mean <- round(mean(CSS),1)
lg.stat <- append(lg.stat,CSS.mean)



################################################
#엘지 씨엔에스
score <- strsplit(lg_cns$score, "/")
score <- unlist(score)
score <- gsub("4.5","",score)
score <- as.double(score)
score <- score[!is.na(score)]
score.mean <- round(mean(score),2)
lg_cns.stat <- append(lg_cns.stat,score.mean)

lg_cns$TOEIC <- gsub("[-]|[점]","",lg_cns$TOEIC)
lg_cns$TOEIC <- as.numeric(lg_cns$TOEIC)
TOEIC <- lg_cns$TOEIC[!is.na(lg_cns$TOEIC)]
TOEIC.mean <- round(mean(TOEIC),0)
lg_cns.stat <- append(lg_cns.stat,TOEIC.mean)

lg_cns$language <- gsub("[-]|[개]","",lg_cns$language)
lg_cns$language <- as.numeric(lg_cns$language)
language <- lg_cns$language[!is.na(lg_cns$language)]
language.mean <- round(mean(language),1)
lg_cns.stat <- append(lg_cns.stat,language.mean)

lg_cns$cert.ea_mean<- gsub("[-]|[개]","",lg_cns$cert.ea_mean)
lg_cns$cert.ea_mean <- as.numeric(lg_cns$cert.ea_mean)
cert.ea_mean <- lg_cns$cert.ea_mean[!is.na(lg_cns$cert.ea_mean)]
cert.ea_mean.mean <- round(mean(cert.ea_mean),1)
lg_cns.stat <- append(lg_cns.stat,cert.ea_mean.mean)

lg_cns$overseas_exp<- gsub("[-]|[회]","",lg_cns$overseas_exp)
lg_cns$overseas_exp <- as.numeric(lg_cns$overseas_exp)
overseas_exp <- lg_cns$overseas_exp[!is.na(lg_cns$overseas_exp)]
overseas_exp.mean <- round(mean(overseas_exp),1)
lg_cns.stat <- append(lg_cns.stat,overseas_exp.mean)

lg_cns$intern<- gsub("[-]|[회]","",lg_cns$intern)
lg_cns$intern <- as.numeric(lg_cns$intern)
intern <- lg_cns$intern[!is.na(lg_cns$intern)]
intern.mean <- round(mean(intern),1)
lg_cns.stat <- append(lg_cns.stat,intern.mean)

lg_cns$prize<- gsub("[-]|[회]","",lg_cns$prize)
lg_cns$prize <- as.numeric(lg_cns$prize)
prize <- lg_cns$prize[!is.na(lg_cns$prize)]
prize.mean <- round(mean(prize),1)
lg_cns.stat <- append(lg_cns.stat,prize.mean)

lg_cns$CSS<- gsub("[-]|[회]","",lg_cns$CSS)
lg_cns$CSS <- as.numeric(lg_cns$CSS)
CSS <- lg_cns$CSS[!is.na(lg_cns$CSS)]
CSS.mean <- round(mean(CSS),1)
lg_cns.stat <- append(lg_cns.stat,CSS.mean)



################################################
#kt
score <- strsplit(kt$score, "/")
score <- unlist(score)
score <- gsub("4.5","",score)
score <- as.double(score)
score <- score[!is.na(score)]
score.mean <- round(mean(score),2)
kt.stat <- append(kt.stat,score.mean)

kt$TOEIC <- gsub("[-]|[점]","",kt$TOEIC)
kt$TOEIC <- as.numeric(kt$TOEIC)
TOEIC <- kt$TOEIC[!is.na(kt$TOEIC)]
TOEIC.mean <- round(mean(TOEIC),0)
kt.stat <- append(kt.stat,TOEIC.mean)

kt$language <- gsub("[-]|[개]","",kt$language)
kt$language <- as.numeric(kt$language)
language <- kt$language[!is.na(kt$language)]
language.mean <- round(mean(language),1)
kt.stat <- append(kt.stat,language.mean)

kt$cert.ea_mean<- gsub("[-]|[개]","",kt$cert.ea_mean)
kt$cert.ea_mean <- as.numeric(kt$cert.ea_mean)
cert.ea_mean <- kt$cert.ea_mean[!is.na(kt$cert.ea_mean)]
cert.ea_mean.mean <- round(mean(cert.ea_mean),1)
kt.stat <- append(kt.stat,cert.ea_mean.mean)

kt$overseas_exp<- gsub("[-]|[회]","",kt$overseas_exp)
kt$overseas_exp <- as.numeric(kt$overseas_exp)
overseas_exp <- kt$overseas_exp[!is.na(kt$overseas_exp)]
overseas_exp.mean <- round(mean(overseas_exp),1)
kt.stat <- append(kt.stat,overseas_exp.mean)

kt$intern<- gsub("[-]|[회]","",kt$intern)
kt$intern <- as.numeric(kt$intern)
intern <- kt$intern[!is.na(kt$intern)]
intern.mean <- round(mean(intern),1)
kt.stat <- append(kt.stat,intern.mean)

kt$prize<- gsub("[-]|[회]","",kt$prize)
kt$prize <- as.numeric(kt$prize)
prize <- kt$prize[!is.na(kt$prize)]
prize.mean <- round(mean(prize),1)
kt.stat <- append(kt.stat,prize.mean)

kt$CSS<- gsub("[-]|[회]","",kt$CSS)
kt$CSS <- as.numeric(kt$CSS)
CSS <- kt$CSS[!is.na(kt$CSS)]
CSS.mean <- round(mean(CSS),1)
kt.stat <- append(kt.stat,CSS.mean)


################################################
#nc
score <- strsplit(nc$score, "/")
score <- unlist(score)
score <- gsub("4.5","",score)
score <- as.double(score)
score <- score[!is.na(score)]
score.mean <- round(mean(score),2)
nc.stat <- append(nc.stat,score.mean)

nc$TOEIC <- gsub("[-]|[점]","",nc$TOEIC)
nc$TOEIC <- as.numeric(nc$TOEIC)
TOEIC <- nc$TOEIC[!is.na(nc$TOEIC)]
TOEIC.mean <- round(mean(TOEIC),0)
nc.stat <- append(nc.stat,TOEIC.mean)

nc$language <- gsub("[-]|[개]","",nc$language)
nc$language <- as.numeric(nc$language)
language <- nc$language[!is.na(nc$language)]
language.mean <- round(mean(language),1)
nc.stat <- append(nc.stat,language.mean)

nc$cert.ea_mean<- gsub("[-]|[개]","",nc$cert.ea_mean)
nc$cert.ea_mean <- as.numeric(nc$cert.ea_mean)
cert.ea_mean <- nc$cert.ea_mean[!is.na(nc$cert.ea_mean)]
cert.ea_mean.mean <- round(mean(cert.ea_mean),1)
nc.stat <- append(nc.stat,cert.ea_mean.mean)

nc$overseas_exp<- gsub("[-]|[회]","",nc$overseas_exp)
nc$overseas_exp <- as.numeric(nc$overseas_exp)
overseas_exp <- nc$overseas_exp[!is.na(nc$overseas_exp)]
overseas_exp.mean <- round(mean(overseas_exp),1)
nc.stat <- append(nc.stat,overseas_exp.mean)

nc$intern<- gsub("[-]|[회]","",nc$intern)
nc$intern <- as.numeric(nc$intern)
intern <- nc$intern[!is.na(nc$intern)]
intern.mean <- round(mean(intern),1)
nc.stat <- append(nc.stat,intern.mean)

nc$prize<- gsub("[-]|[회]","",nc$prize)
nc$prize <- as.numeric(nc$prize)
prize <- nc$prize[!is.na(nc$prize)]
prize.mean <- round(mean(prize),1)
nc.stat <- append(nc.stat,prize.mean)

nc$CSS<- gsub("[-]|[회]","",nc$CSS)
nc$CSS <- as.numeric(nc$CSS)
CSS <- nc$CSS[!is.na(nc$CSS)]
CSS.mean <- round(mean(CSS),1)
nc.stat <- append(nc.stat,CSS.mean)



################################################

#순서 (학점 - 토익 - 언어 - 자격증 - 해외 - 인턴 - 수상 - 교내)

max.stat <- c(4.5, 990, 2, 3, 2, 3, 3, 3)
min.stat <- c(3, 700, 0.5 ,2, 0.5, 1, 1, 1)

stand.stat <- rbind(max.stat, min.stat)
colnames(stand.stat) <- c('학점', '토익', '외국어', '자격증', '해외', '인턴', '수상', '교내')

total.stat <- rbind(stand.stat,samsung.stat,lg.stat,lg_cns.stat,kt.stat,nc.stat)

#rm(sp)
png(filename="output/IT.5_spec.png")
total.stat <- data.frame(total.stat)
  
  cols <- brewer.pal(7,"Dark2")
  cols_border <- cols
  cols_space <- alpha(cols,0.05)
  
  
  #총비교
  radarchart(total.stat,                          
             pcol=cols_border,             
             pfcol=cols_space,   
             plwd=3,                       
             cglcol='grey',               
             cglty=1,                     
             cglwd=0.8,                    
             axistype=1,                  
             seg=5,
             caxislabels=seq(0,10,2),
             axislabcol='black',
             vlcex = 0.8,
             title = '전체'
  )
  legend(x=-1.5,y=1.3, legend = rownames(total.stat[-c(1,2),]), bty = "n",pch = 20,pt.cex=2, col = cols_border[c(1:5)],text.col = "black",cex=0.8)
dev.off()

stat <- NULL
for (i in nrow(total.stat):3){
  png(filename=paste0("output/",rownames(total.stat)[i],".png"))
  stat <- rbind(stand.stat, total.stat[i,])
  stat <- data.frame(stat)
  
  cols <- brewer.pal(nrow(stat),"Dark2")
  cols_border <- cols
  cols_space <- alpha(cols,0.05)
  
  radarchart(stat,                          
             pcol=cols_border,             
             pfcol=cols_space,   
             plwd=3,                       
             cglcol='grey',               
             cglty=1,                     
             cglwd=0.8,                    
             axistype=1,                  
             seg=5,
             caxislabels=seq(0,10,2),
             axislabcol='black',
             vlcex = 0.8,
  )
  legend(x=-1.5,y=1.3, legend = rownames(stat[-c(1,2),]), bty = "n",pch = 20,pt.cex=3, col = cols,text.col = "black",cex=1.5)
  dev.off()
}

