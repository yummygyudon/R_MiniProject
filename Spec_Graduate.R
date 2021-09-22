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

## 대학원
Spec_g <- Spec %>% filter(school == "대학원졸")
nrow(Spec_g)# 고졸 채용 회사 수



#학점
score <- strsplit(Spec_g$score, "/")
score <- unlist(score)
score <- gsub("4.5","",score)
score <- as.double(score)
score <- score[!is.na(score)] #; length(score)

g_score.mean <- round(mean(score),2)
g_score.max <- max(score) 
g_score.min <- min(score)



#토익
Spec_g$TOEIC <- gsub("[-]|[점]","",Spec_g$TOEIC)
Spec_g$TOEIC <- as.numeric(Spec_g$TOEIC)
g_TOEIC <- Spec_g$TOEIC[!is.na(Spec_g$TOEIC)]# 토익 있는 경우
sum(is.na(Spec_g$TOEIC))# 토익 없는 경우
table(g_TOEIC) # 있는 경우 분포

g_TOEIC.mean <- round(mean(g_TOEIC[!is.na(g_TOEIC)]),0) # 고졸 토익 평균
g_TOEIC.max <- max(g_TOEIC) # 최고점 
g_TOEIC.min <- min(g_TOEIC) # 최저점



#토스
Spec_g$T.Speaking <- gsub("[-]","",Spec_g$T.Speaking)
g_T.Speaking <- factor(Spec_g$T.Speaking, levels = tos_lv)
length(g_T.Speaking)
sum(is.na(g_T.Speaking))# 토스 없는 경우
table(g_T.Speaking) # 있는 경우 분포



#오픽
Spec_g$OPIC <- gsub("[-]","",Spec_g$OPIC)
g_OPIC <- factor(Spec_g$OPIC, levels = opic_lv)
length(g_OPIC) # 총 경우
sum(is.na(g_OPIC))# 오픽 없는 경우
table(g_OPIC) # 있는 경우 분포



#외국어
Spec_g$language <- gsub("[-]|[개]","",Spec_g$language)
Spec_g$language <- as.numeric(Spec_g$language)
g_language <- Spec_g$language[!is.na(Spec_g$language)]
sum(is.na(Spec_g$language))# 외국어 못하는 경우
table(g_language) # 할 수 있는 경우 분포
#table() 값을 변수에 대입 후, max값의 lv값 추출

g_language.mean <- round(mean(g_language),1) # 고졸 가능 외국어 평균 갯수
g_language.max <- max(g_language) # 최다 가능 외국어



#자격증 갯수
Spec_g$cert.ea_mean<- gsub("[-]|[개]","",Spec_g$cert.ea_mean)
Spec_g$cert.ea_mean <- as.numeric(Spec_g$cert.ea_mean)
g_cert.ea_mean <- Spec_g$cert.ea_mean[!is.na(Spec_g$cert.ea_mean)]
sum(is.na(Spec_g$cert.ea_mean))# 자격증 없는 경우
table(g_cert.ea_mean) # 있는 경우 분포

g_cert.ea_mean.mean <- round(mean(g_cert.ea_mean),1) # 고졸 자격증 개수평균
g_cert.ea_mean.max <- max(g_cert.ea_mean) # 최고 개수
g_cert.ea_mean.min <- min(g_cert.ea_mean) # 최저 개수



#해외 경험
Spec_g$overseas_exp<- gsub("[-]|[회]","",Spec_g$overseas_exp)
Spec_g$overseas_exp <- as.numeric(Spec_g$overseas_exp)
g_overseas_exp <- Spec_g$overseas_exp[!is.na(Spec_g$overseas_exp)]
sum(is.na(Spec_g$overseas_exp))# 해외경험 없는 경우
table(g_overseas_exp) # 있는 경우 분포

g_overseas_exp.mean <- round(mean(g_overseas_exp),1) # 고졸 해외경험 평균 (유경험자 한해서)
g_overseas_exp.max <- max(g_overseas_exp) # 최다 경험
g_overseas_exp.min <- min(g_overseas_exp) # 최소 경험



#인턴 경험
Spec_g$intern<- gsub("[-]|[회]","",Spec_g$intern)
Spec_g$intern <- as.numeric(Spec_g$intern)
g_intern <- Spec_g$intern[!is.na(Spec_g$intern)]
sum(is.na(Spec_g$intern))# 인턴경험 없는 경우
table(g_intern) # 있는 경우 분포

g_intern.mean <- round(mean(g_intern),1) # 고졸 평균 인턴 횟수
g_intern.max <- max(g_intern) # 최다 횟수



#수상
Spec_g$prize<- gsub("[-]|[회]","",Spec_g$prize)
Spec_g$prize <- as.numeric(Spec_g$prize)
g_prize <- Spec_g$prize[!is.na(Spec_g$prize)]
sum(is.na(Spec_g$prize))# 수상경력 없는 경우
table(g_prize) # 있는 경우 분포

g_prize.mean <- round(mean(g_prize),1) # 고졸 수상 횟수 평균
g_prize.max <- max(g_prize) # 최다 수상
g_prize.min <- min(g_prize) # 최저 수상



#교내활동
Spec_g$CSS<- gsub("[-]|[회]","",Spec_g$CSS)
Spec_g$CSS <- as.numeric(Spec_g$CSS)
g_CSS <- Spec_g$CSS[!is.na(Spec_g$CSS)]
sum(is.na(Spec_g$CSS))# 교내활동 경험 없는 경우
table(g_CSS) # 있는 경우 분포

g_CSS.mean <- round(mean(g_CSS),1) # 고졸 교내활동 횟수수평균
g_CSS.max <- max(g_CSS) # 최다 활동
g_CSS.min <- min(g_CSS) # 최소 활동



getwd()
setwd("C:/R_Mini")
library(showtext)
showtext_auto() 
font_add(family = "godic", regular = "font/210 옴니고딕 030.ttf")
# 학력별 각 요소 최다 빈도 수 값을 통해 500개 IT 기업들의 합격자 학력별 평균 스펙 도출
library(ggplot2)
library(fmsb) 