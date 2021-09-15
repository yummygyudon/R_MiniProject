# 기업 이름 추출
names <- read.csv("KR_Enterpise.csv")
names <- names[2]
#View(names) 

library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , 
                      port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("https://www.jobkorea.co.kr/starter/review/?OrderBy=7")

more <- NULL; category_b <- NULL;
for (i in 1:5) {
  # 기업검색
  webElem <- remDr$findElement(using = "css selector", "[name = 'schTxt']")
  webElem$sendKeysToElement(list(paste0("현대"), key = "enter")) 
  #질문카테고리선택
  one<-remDr$findElement(using='css selector','#container > div.stContainer > div.starListsWrap.ctTarget > div.jaListArea > ul > li:nth-child(1) > div.reviewWrap > ul > li:nth-child(2) ')
  one$clickElement()
  #세부질문카테고리
  category<-remDr$findElements(using ="css selector","#container > div.stContainer > div.viewTabs > div > ul")
  category <- sapply(category,function(x){x$getElementText()})
  category_b <- c(category_b, unlist(category))
  category_b <- strsplit( category_b ,"\n")
  category_b <- unlist(category_b)
  for (i in 1:length(category_b)){
    if (category_b[i] == "인성면접") {
      onecategory <-remDr$findElement(using='css selector',paste0(' div.viewTabs > div > ul > li:nth-child(',i,') > label > span.tx'))
      onecategory$clickElement()
    }
    else if (category_b[i] == "일반면접"){
      onecategory <-remDr$findElement(using='css selector',paste0(' div.viewTabs > div > ul > li:nth-child(',i,') > label > span.tx'))
      onecategory$clickElement()
    }
  }
  #질문수집
  more<-remDr$findElements(using ="css selector","#container > div.stContainer > div.reviewQnaWrap > ul > li > div > span.tx")
  sapply(more,function(x){x$getElementText()})
  
  #다음페이지
  nextpage<-remDr$findElement(using='css selector',' #container > div.stContainer > div.tplPagination.reviewPg > ul > li:nth-child(2) > a')
  nextpage$clickElement()
  more<-remDr$findElements(using ="css selector","#container > div.stContainer > div.reviewQnaWrap > ul > li > div > span.tx")
  sapply(more,function(x){x$getElementText()})
}
