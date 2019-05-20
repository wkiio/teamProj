
/* Drop Tables */

DROP TABLE babypair CASCADE CONSTRAINTS;
DROP TABLE Baby_Border CASCADE CONSTRAINTS;
DROP TABLE Calender CASCADE CONSTRAINTS;
DROP TABLE Reservation CASCADE CONSTRAINTS;
DROP TABLE Carpool_Border CASCADE CONSTRAINTS;
DROP TABLE hospital CASCADE CONSTRAINTS;
DROP TABLE ReView CASCADE CONSTRAINTS;
DROP TABLE kizcafe CASCADE CONSTRAINTS;
DROP TABLE Partner_Members CASCADE CONSTRAINTS;
DROP TABLE Members CASCADE CONSTRAINTS;
DROP TABLE visit CASCADE CONSTRAINTS;


/* Drop Sequence */

DROP SEQUENCE SEQ_Babypair;
DROP SEQUENCE SEQ_calender;
DROP SEQUENCE SEQ_carpool_border;
DROP SEQUENCE SEQ_partner_members;
DROP SEQUENCE SEQ_reservation;
DROP SEQUENCE SEQ_kizcafe;

/* Create Sequence */

CREATE SEQUENCE SEQ_babypair
NOCYCLE
NOCACHE;
CREATE SEQUENCE SEQ_calender
NOCYCLE
NOCACHE;
CREATE SEQUENCE SEQ_carpool_border
NOCYCLE
NOCACHE;
CREATE SEQUENCE SEQ_partner_members
NOCYCLE
NOCACHE;
CREATE SEQUENCE SEQ_reservation
NOCYCLE
NOCACHE;
CREATE SEQUENCE SEQ_kizcafe
NOCYCLE
NOCACHE;




/* Create Tables */

CREATE TABLE babypair
(
	baby_no number NOT NULL,
	title nvarchar2(50) NOT NULL,
	period nvarchar2(100) NOT NULL,
	time nvarchar2(100) NOT NULL,
	place nvarchar2(2000) NOT NULL,
	titleimage nvarchar2(2000) NOT NULL,
	product nvarchar2(2000),
	Cal_No number NOT NULL,
	PRIMARY KEY (baby_no)
);


CREATE TABLE Baby_Border
(
	No number NOT NULL,
	Title nvarchar2(20) NOT NULL,
	Thumbnail varchar2(300),
	Url varchar2(300) NOT NULL,
	PRIMARY KEY (No)
);


CREATE TABLE Calender
(
	Cal_No number NOT NULL,
	Title nvarchar2(2000) NOT NULL,
	StartDate nvarchar2(100) NOT NULL,
	EndDate nvarchar2(100),
	Content clob,
	Type nvarchar2(20),
	ID varchar2(20) NOT NULL,
	PRIMARY KEY (Cal_No)
);


CREATE TABLE carpool_border 
(
   	cp_no number NOT NULL,
   	startpoint nvarchar2(500) NOT NULL,
   	endpoint nvarchar2(500) NOT NULL,
   	type nvarchar2(10),
   	content CLOB,
   	start_Xpos number NOT NULL,
   	start_Ypos number NOT NULL,
   	end_Xpos number NOT NULL,
   	end_Ypos number NOT NULL,
   	id varchar2(20) NOT NULL,
   	-- 0 : 카시트 미 존재
   	-- 1 : 카시트 존재
   	carseat nvarchar2(10),
   	time nvarchar2(50) NOT NULL,
   	price number NOT NULL,
   	-- 0 : 현재 예약되지 않음
   	-- 1 : 예약중
   	status char(1) DEFAULT '0' CONSTRAINTS status_CK CHECK (status = '0' OR status = '1'),
	opened varchar2(100),
	signed varchar2(100),
	done varchar2(100),
	reviewed varchar2(100),
   	PRIMARY KEY (cp_no)
);


CREATE TABLE hospital
(
	h_no number NOT NULL,
	name nvarchar2(100),
	tel nvarchar2(30),
	addr nvarchar2(1000),
	mon nvarchar2(100),
	tue nvarchar2(100),
	wed nvarchar2(100),
	thu nvarchar2(100),
	sat nvarchar2(100),
	fri nvarchar2(100),
	sun nvarchar2(100),
	holiday nvarchar2(100),
	emergency number,
	code number,
	PRIMARY KEY (h_no)
);


CREATE TABLE kizcafe
(
	k_no number NOT NULL,
	name nvarchar2(100),
	tel nvarchar2(30),
	addr nvarchar2(1000),
	PRIMARY KEY (k_no)
);


CREATE TABLE members
(
	id varchar2(20) NOT NULL,
	-- 최소 : 6자
	-- 최대 : 16자
	-- 영문과 숫자와 특수문자의 조합으로...
	pwd varchar2(16) NOT NULL,
	name nvarchar2(5) NOT NULL,
	addr nvarchar2(100) NOT NULL,
	email varchar2(50) NOT NULL,
	tel nvarchar2(15) NOT NULL,
	photo varchar2(300) NOT NULL,
	-- 이메일 인증 키 입니다.
	authkey nvarchar2(500),
	-- 이메일 인증이 완료가되면 값이 들어갑니다. 
	-- 0이면 인증이 되지 않았습니다. 
	-- 1이면 인증이 되어있는 상태입니다.
    	-- 추후 시큐리티와 밀접한 연관이 있기때문에 체크하지않으면 아예 홈페이지가 맛이갑니다.
	enabled number(1) DEFAULT 0 CONSTRAINTS enabled_CK CHECK (enabled = 0 OR enabled = 1),
    	partnerstatus char(1) DEFAULT '0' CONSTRAINTS partnerstatus_CK CHECK (partnerstatus = '0' OR partnerstatus = '1'),
	AUTHORITY nvarchar2(20)  DEFAULT 'ROLE_USER',
	PRIMARY KEY (id)
);


CREATE TABLE partner_members
(
	p_no number NOT NULL,
	id varchar2(20) NOT NULL,
	carnumber nvarchar2(20),
	-- 소형차
	-- 중형차
	-- 대형차
	cartype nvarchar2(10),
	career nvarchar2(10),
	totalscore number,
	totalcount number,
	PRIMARY KEY (p_no)
);

CREATE TABLE reservation
(
   rs_no number NOT NULL,
   score number,
   title varchar2(500),
   content varchar2(2000),
   -- 계약이 완료되었는지 판단하는 컬럼입니다
   -- 0이면 아직 진행중, 1이면 완료되어 완료테이블에서 조회 가능합니다.
   finish char(1) DEFAULT '0' CONSTRAINTS finish_CK CHECK (finish = '0' OR finish = '1'),
   id varchar2(20) NOT NULL,
   cp_no number NOT NULL,
   PRIMARY KEY (rs_no)
);



CREATE TABLE ReView
(
	RV_No number NOT NULL,
	Title nvarchar2(50),
	Content nvarchar2(2000),
	Score number,
	ID varchar2(20) NOT NULL,
	k_no number NOT NULL,
	PRIMARY KEY (RV_No)
);


CREATE TABLE visit
(
	V_DATE date NOT NULL,
	PRIMARY KEY (V_DATE)
);


/* Create Foreign Keys */

ALTER TABLE babypair
	ADD FOREIGN KEY (Cal_No)
	REFERENCES Calender (Cal_No)
;


ALTER TABLE Reservation
	ADD FOREIGN KEY (CP_No)
	REFERENCES Carpool_Border (CP_No)
;


ALTER TABLE ReView
	ADD FOREIGN KEY (k_no)
	REFERENCES kizcafe (k_no)
;


ALTER TABLE Calender
	ADD FOREIGN KEY (ID)
	REFERENCES Members (ID)
;


ALTER TABLE Carpool_Border
	ADD FOREIGN KEY (ID)
	REFERENCES Members (ID)
;


ALTER TABLE Partner_Members
	ADD FOREIGN KEY (ID)
	REFERENCES Members (ID)
;


ALTER TABLE Reservation
	ADD FOREIGN KEY (ID)
	REFERENCES Members (ID)
;


ALTER TABLE ReView
	ADD FOREIGN KEY (ID)
	REFERENCES Members (ID)
;

-- 관리자 아이디넣기
insert into members values('admin','asd123!@#','관리자','주소','이메일','01012345678','관리자의사진','인증키','1',1,default);

insert into members values('aaaa','asd123!@#','타는사람','06267:!:서울 강남구 도곡동 957-13;!@weqwewqe','yuemj@naver.com','01012345678','D:\MMJ\WorkSpace\.metadata\.plugins\org.eclipse.wst.server.core\tmp3\wtpwebapps\KOSMO_Proj\resources\memberPhoto\sumnail.png','LIVWalVtwXoo5QQdaGSW','1','0','ROLE_USER');
insert into members values('bbbb','asd123!@#','태워줄사람','06267:!:서울 강남구 도곡동 957-13;!@weqwewqe','yuemj@naver.com','01056782134','D:\MMJ\WorkSpace\.metadata\.plugins\org.eclipse.wst.server.core\tmp3\wtpwebapps\KOSMO_Proj\resources\memberPhoto\a0481f5b0d0c47a685c.JPG','ZqNh1uD5SOm7XsLi3U9w','1','1','ROLE_USER');
insert into partner_members values('9999999','bbbb','자동차번호','대형차','6개월이하',0,0);
desc partner_members;
desc members;
-- 카풀 게시판
insert into baby_border(no,title,url,thumbnail) values(1,'설명 아직 미정','https://www.youtube.com/watch?v=gcAbeTWjHvQ','http://img.youtube.com/vi/gcAbeTWjHvQ/mqdefault.jpg');
insert into baby_border(no,title,url,thumbnail) values(2,'설명 아직 미정','https://www.youtube.com/watch?v=pe1asLzVQBQ','http://img.youtube.com/vi/pe1asLzVQBQ/mqdefault.jpg');
insert into baby_border(no,title,url,thumbnail) values(3,'설명 아직 미정','https://www.youtube.com/watch?v=IDPPkozCxOw','http://img.youtube.com/vi/IDPPkozCxOw/mqdefault.jpg');
insert into baby_border(no,title,url,thumbnail) values(4,'설명 아직 미정','https://www.youtube.com/watch?v=2ktbTawmR28','http://img.youtube.com/vi/2ktbTawmR28/mqdefault.jpg');
insert into baby_border(no,title,url,thumbnail) values(5,'설명 아직 미정','https://www.youtube.com/watch?v=krbcaUy8K24','http://img.youtube.com/vi/krbcaUy8K24/mqdefault.jpg');
insert into baby_border(no,title,url,thumbnail) values(6,'설명 아직 미정','https://www.youtube.com/watch?v=Z0usnVLGWtM','http://img.youtube.com/vi/Z0usnVLGWtM/mqdefault.jpg');
insert into baby_border(no,title,url,thumbnail) values(7,'설명 아직 미정','https://www.youtube.com/watch?v=FqFmMFrRWew','http://img.youtube.com/vi/FqFmMFrRWew/mqdefault.jpg');
insert into baby_border(no,title,url,thumbnail) values(8,'설명 아직 미정','https://www.youtube.com/watch?v=M4x-SWwc6dI','http://img.youtube.com/vi/M4x-SWwc6dI/mqdefault.jpg');
insert into baby_border(no,title,url,thumbnail) values(9,'설명 아직 미정','https://www.youtube.com/watch?v=ZnLQKTXAtMs','http://img.youtube.com/vi/ZnLQKTXAtMs/mqdefault.jpg');

commit;

purge recyclebin;

CREATE TRIGGER TRG_RESER
AFTER INSERT OR DELETE
ON reservation
FOR EACH ROW
DECLARE
BEGIN
	IF INSERTING THEN
		UPDATE carpool_border SET status = '1'
		WHERE cp_no = :NEW.cp_no;
	ELSIF DELETING THEN
		UPDATE carpool_border SET status = '0'
		WHERE cp_no = :OLD.cp_no;
	END IF;
END;


