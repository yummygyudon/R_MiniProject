
setwd("C:/R_Mini")



load("C:/R_Mini/saramin_Spec_var.RData")
#install.packages("seleniumPipes")
#install.packages("wdman")
library(seleniumPipes)
library(rvest)
library(XML)
library(httr)
library(stringr)
library(RSelenium)
library(wdman)

#############
KR_Ent_name <- read.csv("KR_IT.Enterprise.csv", encoding = "utf-8")
KR_Ent_name <- KR_Ent_name[KR_Ent_name$X>134,"이름"]
names <- iconv(KR_Ent_name)

#chrome Headless Mode
#gpu 없이 headless모드로 창 안띄운 채로 크롤링 -> 서버 과부하 방지
eCaps <- list(chromeOptions = list(
  args = c('--headless', 'disable-gpu', '--window-size=1280,800')
))

#remDr <- remoteDriver(remoteServerAddr = "localhost" ,
 #                    port = 4445, browserName = "chrome")
remDr <- remoteDriver(extraCapabilities = eCaps ,
                      port = 4445, browserName = "chrome")


remDr$open()


url <- "https://www.jobkorea.co.kr/starter/spec?C_Idx=&IsFavorOn=&IsAlumniOn=&schEdu=50&G_ID=&schTxt="

#count 하나일때 선택 element Selector
aft_sch_click.css <-"#container > div.stContainer div.coWrap > dl > dt > a.tit"

#★★count 2 이상일때 
#매출 혹은 규모 상위 기업일 수록 cidx 값이 작은 점 발견 
cidx <- NULL
xpath_Element.css <- "#container > div.stContainer > div.starListsWrap.ctTarget > div.specListArea > ul > li:nth-child("

#교육수준 버튼
edu_lv.btn.css <- "#devPassSpecForm > div > div"
edu.css <- "#devPassSpecForm > div > div > div > ul > li:nth-child("
edu.else <-") > a"

## ★findElement 는 sapply() 에서 $getElementText() 불가능


Spec<-NULL
toNULL()


for (name in names){
  #기업검색 in Spec Page
  #(주) 나 주식회사 때문에 검색이 안되는 이슈 해결
  new_name <- gsub("[[:punct:]&^('주')|'주식회사'|[:blank:]]","",name)
  page <- paste0(url,new_name)
  remDr$navigate(page)
  cat("\n",name," : \n")
  Sys.sleep(1)
  
  
  #검색결과 건 수
  count <- remDr$findElements(using = "css selector","#container > div.stContainer > div.starListsWrap.ctTarget > div.specSubHd > h4 > span")
  count <- as.numeric(sapply(count, function(x){x$getElementText()}))
  #다음페이지 까지 확인할경우 아래 코드들의 작업이 불가능해지기 때문에 검색결과와 가장 유사한 이름은 가장 앞페이지에 배치되는 것을 활용하여 탐색대상을 1페이지로 설정
  if (count > 10){
    count <- 10
  }
  
  if (count == 0){
    cat("검색결과 없어서 건너뜀")
    next
  }
  else{
    if(count > 1){
      cidx <- NULL
      for(k in 1:count){
        #유사이름의 회사이더라도 사용하는 Data는 상위 대기업이기때문에 cidx값이 압도적으로 높은점 활용 
        sch_lst <- remDr$findElement(using = 'css selector', paste0(xpath_Element.css,1,")"))
        remDr$findElement(using = 'css selector', paste0(xpath_Element.css,k,")"))
        # seleniumPipes 패키지 -> 속성의 값을 가져오는 "getElementAttribute(속성명)" 함수 활용
        d_cidx <- sch_lst$getElementAttribute("data-cidx")
        cidx <- append(cidx, as.numeric(unlist(d_cidx)))
      }
      # 모기업의 경우 cidx가 계열사보다 작은 값인 특징 이용
      cidx <- min(as.numeric(cidx))
      # cidx 값을 이용해야하기 때문에 XPath 로 Element 지정
      corp.click <- remDr$findElement(using = 'xpath',paste0("//li[@data-cidx='",cidx,"']/div[2]/dl/dt/a[1]") )
      corp.click$clickElement()
      Sys.sleep(3)
      
    }else{
      corp.click <- remDr$findElement(using = 'css selector', aft_sch_click.css)
      corp.click$clickElement()
      Sys.sleep(3)
    }
    Btn <- remDr$findElement(using = 'css selector', edu_lv.btn.css)
    Btn$clickElement()
    Btn_lst <- remDr$findElements(using = 'css selector', "#devPassSpecForm > div > div > div > ul > li")
    Btn_lng <- length(Btn_lst)
    Btn$clickElement()
    
    for (i in Btn_lng:2){
      if(Btn_lng > 2){
        #학력구분 설정
        Btn <- remDr$findElement(using = 'css selector', edu_lv.btn.css)
        Btn$clickElement()
        Btn.now <- remDr$findElement(using = 'css selector', paste0(edu.css, i , edu.else))
        Btn.now$clickElement()
        Sys.sleep(7)
      }
      #수집 시작
      #회사명
      company <- append(company, name)
      #최종학력
      school_elem <- remDr$findElements(using = 'css selector',edu_lv.btn.css)
      school.tx <- sapply(school_elem, function(x){x$getElementText()})
      school.tx <- unlist(strsplit(unlist(school.tx),split = " "))
      cat("\t", school.tx[1])
      school <- append(school, school.tx[1])
      Sys.sleep(0.2)
      
      #학점
      score_elem <- remDr$findElements(using = 'css selector', score.css)
      score.tx <- sapply(score_elem, function(x){ x$getElementText() })
      cat("\t", unlist(score.tx))
      score <- append(score, unlist(score.tx))
      Sys.sleep(0.2)
      
      #토익
      toeic_elem <- remDr$findElements(using = 'css selector', TOEIC.css)
      toeic.tx <- sapply(toeic_elem, function(x){x$getElementText()})
      cat("\t", unlist(toeic.tx))
      TOEIC <- append(TOEIC, unlist(toeic.tx))
      Sys.sleep(0.2)
      
      #토스
      tos_elem <- remDr$findElements(using = 'css selector', T.Speaking.css)
      tos.tx <- sapply(tos_elem, function(x){x$getElementText()})
      cat("\t", unlist(tos.tx))
      T.Speaking <- append(T.Speaking, unlist(tos.tx))
      Sys.sleep(0.2)
      
      #오픽
      opic_elem <- remDr$findElements(using = 'css selector', OPIC.css)
      opic.tx <- sapply(opic_elem, function(x){x$getElementText()})
      cat("\t", unlist(opic.tx))
      OPIC <- append(OPIC, unlist(opic.tx))
      Sys.sleep(0.2)
      
      #외국어
      lang_elem <- remDr$findElements(using = 'css selector', language.css)
      lang.tx <- sapply(lang_elem, function(x){x$getElementText()})
      cat("\t", unlist(lang.tx))
      language <- append(language, unlist(lang.tx))
      Sys.sleep(0.2)
      
      #자격증
      cert_elem <- remDr$findElements(using = 'css selector', cert.ea_mean.css)
      cert.tx <- sapply(cert_elem, function(x){x$getElementText()})
      cat("\t", unlist(cert.tx))
      cert.ea_mean <- append(cert.ea_mean, unlist(cert.tx))
      Sys.sleep(0.2)
      
      #해외경험
      os.exp_elem <- remDr$findElements(using = 'css selector', overseas_exp.css)
      os.exp.tx <- sapply(os.exp_elem, function(x){x$getElementText()})
      cat("\t", unlist(os.exp.tx))
      overseas_exp <- append(overseas_exp, unlist(os.exp.tx))
      Sys.sleep(0.2)
      
      #인턴
      intern_elem <- remDr$findElements(using = 'css selector', intern.css)
      intern.tx <- sapply(intern_elem, function(x){x$getElementText()})
      cat("\t", unlist(intern.tx))
      intern <- append(intern, unlist(intern.tx))
      Sys.sleep(0.2)
      
      #수상
      prize_elem <- remDr$findElements(using = 'css selector', prize.css)
      prize.tx <- sapply(prize_elem, function(x){x$getElementText()})
      cat("\t", unlist(prize.tx))
      prize <- append(prize, unlist(prize.tx))
      Sys.sleep(0.2)
      
      #교내
      CSS_elem <- remDr$findElements(using = 'css selector', CSS.css)
      CSS.tx <- sapply(CSS_elem, function(x){x$getElementText()})
      cat("\t", unlist(CSS.tx))
      CSS <- append(CSS, unlist(CSS.tx))
      Sys.sleep(0.2)
      
      cat("  **이번 학력 저장 끝 \n")
    }
  }
}
remDr$close()

######## 아까 했던거 합치기#####
Else <- data.frame(company, school, score, TOEIC, T.Speaking, OPIC, language, 
                   cert.ea_mean, overseas_exp, intern, prize, CSS)
View(Else)

Semi <- read.csv("C:/Users/duck9/OneDrive/바탕 화면/semi_Spec.csv", encoding = "utf-8")
Semi <- data.frame(Semi)
View(Semi)

Semi <- Semi[,-1]
Spec <- rbind(Semi, Else)
View(Spec)

write.csv(Spec, "C:/R_Mini/IT.500_Ent_Spec.csv", row.names = F)
