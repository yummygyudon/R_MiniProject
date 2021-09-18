library(RSelenium)
library(dplyr)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
url <- "https://www.jobkorea.co.kr/starter/review/?OrderBy=7"
remDr$navigate(url)


start <- 2; end <- 10

for (index in 1:124){
  site <- "https://www.jobkorea.co.kr/starter/Review?FavorCo_Stat=0&G_ID=0&OrderBy=7&Page="
  page <- paste(site, index, sep="")
  remDr$navigate(page) # 전체 기업목록 순서
  
  
  for (i in 1:20) { 
    # 기업 카테고리 들어가기 -> i로 바꾸기
    one<-remDr$findElement(using='css selector','#container > div.stContainer > div.starListsWrap.ctTarget > div.jaListArea > ul > li:nth-child(1) > div.reviewWrap > ul > li.new > a ')
    one$clickElement()
    Sys.sleep(1)
    
    #IT직무 찾기 IT","프로그래머","응용프로그래머","디지털","SW개발
      #li 목록 몇개있는지 확인
      listcheck<-remDr$findElements(using ='css selector',"#container > div.stContainer > div.reviewQnaWrap > ul > li")
      listcheck <- sapply(listcheck,function(x){x$getElementText()})
      listlength <- length(listcheck)
      for(k in 1: listlength) {
        findIT<-remDr$findElements(using='css selector','#container > div.stContainer > div.reviewQnaWrap > ul > li> div > span.tit')
        findIT <- sapply(findIT,function(x){x$getElementText()})
       
         for(j in 1: length(findIT)){
           #문자 시작순서 지정하고 특정단어만 포함되도 출력할 수 있게 하기기
          if (findIT[j] %in% c("일반면접 - 생산·제조·설비·조립 new")){
            print(findIT[j])
             #IT <- append(IT,findIT)
          }
        }
    
        
      }
  }
  
  
  
}