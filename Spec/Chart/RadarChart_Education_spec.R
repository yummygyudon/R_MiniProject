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
showtext_auto() 
font_add(family = "godic", regular = "font/210 옴니고딕 030.ttf")

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

max.stat <- c(4.5, 990, ceiling(max(language)),3,2,2,2.5,2.5)
min.stat <- rep(0,length(max.stat))

total.stat <- c(score.mean, TOEIC.mean, language.mean, cert.ea_mean.mean, overseas_exp.mean, intern.mean, prize.mean,CSS.mean)

highschool.stat <- c(0,h_TOEIC.mean,h_language.mean, h_cert.ea_mean.mean, h_overseas_exp.mean, h_intern.mean, h_prize.mean,h_CSS.mean)

college.stat <- c(c_score.mean ,c_TOEIC.mean,c_language.mean, c_cert.ea_mean.mean, c_overseas_exp.mean, c_intern.mean, c_prize.mean,c_CSS.mean)

universe.stat <- c(u_score.mean,u_TOEIC.mean,u_language.mean, u_cert.ea_mean.mean, u_overseas_exp.mean, u_intern.mean, u_prize.mean,u_CSS.mean)

graduate.stat <- c(g_score.mean,g_TOEIC.mean,g_language.mean, g_cert.ea_mean.mean, g_overseas_exp.mean, g_intern.mean, g_prize.mean,g_CSS.mean)


#rm(sp)
png(filename="output/all_spec.png")
  sp <- rbind(max.stat, min.stat, highschool.stat, college.stat, universe.stat, graduate.stat, total.stat)
  sp <- data.frame(sp)
  colnames(sp) <- c('학점' , '토익' , '언어' , '자격증' , '해외' , '인턴' , '수상' , '교내')
  rownames(sp) <- c('최대','최소','고졸','초대졸','대졸','대학원졸','종합')
  
  show_col(cols)
  cols <- brewer.pal(7,"Dark2")
  cols_border <- cols
  cols_space <- alpha(cols,0.05)
  
  
  #총비교
  radarchart(sp,                          
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
  legend(x=-1.5,y=1.3, legend = c('고졸','초대졸','대졸','대학원졸','종합'), bty = "n",pch = 20,pt.cex=2, col = cols_border[c(1:5)],text.col = "black",cex=0.8)
dev.off()


##고졸-초대졸
png(filename="output/Highschool-College_spec.png")
h_c <- rbind(max.stat, min.stat, highschool.stat, college.stat)
h_c <- data.frame(h_c)
colnames(h_c) <- c('학점' , '토익' , '언어' , '자격증' , '해외' , '인턴' , '수상' , '교내')
rownames(h_c) <- c('최대','최소','고졸','초대졸')

cols <- brewer.pal(4,"Dark2")
cols_border <- cols
cols_space <- alpha(cols,0.05)

radarchart(h_c,                          
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
legend(x=-1.5,y=1.3, legend = c('고졸','초대졸'), bty = "n",pch = 20,pt.cex=2, col = cols_border[c(1:2)],text.col = "black",cex=0.8)
dev.off()


##고졸-대졸
png(filename="output/Highschool-Universe_spec.png")
h_u <- rbind(max.stat, min.stat, highschool.stat, universe.stat)
h_u <- data.frame(h_u)
colnames(h_u) <- c('학점' , '토익' , '언어' , '자격증' , '해외' , '인턴' , '수상' , '교내')
rownames(h_u) <- c('최대','최소','고졸','대졸')

cols <- brewer.pal(4,"Dark2")
cols_border <- cols
cols_space <- alpha(cols,0.05)

radarchart(h_u,                          
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
legend(x=-1.5,y=1.3, legend = c('고졸','대졸'), bty = "n",pch = 20,pt.cex=2, col = cols_border[c(1:2)],text.col = "black",cex=0.8)
dev.off()


##고졸 - 대학원졸
png(filename="output/Highschool-Graduate_spec.png")
h_g <- rbind(max.stat, min.stat, highschool.stat, graduate.stat)
h_g <- data.frame(h_g)
colnames(h_g) <- c('학점' , '토익' , '언어' , '자격증' , '해외' , '인턴' , '수상' , '교내')
rownames(h_g) <- c('최대','최소','고졸','대학원졸')

cols <- brewer.pal(4,"Dark2")
cols_border <- cols
cols_space <- alpha(cols,0.05)

radarchart(h_g,                          
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
legend(x=-1.5,y=1.3, legend = c('고졸','대학원졸'), bty = "n",pch = 20,pt.cex=2, col = cols_border[c(1:2)],text.col = "black",cex=0.8)
dev.off()


##초대졸-대졸
png(filename="output/College-Universe_spec.png")
c_u <- rbind(max.stat, min.stat, college.stat, universe.stat)
c_u <- data.frame(c_u)
colnames(c_u) <- c('학점' , '토익' , '언어' , '자격증' , '해외' , '인턴' , '수상' , '교내')
rownames(c_u) <- c('최대','최소','초대졸','대졸')

cols <- brewer.pal(4,"Dark2")
cols_border <- cols
cols_space <- alpha(cols,0.05)

radarchart(c_u,                          
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
legend(x=-1.5,y=1.3, legend = c('초대졸','대졸'), bty = "n",pch = 20,pt.cex=2, col = cols_border[c(1:2)],text.col = "black",cex=0.8)
dev.off()


##초대졸-대학원졸
png(filename="output/College-Graduate_spec.png")
c_g <- rbind(max.stat, min.stat, college.stat, graduate.stat)
c_g <- data.frame(c_g)
colnames(c_g) <- c('학점' , '토익' , '언어' , '자격증' , '해외' , '인턴' , '수상' , '교내')
rownames(c_g) <- c('최대','최소','초대졸','대학원졸')

cols <- brewer.pal(4,"Dark2")
cols_border <- cols
cols_space <- alpha(cols,0.05)

radarchart(c_g,                          
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
legend(x=-1.5,y=1.3, legend = c('초대졸','대학원졸'), bty = "n",pch = 20,pt.cex=2, col = cols_border[c(1:2)],text.col = "black",cex=0.8)
dev.off()


##대졸-대학원졸
png(filename="output/Universe-Graduate_spec.png")
u_g <- rbind(max.stat, min.stat, universe.stat, graduate.stat)
u_g <- data.frame(u_g)
colnames(u_g) <- c('학점' , '토익' , '언어' , '자격증' , '해외' , '인턴' , '수상' , '교내')
rownames(u_g) <- c('최대','최소','대졸','대학원졸')

cols <- brewer.pal(4,"Dark2")
cols_border <- cols
cols_space <- alpha(cols,0.05)

radarchart(u_g,                          
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
legend(x=-1.5,y=1.3, legend = c('대졸','대학원졸'), bty = "n",pch = 20,pt.cex=2, col = cols_border[c(1:2)],text.col = "black",cex=0.8)
dev.off()