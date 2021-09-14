# Jobkorea 면접질문 크롤링
library(rvest)
library(XML)
library(httr)
library(rvest)

# 삼성 면접질문, 일반+인성 카테고리
#첫페이지
question <- NULL; text <- NULL; text2 <- NULL; questions <- NULL; Q <- NULL
url <- "https://www.jobkorea.co.kr/starter/review/view?C_Idx=1&Crr_Year=&Half_Year_Type_Code=0&Ctgr_Code=5&FavorCo_Stat=0&G_ID=0&Page=1&itv_Qstn_Type_Code=1,8"
text <- read_html(url)

nodes <- html_nodes(text, paste0("#container > div.stContainer > div.reviewQnaWrap > ul > li > div > span.tx") )
question <- html_text(nodes)
question <- gsub("\r\n","",question)
question <- gsub(" {2,}","",question)
questions <- append(questions,question)

# 2~ 10페이지
site<- "https://www.jobkorea.co.kr/starter/review/view?FavorCo_Stat=0&OrderBy=0&Page=1&C_Idx=1&Half_Year_Type_Code=0&Ctgr_Code=5&Itv_Qstn_Type_Code=1%2C8&VPage="
for (index in 2:12) {
  url2 <- paste(site, index, sep="")
  text2 <- read_html(url2)

  nodes <- html_nodes(text2, paste0("#container > div.stContainer > div.reviewQnaWrap > ul > li > div > span.tx") )
  question2 <- html_text(nodes)
  question2 <- gsub("\r\n","",question2)
  question2 <- gsub(" {2,}","",question2)
  questions <- append(questions, question2)
}
Q <- data.frame(questions)
View(Q)