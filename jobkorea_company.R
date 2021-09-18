library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
url <- "https://www.jobkorea.co.kr/starter/review/?OrderBy=7"
remDr$navigate(url)

companylist <- NULL; company_Q <- NULL;
companylist <- c("삼성전자(주)","LG전자(주)","(주)케이티","중소기업은행","삼성SDI(주)","삼성전기(주)","현대엔지니어링(주)","(주)카카오","롯데하이마트(주)","넷마블(주)","(주)엔씨소프트","(주)한샘","세방전지(주)")
for (i in 3:3) {
  company<-NULL; category_b <- NULL; question <- NULL; lastPage <- NULL; last <- NULL; company_q <- NULL; 
  remDr$navigate(url)
  Sys.sleep(1)
  # 기업검색
  company <- remDr$findElement(using = "css selector", "[name = 'schTxt']")
  company <- company$sendKeysToElement(list(paste0(companylist[i]), key = "enter")) 

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
  
  page_1 <- NULL; end <- 10; count <- 0; 
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
    company_q <- c(company_q,unlist(question))
    
    if(page_first >= 2 ){
      for (page in 2:page_first){ 
        Sys.sleep(2)
        nextCss <- paste0("#container > div.stContainer > div.tplPagination.reviewPg > ul > li:nth-child(",page,") > a")     
        nextListLink <- remDr$findElement(using='css selector',nextCss)
        nextListLink$clickElement()
        Sys.sleep(2)
        
        question<-remDr$findElements(using ="css selector","#container > div.stContainer > div.reviewQnaWrap > ul > li > div > span.tx")
        question <- sapply(question,function(x){x$getElementText()})
        company_q <- append(company_q,unlist(question))
        
      }
    }
  }
  ## 10쪽 이상
  else { 
    question<-remDr$findElements(using ="css selector","#container > div.stContainer > div.reviewQnaWrap > ul > li > div > span.tx")
    question <- sapply(question,function(x){x$getElementText()})
    company_q <- c(company_q,unlist(question))
    
    
    #다음페이지
    for (page in 2:end){ 
      Sys.sleep(2)
      nextCss <- paste0("#container > div.stContainer > div.tplPagination.reviewPg > ul > li:nth-child(",page,") > a")     
      nextListLink <- remDr$findElement(using='css selector',nextCss)
      nextListLink$clickElement()
      Sys.sleep(2)
      
      question<-remDr$findElements(using ="css selector","#container > div.stContainer > div.reviewQnaWrap > ul > li > div > span.tx")
      question <- sapply(question,function(x){x$getElementText()})
      company_q <- append(company_q,unlist(question))
      
      count <- count+1
    }
    end <- (page_first - 10*count)
   
    nextPageLink <- remDr$findElement(using='css selector', "#container > div.stContainer > div.tplPagination.reviewPg > p > a")
    if(length(nextPageLink) == 0)   break;
    nextPageLink$clickElement()
    Sys.sleep(3)
  }
  assign(paste0('company', 3),company_q)
  
  #다음기업 
  nextcompany <- remDr$findElement(using='css selector', "#container > div.stContainer > div.viewBtns > a.linkList")
  nextcompany$clickElement()
}

company_Q <- cbind(unlist(company1),company2,company3,company4,com5,com6,com7,com8,com9,com10,com11,com12,com13)
company_Q<-data.frame(company_Q)
colnames(company_Q) <- c("삼성전자(주)_30","LG전자(주)_300","(주)케이티_11","중소기업은행_85","삼성SDI(주)_65","삼성전기(주)_53","현대엔지니어링(주)_86","(주)카카오_55","롯데하이마트(주43","넷마블(주)_12","(주)엔씨소프트_67","(주)한샘_239","세방전지(주)_19")
View(company_Q)

write.csv(company_Q,"jobkorea_company.csv")


