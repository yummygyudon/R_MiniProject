# 기업 이름 추출
names <- read.csv("KR_Enterpise.csv")
names <- names[2]
#View(names) 

library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , 
                      port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("https://www.jobkorea.co.kr/starter/review/?OrderBy=7")

url <- "https://www.jobkorea.co.kr/starter/review/?OrderBy=7"

company<-NULL; category_b <- NULL;
for (i in 1:500) {
  remDr$navigate(url)
  # 기업검색
  company <- remDr$findElement(using = "css selector", "[name = 'schTxt']")
  company <- company$sendKeysToElement(list(paste0(names[i,]), key = "enter")) 
  if (length(company) == 0) next;
  
  #질문카테고리선택
  one<-remDr$findElement(using='css selector','#container > div.stContainer > div.starListsWrap.ctTarget > div.jaListArea > ul > li:nth-child(1) > div.reviewWrap > ul > li:nth-child(2) ')
  one$clickElement()
  #세부질문카테고리
  category<-remDr$findElements(using ="css selector","#container > div.stContainer > div.viewTabs > div > ul")
  category <- sapply(category,function(x){x$getElementText()})
  category_b <- c(category_b, unlist(category))
  category_b <- strsplit( category_b ,"\n")
  category_b <- unlist(category_b)
  for(i in 1:length(category_b)){ 
    if (category_b[i] == "인성면접") {
      onecategory <-remDr$findElement(using='css selector',paste0(' div.viewTabs > div > ul > li:nth-child(',i,') > label > span.tx'))
      onecategory$clickElement()
    }
    if (category_b[i] == "일반면접"){
      onecategory <-remDr$findElement(using='css selector',paste0(' div.viewTabs > div > ul > li:nth-child(',i,') > label > span.tx'))
      onecategory$clickElement()
      }
    }

  question <- NULL; questions <- NULL; end <- NULL;
  repeat{ 
    #질문수집_첫페이지
    question<-remDr$findElements(using ="css selector","#container > div.stContainer > div.reviewQnaWrap > ul > li > div > span.tx")
    question <- sapply(question,function(x){x$getElementText()})
    questions <- append(questions, question)
    
    #다음페이지
    for (page in 2:10){ 
    nextCss <- paste("#container > div.stContainer > div.tplPagination.reviewPg > ul > li:nth-child(",page,") > a")     
    nextListLink <- remDr$findElement(using='css selector',nextCss)
    if(length(nextListLink) == 0)   break;
    nextListLink$clickElement()
    
    question<-remDr$findElements(using ="css selector","#container > div.stContainer > div.reviewQnaWrap > ul > li > div > span.tx")
    question <- sapply(question,function(x){x$getElementText()})
    questions <- append(questions, question)
    }
    
    nextPageLink <- remDr$findElement(using='css selector', "#container > div.stContainer > div.tplPagination.reviewPg > p > a")
    if(length(nextListLink) == 0)   break;
    nextPageLink$clickElement()
    Sys.sleep(2)
  }
    #다음기업 
    #nextcompany <- remDr$findElement(using='css selector', "#container > div.stContainer > div.viewBtns > a.linkList")
    #nextcompany$clickElement()
}

View(questions)
  