## 기업 선정
# 산업 : IT.전자 / 은행.지주/ 정보통신 외 / 엔지니어링

library(dplyr)
KR_Ent <- read.csv("KR_Enterpise.csv", encoding = "utf-8")

View(KR_Ent)
sec <- c("IT.전자", "은행.지주", "정보통신 외", "엔지니어링")

IT_Ent <- KR_Ent %>% filter(산업 %in% sec) %>%  select(이름) 

write.csv(IT_Ent, "IT_Ent.csv")
