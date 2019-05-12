<<<<<<< HEAD

/* Drop Tables */


DROP TABLE baby_border CASCADE CONSTRAINTS;
DROP TABLE calender  CASCADE CONSTRAINTS;
DROP TABLE reservation CASCADE CONSTRAINTS;
DROP TABLE carpool_border  CASCADE CONSTRAINTS;
DROP TABLE hospital CASCADE CONSTRAINTS;
DROP TABLE kizcafe CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE partner_members CASCADE CONSTRAINTS;
DROP TABLE members CASCADE CONSTRAINTS;
DROP TABLE VISIT CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_Baby_Border;
DROP SEQUENCE SEQ_Calender;
DROP SEQUENCE SEQ_Carpool_Border;
DROP SEQUENCE SEQ_Hospital;
DROP SEQUENCE SEQ_KidHouse;
DROP SEQUENCE SEQ_Map;
DROP SEQUENCE SEQ_Partner_Members;
DROP SEQUENCE SEQ_Reservation;
DROP SEQUENCE SEQ_ReView;
DROP SEQUENCE SQE_Emergency;
DROP TRIGGER  TRG_RESER;

CREATE SEQUENCE SEQ_Baby_Border
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_Calender
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_Carpool_Border
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_Hospital
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_KidHouse
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_Map
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_Partner_Members
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_Reservation
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_ReView
NOCYCLE
NOCACHE;

CREATE SEQUENCE SQE_Emergency
NOCYCLE
NOCACHE;





/* Create Tables */

CREATE TABLE baby_border
(
	no number NOT NULL,
	title nvarchar2(100) NOT NULL,
	thumbnail varchar2(1000),
	url varchar2(1000) NOT NULL,
	PRIMARY KEY (no)
);


CREATE TABLE calender 
(
	cal_no number NOT NULL,
	title nvarchar2(2000) NOT NULL,
	startday date NOT NULL,
	endday date,
	content nvarchar2(2000),
	type nvarchar2(20),
	id varchar2(20) NOT NULL,
	PRIMARY KEY (Cal_no)
);


CREATE TABLE carpool_border 
(
	cp_no number NOT NULL,
	startpoint nvarchar2(500) NOT NULL,
	endpoint nvarchar2(500) NOT NULL,
	type nvarchar2(10),
	content nvarchar2(2000),
	start_Xpos number NOT NULL,
	start_Ypos number NOT NULL,
	end_Xpos number NOT NULL,
	end_Ypos number NOT NULL,
	id varchar2(20) NOT NULL,
	-- 0 : 카시트 미 존재
	-- 1 : 카시트 존재
	carseat char(1) DEFAULT '0' CONSTRAINTS carseat_CK CHECK (carseat = '0' OR carseat = '1'),
	time nvarchar2(50) NOT NULL,
	price number NOT NULL,
	-- 0 : 현재 예약되지 않음
	-- 1 : 예약중
	status char(1) DEFAULT '0' CONSTRAINTS status_CK CHECK (status = '0' OR status = '1'),
	PRIMARY KEY (cp_no)
);


CREATE TABLE hospital(
	h_no number primary key,
	name nvarchar2(100),
	tel nvarchar2(30),
	addr nvarchar2(1000),
	-- 월요일부터 공휴일까지 입니다.
	mon nvarchar2(100),
	tue nvarchar2(100),
	wed nvarchar2(100),
	thu nvarchar2(100),
	fri nvarchar2(100),
	sat nvarchar2(100),
	sun nvarchar2(100),
	holiday nvarchar2(100),
	emergency number
);


CREATE TABLE kizcafe
(
	k_no number NOT NULL,
	name nvarchar2(100),
	tel nvarchar2(30),
	addr nvarchar2(1000),
	PRIMARY KEY (k_no)
);

CREATE TABLE review
(
	rv_no number NOT NULL,
	title nvarchar2(50),
	content nvarchar2(2000),
	score number,
	id varchar2(20) NOT NULL,
	h_no number,
	k_no number,
	PRIMARY KEY (rv_no)
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
	--photo varchar2(300) NOT NULL,
	-- 이메일 인증 키 입니다.
	authkey nvarchar2(50),
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
	-- 계약이 완료되었는지 판단하는 컬럼입니다
	-- 0이면 아직 진행중, 1이면 완료되어 완료테이블에서 조회 가능합니다.
	finish char(1) DEFAULT '0' CONSTRAINTS finish_CK CHECK (finish = '0' OR finish = '1'),
	id varchar2(20) NOT NULL,
	cp_no number NOT NULL,
	PRIMARY KEY (rs_no)
);

CREATE TABLE VISIT (V_DATE DATE);



/* Create Foreign Keys */

ALTER TABLE reservation
	ADD FOREIGN KEY (cp_no)
	REFERENCES carpool_border (cp_no)
    on delete cascade
;

ALTER TABLE review
	ADD FOREIGN KEY (h_no)
	REFERENCES hospital (h_no)
    on delete cascade
;

ALTER TABLE review
	ADD FOREIGN KEY (k_no)
	REFERENCES kizcafe (k_no)
    on delete cascade
;


ALTER TABLE calender 
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
    on delete cascade
;


ALTER TABLE carpool_border 
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
    on delete cascade
;


ALTER TABLE partner_members
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
    on delete cascade
;


ALTER TABLE reservation
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
    on delete cascade
;


ALTER TABLE review
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
    on delete cascade
;

-- 트리거

CREATE TRIGGER TRG_RESER
AFTER INSERT OR DELETE
ON reservation
FOR EACH ROW --행단위 트리거
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
/


-- 관리자 아이디넣기
insert into members values('admin','asd123!@#','관리자','주소','이메일','01012345678','인증키','1',1,default);

-- 카풀 게시판

insert into members values('lee','1234','이길동','천호동','adf@nate.com','01012345678',0,1,0,default);
insert into members values('kim','1234','김길동','천호동','adf@nate.com','01012345678',0,1,0,default);
insert into members values('park','1234','박길동','천호동','adf@nate.com','01012345678',0,1,0,default);
insert into members values('choi','1234','최길동','천호동','adf@nate.com','01012345678',0,1,0,default);

insert into carpool_border values(10,'강남역','역삼역','태워주세요','연락처 010-1234-5678',37.498184,127.028484,37.500474,127.036082,'lee',0,sysdate,10000,'0');
insert into carpool_border values(11,'강남역','역삼역','태워주세요','연락처 010-1234-5678',37.498184,127.028484,37.500474,127.036082,'park',0,sysdate,10000,'0');
insert into carpool_border values(12,'강남역','역삼역','태워주세요','연락처 010-1234-5678', 37.498184,127.028484,37.500474,127.036082,'choi',0,sysdate,10000,'0');

--insert into reservation values(1,0,'0','lee',10);
--insert into reservation values(2,0,'0','park',11);
--insert into reservation values(3,0,'0','choi',12);

insert into baby_border(no,title,url,thumbnail) values(1,'설명 아직 미정','https://www.youtube.com/watch?v=gcAbeTWjHvQ','http://img.youtube.com/vi/gcAbeTWjHvQ/mqdefault.jpg');
insert into baby_border(no,title,url,thumbnail) values(2,'설명 아직 미정','https://www.youtube.com/watch?v=pe1asLzVQBQ','http://img.youtube.com/vi/pe1asLzVQBQ/mqdefault.jpg');
insert into baby_border(no,title,url,thumbnail) values(3,'설명 아직 미정','https://www.youtube.com/watch?v=IDPPkozCxOw','http://img.youtube.com/vi/IDPPkozCxOw/mqdefault.jpg');
insert into baby_border(no,title,url,thumbnail) values(4,'설명 아직 미정','https://www.youtube.com/watch?v=2ktbTawmR28','http://img.youtube.com/vi/2ktbTawmR28/mqdefault.jpg');
insert into baby_border(no,title,url,thumbnail) values(5,'설명 아직 미정','https://www.youtube.com/watch?v=krbcaUy8K24','http://img.youtube.com/vi/krbcaUy8K24/mqdefault.jpg');
insert into baby_border(no,title,url,thumbnail) values(6,'설명 아직 미정','https://www.youtube.com/watch?v=Z0usnVLGWtM','http://img.youtube.com/vi/Z0usnVLGWtM/mqdefault.jpg');
insert into baby_border(no,title,url,thumbnail) values(7,'설명 아직 미정','https://www.youtube.com/watch?v=FqFmMFrRWew','http://img.youtube.com/vi/FqFmMFrRWew/mqdefault.jpg');
insert into baby_border(no,title,url,thumbnail) values(8,'설명 아직 미정','https://www.youtube.com/watch?v=M4x-SWwc6dI','http://img.youtube.com/vi/M4x-SWwc6dI/mqdefault.jpg');
insert into baby_border(no,title,url,thumbnail) values(9,'설명 아직 미정','https://www.youtube.com/watch?v=ZnLQKTXAtMs','http://img.youtube.com/vi/ZnLQKTXAtMs/mqdefault.jpg');

alter trigger TRG_RESER enable;

commit;

purge recyclebin;
=======
	
	/* Drop Tables */
	
	
	DROP TABLE baby_border CASCADE CONSTRAINTS;
	DROP TABLE calender  CASCADE CONSTRAINTS;
	DROP TABLE reservation CASCADE CONSTRAINTS;
	DROP TABLE carpool_border  CASCADE CONSTRAINTS;
	DROP TABLE hospital CASCADE CONSTRAINTS;
	DROP TABLE kizcafe CASCADE CONSTRAINTS;
	DROP TABLE review CASCADE CONSTRAINTS;
	DROP TABLE partner_members CASCADE CONSTRAINTS;
	DROP TABLE members CASCADE CONSTRAINTS;
	DROP TABLE VISIT CASCADE CONSTRAINTS;
	
	DROP SEQUENCE SEQ_Baby_Border;
	DROP SEQUENCE SEQ_Calender;
	DROP SEQUENCE SEQ_Carpool_Border;
	DROP SEQUENCE SEQ_Hospital;
	DROP SEQUENCE SEQ_KidHouse;
	DROP SEQUENCE SEQ_Map;
	DROP SEQUENCE SEQ_Partner_Members;
	DROP SEQUENCE SEQ_Reservation;
	DROP SEQUENCE SEQ_ReView;
	DROP SEQUENCE SQE_Emergency;
	DROP TRIGGER  TRG_RESER;
	
	CREATE SEQUENCE SEQ_Baby_Border
	NOCYCLE
	NOCACHE;
	
	CREATE SEQUENCE SEQ_Calender
	NOCYCLE
	NOCACHE;
	
	CREATE SEQUENCE SEQ_Carpool_Border
	NOCYCLE
	NOCACHE;
	
	CREATE SEQUENCE SEQ_Hospital
	NOCYCLE
	NOCACHE;
	
	CREATE SEQUENCE SEQ_KidHouse
	NOCYCLE
	NOCACHE;
	
	CREATE SEQUENCE SEQ_Map
	NOCYCLE
	NOCACHE;
	
	CREATE SEQUENCE SEQ_Partner_Members
	NOCYCLE
	NOCACHE;
	
	CREATE SEQUENCE SEQ_Reservation
	NOCYCLE
	NOCACHE;
	
	CREATE SEQUENCE SEQ_ReView
	NOCYCLE
	NOCACHE;
	
	CREATE SEQUENCE SQE_Emergency
	NOCYCLE
	NOCACHE;
	
	
	
	
	
	/* Create Tables */
	
	CREATE TABLE baby_border
	(
		no number NOT NULL,
		title nvarchar2(100) NOT NULL,
		thumbnail varchar2(1000),
		url varchar2(1000) NOT NULL,
		PRIMARY KEY (no)
	);
	
	
	CREATE TABLE calender 
	(
		cal_no number NOT NULL,
		title nvarchar2(2000) NOT NULL,
		startday date NOT NULL,
		endday date,
		content nvarchar2(2000),
		type nvarchar2(20),
		id varchar2(20) NOT NULL,
		PRIMARY KEY (Cal_no)
	);
	
	
	CREATE TABLE carpool_border 
	(
		cp_no number NOT NULL,
		startpoint nvarchar2(500) NOT NULL,
		endpoint nvarchar2(500) NOT NULL,
		type nvarchar2(10),
		content nvarchar2(2000),
		start_Xpos number NOT NULL,
		start_Ypos number NOT NULL,
		end_Xpos number NOT NULL,
		end_Ypos number NOT NULL,
		id varchar2(20) NOT NULL,
		-- 0 : 카시트 미 존재
		-- 1 : 카시트 존재
		carseat char(1) DEFAULT '0' CONSTRAINTS carseat_CK CHECK (carseat = '0' OR carseat = '1'),
		time nvarchar2(50) NOT NULL,
		price number NOT NULL,
		-- 0 : 현재 예약되지 않음
		-- 1 : 예약중
		status char(1) DEFAULT '0' CONSTRAINTS status_CK CHECK (status = '0' OR status = '1'),
		PRIMARY KEY (cp_no)
	);
	
	
	CREATE TABLE hospital(
		h_no number primary key,
		name nvarchar2(100),
		tel nvarchar2(30),
		addr nvarchar2(1000),
		-- 월요일부터 공휴일까지 입니다.
		mon nvarchar2(100),
		tue nvarchar2(100),
		wed nvarchar2(100),
		thu nvarchar2(100),
		fri nvarchar2(100),
		sat nvarchar2(100),
		sun nvarchar2(100),
		holiday nvarchar2(100),
		emergency number,
		-- 0 이면 일반 병원
		-- 1 이면 치과
		-- 2 이면 산부인과
		code number
	);
	
	
	CREATE TABLE kizcafe
	(
		k_no number NOT NULL,
		name nvarchar2(100),
		tel nvarchar2(30),
		addr nvarchar2(1000),
		PRIMARY KEY (k_no)
	);
	
	CREATE TABLE review
	(
		rv_no number NOT NULL,
		title nvarchar2(50),
		content nvarchar2(2000),
		score number,
		id varchar2(20) NOT NULL,
		h_no number,
		k_no number,
		PRIMARY KEY (rv_no)
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
		--photo varchar2(300) NOT NULL,
		-- 이메일 인증 키 입니다.
		authkey nvarchar2(50),
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
		-- 계약이 완료되었는지 판단하는 컬럼입니다
		-- 0이면 아직 진행중, 1이면 완료되어 완료테이블에서 조회 가능합니다.
		finish char(1) DEFAULT '0' CONSTRAINTS finish_CK CHECK (finish = '0' OR finish = '1'),
		id varchar2(20) NOT NULL,
		cp_no number NOT NULL,
		PRIMARY KEY (rs_no)
	);
	
	CREATE TABLE VISIT (V_DATE DATE);
	
	
	
	/* Create Foreign Keys */
	
	ALTER TABLE reservation
		ADD FOREIGN KEY (cp_no)
		REFERENCES carpool_border (cp_no)
	    on delete cascade
	;
	
	ALTER TABLE review
		ADD FOREIGN KEY (h_no)
		REFERENCES hospital (h_no)
	    on delete cascade
	;
	
	ALTER TABLE review
		ADD FOREIGN KEY (k_no)
		REFERENCES kizcafe (k_no)
	    on delete cascade
	;
	
	
	ALTER TABLE calender 
		ADD FOREIGN KEY (id)
		REFERENCES members (id)
	    on delete cascade
	;
	
	
	ALTER TABLE carpool_border 
		ADD FOREIGN KEY (id)
		REFERENCES members (id)
	    on delete cascade
	;
	
	
	ALTER TABLE partner_members
		ADD FOREIGN KEY (id)
		REFERENCES members (id)
	    on delete cascade
	;
	
	
	ALTER TABLE reservation
		ADD FOREIGN KEY (id)
		REFERENCES members (id)
	    on delete cascade
	;
	
	
	ALTER TABLE review
		ADD FOREIGN KEY (id)
		REFERENCES members (id)
	    on delete cascade
	;
	
	-- 트리거
	
	CREATE TRIGGER TRG_RESER
	AFTER INSERT OR DELETE
	ON reservation
	FOR EACH ROW --행단위 트리거
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
	/
	
	
	-- 관리자 아이디넣기
	insert into members values('admin','asd123!@#','관리자','주소','이메일','01012345678','인증키','1',1,default);
	
	-- 카풀 게시판
	
	insert into members values('lee','1234','이길동','천호동','adf@nate.com','01012345678',0,1,0,default);
	insert into members values('kim','1234','김길동','천호동','adf@nate.com','01012345678',0,1,0,default);
	insert into members values('park','1234','박길동','천호동','adf@nate.com','01012345678',0,1,0,default);
	insert into members values('choi','1234','최길동','천호동','adf@nate.com','01012345678',0,1,0,default);
	
	insert into carpool_border values(10,'강남역','역삼역','태워주세요','연락처 010-1234-5678',37.498184,127.028484,37.500474,127.036082,'lee',0,sysdate,10000,'0');
	insert into carpool_border values(11,'강남역','역삼역','태워주세요','연락처 010-1234-5678',37.498184,127.028484,37.500474,127.036082,'park',0,sysdate,10000,'0');
	insert into carpool_border values(12,'강남역','역삼역','태워주세요','연락처 010-1234-5678', 37.498184,127.028484,37.500474,127.036082,'choi',0,sysdate,10000,'0');
	
	--insert into reservation values(1,0,'0','lee',10);
	--insert into reservation values(2,0,'0','park',11);
	--insert into reservation values(3,0,'0','choi',12);
	
	insert into baby_border(no,title,url,thumbnail) values(1,'설명 아직 미정','https://www.youtube.com/watch?v=gcAbeTWjHvQ','http://img.youtube.com/vi/gcAbeTWjHvQ/mqdefault.jpg');
	insert into baby_border(no,title,url,thumbnail) values(2,'설명 아직 미정','https://www.youtube.com/watch?v=pe1asLzVQBQ','http://img.youtube.com/vi/pe1asLzVQBQ/mqdefault.jpg');
	insert into baby_border(no,title,url,thumbnail) values(3,'설명 아직 미정','https://www.youtube.com/watch?v=IDPPkozCxOw','http://img.youtube.com/vi/IDPPkozCxOw/mqdefault.jpg');
	insert into baby_border(no,title,url,thumbnail) values(4,'설명 아직 미정','https://www.youtube.com/watch?v=2ktbTawmR28','http://img.youtube.com/vi/2ktbTawmR28/mqdefault.jpg');
	insert into baby_border(no,title,url,thumbnail) values(5,'설명 아직 미정','https://www.youtube.com/watch?v=krbcaUy8K24','http://img.youtube.com/vi/krbcaUy8K24/mqdefault.jpg');
	insert into baby_border(no,title,url,thumbnail) values(6,'설명 아직 미정','https://www.youtube.com/watch?v=Z0usnVLGWtM','http://img.youtube.com/vi/Z0usnVLGWtM/mqdefault.jpg');
	insert into baby_border(no,title,url,thumbnail) values(7,'설명 아직 미정','https://www.youtube.com/watch?v=FqFmMFrRWew','http://img.youtube.com/vi/FqFmMFrRWew/mqdefault.jpg');
	insert into baby_border(no,title,url,thumbnail) values(8,'설명 아직 미정','https://www.youtube.com/watch?v=M4x-SWwc6dI','http://img.youtube.com/vi/M4x-SWwc6dI/mqdefault.jpg');
	insert into baby_border(no,title,url,thumbnail) values(9,'설명 아직 미정','https://www.youtube.com/watch?v=ZnLQKTXAtMs','http://img.youtube.com/vi/ZnLQKTXAtMs/mqdefault.jpg');
	
	alter trigger TRG_RESER enable;
	
	commit;
	
	purge recyclebin;
>>>>>>> branch 'CSJ' of https://github.com/wkiio/teamProj.git
