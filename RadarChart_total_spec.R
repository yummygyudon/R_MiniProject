##전체
Spec <- read.csv("output/spec/IT.500_Ent_Spec.csv", encoding = "utf-8")
library(fmsb)

score <- strsplit(Spec$score, "/")
score <- unlist(score)
score <- gsub("4.5","",score)
score <- as.double(score)
score <- score[!is.na(score)]
score.mean <- round(mean(score),2)

Spec$TOEIC <- gsub("[-]|[점]","",Spec$TOEIC)
Spec$TOEIC <- as.numeric(Spec$TOEIC)
TOEIC <- Spec$TOEIC[!is.na(Spec$TOEIC)]
TOEIC.mean <- round(mean(TOEIC),0)

Spec$language <- gsub("[-]|[개]","",Spec$language)
Spec$language <- as.numeric(Spec$language)
language <- Spec$language[!is.na(Spec$language)]
language.mean <- round(mean(language),1)

Spec$cert.ea_mean<- gsub("[-]|[개]","",Spec$cert.ea_mean)
Spec$cert.ea_mean <- as.numeric(Spec$cert.ea_mean)
cert.ea_mean <- Spec$cert.ea_mean[!is.na(Spec$cert.ea_mean)]
cert.ea_mean.mean <- round(mean(cert.ea_mean),1)

Spec$overseas_exp<- gsub("[-]|[회]","",Spec$overseas_exp)
Spec$overseas_exp <- as.numeric(Spec$overseas_exp)
overseas_exp <- Spec$overseas_exp[!is.na(Spec$overseas_exp)]
overseas_exp.mean <- round(mean(overseas_exp),1)

Spec$intern<- gsub("[-]|[회]","",Spec$intern)
Spec$intern <- as.numeric(Spec$intern)
intern <- Spec$intern[!is.na(Spec$intern)]
intern.mean <- round(mean(intern),1)

Spec$prize<- gsub("[-]|[회]","",Spec$prize)
Spec$prize <- as.numeric(Spec$prize)
prize <- Spec$prize[!is.na(Spec$prize)]
prize.mean <- round(mean(prize),1)

Spec$CSS<- gsub("[-]|[회]","",Spec$CSS)
Spec$CSS <- as.numeric(Spec$CSS)
CSS <- Spec$CSS[!is.na(Spec$CSS)]
CSS.mean <- round(mean(CSS),1)


#순서 (학점 - 토익 - 언어 - 자격증 - 해외 - 인턴 - 수상 - 교내)

max.stat <- c(4.5, 990, ceiling(max(language)),ceiling(max(cert.ea_mean)),ceiling(max(overseas_exp)),ceiling(max(intern)),ceiling(max(prize)),ceiling(max(CSS)))
min.stat <- rep(0,length(max.stat))

total.stat <- c(score.mean, TOEIC.mean, language.mean, cert.ea_mean.mean, overseas_exp.mean, intern.mean, prize.mean,CSS.mean)


sp <- rbind(max.stat, min.stat, total.stat)
sp <- data.frame(sp)
colnames(sp) <- c('학점' , '토익' , '언어' , '자격증' , '해외' , '인턴' , '수상' , '교내')

radarchart(sp,                          
           pcol='red',             
           pfcol='#ffe6e680',   
           plwd=3,                       
           cglcol='pink',               
           cglty=1,                     
           cglwd=0.8,                    
           axistype=1,                  
           seg=5,
           caxislabels=seq(0,10,2),
           axislabcol='grey',           
           title = '전체 평균'
)