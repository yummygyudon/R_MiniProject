# Jobkorea 면접질문 크롤링 // 한 기업의 질문들만 
library(rvest)
library(XML)
library(httr)
library(rvest)

# 면접질문, 일반+인성 카테고리
#첫페이지
question <- NULL; text <- NULL; text2 <- NULL; questions <- NULL; Q <- NULL
url_samsung <- "https://www.jobkorea.co.kr/starter/review/view?C_Idx=1&Crr_Year=&Half_Year_Type_Code=0&Ctgr_Code=5&FavorCo_Stat=0&G_ID=0&Page=1&itv_Qstn_Type_Code=1,8"
url_kt <- "https://www.jobkorea.co.kr/starter/review/view?C_Idx=23&Crr_Year=&Half_Year_Type_Code=0&Ctgr_Code=5&FavorCo_Stat=0&G_ID=0&Page=1&itv_Qstn_Type_Code=1,8"
url_bank <- "https://www.jobkorea.co.kr/starter/review/view?C_Idx=16&Crr_Year=&Half_Year_Type_Code=0&Ctgr_Code=5&FavorCo_Stat=0&G_ID=0&Page=1&itv_Qstn_Type_Code=1,8"
url_samsungSDI <- "https://www.jobkorea.co.kr/starter/review/view?C_Idx=92&Crr_Year=&Half_Year_Type_Code=0&Ctgr_Code=5&FavorCo_Stat=0&G_ID=0&Page=1&itv_Qstn_Type_Code=1,8"
url_lotteH <- "https://www.jobkorea.co.kr/starter/review/view?C_Idx=120&Crr_Year=&Half_Year_Type_Code=0&Ctgr_Code=5&FavorCo_Stat=0&G_ID=0&Page=1&itv_Qstn_Type_Code=1,8"
url_lgCNS <- "https://www.jobkorea.co.kr/starter/review/view?C_Idx=160&Crr_Year=&Half_Year_Type_Code=0&Ctgr_Code=5&FavorCo_Stat=0&G_ID=0&Page=2&itv_Qstn_Type_Code="
url_naver <- "https://www.jobkorea.co.kr/starter/Review/view?C_Idx=215&Ctgr_Code=5&FavorCo_Stat=0&G_ID=0&Page=3"
text <- read_html(url_samsung)

nodes <- html_nodes(text, paste0("#container > div.stContainer > div.reviewQnaWrap > ul > li > div > span.tx") )
question <- html_text(nodes)
question <- gsub("\r\n","",question)
question <- gsub(" {2,}","",question)
questions <- append(questions,question)

# 2~ 10페이지
site_samsung<- "https://www.jobkorea.co.kr/starter/review/view?FavorCo_Stat=0&OrderBy=0&Page=1&C_Idx=1&Half_Year_Type_Code=0&Ctgr_Code=5&Itv_Qstn_Type_Code=1%2C8&VPage="
site_kt <- "https://www.jobkorea.co.kr/starter/review/view?FavorCo_Stat=0&OrderBy=0&Page=1&C_Idx=23&Half_Year_Type_Code=0&Ctgr_Code=5&Itv_Qstn_Type_Code=1%2C8&VPage="
site_bank <- "https://www.jobkorea.co.kr/starter/review/view?FavorCo_Stat=0&OrderBy=0&Page=1&C_Idx=16&Half_Year_Type_Code=0&Ctgr_Code=5&Itv_Qstn_Type_Code=1%2C8&VPage="
site_samsungSDI <- "https://www.jobkorea.co.kr/starter/review/view?FavorCo_Stat=0&OrderBy=0&Page=1&C_Idx=92&Half_Year_Type_Code=0&Ctgr_Code=5&Itv_Qstn_Type_Code=1%2C8&VPage="
site_lotteH <-"https://www.jobkorea.co.kr/starter/review/view?FavorCo_Stat=0&OrderBy=0&Page=1&C_Idx=120&Half_Year_Type_Code=0&Ctgr_Code=5&Itv_Qstn_Type_Code=1%2C8&VPage="
site_lgCNS <- "https://www.jobkorea.co.kr/starter/review/view?FavorCo_Stat=0&OrderBy=0&Page=2&C_Idx=160&Half_Year_Type_Code=0&Ctgr_Code=5&VPage="
site_naver <- "https://www.jobkorea.co.kr/starter/Review/view?FavorCo_Stat=0&OrderBy=0&Page=3&C_Idx=215&Half_Year_Type_Code=0&Ctgr_Code=5&VPage="

for (index in 2:4) {
  url2 <- paste(site_samsung, index, sep="")
  text2 <- read_html(url2)

  nodes <- html_nodes(text2, paste0("#container > div.stContainer > div.reviewQnaWrap > ul > li > div > span.tx") )
  question2 <- html_text(nodes)
  question2 <- gsub("\r\n","",question2)
  question2 <- gsub(" {2,}","",question2)
  questions <- append(questions, question2)
}

Q_samsung <- data.frame(questions)
Q_kt <- data.frame(questions)
Q_bank <- data.frame(questions)
Q_samsungSDI <- data.frame(questions)
Q_lotteH <- data.frame(questions)
Q_lgCNS <- data.frame(questions)
Q_naver <- data.frame(questions)
View(Q_samsungSDI)

write.csv(Q_samsung,"com_Q/samsungQ.csv")
write.csv(Q_kt,"com_Q/ktQ.csv")
write.csv(Q_bank,"com_Q/bankQ.csv")
write.csv(Q_samsungSDI,"com_Q/samsungSDI.csv")
write.csv(Q_lotteH,"com_Q/lotteHQ.csv")
write.csv(Q_lgCNS,"com_Q/lgCNS.csv")
write.csv(Q_naver,"com_Q/naver.csv")