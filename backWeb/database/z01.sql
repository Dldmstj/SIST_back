--[1단계:개념] 1. 제약조건의 각각의 특징을 기본 예제를 통해서 설정하고 확인하세요.
-- 1. NOT NULL
select * from COMPANY01;
CREATE TABLE COMPANY01(
   comName varchar2(30) CONSTRAINTS COMPANY01_comName_nn NOT null
);
INSERT INTO COMPANY01 values(null);

-- 2. UNIQUE
-- 키값이 중복 되면안되지만 null일 경우에는 사용이 가능하다.
CREATE TABLE COMPANY02(
   comNo number(5) CONSTRAINTS COMPANY01_empno_uq UNIQUE,
   comName varchar2(30) CONSTRAINTS employee01_comName_nn NOT NULL,
);

INSERT INTO COMPANY02 values(1,'쌍용');
INSERT INTO COMPANY02(comNo) values(1,null);

-- 3. PRIMARY KEY
CREATE TABLE COMPANY03(
   comNo number(5) PRIMARY KEY -- 제약조건을 자동설정
);
CREATE TABLE PERSON01(
   comNo number(5) CONSTRAINT COMPANY03_comNo_pk PRIMARY key
);

-- 4. FOREIGN KEY
CREATE TABLE COMPANY04(
   comName varchar2(10),
   comNo NUMBER CONSTRAINT COMPANY04_comNo_fk
      REFERENCES PERSON01(comNo)
);
INSERT INTO COMPANY04 values(10,'쌍용');
INSERT INTO COMPANY04 values(20,'KIA');
INSERT INTO COMPANY04 values(30,'현대');
INSERT INTO COMPANY04 values(40,'르노');
SELECT * FROM COMPANY04;

-- 5. CHECK
CREATE TABLE COMPANY04(
   gender varchar2(1) CONSTRAINTS student05_gender_ck
      check(gender IN('F','M'))
);
INSERT INTO STUDENT06 values('F');
INSERT INTO STUDENT06 values('M');
INSERT INTO STUDENT06 values('남'); -- error
INSERT INTO STUDENT06 values('여자'); -- error

--[1단계:코드] 2. 쇼핑몰의 회원 정보/구매정보/물품정보를 테이블로 만들 때, 오늘 배운 제약조건 5가지를 통해 만드세요
CREATE TABLE shopping(
uinfo varchar(50) CONSTRAINT shopping_uinfo_PK PRIMARY KEY
   CHECK(uinfo IN('고객','관리자')) NOT NULL,
buyinfo varchar(50) CONSTRAINT shopping_buyinfo_UK UNIQUE,
pinfo varchar(50)
);

CREATE SEQUENCE seq01
   START WITH 1;

INSERT INTO shopping values('고객','과자-'||seq01.nextval,'새우깡');
INSERT INTO shopping values('관리자','과자-'||seq01.nextval,NULL);
SELECT * FROM shopping;

--[1단계:코드] 3. 컴퓨터부품테이블(부품key, 부품명, 가격, 재고량, 부품 설명)만들되,
--sequence를 이용해서 부품key를 설정해서 할당하도록 하세요.
CREATE SEQUENCE parts_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 9999;

CREATE TABLE parts01(
	partkey NUMBER,
	partname varchar2(50),
	partprice NUMBER,
	parncnt NUMBER,
	partexplan varchar2(100)
);

INSERT INTO parts01 values(
parts_seq.nextval, 'cpu',100000,5,'cpu입니다'
);
INSERT INTO parts01 values(
parts_seq.nextval, 'ram',100000,4,'ram입니다'
);

--[1단계:코드] 4. Enrollments라는 테이블을 생성하고, 학생의 학번(student_id)과 수강한 강의의 고유번호(course_id)를 저장하는데, 
--              각각의 값은 Students 테이블과 Courses 테이블의 학번과 고유번호를 참조하는 외래키로 설정되도록 하세요.
-- Students 테이블 생성
CREATE TABLE Students(
   student_id NUMBER PRIMARY KEY,
   sname varchar2(50)
);
-- Students 테이블 데이터 추가
INSERT INTO Students VALUES(1001,'이은서');
INSERT INTO Students VALUES(1002,'서유림');
INSERT INTO Students VALUES(1003,'유영재');
INSERT INTO Students VALUES(1004,'정준혁');
-- Courses 테이블 생성
CREATE TABLE Courses(
   course_id NUMBER PRIMARY KEY,
   cname varchar2(50)
);
-- Courses 테이블 데이터 추가
INSERT INTO Courses VALUES(1001,'국어');
INSERT INTO Courses VALUES(1002,'영어');
INSERT INTO Courses VALUES(1003,'수학');
INSERT INTO Courses VALUES(1004,'과학');
-- Enrollments 테이블 생성(외래키)
CREATE TABLE Enrollments(
student_id NUMBER CONSTRAINT Enrollments_student_id_fk
references Students(student_id),
course_id NUMBER CONSTRAINT Enrollments_course_id_fk
references Courses(course_id)
);
-- Enrollments 테이블 데이터 추가
INSERT INTO Enrollments VALUES(1001,1001);
INSERT INTO Enrollments VALUES(1002,1002);
INSERT INTO Enrollments VALUES(1003,1003);
-- 종합 데이터 조회
SELECT s.student_id "학번",s.sname "이름",c.course_id "강의번호",c.cname "강의명"
FROM Enrollments e, Students s,Courses c
WHERE e.student_id = s.student_id
AND e.course_id = c.course_id;
