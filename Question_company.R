#####각 기업별 질문
saramin_c <- read.csv("KR_Enterpise_interview_saramin.csv")
jobkorea_c <- read.csv("jobkorea_company.csv")
View(saramin_c)
#samsung
j_samsung_file <- read.csv("com_Q/samsungQ.csv")
s_samsung <- data.frame(saramin_c[[3]][1:30]) ; colnames(s_samsung) <- c("samsung") 
j_samsung <- data.frame(j_samsung_file[2]) ; colnames(j_samsung) <- c("samsung")
com_samsung <- rbind(s_samsung,j_samsung ) ;
com_samsung <- unlist(com_samsung)
write(com_samsung, file ="com_top10/samsung.txt")

#LG
s_lg <- data.frame(saramin_c[[3]][49:57]) ; colnames(s_lg) <- c("lg") 
j_lg <- data.frame(jobkorea_c[[3]][1:300]) ; colnames(j_lg) <- c("lg")
com_lg <- rbind(s_lg,j_lg )
com_lg <- unlist(com_lg)
write(com_lg, file ="com_top10/lg.txt")
length(com_lg)

#KT
j_kt_file <- read.csv("com_Q/ktQ.csv")
s_kt <- data.frame(saramin_c[[3]][227:261]) ; colnames(s_kt) <- c("kt") 
j_kt <- data.frame(j_kt_file[2]) ; colnames(j_kt) <- c("kt")
com_kt <- rbind(s_kt,j_kt )
com_kt <- unlist(com_kt)
write(com_kt, file ="com_top10/kt.txt")
length(com_kt)

#bank-중소기업은행
j_bank_file <- read.csv("com_Q/bankQ.csv")
s_bank <- data.frame(saramin_c[[3]][322:324]) ; colnames(s_bank) <- c("bank") 
j_bank <- data.frame(j_bank_file[2]) ; colnames(j_bank) <- c("bank")
com_bank <- rbind(s_bank,j_bank )
com_bank <- unlist(com_bank)
write(com_bank, file ="com_top10/bank.txt")
length(com_bank)

#samsungSDI
s_samsungSDI <- data.frame(saramin_c[[3]][367:372]) ; colnames(s_samsungSDI) <- c("samsungSDI") 
j_samsungSDI <- data.frame(jobkorea_c[[6]][1:65]) ; colnames(j_samsungSDI) <- c("samsungSDI")
com_samsungSDI <- rbind(s_samsungSDI,j_samsungSDI )
com_samsungSDI <- unlist(com_samsungSDI)
write(com_samsungSDI, file ="com_top10/samsungSDI.txt")
length(com_samsungSDI)

#samsungE
s_samsungE <- data.frame(saramin_c[[3]][404:415]) ; colnames(s_samsungE) <- c("samsungE") 
j_samsungE <- data.frame(jobkorea_c[[7]][1:53]) ; colnames(j_samsungE) <- c("samsungE")
com_samsungE <- rbind(s_samsungE,j_samsungE )
com_samsungE <- unlist(com_samsungE)
write(com_samsungE, file ="com_top10/samsungE.txt")
length(com_samsungE)

#hyundai
s_hyundai <- data.frame(saramin_c[[3]][449:466]) ; colnames(s_hyundai) <- c("hyundai") 
j_hyundai <- data.frame(jobkorea_c[[8]][1:53]) ; colnames(j_hyundai) <- c("hyundai")
com_hyundai <- rbind(s_hyundai,j_hyundai ) 
com_hyundai <- unlist(com_hyundai)
write(com_hyundai, file ="com_top10/hyundai.txt")
length(com_hyundai)

# kakao
s_kakao <- data.frame(saramin_c[[3]][589:594]) ; colnames(s_kakao) <- c("kakao") 
j_kakao <- data.frame(jobkorea_c[[9]][1:55]) ; colnames(j_kakao) <- c("kakao")
com_kakao <- rbind(s_kakao,j_kakao ) 
com_kakao <- unlist(com_kakao)
write(com_kakao, file ="com_top10/kakao.txt")

# lotteH
j_lotteH_file <- read.csv("com_Q/lotteHQ.csv")
s_lotteH <- data.frame(saramin_c[[3]][595:615]) ; colnames(s_lotteH) <- c("lotteH") 
j_lotteH <- data.frame(j_lotteH_file[2]) ; colnames(j_lotteH) <- c("lotteH")
com_lotteH <- rbind(s_lotteH,j_lotteH ) 
com_lotteH <- unlist(com_lotteH)
write(com_lotteH, file ="com_top10/lotteH.txt")

# netmable
s_netmable <- data.frame(saramin_c[[3]][976:978]) ; colnames(s_netmable) <- c("netmable") 
j_netmable <- data.frame(jobkorea_c[[11]][1:12]) ; colnames(j_netmable) <- c("netmable")
com_netmable <- rbind(s_netmable,j_netmable ) 
com_netmable <- unlist(com_netmable)
write(com_netmable, file ="com_top10/netmable.txt")

# nc
s_nc <- data.frame(saramin_c[[3]][992:1001]) ; colnames(s_nc) <- c("nc") 
j_nc <- data.frame(jobkorea_c[[12]][1:67]) ; colnames(j_nc) <- c("nc")
com_nc <- rbind(s_nc,j_nc ) 
com_nc <- unlist(com_nc)
write(com_nc, file ="com_top10/nc.txt")

# hansam
s_hansam <- data.frame(saramin_c[[3]][1114:1136]) ; colnames(s_hansam) <- c("hansam") 
j_hansam <- data.frame(jobkorea_c[[13]][1:239]) ; colnames(j_hansam) <- c("hansam")
com_hansam <- rbind(s_hansam,j_hansam ) 
com_hansam <- unlist(com_hansam)
write(com_hansam, file ="com_top10/hansam.txt")

# sebang
s_sebang <- data.frame(saramin_c[[3]][1539:1541]) ; colnames(s_sebang) <- c("sebang") 
j_sebang <- data.frame(jobkorea_c[[14]][1:19]) ; colnames(j_sebang) <- c("sebang")
com_sebang <- rbind(s_sebang,j_sebang ) 
com_sebang <- unlist(com_sebang)
write(com_sebang, file ="com_top10/sebang.txt")

# lgCNS
j_lgCNS_file <- read.csv("com_Q/lgCNS.csv")
j_lgCNS <- data.frame(j_lgCNS_file[2]) ; colnames(j_lgCNS) <- c("lgCNS")
com_lgCNS <- unlist(j_lgCNS)
write(com_lgCNS, file ="com_top10/lgCNS.txt")

# naver
j_naver_file <- read.csv("com_Q/naver.csv")
j_naver <- data.frame(j_naver_file[2]) ; colnames(j_naver) <- c("naver")
com_naver <- unlist(j_naver)
write(com_naver, file ="com_top10/naver.txt")

#############################################################################################
#samsung #LG #KT #bank-중소기업은행 #samsungSDI #samsungE #hyundai #kakao #lotteH #netmable #nc #hansam #sebang
library(dplyr)
library(KoNLP)
library(wordcloud2)
library(htmlwidgets)
bg <- rgb(255,255,255,max = 255)
#samsung /지원이 가장 많이 나옴 
word_samsung <- readLines('output/com_top10/samsung.txt')
word_samsung <- extractNoun(word_samsung)
word_samsung <- unlist(word_samsung)
word_samsung <- data.frame(word_samsung)
word_samsung %>%  filter(nchar(word_samsung)>=2) -> word_samsung

word_samsung <- sort(table(word_samsung),decreasing = T)
word_samsung <- subset(word_samsung, names(word_samsung) !="무엇"&names(word_samsung) !="생각"&names(word_samsung) !="이유"&names(word_samsung) !="본인"&names(word_samsung) !="자기"
                       &names(word_samsung) !="기억"&names(word_samsung) !="말해보"&names(word_samsung) !="~~으로"&names(word_samsung) !="설명"&names(word_samsung) !="PT해보"&names(word_samsung) !="하나"
                       &names(word_samsung) !="OO"&names(word_samsung) !="or"&names(word_samsung) !="경우"&names(word_samsung) !="거기"&names(word_samsung) !="강자"&names(word_samsung) !="극성"&names(word_samsung) !="대항"
                       &names(word_samsung) !="분양가"&names(word_samsung) !="찬반토론해보"&names(word_samsung) !='직접해본적이'&names(word_samsung) !="용해"&names(word_samsung) !="하기"&names(word_samsung) !="한국의"&names(word_samsung) !="최종"&names(word_samsung) !="진중"
                       &names(word_samsung) !="한국"&names(word_samsung) !="우리"&names(word_samsung) !="위주"&names(word_samsung) !="이전"&names(word_samsung) !="수일"&names(word_samsung) !="어떤식으로"&names(word_samsung) !="비결"&names(word_samsung) !="비교"&names(word_samsung) !="비극")
word_samsung <- subset(word_samsung, word_samsung >2)
samsung <- wordcloud2(word_samsung,col="random-light",backgroundColor = bg,fontFamily = "theleft",shape = 'pentagon',
                       size=1)
samsung2 <- wordcloud2(word_samsung,col="random-light",backgroundColor = bg,fontFamily = "theleft",shape = 'pentagon',
           size=1)
htmltools::save_html(samsung,"output/Q_samsung.html")

# LG
word_lg <- readLines('output/com_top10/lg.txt')
word_lg <- extractNoun(word_lg)
word_lg <- unlist(word_lg)
word_lg <- data.frame(word_lg)
word_lg %>%  filter(nchar(word_lg)>=2) -> word_lg
word_lg <- sort(table(word_lg),decreasing = T)

word_lg <- subset(word_lg, names(word_lg) !="무엇"& names(word_lg) !="지원"& names(word_lg) !="전자"& names(word_lg) !="LG"& names(word_lg) !="설명"& names(word_lg) !="이유"& names(word_lg) !="본인"& names(word_lg) !="자기"& names(word_lg) !="자신"& names(word_lg) !="해주"
                  & names(word_lg) !="사항"& names(word_lg) !='이야기'& names(word_lg) !="어디"& names(word_lg) !="해서"& names(word_lg) !="가능"& names(word_lg) !='말하'
                  & names(word_lg) !="명해"& names(word_lg) !="하라"& names(word_lg) !='해당'& names(word_lg) !="확대"& names(word_lg) !="달라"& names(word_lg) !='우리'& names(word_lg) !="하면"& names(word_lg) !="하기"
                  & names(word_lg) !="do"& names(word_lg) !="HA"& names(word_lg) !="to"& names(word_lg) !="VC"& names(word_lg) !="you"
                  & names(word_lg) !="거기"& names(word_lg) !="그동안"& names(word_lg) !="하지"& names(word_lg) !="하시"& names(word_lg) !="패스트푸드"& names(word_lg) !="일할"
                  & names(word_lg) !="엮어서"& names(word_lg) !="여자"& names(word_lg) !="열전"& names(word_lg) !="얼마"& names(word_lg) !="시력"
                  & names(word_lg) !="밀폐"& names(word_lg) !="뭔가"& names(word_lg) !="몰입"& names(word_lg) !="물건"& names(word_lg) !="로프"& names(word_lg) !="말해보"& names(word_lg) !="등정")
word_lg <- subset(word_lg, word_lg >1)
lg <- wordcloud2(word_lg,col="random-light",backgroundColor = bg,fontFamily = "theleft",shape = 'pentagon',
           size=1)
lg2 <- wordcloud2(word_lg,col="random-light",backgroundColor = bg,fontFamily = "theleft",shape = 'pentagon',
                  size=1)
htmltools::save_html(lg,"output/Q_lg.html")
htmltools::save_html(lg2,"output/Q_lg_LG전자지원X.html")

# KT
word_kt <- readLines('output/com_top10/kt.txt')
word_kt <- extractNoun(word_kt)
word_kt <- unlist(word_kt)
word_kt <- data.frame(word_kt)
word_kt %>%  filter(nchar(word_kt)>=2) -> word_kt
word_kt <- sort(table(word_kt),decreasing = T)

word_kt <- subset(word_kt, names(word_kt) !="생각" &names(word_kt) !="설명"&names(word_kt) !="KT"&names(word_kt) !="지원"&names(word_kt) !="무엇" &names(word_kt) !="본인"& names(word_kt) !="회사")
word_kt <- subset(word_kt, word_kt >1)
kt <- wordcloud2(word_kt,col="random-light",backgroundColor = bg,fontFamily = "theleft",shape = 'pentagon',
           size=1)
kt2 <- wordcloud2(word_kt,col="random-light",backgroundColor = bg,fontFamily = "theleft",shape = 'pentagon',
                 size=1)
htmltools::save_html(kt,"output/Q_kt.html")
htmltools::save_html(kt2,"output/Q_kt_KT지원X.html")


# bank 
word_bank <- readLines('com_top10/bank.txt')
word_bank <- extractNoun(word_bank)
word_bank <- unlist(word_bank)
word_bank <- data.frame(word_bank)
word_bank %>%  filter(nchar(word_bank)>=2) -> word_bank
word_bank <- sort(table(word_bank),decreasing = T)

word_bank <- subset(word_bank, names(word_bank) !="설명" &names(word_bank) !="무엇" &names(word_bank) !="본인"& names(word_bank) !="00"
                    & names(word_bank) !="이유"& names(word_bank) !="자기"& names(word_bank) !="관련"& names(word_bank) !="생각"& names(word_bank) !="자신"
                    & names(word_bank) !="그림"& names(word_bank) !="IBK"& names(word_bank) !="마지막"& names(word_bank) !="비롯"& names(word_bank) !="결심"
                    & names(word_bank) !="기업"& names(word_bank) !="은행"& names(word_bank) !="많은"& names(word_bank) !="동안"& names(word_bank) !="무작위"& names(word_bank) !="하시"& names(word_bank) !="하기")
word_bank <- subset(word_bank, word_bank >1)
bank <- wordcloud2(word_bank,col="random-light",backgroundColor = bg,fontFamily = "theleft",shape = 'pentagon',
           size=1)
htmltools::save_html(bank,"output/Q_bank.html")
head_samsung <- head(word_samsung,10)

# samsungSDI --> 질문 부족 
word_samsungSDI <- readLines('com_top10/samsungSDI.txt')
word_samsungSDI <- extractNoun(word_samsungSDI)
word_samsungSDI <- unlist(word_samsungSDI)
word_samsungSDI <- data.frame(word_samsungSDI)
word_samsungSDI %>%  filter(nchar(word_samsungSDI)>=2) -> word_samsungSDI
word_samsungSDI <- sort(table(word_samsungSDI),decreasing = T)

wordcloud2(word_samsungSDI,col="random-light",backgroundColor = "black",fontFamily = "theleft",shape = 'pentagon',
           size=1)

# samsungE  --> 질문부족
word_samsungE <- readLines('com_top10/samsungE.txt')
word_samsungE <- extractNoun(word_samsungE)
word_samsungE <- unlist(word_samsungE)
word_samsungE <- data.frame(word_samsungE)
word_samsungE %>%  filter(nchar(word_samsungE)>=2) -> word_samsungE
word_samsungE <- sort(table(word_samsungE),decreasing = T)

word_samsungE <- subset(word_samsungE, names(word_samsungE) !="무엇" & names(word_samsungE)!="생각")
wordcloud2(word_samsungE,col="random-light",backgroundColor = "black",fontFamily = "theleft",shape = 'pentagon',
           size=1)

# hyundai  --> 애매
word_hyundai <- readLines('com_top10/hyundai.txt')
word_hyundai <- extractNoun(word_hyundai)
word_hyundai <- unlist(word_hyundai)
word_hyundai <- data.frame(word_hyundai)
word_hyundai %>%  filter(nchar(word_hyundai)>=2) -> word_hyundai
word_hyundai <- sort(table(word_hyundai),decreasing = T)

word_hyundai <- subset(word_hyundai, names(word_hyundai) !="무엇" & names(word_hyundai)!="생각" & names(word_hyundai)!="본인")
hyundai <- wordcloud2(word_hyundai,col="random-light",backgroundColor = bg,fontFamily = "theleft",shape = 'pentagon',
           size=1) 
htmltools::save_html(hyundai,"output/Q_hyundai.html")
head_samsung <- head(word_samsung,10)


# kakao  --> 애매
word_kakao <- readLines('com_top10/kakao.txt')
word_kakao <- extractNoun(word_kakao)
word_kakao <- unlist(word_kakao)
word_kakao <- data.frame(word_kakao)
word_kakao %>%  filter(nchar(word_kakao)>=2) -> word_kakao
word_kakao <- sort(table(word_kakao),decreasing = T)

word_kakao <- subset(word_kakao, names(word_kakao) !="무엇" & names(word_kakao)!="생각" & names(word_kakao)!="본인"& names(word_kakao)!="관련")
kakao <- wordcloud2(word_kakao,col="random-light",backgroundColor = bg,fontFamily = "theleft",shape = 'pentagon',
           size=1) 
htmltools::save_html(kakao,"output/Q_kakao.html")
head_samsung <- head(word_samsung,10)

# lotteH
word_lotteH <- readLines('com_top10/lotteH.txt')
word_lotteH <- extractNoun(word_lotteH)
word_lotteH <- unlist(word_lotteH)
word_lotteH <- data.frame(word_lotteH)
word_lotteH %>%  filter(nchar(word_lotteH)>=2) -> word_lotteH
word_lotteH <- sort(table(word_lotteH),decreasing = T)

word_lotteH <- subset(word_lotteH, names(word_lotteH) !="무엇" & names(word_lotteH)!="생각" & names(word_lotteH)!="본인"& names(word_lotteH)!="관련")
lotteH <- wordcloud2(word_lotteH,col="random-light",backgroundColor = bg,fontFamily = "theleft",shape = 'pentagon',
           size=1) 
htmltools::save_html(lotteH,"output/Q_lotteH.html")
head_samsung <- head(word_samsung,10)


# netmable
word_netmable <- readLines('com_top10/netmable.txt')
word_netmable <- extractNoun(word_netmable)
word_netmable <- unlist(word_netmable)
word_netmable <- data.frame(word_netmable)
word_netmable %>%  filter(nchar(word_netmable)>=2) -> word_netmable
word_netmable <- sort(table(word_netmable),decreasing = T)

word_netmable <- subset(word_netmable, names(word_netmable) !="무엇" & names(word_netmable)!="생각" & names(word_netmable)!="본인"& names(word_netmable)!="관련"& names(word_netmable)!="하시")
netmable <- wordcloud2(word_netmable,col="random-light",backgroundColor = bg,fontFamily = "theleft",shape = 'pentagon',
           size=1) 
htmltools::save_html(netmable,"output/Q_netmable.html")
head_samsung <- head(word_samsung,10)

# nc
word_nc <- readLines('output/com_top10/nc.txt')
word_nc <- extractNoun(word_nc)
word_nc <- unlist(word_nc)
word_nc <- data.frame(word_nc)
word_nc %>%  filter(nchar(word_nc)>=2) -> word_nc
word_nc <- sort(table(word_nc),decreasing = T)

word_nc <- subset(word_nc, word_nc >1)
word_nc <- subset(word_nc, names(word_nc) !="무엇" & names(word_nc)!="생각" & names(word_nc)!="본인"& names(word_nc)!="관련"& names(word_nc)!="하시"& names(word_nc)!= "설명")
nc <- wordcloud2(word_nc,col="random-light",backgroundColor = bg,fontFamily = "theleft",shape = 'pentagon',
           size=1)
htmltools::save_html(nc,"output/Q_nc.html")

# hansam
word_hansam <- readLines('com_top10/hansam.txt')
word_hansam <- extractNoun(word_hansam)
word_hansam <- unlist(word_hansam)
word_hansam <- data.frame(word_hansam)
word_hansam %>%  filter(nchar(word_hansam)>=2) -> word_hansam
word_hansam <- sort(table(word_hansam),decreasing = T)

word_hansam <- subset(word_hansam, word_nc >2)
word_hansam <- subset(word_hansam, names(word_hansam) !="무엇" & names(word_hansam)!="생각" & names(word_hansam)!="본인"& names(word_hansam)!="관련"& names(word_hansam)!="하시")
hansam <- wordcloud2(word_hansam,col="random-light",backgroundColor = bg,fontFamily = "theleft",shape = 'pentagon',
           size=1) 
htmltools::save_html(hansam,"output/Q_hansam.html")
head_samsung <- head(word_samsung,10)

# sebang --> 애매
word_sebang <- readLines('com_top10/sebang.txt')
word_sebang <- extractNoun(word_sebang)
word_sebang <- unlist(word_sebang)
word_sebang <- data.frame(word_sebang)
word_sebang %>%  filter(nchar(word_sebang)>=2) -> word_sebang
word_sebang <- sort(table(word_sebang),decreasing = T)

word_sebang <- subset(word_sebang, names(word_sebang) !="무엇" & names(word_sebang)!="생각" & names(word_sebang)!="본인"& names(word_sebang)!="관련"& names(word_sebang)!="하시")
wordcloud2(word_sebang,col="random-light",backgroundColor = bg,fontFamily = "theleft",shape = 'pentagon',
           size=1) 

# lgCNS
word_lgCNS <- readLines('output/com_top10/lgCNS.txt')
word_lgCNS <- extractNoun(word_lgCNS)
word_lgCNS <- unlist(word_lgCNS)
word_lgCNS <- data.frame(word_lgCNS)
word_lgCNS %>%  filter(nchar(word_lgCNS)>=2) -> word_lgCNS
word_lgCNS <- sort(table(word_lgCNS),decreasing = T)

word_lgCNS <- subset(word_lgCNS, names(word_lgCNS) !="무엇" & names(word_lgCNS)!="CNS"& names(word_lgCNS)!="지원"& names(word_lgCNS)!="LG"& names(word_lgCNS)!="이유"& names(word_lgCNS)!="자기"& names(word_lgCNS)!="자신
                     "& names(word_lgCNS)!="회사"& names(word_lgCNS)!="우리"& names(word_lgCNS)!="생각" & names(word_lgCNS)!="본인"& names(word_lgCNS)!="관련"& names(word_lgCNS)!="하시")
lgcns <- wordcloud2(word_lgCNS,col="random-light",backgroundColor = bg,fontFamily = "theleft",shape = 'pentagon',
           size=1) 
lgcns2 <- wordcloud2(word_lgCNS,col="random-light",backgroundColor = bg,fontFamily = "theleft",shape = 'pentagon',
                     size=1) 

htmltools::save_html(lgcns2,"output/Q_lgcns_LGCNS지원X.html")
htmltools::save_html(lgcns,"output/Q_lgcns.html")

# naver
word_naver <- readLines('output/com_top10/naver.txt')
word_naver <- extractNoun(word_naver)
word_naver <- unlist(word_naver)
word_naver <- data.frame(word_naver)
word_naver %>%  filter(nchar(word_naver)>=2) -> word_naver
word_naver <- sort(table(word_naver),decreasing = T)

word_naver <- subset(word_naver, word_naver >1)
word_naver <- subset(word_naver, names(word_naver) !="하세" &names(word_naver) !="지원"&names(word_naver) !="네이버"&names(word_naver) !="네이버에"&names(word_naver) !="네이버에서"
                     &names(word_naver) !="설명"&names(word_naver) !="한가" &names(word_naver) !="해주" &names(word_naver) !="무엇" & names(word_naver)!="생각" & names(word_naver)!="본인"& names(word_naver)!="관련"& names(word_naver)!="하시")
naver <- wordcloud2(word_naver,col="random-light",backgroundColor = "white",fontFamily = "theleft",shape = 'pentagon',
           size=1) 
naver2 <- wordcloud2(word_naver,col="random-light",backgroundColor = "white",fontFamily = "theleft",shape = 'pentagon',
                    size=1) 
htmltools::save_html(naver,"output/Q_naver.html")
htmltools::save_html(naver2,"output/Q_naver_네이버지원X.html")
head_naver <- head(word_naver,10)

##################
#wordcloud2(tc,col="random-light",backgroundColor = "white",fontFamily = "theleft",shape = 'pentagon',size=1) 
head_lgcns <- head(word_lgCNS,30)
head_nc <- head(word_nc,30)
head_kt <- head(word_kt,30)
head_lg <- head(word_lg,30)
head_samsung <- head(word_samsung,30)

allcompany <- data.frame(head_samsung,head_lg,head_kt,head_nc,head_lgcns)

colnames(allcompany) <- c("top10","fre","top10","fre","top10","fre","top10","fre","top10","fre")
allcompany <- rbind(allcompany[1],allcompany[3],allcompany[5],allcompany[7],allcompany[9])

colnames(allcompany2) <- c("top10","fre","top10","fre","top10","fre","top10","fre","top10","fre")

tc <- sort(table(allcompany[1]),decreasing = T)

tc <- subset(tc, names(tc)!="마지막"&names(tc)!="소개"&names(tc)!="자신"&names(tc)!="선택")

top5company <- as.matrix(allcompany[1])

library(RColorBrewer)

library(showtext)

coul <- brewer.pal(10, "Set2") 
font_add(family = "slim", regular = "fonts/OdSlimfitGothicL.ttf")

top5_Q <- barplot(tc[1:5],
        horiz=F, las=1, cex.names=1.5, family="slim", border="white",
        col=coul, xlab="word")
title(main="TOP5기업의 최다 단어 TOP5",family="slim",cex.main=2,col.main="darkgreen")
dev.copy(top5_Q,"output/top5Company_Q5.png")
dev.off()

library(wordcloud2)
wordcloud2(tc,col="random-light",backgroundColor = "white",fontFamily = "theleft",size=1) 


