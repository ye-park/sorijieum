--MEMBER 테이블 생성
DROP TABLE MEMBER CASCADE CONSTRAINT;

CREATE TABLE MEMBER (
   USERID   VARCHAR2(20)      NOT NULL,
   TYPENUMBER   NUMBER      NOT NULL,
   USERNAME   VARCHAR2(20)      NOT NULL,
   USERPWD   VARCHAR2(20)      NOT NULL,
   PHONE   VARCHAR2(11)      NOT NULL,
   EMAIL   VARCHAR2(50)      NOT NULL,
   GENDER   VARCHAR2(1)      NOT NULL,
   BIRTH   DATE      NOT NULL,
   ENROLLDATE   DATE   DEFAULT SYSDATE   NOT NULL,
   USEROFILE   VARCHAR2(100)      NULL,
   USERRFILE   VARCHAR2(100)      NULL,
   QUITYN   VARCHAR2(1)   DEFAULT 'N'   NOT NULL
);

COMMENT ON COLUMN MEMBER.USERID IS '회원아이디';

COMMENT ON COLUMN MEMBER.TYPENUMBER IS '회원(숫자)구분';

COMMENT ON COLUMN MEMBER.USERNAME IS '회원이름';

COMMENT ON COLUMN MEMBER.USERPWD IS '회원비밀번호';

COMMENT ON COLUMN MEMBER.PHONE IS '회원전화번호';

COMMENT ON COLUMN MEMBER.EMAIL IS '회원이메일';

COMMENT ON COLUMN MEMBER.GENDER IS '회원성별';

COMMENT ON COLUMN MEMBER.BIRTH IS '회원생년월일';

COMMENT ON COLUMN MEMBER.ENROLLDATE IS '회원가입일';

COMMENT ON COLUMN MEMBER.USEROFILE IS '장애인등록증 기존파일명';

COMMENT ON COLUMN MEMBER.USERRFILE IS '장애인등록증 변경파일명';

COMMENT ON COLUMN MEMBER.QUITYN IS '회원탈퇴여부';


--BOOK 테이블 생성
DROP TABLE BOOK CASCADE CONSTRAINT;

CREATE TABLE BOOK (
   BOOKCODE   VARCHAR2(15)      NOT NULL,
   BOOKTITLE   VARCHAR2(200)      NOT NULL,
   AUTHOR   VARCHAR2(100)      NOT NULL,
   PUBLISHER   VARCHAR2(100)      NOT NULL,
   PUBLISHDATE   DATE      NOT NULL,
   BOOKPAGE   NUMBER      NOT NULL,
   BOOKINFO   VARCHAR2(3000)      NOT NULL,
   BOOKOIMG   VARCHAR2(300)      NOT NULL,
   BOOKRIMG   VARCHAR2(300)      NOT NULL,
   BOOKOPDF   VARCHAR2(1000)      NOT NULL,
   BOOKRPDF   VARCHAR2(1000)      NOT NULL,
   BOOKDATE   DATE   DEFAULT SYSDATE   NOT NULL,
   BOOKVIEWS   NUMBER   DEFAULT 0   NOT NULL,
   MAKESTATUS   VARCHAR2(4)   DEFAULT 'WAIT'   NOT NULL,
   BOOKDELYN   VARCHAR2(2) DEFAULT 'N' NOT NULL
);

COMMENT ON COLUMN BOOK.BOOKCODE IS '도서코드';

COMMENT ON COLUMN BOOK.BOOKTITLE IS '도서명';

COMMENT ON COLUMN BOOK.AUTHOR IS '저자명';

COMMENT ON COLUMN BOOK.PUBLISHER IS '출판사';

COMMENT ON COLUMN BOOK.PUBLISHDATE IS '출판일';

COMMENT ON COLUMN BOOK.BOOKPAGE IS '전체쪽수';

COMMENT ON COLUMN BOOK.BOOKINFO IS '도서소개';

COMMENT ON COLUMN BOOK.BOOKOIMG IS '기존도서커버이미지';

COMMENT ON COLUMN BOOK.BOOKRIMG IS '변경도서커버이미지';

COMMENT ON COLUMN BOOK.BOOKOPDF IS '기존원본도서PDF';

COMMENT ON COLUMN BOOK.BOOKRPDF IS '변경도서원본PDF';

COMMENT ON COLUMN BOOK.BOOKDATE IS '도서등록일';

COMMENT ON COLUMN BOOK.BOOKVIEWS IS '도서조회수';

COMMENT ON COLUMN BOOK.MAKESTATUS IS '도서제작상태';

COMMENT ON COLUMN BOOK.BOOKDELYN IS '도서삭제여부';



--NOTICE 테이블 생성
DROP TABLE NOTICE CASCADE CONSTRAINT;

CREATE TABLE NOTICE (
   NOTICENO   NUMBER      NOT NULL,
   NOTICETITLE   VARCHAR2(200)      NOT NULL,
   NOTICEWRITER   VARCHAR2(20)      NOT NULL,
   NOTICECONTENT   VARCHAR2(4000)      NOT NULL,
   NOTICEDATE   DATE   DEFAULT SYSDATE   NOT NULL,
   NOTICEVIEWS   NUMBER   DEFAULT 0   NOT NULL,
   NOTICEOFILE   VARCHAR2(1000)      NULL,
   NOTICERFILE   VARCHAR2(1000)      NULL,
   NOTICERDATE   DATE      NULL,
   NOTICETOP   VARCHAR2(1)   DEFAULT 'N'   NOT NULL
);

COMMENT ON COLUMN NOTICE.NOTICENO IS '공지사항 번호';

COMMENT ON COLUMN NOTICE.NOTICETITLE IS '공지사항  제목';

COMMENT ON COLUMN NOTICE.NOTICEWRITER IS '공지사항 작성자';

COMMENT ON COLUMN NOTICE.NOTICECONTENT IS '공지사항  내용';

COMMENT ON COLUMN NOTICE.NOTICEDATE IS '공지사항  날짜';

COMMENT ON COLUMN NOTICE.NOTICEVIEWS IS '공지사항  조회수';

COMMENT ON COLUMN NOTICE.NOTICEOFILE IS '공지사항  기존 첨부파일';

COMMENT ON COLUMN NOTICE.NOTICERFILE IS '공지사항 변경 첨부 파일';

COMMENT ON COLUMN NOTICE.NOTICERDATE IS '공지사항 예약일';

COMMENT ON COLUMN NOTICE.NOTICETOP IS '공지사항 상단 고정 구분';


--QNA 테이블 생성
DROP TABLE QNA CASCADE CONSTRAINT;

CREATE TABLE QNA (
   QNANO   NUMBER      NOT NULL,
   QNATITLE   VARCHAR2(200)      NOT NULL,
   QNAWRITER   VARCHAR2(20)      NOT NULL,
   QNACONTENT   VARCHAR2(4000)      NOT NULL,
   QNADATE   DATE   DEFAULT SYSDATE   NOT NULL,
   QNAVIEWS   NUMBER   DEFAULT 0   NOT NULL,
   QNASTATUS   VARCHAR2(1)   DEFAULT 'N'   NOT NULL,
   QNAOFILE   VARCHAR2(1000)      NULL,
   QNARFILE   VARCHAR2(1000)      NULL,
   QNATOP   VARCHAR2(1)   DEFAULT 'N'   NOT NULL
);

COMMENT ON COLUMN QNA.QNANO IS 'QNA  번호';

COMMENT ON COLUMN QNA.QNATITLE IS 'QNA  제목';

COMMENT ON COLUMN QNA.QNAWRITER IS 'QNA  작성자';

COMMENT ON COLUMN QNA.QNACONTENT IS 'QNA  내용';

COMMENT ON COLUMN QNA.QNADATE IS 'QNA  날짜';

COMMENT ON COLUMN QNA.QNAVIEWS IS 'QNA  조회수';

COMMENT ON COLUMN QNA.QNASTATUS IS 'QNA  답변여부';

COMMENT ON COLUMN QNA.QNAOFILE IS 'QNA  기존 첨부파일';

COMMENT ON COLUMN QNA.QNARFILE IS 'QNA  변경 첨부파일';

COMMENT ON COLUMN QNA.QNATOP IS 'QNA 상단 고정구분';

--WISHBOOK 테이블 생성
DROP TABLE WISHBOOK CASCADE CONSTRAINT;

CREATE TABLE WISHBOOK (
   WISHNO   NUMBER      NOT NULL,
   WISHWRITER   VARCHAR2(20)      NOT NULL,
   WISHBOOKTITLE   VARCHAR2(200)      NOT NULL,
   WISHBOOKAUTHOR   VARCHAR2(100)      NOT NULL,
   WISHPUBLISHER   VARCHAR2(100)      NULL,
   WISHPUBLISHDATE   DATE      NULL,
   WISHDATE   DATE   DEFAULT SYSDATE   NOT NULL,
   WISHVIEWS   NUMBER   DEFAULT 0   NOT NULL,
   WISHSTATUS   VARCHAR2(4)   DEFAULT 'WAIT'   NOT NULL,
   RJCTREASON   VARCHAR2(300)      NULL,
   WISHSTATUSDATE   DATE      NULL,
   WISHTOP    VARCHAR2(1)   DEFAULT 'N'   NOT NULL,
   WISHBOOKADMIN VARCHAR2(20)   NULL
);

COMMENT ON COLUMN WISHBOOK.WISHNO IS '글번호';

COMMENT ON COLUMN WISHBOOK.WISHWRITER IS '게시글아이디';

COMMENT ON COLUMN WISHBOOK.WISHBOOKTITLE IS '도서명';

COMMENT ON COLUMN WISHBOOK.WISHBOOKAUTHOR IS '저자명';

COMMENT ON COLUMN WISHBOOK.WISHPUBLISHER IS '출판사';

COMMENT ON COLUMN WISHBOOK.WISHPUBLISHDATE IS '출판일';

COMMENT ON COLUMN WISHBOOK.WISHDATE IS '신청일';

COMMENT ON COLUMN WISHBOOK.WISHVIEWS IS '조회수';

COMMENT ON COLUMN WISHBOOK.WISHSTATUS IS '처리상태';

COMMENT ON COLUMN WISHBOOK.RJCTREASON IS '반려사유';

COMMENT ON COLUMN WISHBOOK.WISHSTATUSDATE IS '처리일시';

COMMENT ON COLUMN WISHBOOK.WISHTOP IS '상단 고정구분';

COMMENT ON COLUMN WISHBOOK.WISHBOOKADMIN IS '처리관리자';

--LIKEBOOK 테이블 생성
DROP TABLE LIKEBOOK CASCADE CONSTRAINT;

CREATE TABLE LIKEBOOK (
   USERID   VARCHAR2(20)      NOT NULL,
   BOOKCODE   VARCHAR2(15)      NOT NULL
);

COMMENT ON COLUMN LIKEBOOK.USERID IS '회원아이디';

COMMENT ON COLUMN LIKEBOOK.BOOKCODE IS '도서코드';


--MAKEBOOK 테이블 생성
DROP TABLE MAKEDBOOK CASCADE CONSTRAINT;

CREATE TABLE MAKEDBOOK (
   USERID   VARCHAR2(20)      NOT NULL,
   BOOKCODE   VARCHAR2(15)      NOT NULL,
   MAKEDATE   DATE   DEFAULT SYSDATE   NOT NULL
);

COMMENT ON COLUMN MAKEDBOOK.USERID IS '회원아이디';

COMMENT ON COLUMN MAKEDBOOK.BOOKCODE IS '도서코드';

COMMENT ON COLUMN MAKEDBOOK.MAKEDATE IS '제작 참여 날짜';


--MYBOOK 테이블 생성
DROP TABLE MYBOOK CASCADE CONSTRAINT;

CREATE TABLE MYBOOK (
   USERID   VARCHAR2(20)      NOT NULL,
   BOOKCODE   VARCHAR2(15)      NOT NULL,
   READPAGE   NUMBER      NOT NULL,
   READSDATE   DATE   DEFAULT SYSDATE   NOT NULL,
   READRDATE   DATE   DEFAULT SYSDATE   NOT NULL
);

COMMENT ON COLUMN MYBOOK.USERID IS '회원아이디';

COMMENT ON COLUMN MYBOOK.BOOKCODE IS '도서코드';

COMMENT ON COLUMN MYBOOK.READPAGE IS '이어읽을위치(쪽수)';

COMMENT ON COLUMN MYBOOK.READSDATE IS '처음 읽은 날짜';

COMMENT ON COLUMN MYBOOK.READRDATE IS '최근 읽은 날짜';


--ADMINMEMO 테이블 생성
DROP TABLE ADMINMEMO CASCADE CONSTRAINT;

CREATE TABLE ADMINMEMO (
   MEMONO   NUMBER   NOT NULL,
   USERID   VARCHAR2(20)      NOT NULL,
   ADMINID   VARCHAR2(20)      NOT NULL,
   ADMINMEMO   VARCHAR2(300)      NOT NULL,
   MEMODATE   DATE   DEFAULT SYSDATE   NOT NULL
);

COMMENT ON COLUMN ADMINMEMO.USERID IS '회원아이디';

COMMENT ON COLUMN ADMINMEMO.ADMINID IS '관리자아이디';

COMMENT ON COLUMN ADMINMEMO.ADMINMEMO IS '메모내용';

COMMENT ON COLUMN ADMINMEMO.MEMODATE IS '메모작성일';


--QUIT 테이블 생성
DROP TABLE QUIT CASCADE CONSTRAINT;

CREATE TABLE QUIT (
   USERID   VARCHAR2(20)      NOT NULL,
   QUITTYPE   VARCHAR2(1)      NOT NULL,
   QUITREASON   VARCHAR2(1000)      NOT NULL,
   QUITDATE   DATE   DEFAULT SYSDATE   NOT NULL
);

COMMENT ON COLUMN QUIT.USERID IS '탈퇴회원아이디';

COMMENT ON COLUMN QUIT.QUITTYPE IS '탈퇴유형(G일반/F강제)';

COMMENT ON COLUMN QUIT.QUITREASON IS '탈퇴사유';

COMMENT ON COLUMN QUIT.QUITDATE IS '탈퇴일자';


--BOOKMAKING 테이블 생성
DROP TABLE BOOKMAKING CASCADE CONSTRAINT;

CREATE TABLE BOOKMAKING (
   BOOKCODE   VARCHAR2(15)      NOT NULL,
   MAKESTART   DATE   DEFAULT SYSDATE   NOT NULL,
   MAKEFIN   DATE      NULL,
   BOOKOTXT   VARCHAR2(1000)      NULL,
   BOOKRTXT   VARCHAR2(1000)      NULL,
   MAKEPAGE   NUMBER   DEFAULT 0   NOT NULL
);

COMMENT ON COLUMN BOOKMAKING.BOOKCODE IS '도서코드';

COMMENT ON COLUMN BOOKMAKING.MAKESTART IS '제작시작일';

COMMENT ON COLUMN BOOKMAKING.MAKEFIN IS '제작완료일';

COMMENT ON COLUMN BOOKMAKING.BOOKOTXT IS '기존제작완료TXT';

COMMENT ON COLUMN BOOKMAKING.BOOKRTXT IS '변경제작완료TXT';

COMMENT ON COLUMN BOOKMAKING.MAKEPAGE IS '현재까지 제작된 쪽수';


--QNACOMMENT 테이블 생성
DROP TABLE QNACOMMENT CASCADE CONSTRAINT;

CREATE TABLE QNACOMMENT (
   QNANO   NUMBER      NOT NULL,
   QNACOMWRITER   VARCHAR2(20)      NOT NULL,
   QNACOMMENTS   VARCHAR2(1000)      NOT NULL,
   QNACOMDATE   DATE   DEFAULT SYSDATE   NOT NULL
);

COMMENT ON COLUMN QNACOMMENT.QNANO IS 'QNA 질문글 번호';

COMMENT ON COLUMN QNACOMMENT.QNACOMWRITER IS 'QNA 답변한 관리자 아이디';

COMMENT ON COLUMN QNACOMMENT.QNACOMMENTS IS 'QNA 답변 내용';

COMMENT ON COLUMN QNACOMMENT.QNACOMDATE IS 'QNA 답변 작성시간';


--USERTYPE 테이블 생성
DROP TABLE MEMBERTYPE CASCADE CONSTRAINT;

CREATE TABLE MEMBERTYPE (
   TYPENUMBER   NUMBER      NOT NULL,
   MEMBERTYPE   VARCHAR2(20)      NOT NULL
);

COMMENT ON COLUMN MEMBERTYPE.TYPENUMBER IS '회원구분(숫자)';

COMMENT ON COLUMN MEMBERTYPE.MEMBERTYPE IS '회원종류(글자)';


--제약조건 설정
ALTER TABLE MEMBER ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
   USERID
);

ALTER TABLE BOOK ADD CONSTRAINT PK_BOOK PRIMARY KEY (
   BOOKCODE
);

ALTER TABLE NOTICE ADD CONSTRAINT PK_NOTICE PRIMARY KEY (
   NOTICENO
);

ALTER TABLE QNA ADD CONSTRAINT PK_QNA PRIMARY KEY (
   QNANO
);

ALTER TABLE WISHBOOK ADD CONSTRAINT PK_WISHBOOK PRIMARY KEY (
   WISHNO
);

ALTER TABLE LIKEBOOK ADD CONSTRAINT PK_LIKEBOOK PRIMARY KEY (
   USERID,
   BOOKCODE
);

ALTER TABLE MAKEDBOOK ADD CONSTRAINT PK_MAKEDBOOK PRIMARY KEY (
   USERID,
   BOOKCODE
);

ALTER TABLE MYBOOK ADD CONSTRAINT PK_MYBOOK PRIMARY KEY (
   USERID,
   BOOKCODE
);

ALTER TABLE ADMINMEMO ADD CONSTRAINT PK_ADMINMEMO PRIMARY KEY (
   USERID,
   ADMINID
);

ALTER TABLE QUIT ADD CONSTRAINT PK_QUIT PRIMARY KEY (
   USERID
);

ALTER TABLE BOOKMAKING ADD CONSTRAINT PK_BOOKMAKING PRIMARY KEY (
   BOOKCODE
);

ALTER TABLE QNACOMMENT ADD CONSTRAINT PK_QNACOMMENT PRIMARY KEY (
   QNANO
);

ALTER TABLE MEMBERTYPE ADD CONSTRAINT PK_MEMBERTYPE PRIMARY KEY (
   TYPENUMBER
);

ALTER TABLE MEMBER ADD CONSTRAINT FK_MEMBERTYPE_TO_MEMBER_1 FOREIGN KEY (
   TYPENUMBER
)
REFERENCES MEMBERTYPE (
   TYPENUMBER
);

ALTER TABLE NOTICE ADD CONSTRAINT FK_MEMBER_TO_NOTICE_1 FOREIGN KEY (
   NOTICEWRITER
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE QNA ADD CONSTRAINT FK_MEMBER_TO_QNA_1 FOREIGN KEY (
   QNAWRITER
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE WISHBOOK ADD CONSTRAINT FK_MEMBER_TO_WISHBOOK_1 FOREIGN KEY (
   WISHWRITER
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE LIKEBOOK ADD CONSTRAINT FK_MEMBER_TO_LIKEBOOK_1 FOREIGN KEY (
   USERID
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE LIKEBOOK ADD CONSTRAINT FK_BOOK_TO_LIKEBOOK_1 FOREIGN KEY (
   BOOKCODE
)
REFERENCES BOOK (
   BOOKCODE
);

ALTER TABLE MAKEDBOOK ADD CONSTRAINT FK_MEMBER_TO_MAKEDBOOK_1 FOREIGN KEY (
   USERID
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE MAKEDBOOK ADD CONSTRAINT FK_BOOK_TO_MAKEDBOOK_1 FOREIGN KEY (
   BOOKCODE
)
REFERENCES BOOK (
   BOOKCODE
);

ALTER TABLE MYBOOK ADD CONSTRAINT FK_MEMBER_TO_MYBOOK_1 FOREIGN KEY (
   USERID
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE MYBOOK ADD CONSTRAINT FK_BOOK_TO_MYBOOK_1 FOREIGN KEY (
   BOOKCODE
)
REFERENCES BOOK (
   BOOKCODE
);

ALTER TABLE ADMINMEMO ADD CONSTRAINT FK_MEMBER_TO_ADMINMEMO_1 FOREIGN KEY (
   USERID
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE ADMINMEMO ADD CONSTRAINT FK_MEMBER_TO_ADMINMEMO_2 FOREIGN KEY (
   ADMINID
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE QUIT ADD CONSTRAINT FK_MEMBER_TO_QUIT_1 FOREIGN KEY (
   USERID
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE BOOKMAKING ADD CONSTRAINT FK_BOOK_TO_BOOKMAKING_1 FOREIGN KEY (
   BOOKCODE
)
REFERENCES BOOK (
   BOOKCODE
);

ALTER TABLE QNACOMMENT ADD CONSTRAINT FK_QNA_TO_QNACOMMENT_1 FOREIGN KEY (
   QNANO
)
REFERENCES QNA (
   QNANO
);

ALTER TABLE QNACOMMENT ADD CONSTRAINT FK_MEMBER_TO_QNACOMMENT_1 FOREIGN KEY (
   QNACOMWRITER
)
REFERENCES MEMBER (
   USERID
);

ALTER TABLE MEMBER ADD CHECK (QUITYN IN('Y','N'));

ALTER TABLE MEMBER ADD CHECK (TYPENUMBER IN(1,2,3,4,5));

ALTER TABLE QUIT ADD CHECK (QUITTYPE IN('G','F'));

ALTER TABLE QNA ADD CHECK (QNASTATUS IN('Y','N'));

ALTER TABLE QNA ADD CHECK (QNATOP IN('Y','N'));

ALTER TABLE NOTICE ADD CHECK (NOTICETOP IN('Y','N'));

ALTER TABLE BOOK ADD CHECK (MAKESTATUS IN('WAIT','MAKE','DONE'));

ALTER TABLE WISHBOOK ADD CHECK (WISHSTATUS IN('WAIT','RJCT','DONE'));

COMMIT;


--게시판별 글번호 시퀀스 생성
DROP SEQUENCE SEQ_NOTICENO;

CREATE SEQUENCE SEQ_NOTICENO
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_QNANO;

CREATE SEQUENCE SEQ_QNANO
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP SEQUENCE SEQ_WISHNO;

CREATE SEQUENCE SEQ_WISHNO
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

COMMIT;


DROP SEQUENCE SEQ_MEMONO;

CREATE SEQUENCE SEQ_MEMONO
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

COMMIT;

--샘플 데이터 입력

--회원 구분 테이블 데이터 입력
INSERT INTO MEMBERTYPE VALUES(1,'이용대기자');
INSERT INTO MEMBERTYPE VALUES(2,'이용자');
INSERT INTO MEMBERTYPE VALUES(3,'제작자');
INSERT INTO MEMBERTYPE VALUES(4,'부관리자');
INSERT INTO MEMBERTYPE VALUES(5,'대표관리자');

COMMIT;

--회원 테이블 데이터 입력
INSERT INTO MEMBER VALUES(
'admin00',5,'최민영','adpass00','01000000000','admin@gmail.com','F','1993-06-14',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'admin01',4,'이유진','admin01','01001010101','admin01@gmail.com','F','1993-03-06',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'admin02',4,'관리자','admin02','01002020202','admin02@gmail.com','F','1990-10-17',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'user001',3,'박예은','pass001','01012341234','user001@naver.com','F','1995-12-04',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'user002',3,'조하영','pass002','01023452345','user002@naver.com','F','1993-04-28',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'user003',2,'이아무개','pass003','01034563456','user003@daum.net','M','1997-08-04',default,'등록증.jpg','201909211234.jpg','N');

INSERT INTO MEMBER VALUES(
'user004',1,'김첨지','pass004','01044443333','user004@naver.com','M','1978-05-17',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'user005',2,'박공주','pass005','01055556666','user005@gmail.com','F','1987-04-21',DEFAULT,'장애인등록증.jpg','201909272341.jpg','N');

INSERT INTO MEMBER VALUES(
'user006',1,'왕건','pass006','01066663444','user006@daum.net','M','1955-05-06',DEFAULT,NULL,NULL,'N');

INSERT INTO MEMBER VALUES(
'user007',3,'김철수','pass007','01087669877','user007@gmail.com','M','1985-11-19',default,null,null,'N');

COMMIT;

--관리자 메모 데이터 생성
INSERT INTO ADMINMEMO
VALUES(SEQ_MEMONO.NEXTVAL,'user001','admin00','제한 시간 안에 할당된 도서페이지를 완성 하지 못했음',SYSDATE);

INSERT INTO ADMINMEMO
VALUES(SEQ_MEMONO.NEXTVAL,'user005','admin01','사이트 이용중 도서재생에서 강제종료 된다고 전화로 항의함',SYSDATE);

--도서 데이터 입력
INSERT INTO BOOK VALUES ('8936434268', '아몬드', '손원평', '창비', '2017/03/31', 264, '영화보다 강렬하고 드라마처럼 팽팽한, 완전히 새로운 소설이 나타났다. 감정을 느끼지 못하는 소년의 특별한 성장 이야기로, 첫 장부터 강렬한 사건으로 시작해 다음 페이지가 궁금해지게 만드는 흡입력 강한 작품이다. 또한 타인의 감정에 무감각해진 공감 불능인 이 시대에 큰 울림을 주는 소설로, 작품 속 인물들이 타인과 관계 맺고 슬픔에 공감하며 성장해 나가는 과정을 탁월하게 묘사했다. 영화처럼 펼쳐지는 극적인 사건과 매혹적인 문체로 독자를 단숨에 사로잡을 것이다. 『완득이』, 『위저드 베이커리』를 잇는 제10회 창비청소년문학상 수상작.', '아몬드_손원평.jpg', '201901142208.jpg', '아몬드_손원평.pdf', '201901152110.pdf', '2019/01/15', 35, 'DONE', DEFAULT);

INSERT INTO BOOK VALUES ('8954641636', '쇼코의 미소', '최은영', '문학동네', '2016/07/04', 296, '등단작에 대해 흔히 우리가 걸게 되는 기대―기존 작품과 구별되는 ''낯섦''과 ''전위''에 대한 요구―로부터 물러나, 별다른 기교 없이 담백하게 이야기를 풀어나가고, 그 정통적인 방식을 통해 읽는 이의 마음을 움직였다는 것에 「쇼코의 미소」가 지닌 특별함이 담겨 있다. 그러니까, “고레에다 히로카즈나 이누도 잇신 감독의 어떤 영화들처럼 거의 모든 영역에서 ''진실하다''라는 느낌”(문학평론가 신형철)을 준다는 것, 그로부터 “소설이 주는 감동이란 무엇인가를 새삼 생각해보게 만들었다”(소설가 임철우)라는 것.', '쇼코의 미소_최은영.jpg', '201811241328.jpg', '쇼코의 미소_최은영.pdf', '201903031830.pdf', '2019/03/03', DEFAULT, 'MAKE', DEFAULT);

INSERT INTO BOOK VALUES ('8954655971', '여행의 이유', '김영하', '문학동네', '2019/04/17', 216, '『여행의 이유』는 작가 김영하가 처음 여행을 떠났던 순간부터 최근의 여행까지, 오랜 시간 여행을 하면서 느끼고 생각했던 것들을 아홉 개의 이야기로 풀어낸 산문이다. 여행지에서 겪은 경험을 풀어낸 여행담이기보다는, 여행을 중심으로 인간과 글쓰기, 타자와 삶의 의미로 주제가 확장되어가는 사유의 여행에 가깝다. 작품에 담긴 소설가이자 여행자로서 바라본 인간과 세상에 대한 이야기들은 놀랄 만큼 매혹적이다. 누구나 한번쯤은 떠올렸을 법한, 그러나 제대로 정리하지 못한 채 남겨두었던 상념의 자락들을 끄집어내 생기를 불어넣는 김영하 작가 특유의 (인)문학적 사유의 성찬이 담겼다.', '여행의 이유_김영하.jpg', '201902041944.jpg', '여행의 이유_김영하.pdf', '201904271126.pdf', '2019/04/27', DEFAULT, 'MAKE', DEFAULT);

INSERT INTO BOOK VALUES ('8937473135', '82년생 김지영', '조남주', '민음사', '2016/10/14', 192, '슬하에 딸을 두고 있는 서른네 살 김지영 씨가 어느 날 갑자기 이상 증세를 보인다. 시댁 식구들이 모여 있는 자리에서 친정 엄마로 빙의해 속말을 뱉어 내고, 남편의 결혼 전 애인으로 빙의해 그를 식겁하게 만들기도 한다. 이를 이상하게 여긴 남편이 김지영 씨의 정신 상담을 주선하고, 지영 씨는 정기적으로 의사를 찾아가 자신의 삶을 이야기한다. 소설은 김지영 씨의 이야기를 들은 담당 의사가 그녀의 인생을 재구성해 기록한 리포트 형식이다. 리포트에 기록된 김지영 씨의 기억은 ''여성''이라는 젠더적 기준으로 선별된 에피소드로 구성된다.', '82년생 김지영_조남주.jpg', '201906131208.jpg', '82년생 김지영_조남주.pdf', '201906140908.pdf', '2019/06/14', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO BOOK VALUES ('8937473097', '보건교사 안은영', '정세랑', '민음사', '2015/12/07',   280, '소설은 제목 그대로 사립 M고의 보건교사 ''안은영''을 주인공으로 한다. 특별한 것 없는 직업과 평범한 이름이지만 안은영은 보통의 보건교사가 아니다. 복 중의 복, 일복 하나는 타고난 그녀는 직업으로 ''보건교사'' 역할에 열심히면서 동시에 자신만이 볼 수 있는 것들을 처치하고 쫓아내며, 또는 위로하는 ''퇴마사''의 운명에도 충실히 복무한다. 여기에 사립 M고의 한문교사이자 학교 설립자의 후손인 홍인표에게 흐르는 거대한 에너지는 안은영의 활약을 돕는 필수적인 영양제 역할을 한다. 에너지(기)를 보충하기 위해, 학교의 평화를 지키기 위해 둘은 내 거 아닌 내 것 같은 사이가 되어 힘을 합한다. 둘 앞에 나타나는 기이한 괴물들, 학생들에게 보이는 미스터리한 현상들, 학교 곳곳에 숨은 괴상한 힘들…… 사립 M고에는 어떤 비밀이 있는 것일까. 무엇보다 안은영과 홍인표의 썸(some)은 어떻게 마무리될까?', '보건교사 안은영_정세랑.jpg', '201908191645.jpg', '보건교사 안은영_정세랑.pdf', '201908201445pdf', '2019/08/20', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO BOOK VALUES ('8982814477', '연금술사', '파울로 코엘료', '문학동네', '2001/12/01', 278, '청년의 가슴속에서, 알 수 없는 기쁨이 솟구쳤다. 자신은 이제 자아의 신화를 위해서, 그리고 파티마를 위해서 죽게 되리라. 낯선 기쁨의 실체는 바로 그것이었다. 표지들이 보여준 것은 끝내 사실이었던 것이다. 눈앞에 칼을 든 적이 있었지만, 그는 죽음을 걱정할 필요가 없었다. 만물의 정기가 그를 기다리고 있었고, 잠시 후면 그 정기의 일부가 될 터였다."이방인이 낯선 땅에서 무엇을 하고 있는가?", "자아의 신화를 찾으러 왔습니다. 당신은 절대 이해하지 못할 어떤 것을 찾아서."',   '연금술사_파울로 코엘료.jpg', '201909261556.jpg', '연금술사_파울로 코엘료.pdf', '201909271556.pdf', '2019/09/27', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO BOOK VALUES ('8983925310', '해리포터와 마법사의 돌 1', 'J. K. 롤링', '문학수첩', '2014/12/18', 244, '어둠의 마왕 볼드모트에게 부모를 잃고 홀로 살아남은 아이, 해리는 안전을 위해 마법사가 아닌 사람인 ‘머글’ 페투니아 이모와 버논 이모부 손에 길러지며 불우한 어린 시절을 보낸다. 열한 번째 생일날, 해그리드를 통해 자신이 마법사라는 사실을 알게 된 해리는 호그와트 마법학교에 입학해 헤르미온느 그레인저, 론 위즐리라는 친구들과 함께 영생을 주는 마법사의 돌을 찾는 엄청난 모험을 시작하게 된다.', '해리포터와_마법사의_돌1.jpg', '201902142136.jpg', '해리포터와_마법사의_돌1.pdf', '201907252115.pdf', '2019/07/25', 55, 'DONE', DEFAULT);

INSERT INTO BOOK VALUES ('1162203625', '파과', '구병모', '위즈덤하우스', '2018/04/16', 344, '노인, 여성, 킬러. 도무지 어울릴 것 같지 않은 세 가지를 조합한 주인공 조각은 65세 여성 킬러다. 한국 소설 가운데 이토록 파격적인 주인공이 또 있을까. 그동안 아가미를 가진 소년([아가미]), 인간을 닮은 로봇([한 스푼의 시간]) 등 환상적인 상상력을 통해 독특한 주인공들을 탄생시킨 구병모 작가는 한국 소설에서 유례를 찾을 수 없는 ‘60대 여성 킬러’라는 독특한 캐릭터를 통해 새로운 여성 서사를 써내려가며 독자들에게 신선한 충격을 던져준다. 사회의 최약자로서 차별받아온 ‘노인’과 ‘여성’이라는 인물이 억압적이고 폭력적인 사회에 ‘킬러’라는 강렬한 이름으로 맞서 싸우는 것이다.
자신을 치료해준 강 박사에게 남다른 감정을 품게 된 조각, 그런 조각을 경멸하는 투우, 킬러들에게서 가족을 지키려는 강 박사. 마침내 투우가 강 박사의 딸을 납치하고, 조각이 투우에게 총을 겨누며 생애 마지막 작업을 실행키로 결심하면서 소설은 절정으로 향한다. 읽는 내내 한 편의 액션 영화를 보는 듯 박진감과 긴장감이 넘치는 이 소설의 말미에서 조각과 투우가 벌이는 총격전은 그야말로 압권이다.
[파과]는 내가 살아남기 위해 누군가를 죽여야만 하는 이 지독하고 잔혹한 현실 속에서 어떤 기대도 소망도 없이, 오늘도 눈을 떴기 때문에, 그저 살아 있기 때문에, 기꺼이 살아내는 모든 것들에게 따뜻한 응원과 위로를 전한다.', '파과.jpg', '201910072336.jpg', '파과.pdf', '201910072338.pdf', '2019/10/7', 0, 'WAIT', DEFAULT);

INSERT INTO BOOK VALUES ('9791130620459', '철학은 어떻게 삶의 무기가 되는가', '야마구치 슈', '다산초당', '2019/01/22', 336, '삶과 비즈니스 현장에서 철학적으로 생각하고 답을 도출하는 법을 알려 주는 실용 철학서. 세계 1위 경영·인사 컨설팅 기업 콘페리헤이그룹의 시니어 파트너인 저자는 대학교에서 철학을 전공하고 대학원에서 미학미술사를 공부한 ‘문사철’ 출신이다. 경영에 관한 정식 교육은 한 번도 받지 않았지만 컨설턴트로서 경영 전반에 걸친 기업 문제를 해결하는 데 어려움을 겪은 적은 없다. 눈앞의 상황을 철학이나 심리학, 경제학 개념에 맞춰 생각하면 언제나 해결의 실마리가 보였기 때문이다.
철학이 현실 세계와 동떨어진 학문이라는 말을 강하게 부정하는 저자는 사람들이 철학을 쓸모없다고 여기는 이유가 철학과 비즈니스를 연결시켜서 생각하는 법을 모르기 때문이라고 진단한다. 오히려 그는 본질을 꿰뚫고 최적의 솔루션을 찾아내는 철학적 사고법이야말로 현대인들에게 가장 필요한 무기라고 말한다. 그가 비즈니스 현장에서 유용하게 사용하는 50가지 철학·사상을 담은 『철학은 어떻게 삶의 무기가 되는가』는 철학의 쓸모를 새롭게 조명하는 세상에서 가장 실용적인 철학 사용 설명서다.', '철학은 어떻게 삶의 무기가 되는가.jpg', '201909121723.jpg', '철학은 어떻게 삶의 무기가 되는가.pdf', '201909121815.pdf', '2019/09/12', 0, 'MAKE', DEFAULT);

INSERT INTO BOOK VALUES ('9788934972464', '사피엔스', '유발 하라리', '김영사', '2015/11/23', 640, '인간의 역사와 미래에 대한 가장 논쟁적인 대서사!
문명의 배를 타고 진화의 바다를 항해한 인류는 이제 어디로 나아갈 것인가! 왜 사피엔스 종만이 지구상에 살아남았나? 인간은 왜 역사상 가장 치명적인 동물이 되었는가? 인간의 유효기간은 언제까지인가? 역사, 사회, 생물, 종교, 등 학문의 경계를 넘나들며 인류 역사의 시간을 종횡무진 써내려간 문명의 항해기가 우리 눈앞에 펼쳐진다!', '사피엔스.jpg', '201910131936.jpg', '사피엔스.pdf', '201910131856.pdf', '2019/10/13', 0, 'WAIT', DEFAULT);

INSERT INTO BOOK VALUES ('8982816631', '자기 앞의 생', '에밀 아자르', '문학동네', '2003/05/06', 363, '자신에게 주어진 생을 완전히 만족하며 살아가는 사람이 몇이나 될까? 작가는 실제 나이보다 많은 나이를 살고 있는 열네 살 모모의 눈으로 이해하지 못할 세상을 바라본다. 모모의 눈에 비친 세상은 결코 꿈같이 아름다운 세상이 아니다. 인종 차별받는 아랍인, 감옥에 끌려갔다가 살아 돌아온 유태인, 성전환자 등... 세상 모든 사람들은 스승이라고 했듯이 모모의 눈에도 소설속 모든 이들이 인생의 굳은살을 단단하게 해주는 인생선배들이다. 작은 상처에도 아파하는 독자들이여, 온전히 삶을 보듬길 바란다면 지금 이 책 앞에 서라.', '자기 앞의 생.jpg', '201910021429.jpg', '자기 앞의 생.pdf', '201910021215.pdf', '2019/10/02', 0, 'MAKE', DEFAULT);

INSERT INTO BOOK VALUES ('9788950980726', '타인의 시선을 의식해 힘든 나에게', '글배우', '21세기북스', '2019/04/19', 184, '생각이 너무 많아 괴롭거나, 감정 기복이 심하거나, 작은 말에도 상처받는 이유는 우리가 알게 모르게 타인의 시선을 의식하며 살고 있기 때문이다. 수년 간 많은 이들의 고민을 직접 상담해오며 요즘 사람들이 가장 걱정하는 문제에 대해 같이 공감하고 이야기를 나눈 저자는 이들에게 실질적인 도움을 줄 수 있는 방법을 모아 이 책에 담았다.', '타인의 시선을 의식해 힘든 나에게.jpg', '201910031439.jpg', '타인의 시선을 의식해 힘든 나에게.pdf', '201910031235.pdf', '2019/10/03', 0, 'MAKE');

--도서 데이터 수정
UPDATE BOOK SET MAKESTATUS = 'MAKE'
WHERE BOOKCODE = '9791188248674';
UPDATE BOOK SET MAKESTATUS = 'MAKE'
WHERE BOOKCODE = '9788932919874';
UPDATE BOOK SET MAKESTATUS = 'MAKE'
WHERE BOOKCODE = '9788995563502';
UPDATE BOOK SET MAKESTATUS = 'MAKE'
WHERE BOOKCODE = '9791135445620';
UPDATE BOOK SET MAKESTATUS = 'MAKE'
WHERE BOOKCODE = '9791187119845';
UPDATE BOOK SET MAKESTATUS = 'MAKE'
WHERE BOOKCODE = '9791162540640';


--내서재 데이터 입력
INSERT INTO MYBOOK VALUES ('user005', '8954655971', 7, DEFAULT, DEFAULT);

--관심도서 데이터 입력
INSERT INTO LIKEBOOK VALUES ('user003', '8954655971');
INSERT INTO LIKEBOOK VALUES ('user003', '8954641636');
INSERT INTO LIKEBOOK VALUES ('user005', '8936434268');
INSERT INTO LIKEBOOK VALUES ('user005', '8937473135');
INSERT INTO LIKEBOOK VALUES ('user005', '8937473097');

--제작도서 데이터 입력
INSERT INTO MAKEDBOOK VALUES ('user001', '8954655971', DEFAULT);
INSERT INTO MAKEDBOOK VALUES ('user001', '8954641636', DEFAULT);
INSERT INTO MAKEDBOOK VALUES ('user001', '8936434268', DEFAULT);
INSERT INTO MAKEDBOOK VALUES ('user002', '8937473135', DEFAULT);
INSERT INTO MAKEDBOOK VALUES ('user007', '8937473097', DEFAULT);

--도서제작 데이터 입력
INSERT INTO BOOKMAKING VALUES ('8954655971', '2019-04-29', NULL, NULL, NULL, 43);
INSERT INTO BOOKMAKING VALUES ('8954641636', '2019-03-03', NULL, NULL, NULL, 121);
INSERT INTO BOOKMAKING VALUES ('8983925310', '2019-07-26', '2019-08-01', '해리포터와 마법사의 돌 1.txt', '201908011508.txt', 244);
INSERT INTO BOOKMAKING VALUES ('8936434268', '2019-01-15', '2019-01-31', '아몬드_손평원.txt', '201901312208.txt', 264);
INSERT INTO BOOKMAKING VALUES ('8937473135', SYSDATE, NULL, NULL, NULL, DEFAULT);
INSERT INTO BOOKMAKING VALUES ('8937473097', SYSDATE, NULL, NULL, NULL, DEFAULT);
INSERT INTO BOOKMAKING VALUES ('8982814477', SYSDATE, NULL, NULL, NULL, DEFAULT);
INSERT INTO BOOKMAKING VALUES ('1162203625', SYSDATE, NULL, NULL, NULL, DEFAULT);
INSERT INTO BOOKMAKING VALUES ('9791130620459', '2019-09-14', null, null, null, 20);
INSERT INTO BOOKMAKING VALUES ('9788934972464', sysdate, null, null, null, default);
INSERT INTO BOOKMAKING VALUES ('8982816631', '2019-10-03', null, null, null, 84);
INSERT INTO BOOKMAKING VALUES ('9788950980726', '2019-10-03', null, null, null, 15);
INSERT INTO BOOKMAKING VALUES ('9788950981983', sysdate, null, null, null, 0);
INSERT INTO BOOKMAKING VALUES ('9791188248674', sysdate, null, null, null, 231);
INSERT INTO BOOKMAKING VALUES ('9788965134947', sysdate, null, null, null, 0);
INSERT INTO BOOKMAKING VALUES ('9788932919874', sysdate, null, null, null, 12);
INSERT INTO BOOKMAKING VALUES ('9788995563502', sysdate, null, null, null, 46);
INSERT INTO BOOKMAKING VALUES ('9791135445620', sysdate, null, null, null, 15);
INSERT INTO BOOKMAKING VALUES ('9791187119845', sysdate, null, null, null, 67);
INSERT INTO BOOKMAKING VALUES ('9791162540640', sysdate, null, null, null, 154);

--도서신청 데이터 입력
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user003', '아몬드', '손원평', '창비', '2017/03/31', '2019/01/12', 14, 'DONE', NULL, '2019/01/15', 'N', 'admin00');
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user005', '쇼코의 미소', '최은영', '문학동네', NULL, '2019/02/25', 12, 'DONE', NULL, '2019/03/03', 'N', 'admin01');
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user003', '쇼코의 미소', '최은영', NULL, NULL, '2019/03/02', 8, 'RJCT', '이미 신청된 도서입니다.', '2019/03/03', 'N' , 'admin00');
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user005', '소년이 온다', '한강', NULL, NULL, '2019/09/02', 7, DEFAULT, NULL, NULL, 'N', NULL);
INSERT INTO WISHBOOK VALUES (SEQ_WISHNO.NEXTVAL, 'user005', '검사내전', '김웅', NULL, NULL, '2019/09/08', 5, DEFAULT, NULL, NULL, 'N', NULL);


--qna 데이터 입력
INSERT INTO QNA VALUES (SEQ_QNANO.NEXTVAL, '한자 작성은 어떻게 하면되나요', 'user002', '도서 중간중간 나오는 한자는 어떻게 작성하면 되나요?', '2019/09/23', 21, 'Y', NULL, NULL, 'N');
INSERT INTO QNA VALUES (SEQ_QNANO.NEXTVAL, '제작한 도서는 어떻게 이용할수 있나요??', 'user002', '제작자는 따로 이용못하는 건가요?', '2019/09/24', 10, 'Y', NULL, NULL, 'N');
INSERT INTO QNA VALUES (SEQ_QNANO.NEXTVAL, '도서 이어듣기는 어떻게 하는건가요?', 'user003', '기존에 읽었던 도서를 이어읽고 싶습니다. 어떻게 해야하나요?', '2019/09/25', 8, 'Y', NULL, NULL, 'N');
INSERT INTO QNA VALUES (SEQ_QNANO.NEXTVAL, '제작할 도서가 없습니다', 'user001', '도서 제작 페이지에 제작할 도서가 없다면 어떻게 해야되나요?', '2019/09/26', 14, 'Y', NULL, NULL, 'N');
INSERT INTO QNA VALUES (SEQ_QNANO.NEXTVAL, '표 작성은 어떻게 하는지 궁금합니다.', 'user001', '도서 내용에 표가 있다면 어떻게 작성하면 되나요?', '2019/09/27', 3, 'N', NULL, NULL, 'N');


--qna 답변 데이터 입력
INSERT INTO QNACOMMENT VALUES (1, 'admin02', '네이버 사전에 한자를 그려서 확인할수 있습니다.', '2019/09/24');
INSERT INTO QNACOMMENT VALUES (2, 'admin01', '네, 죄송합니다. 제작자는 도서 듣기를 이용할 수 없습니다. 이 사이트는 시각장애인들을 위한 사이트이므로 시각장애인인분들만 도서 듣기를 이용할 수 있습니다.', '2019/09/25');
INSERT INTO QNACOMMENT VALUES (3, 'admin01', '도서 듣기 메뉴 상단의 종료 버튼을 누르면 자동으로 이어듣기 북마크가 생성됩니다.', '2019/09/26');
INSERT INTO QNACOMMENT VALUES (4, 'admin00', '도서 제작에 제작할 도서가 없는것은 신청된 도서가 다 제작되었기 때문입니다. 며칠후 다시 확인부탁드립니다.', '2019/09/27');


--공지 데이터 입력
INSERT INTO NOTICE VALUES (SEQ_NOTICENO.NEXTVAL,'홈페이지 서버 오류에 대한 안내','admin02','안녕하세요, 소리지음 입니다.
먼저 6월 7일 홈페이지 서버 점검 작업 후
계속되는 오류로 인해 불편을 겪으신 봉사자 여러분께 사과의 말씀 드립니다.
이용에 불편을 드려 대단히 죄송합니다.','2019/06/13',321,null,null,null,'N');

INSERT INTO NOTICE VALUES (2,'신규도서 업로드 안내 02','admin02','안녕하세요, 
저희 소리지음에서 운영하는 나누는 책읽기 프로젝트는
자원봉사자 여러분들의 동시 협업을 통해 시각장애인 이용자들이 읽고 싶은 책을 빠른 시간에 제작하여 서비스함으로써
시각장애인의 책가뭄 문제를 해결하고자 기획되었습니다.
따라서 시각장애인 이용자분들의 신청 도서가 도착하는 대로 실시간 업로드하고 있으나,
1일 평균 500여분의 참여로 작업이 이루어지므로 빠른 시간 안에 준비된 도서가 모두 편집 완료되어 검수 대기 상태인 경우가 많습니다.
도서 업로드의 경우 시각장애인 이용자 분들의 요청으로 이루어진다는 점을 감안하여,
사이트에 수시로 접속하시어 신규 도서를 확인한 후 활동에 참여해주시면 감사하겠습니다.
시각장애인의 책가뭄 문제 해결과 독서권 확보를 위한 도서관 사업의 취지와 정책 운영에 협조 부탁드립니다.
감사합니다.','2019/08/05',221,null,null,null,'Y');

INSERT INTO NOTICE VALUES (3,'e북 제작 목록(2019년 1월~8월 기준)공유 드립니다','admin01','안녕하세요.
자원봉사자 선생님들께서 온라인 협업으로 제작하여 주신 
e북 제작 목록(2019년 9월~10월 기준)을 공유드립니다.
제작 도서는 정기적으로 시각장애인 이용자분들의 간담회 및 소리지음 도서선정위원회 개최를 통하여 추천 선정됩니다. 
다시한번 자원봉사자 선생님들의 자원활동에 깊은 감사를 드립니다.','2019/09/24',31,null,null,null,'Y');

INSERT INTO NOTICE VALUES (4,'긴급도서 ''김대균 토익킹''에 대한 안내','admin01','
현재 제작이 급한 도서로 업로드된 ''김대균 토익킹 2019/10''은시각장애인 이용자분이 
직접 신청하신 토익 교재로,다른 도서보다 더욱 꼼꼼한 편집이 필요합니다.
도서의 내용 모두를 빠짐없이 입력해주시기 바라며,
사소한 오타 하나로도 시험 등의 결과에 치명적일 수 있으므로책임감을 가지고 
정확한 오탈자 및 띄어쓰기 수정 부탁드리겠습니다. 
※ 주의사항첨부파일에 적용된 편집 방법을 준수하여 입력해주셔야 페이지 승인이 됩니다.
가이드라인을 확인한 후 봉사에 참여해주시기 바랍니다.','2019/09/25',25,null,null,null,'N');

INSERT INTO NOTICE VALUES (5,'긴급도서 ''이승과 저승을 잇는 다리 한국 신화''에 대한 안내','admin01','현재 제작이 급한 도서로 업로드된 
''이승과 저승을 잇는 다리 한국 신화''는시각장애인 이용자분이 직접 신청하신 책입니다.
다른 도서보다 더욱 꼼꼼한 편집이 필요하므로, 
책임감을 가지고가이드라인을 다시 한번 숙지한 후 작업에 참여해주시기 바랍니다.
특히, 정확한 오탈자 및 띄어쓰기 수정 부탁드리겠습니다.','2019/09/27',50,null,null,null,'N');


--회원탈퇴 데이터 입력
INSERT INTO MEMBER VALUES(
'quituser01',3,'김탈퇴','quit01','01011118888','quituser@gmail.com','M','1978-05-14',DEFAULT,NULL,NULL,'Y');

INSERT INTO QUIT VALUES('quituser01','F','사이트를 이용하지 않습니다.','2019-08-27');

COMMIT;