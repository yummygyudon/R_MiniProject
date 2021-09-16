KR_Ent <- read.csv("KR_Enterpise.csv", encoding = "utf-8")
names <- iconv(KR_Ent$이름)

library(rvest)
library(XML)
library(httr)
library(stringr)
library(RSelenium)

#GET()으로 정보를 얻어오면 각종 메타데이터가 표시됩니다.
#Content-Type: text/html; charset=UTF-8 확인 가능
URL <- paste0("https://www.saramin.co.kr/zf_user/interview-review?my=0&page=1&csn=&orderby=registration&career_cd=&job_category=&company_nm=",iconv("삼성전자(주)"))
get0= GET(URL)

#htmlParse()를 이용하여 파싱하기
html0 <- htmlParse(get0, encoding = "utf-8")
xpath <- paste0('//*[@id="content"]/div[2]/div[1]/form/div[3]/div[1]/div[1]/button')
xpathSApply(html0, xpath, xmlValue) #length 가 2이상일 경우 구역이 여러개 선택된 것이기 때문에 수정 필요함
length(xpathSApply(html0, xpath, xmlValue))

########



#co_view <- data.frame(co_view)

remDr$

remDr <- remoteDriver(remoteServerAddr = "localhost" ,
                      port = 4445, browserName = "chrome")
remDr$open()


url <- "https://www.saramin.co.kr/zf_user/interview-review?my=0&page=1&csn=&orderby=registration&career_cd=&job_category=&company_nm="

company <- NULL ; interview <- NULL ; 
co_view <- NULL

for (name in names){
  page <- paste0(url,name)
  remDr$navigate(page)
  cat("\n",name)
  Sys.sleep(0.5)
  
  count <- remDr$findElements(using = "css selector","#content span.num_count > b")
  count <- as.numeric(sapply(count, function(x){x$getElementText()}))
  
  if (count == 0){
    next
  }else{
    for (num in 1:count){
      if (num%%10 > 0){
        button.path <- paste0('//*[@id="content"]/div[2]/div[1]/form/div[3]/div[',num%%10,"]/div[1]/button")
      }else{
        button.path <- paste0('//*[@id="content"]/div[2]/div[1]/form/div[3]/div[',num,"]/div[1]/button")
      }
      #한 페이지에 button가 여러개이지만 동시에 모두 열기보단 Element로 하나씩 xpath를 지정해서 열어주는게 바람직
      
      button <- remDr$findElement(using = "xpath", button.path)
      cat(num)
      
      button$clickElement()
      Sys.sleep(0.3)
      
      #company.css <- paste0("#content div:nth-child(",num,") div.view_title strong #text")
      interview.css <- paste0("#content > div.wrap_interview_review > div.review_cont > form > div.list_review > div.box_review.open > div.view_cont > div:nth-child(5) > ul > li")
      
      #company <- name
      #Sys.sleep(0.3)
      interview_elem <- remDr$findElements(using = "css selector",interview.css)
      interview_txt <- sapply(interview_elem, function(x){x$getElementText()})
      Sys.sleep(0.3)
      
      
      interview_txt <- unlist(interview_txt)
      for (v in interview_txt){
        company <- append(company, name)
        interview <- append(interview, v)
      }
      
      #co_view <- rbind(c(company, v))
      Sys.sleep(0.3)
      
      if(num%%10 == 0 & count%%10 > 0){
        NextPage.css <- "#content div.wrap_interview_review div.pagination > a"
        NextPage.Btn <- remDr$findElement(using = 'css selector', NextPage.css)
        NextPage.Btn$clickElement()
        Sys.sleep(0.3)
      }
      
    }
  }
}

co_view <- data.frame(company, interview)

colnames(co_view) <- c("회사명", "면접질문")    

View(co_view)
#getwd()
#setwd("C:/R_Mini")
write.csv(co_view, 'KR_Enterpise_interview_saramin.csv')


#for (num in 1:count){
#  button.path <- paste0('//*[@id="content"]/div[2]/div[1]/form/div[3]/div[',num,"]/div[1]/button")
  #한 페이지에 button가 여러개이지만 동시에 모두 열기보단 Element로 하나씩 xpath를 지정해서 열어주는게 바람직
  
#  button <- remDr$findElements(using = "xpath", button.path)

 
#}else{
 # next
#}


##xpath 사용법 Error in button$clickElement() : attempt to apply non-function