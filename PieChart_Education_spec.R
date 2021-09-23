library(ggplot2)
Spec <- read.csv("output/spec/IT.500_Ent_Spec.csv", encoding = "utf-8")
load("C:/R_Mini/Highschool_var.RData")
load("C:/R_Mini/College_var.RData")
load("C:/R_Mini/Universe_var.RData")
load("C:/R_Mini/Graduate_var.RData")

### 토익 유무
#전체

#고졸
lbls <- c("있음", "없음")
slices <- c(length(h_TOEIC), na.TOEIC)
pct <- round(slices/company_h*100)
lbls <- paste0(lbls,"(",pct,"%)")

pie(slices,
    labels = lbls,
    main = "비율",
    col = c("#3366ff", "#99ccff"))

#초대졸


#대졸


#대학원졸




### 토스 유무
#전체


#고졸
lbls <- c("있음", "없음")
slices <- c(length(h_T.Speaking), na.T.Speaking)
pct <- round(slices/company_h*100)
lbls <- paste0(lbls,"(",pct,"%)")

pie(slices,
    labels = lbls,
    main = "비율",
    col = c("#3366ff", "#99ccff"))

#초대졸


#대졸


#대학원졸





### 오픽 유무
#전체


#고졸
lbls <- c("있음", "없음")
slices <- c(length(h_OPIC), na.OPIC)
pct <- round(slices/company_h*100)
lbls <- paste0(lbls,"(",pct,"%)")

pie(slices,
    labels = lbls,
    main = "비율",
    col = c("#3366ff", "#99ccff"))

#초대졸


#대졸


#대학원졸






### 외국어 유무
#전체


#고졸


#초대졸


#대졸


#대학원졸






### 자격증 유무
#전체


#고졸


#초대졸


#대졸


#대학원졸






### 해외경험 유무
#전체


#고졸


#초대졸


#대졸


#대학원졸






### 인턴경험 유무
#전체


#고졸


#초대졸


#대졸


#대학원졸






### 수상이력 유무
#전체


#고졸


#초대졸


#대졸


#대학원졸






### 교내활동 유무
#전체


#고졸


#초대졸


#대졸


#대학원졸



