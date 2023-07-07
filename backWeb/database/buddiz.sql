--=========================회원===================
CREATE TABLE BUser(
   ID varchar2(16) PRIMARY KEY,
   N_NAME varchar2(18),
   PASS varchar2(16),
   B_DAY varchar2(6) NOT NULL,
   MAIL varchar2(30),
   P_NUM varchar2(11) 
);

DROP TABLE BUser;

SELECT * FROM BUser;


INSERT INTO BUser VALUES('kkw01','경웅','111111111','980714','rkd@naver.com','01011112222');
INSERT INTO BUser VALUES('ysm01','석민','222222222','980309','tjrals@naver.com','01033334444');
INSERT INTO BUser VALUES('kya01','윤아','333333333','000912','dbsdk@naver.com','01055556666');
INSERT INTO BUser VALUES('syr01','유림','444444444','981123','dbfla@naver.com','01077778888');


--=========================게시물===================

CREATE TABLE POST (
    POST_ID NUMBER PRIMARY KEY,
    ID varchar2(16) ,
    P_TEXT VARCHAR2(1000) NOT NULL,
    P_TIME DATE NOT NULL,
    TAG_ID NUMBER,
   FOREIGN KEY (ID) REFERENCES BUser (ID)
);


SELECT * FROM POST;

INSERT INTO POST values(1,'syr01','오늘 s날씨 너무 더워서 수영도 못가겠다...',to_date(sysdate,'YYYY-MM-DD'),1);
INSERT INTO POST values(2,'kya01','스피닝 처음 다녀왔어요. 진짜 힘들지만 꾸준히 하면 근육도 생길 것 같아요. 성취감이 좋네요',to_date(sysdate,'YYYY-MM-DD'),2);
INSERT INTO POST values(3,'kkw01','베이스 수업 2일차 입니다. 낭만 있어~',to_date(sysdate,'YYYY-MM-DD'),3);
INSERT INTO POST values(4,'ysm01','여자친구 주려고 목도리 떴습니다',to_date(sysdate,'YYYY-MM-DD'),4);




SELECT DISTINCT POST.POST_ID, POST.P_TEXT, POST.P_IMG, POST.P_TIME, BUser.ID, COM_MENT.COMMENT_ID, COM_MENT.C_TEXT, TAG.TAG_ID, TAG.T_TEXT
FROM POST
JOIN BUser ON POST.ID = BUser.ID
JOIN COM_MENT ON POST.POST_ID = COM_MENT.POST_ID
JOIN TAG ON POST.POST_ID = TAG.TAG_ID;


--=========================댓글===================

CREATE TABLE COM_MENT(
   COMMENT_ID NUMBER PRIMARY KEY,
   ID varchar2(16) ,
   POST_ID NUMBER(30),
   C_TEXT varchar2(300),
   C_TIME DATE NOT NULL,
   FOREIGN KEY (ID) REFERENCES BUser (ID),
   FOREIGN KEY (POST_ID) REFERENCES POST (POST_ID)
);


SELECT * FROM COM_MENT;

INSERT INTO COM_MENT values(1,'syr01',2,'와~ 드디어 상급반 올라가셨군요 멋져용ㅠㅠ',to_date(sysdate,'YYYY-MM-DD'));

--=========================태그===================

CREATE TABLE TAG (
    TAG_ID NUMBER PRIMARY KEY,
    ID varchar2(16) ,
    T_TEXT VARCHAR2(30) NOT NULL,
    FOREIGN KEY (ID) REFERENCES BUser (ID)
);
SELECT * FROM TAG;
INSERT INTO TAG values(1,'syr01','운동');
INSERT INTO TAG values(1,'syr01','운동');
INSERT INTO TAG values(1,'syr01','운동');
INSERT INTO TAG values(1,'syr01','운동');

--=========================좋아요===================

CREATE TABLE LIKE_ (
    LIKE_ID NUMBER PRIMARY KEY,
    POST_ID NUMBER,
    ID varchar2(16) ,
    L_TIME DATE NOT NULL,
    FOREIGN KEY (POST_ID) REFERENCES POST (POST_ID),
      FOREIGN KEY (ID) REFERENCES BUser (ID)
);
SELECT * FROM LIKE_;

INSERT INTO LIKE_ values();

--=========================채팅방===================
CREATE TABLE ROOM (
    ROOM_ID NUMBER PRIMARY KEY,
    ID varchar2(16) ,
    ROOM_NAME VARCHAR2(30),
    R_TIME DATE NOT NULL,
    R_YN NUMBER NOT NULL,
    FOREIGN KEY (ID) REFERENCES BUser (ID)
);

SELECT * FROM ROOM;
INSERT INTO ROOM values();

--=========================채팅 내용===================
CREATE TABLE CHATTING (
    CHAT_ID NUMBER PRIMARY KEY,
    ROOM_ID NUMBER,
    ID varchar2(16) ,
    C_TEXT VARCHAR2(600),
    C_TIME DATE NOT NULL,
    FOREIGN KEY (ROOM_ID) REFERENCES ROOM (ROOM_ID),
    FOREIGN KEY (ID) REFERENCES BUser (ID)
);

SELECT * FROM CHATTING;

INSERT INTO CHATTING values();

--=========================친구목록===================
CREATE TABLE FRIEND (
    FRIEND_ID NUMBER PRIMARY KEY,
    ID varchar2(16) ,
    F_ID varchar2(16),
    F_YS NUMBER,
    FOREIGN KEY (ID) REFERENCES BUser (ID)
);

SELECT * FROM FRIEND;

INSERT INTO FRIEND values();
 

--===========================JOIN문==================
-- 
SELECT *
FROM POST p
INNER JOIN BUser b
ON b.id = '%%';

SELECT *
FROM POSTS AS p
INNER JOIN TAG AS t
ON t.TAG_ID = ? ;
--==========================DROP문===================
DROP TABLE BUser;
DROP TABLE POST;
DROP TABLE COM_MENT;
DROP TABLE LIKE_;
DROP TABLE TAG;

