####IT직무 전체 질문####
library(RSelenium)
library(dplyr)
install.packages("stringr")
library(stringr)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
url <- "https://www.jobkorea.co.kr/starter/review/?OrderBy=7"
remDr$navigate(url)

IT_questions <- NULL #최종 IT질문 담는 변수 
IT_q <- NULL;
pagecount <- NULL; end <- 10; count <- 0; 

for (index in 116:124){ # 전체 기업목록
  site <- "https://www.jobkorea.co.kr/starter/Review?FavorCo_Stat=0&G_ID=0&OrderBy=7&Page="
  page <- paste(site, index, sep="")
  remDr$navigate(page)
for (i in 1:20) {  # 기업 카테고리 들어가기 -> i로 바꾸기
  one<-remDr$findElement(using='css selector',paste0('#container > div.stContainer > div.starListsWrap.ctTarget > div.jaListArea > ul > li:nth-child(',i,') > div.reviewWrap > ul > li:nth-child(2)'))
  one$clickElement()
  Sys.sleep(1)

  category<-remDr$findElements(using ="css selector","#container > div.stContainer > div.viewTabs > div > ul")
  category <- sapply(category,function(x){x$getElementText()})
  if (length(category) == 0){
    backsite <- "https://www.jobkorea.co.kr/starter/Review?FavorCo_Stat=0&G_ID=0&OrderBy=7&Page="
    backsite <- paste(backsite, index, sep="")
    remDr$navigate(backsite)
    next
  }
  
    #####
    findnextbutton<-remDr$findElements(using ='css selector',"#container > div.stContainer > div.tplPagination.reviewPg > p > a")
    findnextbutton <- sapply(findnextbutton,function(x){x$getElementText()})
    if (length(findnextbutton)==0) print('nextpages')
    #####
    # page_Num 10 이내인경우
    if (length(findnextbutton)==0) {
      #
      pagecount<-remDr$findElements(using ='css selector',"#container > div.stContainer > div.tplPagination.reviewPg > ul")
      pagecount <- sapply(pagecount,function(x){x$getElementText()})
      pagecount <- unlist(pagecount)
      pagecount <- strsplit( pagecount ," ")
      pagecount <- unlist(pagecount)
      page_Num <- length(pagecount)
        #
        for (p in 1:page_Num) { 
          listcheck<-remDr$findElements(using ='css selector',"#container > div.stContainer > div.reviewQnaWrap > ul > li")
          listcheck <- sapply(listcheck,function(x){x$getElementText()})
          listlength <- length(listcheck) 
            findIT<-remDr$findElements(using='css selector','#container > div.stContainer > div.reviewQnaWrap > ul > li> div > span.tit')
            findIT <- sapply(findIT,function(x){x$getElementText()})
            IT <- str_match(findIT,'IT|SW|프로그래머|디지털|네트워크|전산|sw|it|프로그램|소프트웨어|S/W|통신|정보|정보보안|인터넷')
            for(j in 1: length(findIT)){
              if ( length(IT) == 0)  break;
              if (!is.na(IT[j])){
                IT_q <- remDr$findElements(using='css selector', paste0('#container > div.stContainer > div.reviewQnaWrap > ul > li:nth-child(',j,') > div > span.tx'))
                IT_q <- sapply(IT_q,function(x){x$getElementText()})
                IT_questions <- append(IT_questions, IT_q)          
               } 
              }
            if (page_Num > 1 & p < page_Num){ 
              nextCss <- paste0("#container > div.stContainer > div.tplPagination.reviewPg > ul > li:nth-child(",p+1,") > a")     
              nextListLink <- remDr$findElement(using='css selector',nextCss)
              nextListLink$clickElement() 
            }
          }
    } 
    # 10 이상
    else { 
    
    while (TRUE) {
     #
      pagecount<-remDr$findElements(using ='css selector',"#container > div.stContainer > div.tplPagination.reviewPg > ul")
      pagecount <- sapply(pagecount,function(x){x$getElementText()})
      pagecount <- unlist(pagecount)
      pagecount <- strsplit( pagecount ," ")
      pagecount <- unlist(pagecount)
      page_Num <- length(pagecount)
      
     # 1
      findIT<-remDr$findElements(using='css selector','#container > div.stContainer > div.reviewQnaWrap > ul > li> div > span.tit')
      findIT <- sapply(findIT,function(x){x$getElementText()})
      IT <- str_match(findIT,'IT|SW|프로그래머|디지털|네트워크|전산|sw|it|프로그램|소프트웨어|S/W|통신|정보|정보보안|인터넷')
      for(j in 1:30){
        if (!is.na(IT[j])){
          IT_q <- remDr$findElements(using='css selector', paste0('#container > div.stContainer > div.reviewQnaWrap > ul > li:nth-child(',j,') > div > span.tx'))
          IT_q <- sapply(IT_q,function(x){x$getElementText()})
          IT_questions <- append(IT_questions, IT_q)          
        } 
      }
     # 2~10
      if (page_Num >= 2){   
        for (p in 2:page_Num){ 
          Sys.sleep(2)
          nextCss <- paste0("#container > div.stContainer > div.tplPagination.reviewPg > ul > li:nth-child(",p,") > a")     
          nextListLink <- remDr$findElement(using='css selector',nextCss)
          nextListLink$clickElement()
          Sys.sleep(2)
          
          listcheck<-remDr$findElements(using ='css selector',"#container > div.stContainer > div.reviewQnaWrap > ul > li")
          listcheck <- sapply(listcheck,function(x){x$getElementText()})
          listlength <- length(listcheck) 
          findIT<-remDr$findElements(using='css selector','#container > div.stContainer > div.reviewQnaWrap > ul > li> div > span.tit')
          findIT <- sapply(findIT,function(x){x$getElementText()})
          IT <- str_match(findIT,'IT|SW|프로그래머|디지털|네트워크|전산|sw|it|프로그램|소프트웨어|S/W|통신|정보|정보보안|인터넷')
          for(j in 1: length(findIT)){
            if ( length(IT) == 0)  break;
            if (!is.na(IT[j])){
              IT_q <- remDr$findElements(using='css selector', paste0('#container > div.stContainer > div.reviewQnaWrap > ul > li:nth-child(',j,') > div > span.tx'))
              IT_q <- sapply(IT_q,function(x){x$getElementText()})
              IT_questions <- append(IT_questions, IT_q)          
            } 
          }
        }
      } else break
      if (page_Num == 10) { 
        nextPageLink <- remDr$findElement(using='css selector', "#container > div.stContainer > div.tplPagination.reviewPg > p > a")
        nextPageLink$clickElement()
      }
      if (page_Num < 10 ) break
    }
    }
    # 나가기
    remDr$navigate(page)
}
}
typeof(IT_questions)
IT_questions <- unlist(IT_questions)
IT_questions <- data.frame(IT_questions)
write.csv(IT_questions,"output/IT_questions.csv")