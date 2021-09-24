###[[빈 변수]]#############################
company <- NULL

school <- NULL

score <- NULL
score.css <- "#container > div.stContainer div.averageSpec.allContent > div.specListWrap ul > li:nth-child(1) > div > span"#학점 

TOEIC <- NULL
TOEIC.css <- "#container > div.stContainer div.averageSpec.allContent > div.specListWrap ul > li:nth-child(2) > div > span"#토익

T.Speaking <- NULL
T.Speaking.css <- "#container > div.stContainer div.averageSpec.allContent > div.specListWrap ul > li:nth-child(3) > div > span"#토익스피킹

OPIC <- NULL
OPIC.css <- "#container > div.stContainer div.averageSpec.allContent > div.specListWrap ul > li:nth-child(4) > div > span"#오픽

language <- NULL
language.css <- "#container > div.stContainer div.averageSpec.allContent > div.specListWrap ul > li:nth-child(5) > div > span"#언어

cert.ea_mean <- NULL
cert.ea_mean.css <- "#container > div.stContainer div.averageSpec.allContent > div.specListWrap ul > li:nth-child(6) > div > span"#자격증

overseas_exp <- NULL
overseas_exp.css <- "#container > div.stContainer div.averageSpec.allContent > div.specListWrap ul > li:nth-child(7) > div > span"#해외경험

intern <- NULL
intern.css <- "#container > div.stContainer div.averageSpec.allContent > div.specListWrap ul > li:nth-child(8) > div > span"#인턴

prize <- NULL
prize.css <- "#container > div.stContainer div.averageSpec.allContent > div.specListWrap ul > li:nth-child(9) > div > span"#수상

CSS <- NULL
CSS.css <- "#container > div.stContainer div.averageSpec.allContent > div.specListWrap ul > li:nth-child(10) > div > span"#교내/사회/봉사


#학력 별 총 결과치
Total <- NULL 


#[학력별 Data Frame 용]
Spec <- NULL
#ALL <- data.frame() 이건 그냥 나머지 rbind 하자...ㅎㅎ..

###########################################

#NULL 전환 함수
toNULL <- function(){
  company <- NULL
  school <- NULL
  score <- NULL
  TOEIC <- NULL
  T.Speaking <- NULL
  OPIC <- NULL
  language <- NULL
  cert.ea_mean
  CSS <- NULL
  prize <- NULL
  intern <- NULL
  overseas_exp <- NULL
}
save.image(file = "C:/R_Mini/saramin_Spec_var.RData")