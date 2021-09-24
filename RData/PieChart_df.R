Spec <- read.csv("output/spec/IT.500_Ent_Spec.csv", encoding = "utf-8")
## Data Frame
total.ratio <- NULL
samsung.ratio <- NULL
lg.ratio <- NULL
lg_cns.ratio <- NULL
kt.ratio <- NULL
nc.ratio <- NULL


  

  Ent <- nrow(Spec)
  #토익
  Spec$TOEIC <- gsub("[-]|[점]","",Spec$TOEIC)
  Spec$TOEIC <- as.numeric(Spec$TOEIC)
  toeic <- length(Spec$TOEIC[!is.na(Spec$TOEIC)])# 토익 있는 경우
  na.toeic <- sum(is.na(Spec$TOEIC))# 토익 없는 경우
  slices <- c(toeic, na.toeic)
  toeic.pct <- round(slices/Ent*100)
  
  
  #토스
  Spec$T.Speaking <- gsub("[-]","",Spec$T.Speaking)
  Spec$T.Speaking <- factor(Spec$T.Speaking, levels = tos_lv)
  toss <- length(Spec$T.Speaking[!is.na(Spec$T.Speaking)])#있는경우
  na.toss <- sum(is.na(Spec$T.Speaking))# 토스 없는 경우
  slices <- c(toss, na.toss)
  toss.pct <- round(slices/Ent*100)
  
  #오픽
  Spec$OPIC <- gsub("[-]","",Spec$OPIC)
  Spec$OPIC <- factor(Spec$OPIC, levels = opic_lv)
  opic <- length(Spec$OPIC[!is.na(Spec$OPIC)]) # 총 경우
  na.opic <- sum(is.na(Spec$OPIC))# 오픽 없는 경우
  slices <- c(opic, na.opic)
  opic.pct <- round(slices/Ent*100)
   
  #외국어
  Spec$language <- gsub("[-]|[개]","",Spec$language)
  Spec$language <- as.numeric(Spec$language)
  language <- length(Spec$language[!is.na(Spec$language)])
  na.language <- sum(is.na(Spec$language))# 외국어 못하는 경우
  slices <- c(language, na.language)
  language.pct <- round(slices/Ent*100)
  
  #자격증 갯수
  Spec$cert.ea_mean<- gsub("[-]|[개]","",Spec$cert.ea_mean)
  Spec$cert.ea_mean <- as.numeric(Spec$cert.ea_mean)
  cert <- length(Spec$cert.ea_mean[!is.na(Spec$cert.ea_mean)])
  na.cert <- sum(is.na(Spec$cert.ea_mean))# 자격증 없는 경우
  slices <- c(cert, na.cert)
  cert.pct <- round(slices/Ent*100)
  
  #해외 경험
  Spec$overseas_exp<- gsub("[-]|[회]","",Spec$overseas_exp)
  Spec$overseas_exp <- as.numeric(Spec$overseas_exp)
  overseas_exp <- length(Spec$overseas_exp[!is.na(Spec$overseas_exp)])
  na.overseas_exp <- sum(is.na(Spec$overseas_exp))# 해외경험 없는 경우
  slices <- c(overseas_exp, na.overseas_exp)
  overseas_exp.pct <- round(slices/Ent*100)
  
  #인턴 경험
  Spec$intern<- gsub("[-]|[회]","",Spec$intern)
  Spec$intern <- as.numeric(Spec$intern)
  intern <- length(Spec$intern[!is.na(Spec$intern)])
  na.intern <- sum(is.na(Spec$intern))# 인턴경험 없는 경우
  slices <- c(intern, na.intern)
  intern.pct <- round(slices/Ent*100)
  
  #수상
  Spec$prize<- gsub("[-]|[회]","",Spec$prize)
  Spec$prize <- as.numeric(Spec$prize)
  prize <- length(Spec$prize[!is.na(Spec$prize)])
  na.prize <- sum(is.na(Spec$prize))# 수상경력 없는 경우
  slices <- c(prize, na.prize)
  prize.pct <- round(slices/Ent*100)
  
  #교내활동
  Spec$CSS<- gsub("[-]|[회]","",Spec$CSS)
  Spec$CSS <- as.numeric(Spec$CSS)
  CSS <- length(Spec$CSS[!is.na(Spec$CSS)])
  na.CSS <- sum(is.na(Spec$CSS))# 교내활동 경험 없는 경우
  slices <- c(CSS, na.CSS)
  CSS.pct <- round(slices/Ent*100)
  


#전체

total.ratio <- rbind(toeic.pct, toss.pct, opic.pct, language.pct, cert.pct, overseas_exp.pct, intern.pct, prize.pct, CSS.pct)
colnames(total.ratio) <- c("있음", "없음")

save.image(file = "C:/R_Mini/RData/Total_Percent.RData")
