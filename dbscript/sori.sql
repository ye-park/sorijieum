--소리지음 계정 생성
CREATE USER SORI IDENTIFIED BY JIEUM;
GRANT CONNECT,RESOURCE TO SORI;


--MEMBER 테이블 생성
DROP TABLE MEMBER;

CREATE TABLE MEMBER (
	USERID	VARCHAR2(20)		NOT NULL,
	TYPENUMBER	NUMBER		NOT NULL,
	USERNAME	VARCHAR2(20)		NOT NULL,
	USERPWD	VARCHAR2(20)		NOT NULL,
	PHONE	VARCHAR2(13)		NOT NULL,
	EMAIL	VARCHAR2(50)		NOT NULL,
	GENDER	VARCHAR2(1)		NOT NULL,
	BIRTH	DATE		NOT NULL,
	ENROLLDATE	DATE	DEFAULT SYSDATE	NOT NULL,
	USEROFILE	VARCHAR2(100)		NULL,
	USERRFILE	VARCHAR2(100)		NULL,
	QUITYN	VARCHAR2(1)	DEFAULT 'N'	NOT NULL
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
DROP TABLE BOOK;

CREATE TABLE BOOK (
	BOOKCODE	NUMBER		NOT NULL,
	BOOKTITLE	VARCHAR2(200)		NOT NULL,
	AUTHOR	VARCHAR2(100)		NOT NULL,
	PUBLISHER	VARCHAR2(100)		NOT NULL,
	PUBLISHDATE	DATE		NOT NULL,
	BOOKPAGE	NUMBER		NOT NULL,
	BOOKINFO	VARCHAR2(1500)		NOT NULL,
	BOOKIMG	VARCHAR2(300)		NOT NULL,
	BOOKOPDF	VARCHAR2(1000)		NOT NULL,
	BOOKRPDF	VARCHAR2(1000)		NOT NULL,
	BOOKDATE	DATE	DEFAULT SYSDATE	NOT NULL,
	BOOKVIEWS	NUMBER	DEFAULT 0	NOT NULL,
	MAKESTATUS	VARCHAR2(4)	DEFAULT 'WAIT'	NOT NULL
);

COMMENT ON COLUMN BOOK.BOOKCODE IS '도서코드';

COMMENT ON COLUMN BOOK.BOOKTITLE IS '도서명';

COMMENT ON COLUMN BOOK.AUTHOR IS '저자명';

COMMENT ON COLUMN BOOK.PUBLISHER IS '출판사';

COMMENT ON COLUMN BOOK.PUBLISHDATE IS '출판일';

COMMENT ON COLUMN BOOK.BOOKPAGE IS '전체쪽수';

COMMENT ON COLUMN BOOK.BOOKINFO IS '도서소개';

COMMENT ON COLUMN BOOK.BOOKIMG IS '도서커버이미지';

COMMENT ON COLUMN BOOK.BOOKOPDF IS '기존원본도서PDF';

COMMENT ON COLUMN BOOK.BOOKRPDF IS '변경도서원본PDF';

COMMENT ON COLUMN BOOK.BOOKDATE IS '도서등록일';

COMMENT ON COLUMN BOOK.BOOKVIEWS IS '도서조회수';

COMMENT ON COLUMN BOOK.MAKESTATUS IS '도서제작상태';


--NOTICE 테이블 생성
DROP TABLE NOTICE;

CREATE TABLE NOTICE (
	NOTICENO	NUMBER		NOT NULL,
	NOTICETITLE	VARCHAR2(200)		NOT NULL,
	NOTICEWRITER	VARCHAR2(20)		NOT NULL,
	NOTICECONTENT	VARCHAR2(4000)		NOT NULL,
	NOTICEDATE	DATE	DEFAULT SYSDATE	NOT NULL,
	NOTICEVIEWS	NUMBER	DEFAULT 0	NOT NULL,
	NOTICEOFILE	VARCHAR2(1000)		NULL,
	NOTICERFILE	VARCHAR2(1000)		NULL,
	NOTICERDATE	DATE		NULL,
	NOTICETOP	VARCHAR2(1)	DEFAULT 'N'	NULL
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
DROP TABLE QNA;

CREATE TABLE QNA (
	QNANO	NUMBER		NOT NULL,
	QNATITLE	VARCHAR2(200)		NOT NULL,
	QNAWRITER	VARCHAR2(20)		NOT NULL,
	QNACONTENT	VARCHAR2(4000)		NOT NULL,
	QNADATE	DATE	DEFAULT SYSDATE	NOT NULL,
	QNAVIEWS	NUMBER	DEFAULT 0	NOT NULL,
	QNASTATUS	VARCHAR2(1)	DEFAULT 'N'	NOT NULL,
	QNAOFILE	VARCHAR2(1000)		NULL,
	QNARFILE	VARCHAR2(1000)		NULL,
	QNATOP	VARCHAR2(1)	DEFAULT 'N'	NULL
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


--FAQ 테이블 생성
DROP TABLE FAQ;

CREATE TABLE FAQ (
	FAQNO	NUMBER		NOT NULL,
	FAQWRITER	VARCHAR2(20)		NOT NULL,
	FAQQ	VARCHAR2(4000)		NOT NULL,
	FAQA	VARCHAR2(4000)		NOT NULL,
	FAQDATE	DATE	DEFAULT SYSDATE	NOT NULL,
	FAQOFILE	VARCHAR2(1000)		NULL,
	FAQRFILE	VARCHAR2(1000)		NULL
);

COMMENT ON COLUMN FAQ.FAQNO IS 'FAQ 번호';

COMMENT ON COLUMN FAQ.FAQWRITER IS 'FAQ  작성한 관리자 아이디';

COMMENT ON COLUMN FAQ.FAQQ IS 'FAQ  질문';

COMMENT ON COLUMN FAQ.FAQA IS 'FAQ  답변';

COMMENT ON COLUMN FAQ.FAQDATE IS 'FAQ  작성날짜';

COMMENT ON COLUMN FAQ.FAQOFILE IS 'FAQ  기존 첨부 파일';

COMMENT ON COLUMN FAQ.FAQRFILE IS 'FAQ  변경 첨부 파일';


--WISHBOOK 테이블 생성
DROP TABLE WISHBOOK;

CREATE TABLE WISHBOOK (
	WISHNO	NUMBER		NOT NULL,
	WISHWRITER	VARCHAR2(20)		NOT NULL,
	WISHBOOKTITLE	VARCHAR2(200)		NOT NULL,
	WISHBOOKWRITER	VARCHAR2(100)		NOT NULL,
	WISHPUBLISH	VARCHAR2(100)		NULL,
	WISHPUBLISHDATE	DATE		NULL,
	WISHDATE	DATE	DEFAULT SYSDATE	NOT NULL,
	WISHLIKE	NUMBER	DEFAULT 0	NOT NULL,
	WISHVIEWS	NUMBER	DEFAULT 0	NOT NULL,
	WISHSTATUS	VARCHAR2(4)	DEFAULT 'WAIT'	NOT NULL,
	WISHREASON	VARCHAR2(50)		NULL,
	WISHSTATUSDATE	DATE		NULL
);

COMMENT ON COLUMN WISHBOOK.WISHNO IS '글번호';

COMMENT ON COLUMN WISHBOOK.WISHWRITER IS '게시글아이디';

COMMENT ON COLUMN WISHBOOK.WISHBOOKTITLE IS '도서명';

COMMENT ON COLUMN WISHBOOK.WISHBOOKWRITER IS '저자명';

COMMENT ON COLUMN WISHBOOK.WISHPUBLISH IS '출판사';

COMMENT ON COLUMN WISHBOOK.WISHPUBLISHDATE IS '출판일';

COMMENT ON COLUMN WISHBOOK.WISHDATE IS '신청일';

COMMENT ON COLUMN WISHBOOK.WISHLIKE IS '좋아요수';

COMMENT ON COLUMN WISHBOOK.WISHVIEWS IS '조회수';

COMMENT ON COLUMN WISHBOOK.WISHSTATUS IS '처리상태';

COMMENT ON COLUMN WISHBOOK.WISHREASON IS '반려사유';

COMMENT ON COLUMN WISHBOOK.WISHSTATUSDATE IS '처리일시';


--LIKEBOOK 테이블 생성
DROP TABLE LIKEBOOK;

CREATE TABLE LIKEBOOK (
	USERID	VARCHAR2(20)		NOT NULL,
	BOOKCODE	NUMBER		NOT NULL
);

COMMENT ON COLUMN LIKEBOOK.USERID IS '회원아이디';

COMMENT ON COLUMN LIKEBOOK.BOOKCODE IS '도서코드';

DROP TABLE MAKEDBOOK;

CREATE TABLE MAKEDBOOK (
	USERID	VARCHAR2(20)		NOT NULL,
	BOOKCODE	NUMBER		NOT NULL,
	MAKEDATE	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN MAKEDBOOK.USERID IS '회원아이디';

COMMENT ON COLUMN MAKEDBOOK.BOOKCODE IS '도서코드';

COMMENT ON COLUMN MAKEDBOOK.MAKEDATE IS '제작 참여 날짜';


--MYBOOK 테이블 생성
DROP TABLE MYBOOK;

CREATE TABLE MYBOOK (
	USERID	VARCHAR2(20)		NOT NULL,
	BOOKCODE	NUMBER		NOT NULL,
	READPAGE	NUMBER		NOT NULL,
	READSDATE	DATE	DEFAULT SYSDATE	NOT NULL,
	READRDATE	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN MYBOOK.USERID IS '회원아이디';

COMMENT ON COLUMN MYBOOK.BOOKCODE IS '도서코드';

COMMENT ON COLUMN MYBOOK.READPAGE IS '이어읽을위치(쪽수)';

COMMENT ON COLUMN MYBOOK.READSDATE IS '처음 읽은 날짜';

COMMENT ON COLUMN MYBOOK.READRDATE IS '최근 읽은 날짜';


--ADMINMEMO 테이블 생성
DROP TABLE ADMINMEMO;

CREATE TABLE ADMINMEMO (
	USERID	VARCHAR2(20)		NOT NULL,
	ADMINID	VARCHAR2(20)		NOT NULL,
	ADMINMEMO	VARCHAR2(300)		NOT NULL,
	MEMODATE	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN ADMINMEMO.USERID IS '회원아이디';

COMMENT ON COLUMN ADMINMEMO.ADMINID IS '관리자아이디';

COMMENT ON COLUMN ADMINMEMO.ADMINMEMO IS '메모내용';

COMMENT ON COLUMN ADMINMEMO.MEMODATE IS '메모작성일';


--QUIT 테이블 생성
DROP TABLE QUIT;

CREATE TABLE QUIT (
	USERID	VARCHAR2(20)		NOT NULL,
	QUITTYPE	VARCHAR2(1)		NOT NULL,
	QUITREASON	VARCHAR2(1000)		NOT NULL,
	QUITDATE	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN QUIT.USERID IS '탈퇴회원아이디';

COMMENT ON COLUMN QUIT.QUITTYPE IS '탈퇴유형(G일반/F강제)';

COMMENT ON COLUMN QUIT.QUITREASON IS '탈퇴사유';

COMMENT ON COLUMN QUIT.QUITDATE IS '탈퇴일자';


--BOOKMAKING 테이블 생성
DROP TABLE BOOKMAKING;

CREATE TABLE BOOKMAKING (
	BOOKCODE	NUMBER		NOT NULL,
	MAKESTART	DATE	DEFAULT SYSDATE	NOT NULL,
	MAKEFIN	DATE		NULL,
	BOOKPDF	VARCHAR2(1000)		NOT NULL,
	BOOKOTXT	VARCHAR2(1000)		NULL,
	BOOKRTXT	VARCHAR2(1000)		NULL,
	MAKEPAGE	NUMBER	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN BOOKMAKING.BOOKCODE IS '도서코드';

COMMENT ON COLUMN BOOKMAKING.MAKESTART IS '제작시작일';

COMMENT ON COLUMN BOOKMAKING.MAKEFIN IS '제작완료일';

COMMENT ON COLUMN BOOKMAKING.BOOKPDF IS '도서원본PDF';

COMMENT ON COLUMN BOOKMAKING.BOOKOTXT IS '기존제작완료TXT';

COMMENT ON COLUMN BOOKMAKING.BOOKRTXT IS '변경제작완료TXT';

COMMENT ON COLUMN BOOKMAKING.MAKEPAGE IS '현재까지 제작된 쪽수';


--QNACOMMENT 테이블 생성
DROP TABLE QNACOMMENT;

CREATE TABLE QNACOMMENT (
	QNANO	NUMBER		NOT NULL,
	QNACOMWRITER	VARCHAR2(20)		NOT NULL,
	QNACOMMENTS	VARCHAR2(1000)		NOT NULL,
	QNACOMDATE	DATE	DEFAULT SYSDATE	NOT NULL,
	QNACOMOFILE	VARCHAR2(1000)		NULL,
	QNACOMRFILE	VARCHAR2(1000)		NULL
);

COMMENT ON COLUMN QNACOMMENT.QNANO IS 'QNA 답변 글번호';

COMMENT ON COLUMN QNACOMMENT.QNACOMWRITER IS 'QNA 답변한 관리자 아이디';

COMMENT ON COLUMN QNACOMMENT.QNACOMMENTS IS 'QNA 답변 내용';

COMMENT ON COLUMN QNACOMMENT.QNACOMDATE IS 'QNA 답변 작성시간';

COMMENT ON COLUMN QNACOMMENT.QNACOMOFILE IS 'QNA 답변 기존 첨부파일';

COMMENT ON COLUMN QNACOMMENT.QNACOMRFILE IS 'QNA 답변  변경 첨부파일';


--USERTYPE 테이블 생성
DROP TABLE USERTYPE;

CREATE TABLE USERTYPE (
	TYPENUMBER	NUMBER		NOT NULL,
	USERTYPE	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN USERTYPE.TYPENUMBER IS '회원구분(숫자)';

COMMENT ON COLUMN USERTYPE.USERTYPE IS '회원종류(글자)';


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

ALTER TABLE FAQ ADD CONSTRAINT PK_FAQ PRIMARY KEY (
	FAQNO
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

ALTER TABLE USERTYPE ADD CONSTRAINT PK_USERTYPE PRIMARY KEY (
	TYPENUMBER
);

ALTER TABLE MEMBER ADD CONSTRAINT FK_USERTYPE_TO_MEMBER_1 FOREIGN KEY (
	TYPENUMBER
)
REFERENCES USERTYPE (
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

ALTER TABLE FAQ ADD CONSTRAINT FK_MEMBER_TO_FAQ_1 FOREIGN KEY (
	FAQWRITER
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