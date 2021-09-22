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
library(ggplot2)

tos_lv <- c('Lv1','Lv2','Lv3','Lv4','Lv5','Lv6','Lv7','Lv8')
opic_lv <- c('NL', 'NM', 'NH', 'IL', 'IM1', 'IM2', 'IM3', 'IH', 'AL')

## 대졸
Spec_u <- Spec %>% filter(school == "대졸")
nrow(Spec_u)# 초대졸 채용 회사 수



#학점
score <- strsplit(Spec_u$score, "/")
score <- unlist(score)
score <- gsub("4.5","",score)
score <- as.double(score)
score <- score[!is.na(score)] #; length(score)

u_score.mean <- round(mean(score),2)
u_score.max <- max(score) 
u_score.min <- min(score)



#토익
Spec_u$TOEIC <- gsub("[-]|[점]","",Spec_u$TOEIC)
Spec_u$TOEIC <- as.numeric(Spec_u$TOEIC)
u_TOEIC <- Spec_u$TOEIC[!is.na(Spec_u$TOEIC)]# 토익 있는 경우
sum(is.na(Spec_u$TOEIC))# 토익 없는 경우
table(u_TOEIC) # 있는 경우 분포

u_TOEIC.mean <- round(mean(u_TOEIC[!is.na(u_TOEIC)]),0) # 고졸 토익 평균
u_TOEIC.max <- max(u_TOEIC) # 최고점 
u_TOEIC.min <- min(u_TOEIC) # 최저점



#토스
Spec_u$T.Speaking <- gsub("[-]","",Spec_u$T.Speaking)
u_T.Speaking <- factor(Spec_u$T.Speaking, levels = tos_lv)
length(u_T.Speaking)
sum(is.na(u_T.Speaking))# 토스 없는 경우
table(u_T.Speaking) # 있는 경우 분포



#오픽
Spec_u$OPIC <- gsub("[-]","",Spec_u$OPIC)
u_OPIC <- factor(Spec_u$OPIC, levels = opic_lv)
length(u_OPIC) # 총 경우
sum(is.na(u_OPIC))# 오픽 없는 경우
table(u_OPIC) # 있는 경우 분포



#외국어
Spec_u$language <- gsub("[-]|[개]","",Spec_u$language)
Spec_u$language <- as.numeric(Spec_u$language)
u_language <- Spec_u$language[!is.na(Spec_u$language)]
sum(is.na(Spec_u$language))# 외국어 못하는 경우
table(u_language) # 할 수 있는 경우 분포
#table() 값을 변수에 대입 후, max값의 lv값 추출

u_language.mean <- round(mean(u_language),1) # 고졸 가능 외국어 평균 갯수
u_language.max <- max(u_language) # 최다 가능 외국어



#자격증 갯수
Spec_u$cert.ea_mean<- gsub("[-]|[개]","",Spec_u$cert.ea_mean)
Spec_u$cert.ea_mean <- as.numeric(Spec_u$cert.ea_mean)
u_cert.ea_mean <- Spec_u$cert.ea_mean[!is.na(Spec_u$cert.ea_mean)]
sum(is.na(Spec_u$cert.ea_mean))# 자격증 없는 경우
table(u_cert.ea_mean) # 있는 경우 분포

u_cert.ea_mean.mean <- round(mean(u_cert.ea_mean),1) # 고졸 자격증 개수평균
u_cert.ea_mean.max <- max(u_cert.ea_mean) # 최고 개수
u_cert.ea_mean.min <- min(u_cert.ea_mean) # 최저 개수



#해외 경험
Spec_u$overseas_exp<- gsub("[-]|[회]","",Spec_u$overseas_exp)
Spec_u$overseas_exp <- as.numeric(Spec_u$overseas_exp)
u_overseas_exp <- Spec_u$overseas_exp[!is.na(Spec_u$overseas_exp)]
sum(is.na(Spec_u$overseas_exp))# 해외경험 없는 경우
table(u_overseas_exp) # 있는 경우 분포

u_overseas_exp.mean <- round(mean(u_overseas_exp),1) # 고졸 해외경험 평균 (유경험자 한해서)
u_overseas_exp.max <- max(u_overseas_exp) # 최다 경험
u_overseas_exp.min <- min(u_overseas_exp) # 최소 경험



#인턴 경험
Spec_u$intern<- gsub("[-]|[회]","",Spec_u$intern)
Spec_u$intern <- as.numeric(Spec_u$intern)
u_intern <- Spec_u$intern[!is.na(Spec_u$intern)]
sum(is.na(Spec_u$intern))# 인턴경험 없는 경우
table(u_intern) # 있는 경우 분포

u_intern.mean <- round(mean(u_intern),1) # 고졸 평균 인턴 횟수
u_intern.max <- max(u_intern) # 최다 횟수



#수상
Spec_u$prize<- gsub("[-]|[회]","",Spec_u$prize)
Spec_u$prize <- as.numeric(Spec_u$prize)
u_prize <- Spec_u$prize[!is.na(Spec_u$prize)]
sum(is.na(Spec_u$prize))# 수상경력 없는 경우
table(u_prize) # 있는 경우 분포

u_prize.mean <- round(mean(u_prize),1) # 고졸 수상 횟수 평균
u_prize.max <- max(u_prize) # 최다 수상
u_prize.min <- min(u_prize) # 최저 수상



#교내활동
Spec_u$CSS<- gsub("[-]|[회]","",Spec_u$CSS)
Spec_u$CSS <- as.numeric(Spec_u$CSS)
u_CSS <- Spec_u$CSS[!is.na(Spec_u$CSS)]
sum(is.na(Spec_u$CSS))# 교내활동 경험 없는 경우
table(u_CSS) # 있는 경우 분포

u_CSS.mean <- round(mean(u_CSS),1) # 고졸 교내활동 횟수수평균
u_CSS.max <- max(u_CSS) # 최다 활동
u_CSS.min <- min(u_CSS) # 최소 활동



getwd()
setwd("C:/R_Mini")
library(showtext)
showtext_auto() 
font_add(family = "godic", regular = "font/210 옴니고딕 030.ttf")
# 학력별 각 요소 최다 빈도 수 값을 통해 500개 IT 기업들의 합격자 학력별 평균 스펙 도출
library(ggplot2)
library(fmsb) 