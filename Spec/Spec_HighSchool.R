#setwd("C:/R_Mini")

Spec <- read.csv("output/spec/IT.500_Ent_Spec.csv", encoding = "utf-8")
View(Spec)
str(Spec)



### 최종학력별 분류 ###
# 같은 학년 내에서도 해당 스펙을 보유하는 합격자 비율 -> 원그래프
# 토익 : mean 함수 or 구간 지정 및 빈도수 파악
# 언어 자격 등급 : factor로 빈도 수 비교
# 개수 및 횟수 : 문자열 제거 & 각 실수값 평균
library(dplyr)


tos_lv <- c('Lv1','Lv2','Lv3','Lv4','Lv5','Lv6','Lv7','Lv8')
opic_lv <- c('NL', 'NM', 'NH', 'IL', 'IM1', 'IM2', 'IM3', 'IH', 'AL')

## 고졸
Spec_h <- Spec %>% filter(school == "고졸")
company_h <- nrow(Spec_h)# 고졸 채용 회사 수

#토익
Spec_h$TOEIC <- gsub("[-]|[점]","",Spec_h$TOEIC)
Spec_h$TOEIC <- as.numeric(Spec_h$TOEIC)
h_TOEIC <- Spec_h$TOEIC[!is.na(Spec_h$TOEIC)]# 토익 있는 경우
na.TOEIC <- sum(is.na(Spec_h$TOEIC))# 토익 없는 경우
tbl.TOEIC <- data.frame(table(h_TOEIC)) # 있는 경우 분포


x_axis <- seq(300,1000,by=100)
y_axis <- seq(min(tbl.TOEIC$Freq),max(tbl.TOEIC$Freq), by=1)
axis(side=1,at=x_axis)
axis(side=2,at=y_axis)

h_TOEIC.mean <- round(mean(h_TOEIC[!is.na(h_TOEIC)]),0) # 고졸 토익 평균
h_TOEIC.max <- max(h_TOEIC) # 최고점 
h_TOEIC.min <- min(h_TOEIC) # 최저점



#토스
Spec_h$T.Speaking <- gsub("[-]","",Spec_h$T.Speaking)
Spec_h$T.Speaking <- factor(Spec_h$T.Speaking, levels = tos_lv)
#length(h_T.Speaking)
h_T.Speaking <- Spec_h$T.Speaking[!is.na(Spec_h$T.Speaking)]#있는경우
na.T.Speaking <- sum(is.na(Spec_h$T.Speaking))# 토스 없는 경우
tbl.T.Speaking <- table(h_T.Speaking) # 있는 경우 분포

barplot(as.matrix(table(tbl.T.Speaking)),beside = T, ylim = c(0,3),width = 0.93,col = rainbow(2),main="취득자 수")
axis(1,1:8,labels=tos_lv)



#오픽
Spec_h$OPIC <- gsub("[-]","",Spec_h$OPIC)
Spec_h$OPIC <- factor(Spec_h$OPIC, levels = opic_lv)
h_OPIC <- Spec_h$OPIC[!is.na(Spec_h$OPIC)] # 총 경우
na.OPIC <- sum(is.na(Spec_h$OPIC))# 오픽 없는 경우
table(h_OPIC) # 있는 경우 분포


barplot(as.matrix(table(h_OPIC)),beside = T, ylim = c(0,10),width = 1,col = "skyblue",main="취득자 수")
axis(1,1:length(opic_lv),labels=opic_lv)

table(h_OPIC)[which.max(table(h_OPIC))]

#외국어
Spec_h$language <- gsub("[-]|[개]","",Spec_h$language)
Spec_h$language <- as.numeric(Spec_h$language)
h_language <- Spec_h$language[!is.na(Spec_h$language)]
sum(is.na(Spec_h$language))# 외국어 못하는 경우
table(h_language) # 할 수 있는 경우 분포
#table() 값을 변수에 대입 후, max값의 lv값 추출

h_language.mean <- round(mean(h_language),1) # 고졸 가능 외국어 평균 갯수
h_language.max <- max(h_language) # 최다 가능 외국어



#자격증 갯수
Spec_h$cert.ea_mean<- gsub("[-]|[개]","",Spec_h$cert.ea_mean)
Spec_h$cert.ea_mean <- as.numeric(Spec_h$cert.ea_mean)
h_cert.ea_mean <- Spec_h$cert.ea_mean[!is.na(Spec_h$cert.ea_mean)]
sum(is.na(Spec_h$cert.ea_mean))# 자격증 없는 경우
table(h_cert.ea_mean) # 있는 경우 분포

h_cert.ea_mean.mean <- round(mean(h_cert.ea_mean),1) # 고졸 자격증 개수평균
h_cert.ea_mean.max <- max(h_cert.ea_mean) # 최고 개수
h_cert.ea_mean.min <- min(h_cert.ea_mean) # 최저 개수



#해외 경험
Spec_h$overseas_exp<- gsub("[-]|[회]","",Spec_h$overseas_exp)
Spec_h$overseas_exp <- as.numeric(Spec_h$overseas_exp)
h_overseas_exp <- Spec_h$overseas_exp[!is.na(Spec_h$overseas_exp)]
sum(is.na(Spec_h$overseas_exp))# 해외경험 없는 경우
table(h_overseas_exp) # 있는 경우 분포

h_overseas_exp.mean <- round(mean(h_overseas_exp),1) # 고졸 해외경험 평균 (유경험자 한해서)
h_overseas_exp.max <- max(h_overseas_exp) # 최다 경험
h_overseas_exp.min <- min(h_overseas_exp) # 최소 경험



#인턴 경험
Spec_h$intern<- gsub("[-]|[회]","",Spec_h$intern)
Spec_h$intern <- as.numeric(Spec_h$intern)
h_intern <- Spec_h$intern[!is.na(Spec_h$intern)]
sum(is.na(Spec_h$intern))# 인턴경험 없는 경우
table(h_intern) # 있는 경우 분포

h_intern.mean <- round(mean(h_intern),1) # 고졸 평균 인턴 횟수
h_intern.max <- max(h_intern) # 최다 횟수



#수상
Spec_h$prize<- gsub("[-]|[회]","",Spec_h$prize)
Spec_h$prize <- as.numeric(Spec_h$prize)
h_prize <- Spec_h$prize[!is.na(Spec_h$prize)]
sum(is.na(Spec_h$prize))# 수상경력 없는 경우
table(h_prize) # 있는 경우 분포

h_prize.mean <- round(mean(h_prize),1) # 고졸 수상 횟수 평균
h_prize.max <- max(h_prize) # 최다 수상
h_prize.min <- min(h_prize) # 최저 수상



#교내활동
Spec_h$CSS<- gsub("[-]|[회]","",Spec_h$CSS)
Spec_h$CSS <- as.numeric(Spec_h$CSS)
h_CSS <- Spec_h$CSS[!is.na(Spec_h$CSS)]
sum(is.na(Spec_h$CSS))# 교내활동 경험 없는 경우
table(h_CSS) # 있는 경우 분포

h_CSS.mean <- round(mean(h_CSS),1) # 고졸 교내활동 횟수수평균
h_CSS.max <- max(h_CSS) # 최다 활동
h_CSS.min <- min(h_CSS) # 최소 활동


save.image(file = "C:/R_Mini/Highschool_var.RData")

