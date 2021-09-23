##############전체 면접질문 추출 ##################
library(dplyr)
question_all <- NULL;
# 합치기
saramin <- read.csv("KR_Enterpise_interview_saramin.csv")
saramin <- saramin[3]
colnames(saramin)<- "question"

jobkorea <- read.csv("jobkorea_question1.csv")
jobkorea <- jobkorea[2]
colnames(jobkorea)<- "question"

question_all <- rbind(saramin,jobkorea)
question_all <- unlist(question_all)
write(question_all, file = "Question_All.txt")

questions <- readLines('Question_All.txt')

#워드
library(KoNLP)
library(wordcloud2)
question_word <- NULL;
# 
question_word <- extractNoun(questions) # 문장 명사만 구분한거
question_word <- unlist(question_word)
question_word <- gsub("[A-Za-z]","",question_word)
question_word <- gsub("[[:digit:][:punct:]]","",question_word)
question_word <- data.frame(question_word)
question_word %>%  filter(!is.na(question_word)) -> question_word
question_word %>%  filter(nchar(question_word)>=2) -> question_word

question_word <- table(question_word)
question_word <- sort(question_word,decreasing = T)
#head(question_word)
question_word <- question_word[3:5095]
question_word <- subset(question_word,names(question_word) != "본인" & names(question_word) != "이유" & names(question_word) !="자기"
                        & names(question_word) !="설명"& names(question_word) !="자신"& names(question_word) !="지원자"& names(question_word) !="관련"
                        & names(question_word) !="선택"& names(question_word) !="영업"& names(question_word) !="면접"& names(question_word) !="은행"
                        & names(question_word) !="제품"& names(question_word) !="현대"& names(question_word) !="가지"& names(question_word) !="당신"
                        & names(question_word) !="친구"& names(question_word) !="어디"& names(question_word) !="이야기"& names(question_word) !="하기"
                        & names(question_word) !="동안"& names(question_word) !="해주"& names(question_word) !="해당"& names(question_word) !="누구"
                        & names(question_word) !="경우"& names(question_word) !="사용"& names(question_word) !="사항"& names(question_word) !="의견"
                        & names(question_word) !="진행"& names(question_word) !="말하"& names(question_word) !="해서"& names(question_word) !="구체"
                        & names(question_word) !="부분"& names(question_word) !="한가"& names(question_word) !="하나"& names(question_word) !="하시오"
                        & names(question_word) !="하시"& names(question_word) !="상품"& names(question_word) !="이전"& names(question_word) !="보험"
                        & names(question_word) !="하면"& names(question_word) !="말해보시"& names(question_word) !="전자"& names(question_word) !="필요"
                        & names(question_word) !="연구"& names(question_word) !="들이"& names(question_word) !="하지"& names(question_word) !="대한항공"
                        & names(question_word) !="백화점"& names(question_word) !="그것"& names(question_word) !="매장"& names(question_word) !="현장"
                        & names(question_word) !="품질"& names(question_word) !="방문"& names(question_word) !="브랜드"& names(question_word) !="제약"
                        & names(question_word) !="물류"& names(question_word) !="일하"& names(question_word) !="여자"& names(question_word) !="말씀"
                        & names(question_word) !="설계"& names(question_word) !="얼마"& names(question_word) !="보시"& names(question_word) !="전기"
                        & names(question_word) !="평가"& names(question_word) !="공단"& names(question_word) !="홈쇼핑"& names(question_word) !="지시"
                        & names(question_word) !="채용"& names(question_word) !="간단"& names(question_word) !="생산관리"& names(question_word) !="항공"
                        & names(question_word) !="하라"& names(question_word) !="게임"& names(question_word) !="단어"& names(question_word) !="뭔가"
                        & names(question_word) !="면접관"& names(question_word) !="한국전력"& names(question_word) !="사람들"& names(question_word) !="공장"& names(question_word) !="금융"
                        & names(question_word) !="하려"& names(question_word) !="제일"& names(question_word) !="화학"& names(question_word) !="궁금"& names(question_word) !="생산"& names(question_word) !="열역학"
                        & names(question_word) !="무언가"& names(question_word) !="한화"& names(question_word) !="주변"& names(question_word) !="추천"& names(question_word) !="신한"
                        & names(question_word) !="영업직"& names(question_word) !="오늘"& names(question_word) !="지점"& names(question_word) !="포스"& names(question_word) !="일할"
                        & names(question_word) !="모습"& names(question_word) !="종류"& names(question_word) !="사유"& names(question_word) !="식품"& names(question_word) !="연관"
                        & names(question_word) !="영업관리"& names(question_word) !="증권"& names(question_word) !="건설"& names(question_word) !="상관"
                        & names(question_word) !="시스템"& names(question_word) !="아버지"& names(question_word) !="엔지니어"& names(question_word) !="실험")
length(question_word) #4984
question_word <- subset(question_word, names(question_word) != "이름" &names(question_word) != "이해" &names(question_word) !="임원"&names(question_word) !="제안"&names(question_word) !="파트"&names(question_word) !="하세"
                        &names(question_word) !="대구"&names(question_word) !="현대중공업"&names(question_word) !="하세"&names(question_word) !="경영"&names(question_word) !="서브"&names(question_word) !="카드"&names(question_word) !="구성"
                        &names(question_word) !="국민연금"&names(question_word) !="그린"&names(question_word) !="생산기술"&names(question_word) !="푸드"&names(question_word) !="구성"
                        &names(question_word) !="금융권"&names(question_word) !="기계"&names(question_word) !="진출"&names(question_word) !="때문"&names(question_word) !="배터리"&names(question_word) !="상태"
                        &names(question_word) !="위주"&names(question_word) !="이것"&names(question_word) !="이익"&names(question_word) !="인터넷"
                        &names(question_word) !="작성"&names(question_word) !="특이"&names(question_word) !="특정"&names(question_word) !="거래"&names(question_word) !="금리"
                        &names(question_word) !="기아"&names(question_word) !="이번"&names(question_word) !="랜드"&names(question_word) !="유통업"
                        &names(question_word) !="이후"&names(question_word) !="핸드폰"&names(question_word) !="공공기관"&names(question_word) !="남자"
                        &names(question_word) !="농심"&names(question_word) !="누군가"&names(question_word) !="달라"&names(question_word) !="당시"&names(question_word) !="말해달라"&names(question_word) !="무슨일"
                        &names(question_word) !="부문"&names(question_word) !="여성"&names(question_word) !="역사"&names(question_word) !="영업과"&names(question_word) !="일본"
                        &names(question_word) !="대형"&names(question_word) !="남동"&names(question_word) !="국토"&names(question_word) !="하자"&names(question_word) !="하이마트"&names(question_word) !="하거"&names(question_word) !="포함"
                        &names(question_word) !="작년"&names(question_word) !="동물"&names(question_word) !="많은"&names(question_word) !="반도체"&names(question_word) !="배정"&names(question_word) !="사이"&names(question_word) !="어떤가요"
                        &names(question_word) !="연결"&names(question_word) !="요리"&names(question_word) !="우선"&names(question_word) !="위치"&names(question_word) !="삼양"&names(question_word) !="설비"&names(question_word) !="개월"&names(question_word) !="꼬리"
                        &names(question_word) !="기능"&names(question_word) !="물산"&names(question_word) !="박사"&names(question_word) !="원자력"&names(question_word) !="손님"&names(question_word) !="수준"&names(question_word) !="유통"
                        &names(question_word) !="키워드"&names(question_word) !="이곳"&names(question_word) !="이노베이션"&names(question_word) !="화력발전소"&names(question_word) !="가스"&names(question_word) !="녹십자"&names(question_word) !="다룰"
                        &names(question_word) !="담당자"&names(question_word) !="대부분"&names(question_word) !="동원"&names(question_word) !="만도"&names(question_word) !="반값"&names(question_word) !="반응"&names(question_word) !="번째"&names(question_word) !="비결"&names(question_word) !="색깔"
                        &names(question_word) !="스포츠"&names(question_word) !="세일즈"&names(question_word) !="시공"&names(question_word) !="아시"&names(question_word) !="아파트"&names(question_word) !="어떤것이"
                        &names(question_word) !="어떤식으로"&names(question_word) !="온라인"&names(question_word) !="울산"&names(question_word) !="유효"&names(question_word) !="응대"&names(question_word) !="주택금융"&names(question_word) !="중간"
                        &names(question_word) !="하루"&names(question_word) !="함수"&names(question_word) !="건설업"&names(question_word) !="계약"&names(question_word) !="공법"&names(question_word) !="공통점"&names(question_word) !="그때"
                        &names(question_word) !="그리드"&names(question_word) !="남성"&names(question_word) !="농협"&names(question_word) !="대우"&names(question_word) !="대우건설"&names(question_word) !="대장정"&names(question_word) !="부하"
                        &names(question_word) !="뭔지"&names(question_word) !="면접자"&names(question_word) !="목적"&names(question_word) !="아워"&names(question_word) !="언급"&names(question_word) !="엔지니어링"&names(question_word) !="웨이"&names(question_word) !="위해"&names(question_word) !="유리"&names(question_word) !="제의"
                        &names(question_word) !="중공업"&names(question_word) !="중심"&names(question_word) !="차면접"&names(question_word) !="커리"&names(question_word) !="포지션 현대모비스에서"&names(question_word) !="확대"
                        &names(question_word) !="휴대폰"&names(question_word) !="개별"&names(question_word) !="개수"&names(question_word) !="계통"&names(question_word) !="공채"&names(question_word) !="관리직"&names(question_word) !="기재"
                        &names(question_word) !="기숙사"&names(question_word) !="귀하"&names(question_word) !="나중"&names(question_word) !="다이"&names(question_word) !="노인"&names(question_word) !="네트워크"&names(question_word) !="냉장고"&names(question_word) !="라인"
                        &names(question_word) !="리드"&names(question_word) !="마디"&names(question_word) !="모레"&names(question_word) !="변압기"&names(question_word) !="베트남"&names(question_word) !="발명"&names(question_word) !="미래의"&names(question_word) !="무인"&names(question_word) !="목격"
                        &names(question_word) !="보험업"&names(question_word) !="북한"&names(question_word) !="바이클"&names(question_word) !="수도권"&names(question_word) !="선정"&names(question_word) !="선물"&names(question_word) !="서비스직"&names(question_word) !="상상"&names(question_word) !="아모레퍼시픽"
                        &names(question_word) !="아무"&names(question_word) !="아이"&names(question_word) !="약자"&names(question_word) !="여사"&names(question_word) !="이거"&names(question_word) !="이송"&names(question_word) !="이점"
                        &names(question_word) !="인원"&names(question_word) !="영양사"&names(question_word) !="제조업"&names(question_word) !="조건"&names(question_word) !="진짜"&names(question_word) !="화장품"&names(question_word) !="현대건설"&names(question_word) !="해외영업"&names(question_word) !="해도"&names(question_word) !="하신"
                        &names(question_word) !="택배"&names(question_word) !="프로"&names(question_word) !="기대"&names(question_word) !="기법"&names(question_word) !="기본적"&names(question_word) !="기해"&names(question_word) !="네이버"&names(question_word) !="네이버에"&names(question_word) !="매니저"&names(question_word) !="만약"
                        &names(question_word) !="로또"&names(question_word) !="라면"&names(question_word) !="모터"&names(question_word) !="불량률"&names(question_word) !="비슷"&names(question_word) !="비율"&names(question_word) !="사물"&names(question_word) !="부산"
                        &names(question_word) !="복합"&names(question_word) !="불구"&names(question_word) !="복장"&names(question_word) !="현대모비스에"&names(question_word) !="형제"&names(question_word) !="환자"&names(question_word) !="가공"&names(question_word) !="각각"
                        &names(question_word) !="할머니"&names(question_word) !="하나씩"&names(question_word) !="토대"&names(question_word) !="타지역"&names(question_word) !="폐지"&names(question_word) !="표피"&names(question_word) !="품목"
                        &names(question_word) !="컴퓨터"&names(question_word) !="치명"&names(question_word) !="주위"&names(question_word) !="장학재단"&names(question_word) !="자전거"&names(question_word) !="입행"
                        &names(question_word) !="전지"&names(question_word) !="인도"&names(question_word) !="이쪽"&names(question_word) !="오프"&names(question_word) !="오디션"&names(question_word) !="역률"&names(question_word) !="어떤지"&names(question_word) !="어떤가"
                        &names(question_word) !="아나"&names(question_word) !="오프"&names(question_word) !="온도"&names(question_word) !="유체역학"&names(question_word) !="의향"&names(question_word) !="이내"&names(question_word) !="저번"&names(question_word) !="저희"&names(question_word) !="전문가"
                        &names(question_word) !="전화"&names(question_word) !="장소"&names(question_word) !="종사"&names(question_word) !="종근당"&names(question_word) !="조치"&names(question_word) !="재료"&names(question_word) !="소프트웨어"
                        &names(question_word) !="스레드"&names(question_word) !="예정"&names(question_word) !="예시"&names(question_word) !="시하"&names(question_word) !="상이"&names(question_word) !="속도"
                        &names(question_word) !="쇼핑"&names(question_word) !="세계")
question_word <- subset(question_word, question_word > 4 & names(question_word) != "소개") #655
question_word2 <- subset(question_word, question_word >10)

View(question_word)
###
library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
windowsFonts(theleft=windowsFont("THE왼손잡이"))
library(wordcloud2)
wordcloud2(question_word,col="random-light",backgroundColor = "black",fontFamily = "theleft")
wordcloud2(question_word2,col="random-light",backgroundColor = "black",fontFamily = "theleft",shape = 'pentagon',
           size=1)
result_allquestion <- wordcloud2(question_word,col="random-light",backgroundColor = "white",fontFamily = "theleft")
library(htmlwidgets)
htmltools::save_html(result_allquestion,"output/allquestion.html")

######
library(qgraph)

qgraph(question_word, labels=rownames(question_word), diag=F, 
       layout='spring',  edge.color='blue', 
       vsize=log(diag(IT_word)*800))

all_Q_n <- head(question_word,30)
co.matrix <- all_Q_n %*% t(all_Q_n)

png(filename="output/all_Q_qgraph.png",unit="px",bg="transparent")

qgraph(co.matrix,
       
       labels=rownames(co.matrix),   ##label 추가
       
       diag=F,                       ## 자신의 관계는 제거함
       
       layout='spring',              ##노드들의 위치를 spring으로 연결된 것 처럼 관련이 강하면 같이 붙어 있고 없으면 멀리 떨어지도록 표시됨
       
       edge.color='purple',
       
       vsize=log(diag(co.matrix))*0.7)

dev.off()
########
# 그래프 --> 수정
library(RColorBrewer)
coul <- brewer.pal(10, "Set3") 
par(mar=c(5,9,5,2))
font_add(family = "slim", regular = "fonts/OdSlimfitGothicL.ttf")
top_q <- head(question_word,15)
barplot(top_q, xlim = c(0,1200),
        horiz=T, las=1, cex.names=1.5,family="slim", border="white",
        col=coul)

title(main="최다 단어 TOP 20",family="slim",cex.main=2,col.main="orange")
dev.copy(png,"output/all_Q_barplot.png")
dev.off()
