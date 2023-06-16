/*
 * 
 * 
 * 
# check
1. 특정 컬럼에 조건이나 범위를 지정해서,
	해당 범위에 데이터만 입력되도록 처리하는 것을 말한다.
2. 형식
	컬럼명 데이터유형 constraint 제약명 check(조건데이터-where문하위 sql)
	컬럼명 데이터유형 check(제약조건 내용)	
 * */
CREATE TABLE student06(
	gender varchar2(1) CONSTRAINT student05_gender_ck 
		check(gender IN('F','M'))
);
INSERT INTO student06 values('F');
INSERT INTO student06 values('M');
INSERT INTO student06 values('남');
INSERT INTO student06 values('여자');
INSERT INTO student06 values('F');
INSERT INTO student06 values(null);
INSERT INTO student06 values('F');
--ex) student07 테이블을 생성해서
--  sno(프라이머리 키), 이름, 
--   성별(남/여), 국어(0~100),영어(0~100),수학(0~100)
-- 한글-3byte
CREATE TABLE student07(
   sno number primary key,
   name varchar2(30),
   gender char(3) constraint student07_gender_ck 
           check( gender in('남','여')),
   kor NUMBER(3) check(kor BETWEEN 0 AND 100),
   eng NUMBER(3) check(eng BETWEEN 0 AND 100),
   math NUMBER(3) check(math BETWEEN 0 AND 100)
);
INSERT INTO STUDENT07 values(1001, '홍길동','남',100,80,90);
INSERT INTO STUDENT07 values(1002, '김길동','여',80,90,100);
INSERT INTO STUDENT07 values(1003, '마길동','MAN',90,80,100);
INSERT INTO STUDENT07 values(1004, '오길동',null,100,90,10);
INSERT INTO STUDENT07 values(1005, '하길동',null,90,80,90);
INSERT INTO STUDENT07 values(1006, '하길동',null,120,90,90);
SELECT * FROM STUDENT07;
/*
# 외래키 설정 관계(foreign key)
1. 연관관계 있는 두 테이블에 대하여, 한쪽 테이블에 있는 데이터 기준으로
다른 테이블의 데이터를 입력할 수 있게 하는 것을 말한다.
	ex) dept테이블의 deptno만 emp테이블에 입력가능하게 처리.
2. 기본 형식
	컬럼명 데이터유형 constraint 테이블명_컬럼명_fk 
		references 대상테이블명(컬러명)
 * */
CREATE TABLE teacher01(
	tno NUMBER PRIMARY key
);
INSERT INTO teacher01 values(10);
INSERT INTO teacher01 values(20);
INSERT INTO teacher01 values(30);
SELECT * FROM teacher01;
CREATE TABLE student08(
	name varchar2(10),
	tno NUMBER CONSTRAINT student08_tno_fk
		REFERENCES teacher01(tno)
);
INSERT INTO student08 values('홍길동',10);
INSERT INTO student08 values('김길동',20);
INSERT INTO student08 values('신길동',30);
INSERT INTO student08 values('오길동',40);
SELECT * FROM student08;
/*
ex) 물건테이블(물건번호, 물건명, 가격, 재고량)
    구매테이블(구매번호, 구매수량, 물건번호-외래키설정)
 * */
CREATE TABLE product001(
   pno NUMBER PRIMARY KEY,
   pname varchar2(20),
   price NUMBER,
   rcnt NUMBER -- 재고량과 구매수량을 컬럼명을 구분해서 설정을 할 수 있도록 한다.
);
INSERT INTO product001 values(1,'사과',2000,3);
INSERT INTO product001 values(2,'수박',8000,2);
INSERT INTO product001 values(3,'바나나',3000,7);
CREATE TABLE pbuy(
   bno NUMBER,
   bcnt NUMBER,
   pno NUMBER CONSTRAINT pbuy_pno_fk 
   	REFERENCES product001(pno)
);
INSERT INTO pbuy VALUES(10,2,1);
INSERT INTO pbuy VALUES(20,4,2);
INSERT INTO pbuy VALUES(30,1,4); -- 에러발생.
-- 구매한 물건정보
SELECT pname, price "판매가격", bcnt "구매갯수",
		price*bcnt "총계", rcnt-bcnt "현재고량"
FROM product001 p, pbuy b
WHERE p.pno = b.pno;






