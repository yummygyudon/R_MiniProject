library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" ,
                      port = 4445, browserName = "chrome")
remDr$open()
site <- "http://ceoranking.com/pages/page_231.php?"
remDr$navigate(site)


IT.opt <- remDr$findElement(using = 'css selector', '#category_list > li:nth-child(6) > a')
list <- remDr$findElement(using='css selector','#rank_board2 > div > div:nth-child(3) > select')
list.500 <- remDr$findElement(using='css selector','#rank_board2 > div > div:nth-child(3) > select > option:nth-child(8)')

IT.opt$clickElement()
Sys.sleep(0.2)
list$clickElement()
list.500$clickElement()


Ent.name <-NULL ; Ent.detail <- NULL ; Ent.sales <- NULL

name.css <- "td.c_col1"
sector.css <- "td:nth-child(3) > span"
sales.css <- "td:nth-child(6)"

for (i in 1:500){
  css <- paste0("#rank_board2 tr:nth-child(",i,") ")
  
  name_elem <- remDr$findElements(using = "css selector",paste0(css,name.css))
  name <- sapply(name_elem, function(x){x$getElementText()})
  Ent.name <- append(Ent.name, unlist(name))
  Sys.sleep(0.5)
  
  sector_elem <- remDr$findElements(using = "css selector",paste0(css,sector.css))
  sector <- sapply(sector_elem, function(x){x$getElementText()})
  Ent.detail <- append(Ent.detail, unlist(sector))
  Sys.sleep(0.5)
  
  sales_elem <- remDr$findElements(using = "css selector",paste0(css,sales.css))
  sales <- sapply(sales_elem, function(x){x$getElementText()})
  Ent.sales <- append(Ent.sales, unlist(sales))
  Sys.sleep(0.5)
}
Ent.name

length(Ent.name)
length(Ent.sector)
length(Ent.sales)

Ent_500 <- data.frame(Ent.name, Ent.sector, Ent.sales)
colnames(Ent_500) <- c("이름", "상세 산업", "매출")
View(Ent_500)

getwd()
setwd("C:/R_Mini")
write.csv(Ent_500, 'KR_IT.Enterprise.csv')
