# 기업 이름 추출
names <- read.csv("KR_Enterpise.csv")
names <- names[2]
#View(names) 
questions <- NULL; company_name <- NULL;
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , 
                      port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("https://www.jobkorea.co.kr/starter/review/?OrderBy=7")
url <- "https://www.jobkorea.co.kr/starter/review/?OrderBy=7"

for (i in 96:200) {
  noquestion <- NULL; company<-NULL; category_b <- NULL; question <- NULL; lastPage <- NULL; last <- NULL;
  remDr$navigate(url)
  Sys.sleep(1)
  # 기업검색
  company <- remDr$findElement(using = "css selector", "[name = 'schTxt']")
  company <- company$sendKeysToElement(list(paste0(names[i,]), key = "enter")) 
  
  noquestion <- remDr$findElements(using = "css selector", " li.scNoSelect")
  if ( length(noquestion) == 1) next;
  
  #질문카테고리선택
  one<-remDr$findElement(using='css selector','#container > div.stContainer > div.starListsWrap.ctTarget > div.jaListArea > ul > li:nth-child(1) > div.reviewWrap > ul > li:nth-child(2) ')
  one$clickElement()
  Sys.sleep(1)
  #세부질문카테고리
  category<-remDr$findElements(using ="css selector","#container > div.stContainer > div.viewTabs > div > ul")
  category <- sapply(category,function(x){x$getElementText()})
  if (length(category) == 0){
   next
  }
  category_b <- c(category_b, unlist(category))
  category_b <- strsplit( category_b ,"\n")
  category_b <- unlist(category_b)
  for(i in 1:length(category_b)){
    Sys.sleep(1)
    if (category_b[i] == "인성면접") {
      onecategory <-remDr$findElement(using='css selector',paste0(' div.viewTabs > div > ul > li:nth-child(',i,') > label > span.tx'))
      onecategory$clickElement()
    }
    Sys.sleep(1)
    if (category_b[i] == "일반면접"){
      onecategory <-remDr$findElement(using='css selector',paste0(' div.viewTabs > div > ul > li:nth-child(',i,') > label > span.tx'))
      onecategory$clickElement()
      }
  }
  page_1 <- NULL; end <- 10; count <- 0
  ###
  page_1<-remDr$findElements(using ='css selector',"#container > div.stContainer > div.tplPagination.reviewPg > ul")
  page_1 <- sapply(page_1,function(x){x$getElementText()})
  page_1 <- unlist(page_1)
    if (page_1 != 1) { 
    page_1 <- strsplit( page_1 ," ")
    page_1 <- unlist(page_1)
    }
  page_first <- length(page_1)
  
  ## page 10 이내인경우
  if (page_first <= 10){
      question<-remDr$findElements(using ="css selector","#container > div.stContainer > div.reviewQnaWrap > ul > li > div > span.tx")
      question <- sapply(question,function(x){x$getElementText()})
      questions <- append(questions, question)
      
    if(page_first >= 2 ){
      for (page in 2:page_first){ 
        Sys.sleep(2)
        nextCss <- paste0("#container > div.stContainer > div.tplPagination.reviewPg > ul > li:nth-child(",page,") > a")     
        nextListLink <- remDr$findElement(using='css selector',nextCss)
        nextListLink$clickElement()
        Sys.sleep(2)
        
        question<-remDr$findElements(using ="css selector","#container > div.stContainer > div.reviewQnaWrap > ul > li > div > span.tx")
        question <- sapply(question,function(x){x$getElementText()})
        questions <- append(questions, question)
        
      }
     }
  }
  ## 10쪽 이상
  else { 
    question<-remDr$findElements(using ="css selector","#container > div.stContainer > div.reviewQnaWrap > ul > li > div > span.tx")
    question <- sapply(question,function(x){x$getElementText()})
    questions <- append(questions, question)
   
    
    #다음페이지
    for (page in 2:end){ 
      Sys.sleep(2)
      nextCss <- paste0("#container > div.stContainer > div.tplPagination.reviewPg > ul > li:nth-child(",page,") > a")     
      nextListLink <- remDr$findElement(using='css selector',nextCss)
      nextListLink$clickElement()
      Sys.sleep(2)
      
      question<-remDr$findElements(using ="css selector","#container > div.stContainer > div.reviewQnaWrap > ul > li > div > span.tx")
      question <- sapply(question,function(x){x$getElementText()})
      questions <- append(questions, question)
     
      count <- count+1
    }
    end <- (page_first - 10*count)
    
    nextPageLink <- remDr$findElement(using='css selector', "#container > div.stContainer > div.tplPagination.reviewPg > p > a")
    if(length(nextPageLink) == 0)   break;
    nextPageLink$clickElement()
    Sys.sleep(3)
  }
  
  #다음기업 
  nextcompany <- remDr$findElement(using='css selector', "#container > div.stContainer > div.viewBtns > a.linkList")
  nextcompany$clickElement()
  }

jobkorea_Q <- data.frame(questions)
write.csv(jobkorea_Q,'jobkorea_question1.csv')

#####################
questions[4207]
View(company_name)
length(questions)
  names