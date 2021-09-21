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
nrow(Spec_c)# 초대졸 채용 회사 수



#학점
score <- strsplit(Spec_c$score, "/")
score <- unlist(score)
score <- gsub("4.5","",score)
score <- as.double(score)
score <- score[!is.na(score)] #; length(score)

c_score.mean <- round(mean(score),2)
c_score.max <- max(score) 
c_score.min <- min(score)



#토익
Spec_c$TOEIC <- gsub("[-]|[점]","",Spec_c$TOEIC)
Spec_c$TOEIC <- as.numeric(Spec_c$TOEIC)
c_TOEIC <- Spec_c$TOEIC[!is.na(Spec_c$TOEIC)]# 토익 있는 경우
sum(is.na(Spec_c$TOEIC))# 토익 없는 경우
table(c_TOEIC) # 있는 경우 분포

c_TOEIC.mean <- round(mean(c_TOEIC[!is.na(c_TOEIC)]),0) # 고졸 토익 평균
c_TOEIC.max <- max(c_TOEIC) # 최고점 
c_TOEIC.min <- min(c_TOEIC) # 최저점



#토스
Spec_c$T.Speaking <- gsub("[-]","",Spec_c$T.Speaking)
c_T.Speaking <- factor(Spec_c$T.Speaking, levels = tos_lv)
length(c_T.Speaking)
sum(is.na(c_T.Speaking))# 토스 없는 경우
table(c_T.Speaking) # 있는 경우 분포



#오픽
Spec_c$OPIC <- gsub("[-]","",Spec_c$OPIC)
c_OPIC <- factor(Spec_c$OPIC, levels = opic_lv)
length(c_OPIC) # 총 경우
sum(is.na(c_OPIC))# 오픽 없는 경우
table(c_OPIC) # 있는 경우 분포



#외국어
Spec_c$language <- gsub("[-]|[개]","",Spec_c$language)
Spec_c$language <- as.numeric(Spec_c$language)
c_language <- Spec_c$language[!is.na(Spec_c$language)]
sum(is.na(Spec_c$language))# 외국어 못하는 경우
table(c_language) # 할 수 있는 경우 분포
#table() 값을 변수에 대입 후, max값의 lv값 추출

c_language.mean <- round(mean(c_language),1) # 고졸 가능 외국어 평균 갯수
c_language.max <- max(c_language) # 최다 가능 외국어



#자격증 갯수
Spec_c$cert.ea_mean<- gsub("[-]|[개]","",Spec_c$cert.ea_mean)
Spec_c$cert.ea_mean <- as.numeric(Spec_c$cert.ea_mean)
c_cert.ea_mean <- Spec_c$cert.ea_mean[!is.na(Spec_c$cert.ea_mean)]
sum(is.na(Spec_c$cert.ea_mean))# 자격증 없는 경우
table(c_cert.ea_mean) # 있는 경우 분포

c_cert.ea_mean.mean <- round(mean(c_cert.ea_mean),1) # 고졸 자격증 개수평균
c_cert.ea_mean.max <- max(c_cert.ea_mean) # 최고 개수
c_cert.ea_mean.min <- min(c_cert.ea_mean) # 최저 개수



#해외 경험
Spec_c$overseas_exp<- gsub("[-]|[회]","",Spec_c$overseas_exp)
Spec_c$overseas_exp <- as.numeric(Spec_c$overseas_exp)
c_overseas_exp <- Spec_c$overseas_exp[!is.na(Spec_c$overseas_exp)]
sum(is.na(Spec_c$overseas_exp))# 해외경험 없는 경우
table(c_overseas_exp) # 있는 경우 분포

c_overseas_exp.mean <- round(mean(c_overseas_exp),1) # 고졸 해외경험 평균 (유경험자 한해서)
c_overseas_exp.max <- max(c_overseas_exp) # 최다 경험
c_overseas_exp.min <- min(c_overseas_exp) # 최소 경험



#인턴 경험
Spec_c$intern<- gsub("[-]|[회]","",Spec_c$intern)
Spec_c$intern <- as.numeric(Spec_c$intern)
c_intern <- Spec_c$intern[!is.na(Spec_c$intern)]
sum(is.na(Spec_c$intern))# 인턴경험 없는 경우
table(c_intern) # 있는 경우 분포

c_intern.mean <- round(mean(c_intern),1) # 고졸 평균 인턴 횟수
c_intern.max <- max(c_intern) # 최다 횟수



#수상
Spec_c$prize<- gsub("[-]|[회]","",Spec_c$prize)
Spec_c$prize <- as.numeric(Spec_c$prize)
c_prize <- Spec_c$prize[!is.na(Spec_c$prize)]
sum(is.na(Spec_c$prize))# 수상경력 없는 경우
table(c_cert.ea_mean) # 있는 경우 분포

c_prize.mean <- round(mean(c_prize),1) # 고졸 수상 횟수 평균
c_prize.max <- max(c_prize) # 최다 수상
c_prize.min <- min(c_prize) # 최저 수상



#교내활동
Spec_c$CSS<- gsub("[-]|[회]","",Spec_c$CSS)
Spec_c$CSS <- as.numeric(Spec_c$CSS)
c_CSS <- Spec_c$CSS[!is.na(Spec_c$CSS)]
sum(is.na(Spec_c$CSS))# 교내활동 경험 없는 경우
table(c_cert.ea_mean) # 있는 경우 분포

c_CSS.mean <- round(mean(c_CSS),1) # 고졸 교내활동 횟수수평균
c_CSS.max <- max(c_CSS) # 최다 활동
c_CSS.min <- min(c_CSS) # 최소 활동



# 학력별 각 요소 최다 빈도 수 값을 통해 500개 IT 기업들의 합격자 학력별 평균 스펙 도출

library(fmsb) 