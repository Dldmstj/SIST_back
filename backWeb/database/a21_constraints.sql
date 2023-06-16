/*
 * 
 * 
# 데이터 무결성 제약조건
1. 데이터의 정확성과 일관성을 보장
2. 데이터의 정확성을 유지하여 다양한 종류의 업무규칙을 고려함
	1) student테이블에서 학년 데이터는 1,2,3,4, 중의 하나만 입력
	2) 모든 학번은 유일하게 처리
	3) student테이블의 지도 교슈 번호는 professor 테이블의
		교수번호 중의 하나와 반드시 일치
3. 데이터 무결성 제약조건의 장점
	1) 테이블 생성시 무결성 제약조건을 정의 가능
		- 생성 후 제약조건 변경이나 설정도 가능
	2) 테이블에 대해 정의, 데이터 딕션너리에 저장되므로
		응용프로그램에서 입력되는 모든 데이터에 대하여 동일하게 적용
	3) 제약조건을 활성화, 비활성화 할 수 있어 융통성 있게 사용 가능
4. 무결성 제약조건의 종류
	1) not null : 데이터에 null을 포함할 수 없음.
				  행단위로 입력시 해당 열은 반드시 입력되어야 처리가 된다.
	2) unique key : 테이블의 모든 행에서 고유한 값을 갖는 열 또는
		열 조합을 지정해야 한다. ex) 학번, 주민번호, 사원번호를
		중복되지 않아야 한다.
		ps) null은 입력이 가능하고, 여러가지 null은 중복이 가능..
	3) primary key : 해당 컬럼 값은 받드시 존재하며 유일해야 한다.
		not null과 unique가 결합된 형태
		주로 테이블에서 식별해야할 컬럼 즉, key를 설정할 때, 사용된다.
		ex) emp 테이블의 empno, dept테이블의 deptno
	4) foreign key : 한 열과 참조된 테이블의 열간의 외래 키 관계를
		설정하고 시행
		ex) 사원 테이블의 부서번호는 반드시 부서테이블에 있는 부서번호
			이어야 한다.
	5) check : 해당 컬럼에 저장 가능한 데이터 범위나 조건을 지정처리
		ex) student테이블의 학년은 1,2,3,4만 데이터로 넣을 수 있다.
5. 설정 형식
	1) 컬럼명 데이터타입 constraints 제약조건명 제약조건
		제약조건명 : 테이블명_컬럼명_제약조건종류
	2) primary key 지정
	
	ex) create table student(
	       stuno number constraint student_stunno_pk primary key
	    );
		제약조건 이름 : 테이블명_컬럼명_제약조건종류
			제약조건 종류 : pk, uq, nn, fk
	    이런 제약조건 사항는 sys.all_constraints : DB시스템에 있는
	    제약조건 메타테이블에서 확인할 수 있다.	
 * */
-- 사원 정보의 제약 조건 테이블에서 확인해보기
SELECT *
FROM  sys.all_constraints
WHERE table_name LIKE 'EMP';
-- # not null 제약 조건 설정
CREATE TABLE student03(
	name varchar2(30) CONSTRAINT student03_name_nn NOT null
);
SELECT *
FROM  sys.all_constraints
WHERE table_name = 'STUDENT03';
INSERT INTO student03 values('홍길동');
INSERT INTO student03 values('김길동');
INSERT INTO student03 values('오길동');
SELECT * FROM student03;
INSERT INTO student03 values(null);
-- ex) student04테이블로 학생번호(숫자), 이름, 국어,영어,수학
--    테이블을 만들면서, 학생번호와 이름을 not null로
--    제야조건을 만들고, 등록/조회/확인해보자.
CREATE TABLE student04(
   stuno number(8) CONSTRAINT student04_stuno_nn NOT NULL,
   name varchar2(30) CONSTRAINT student04_name_nn NOT NULL,
   kor NUMBER,
   eng NUMBER,
   math NUMBER
);
SELECT *
FROM  sys.all_constraints
WHERE table_name = 'STUDENT04';
INSERT INTO student04(stuno,name) values(1000,'홍길동');
INSERT INTO student04 values(1001,'김길동',90,80,90);
INSERT INTO student04 values(NULL,'마길동',80,90,100);
INSERT INTO student04 values(1002,null,80,90,100);
SELECT * FROM student04;
-- # unique : 중복되지 않는 유일키만 입력가능, 단 null을 중복 허용
CREATE TABLE employee01(
	empno number(5) CONSTRAINT employee01_empno_uq UNIQUE,
	ename varchar2(30) 
	  CONSTRAINT employee01_ename_nn NOT NULL,
	sal number(5)
);
SELECT *
FROM  sys.all_constraints
WHERE table_name = 'EMPLOYEE01';

INSERT INTO employee01 values(1,'홍길동',1000);
INSERT INTO employee01 values(2,'김길동',2000);
INSERT INTO employee01(empno,ename) values(3,'마길동');
INSERT INTO employee01 values(3,'오길동',4000);
-- 동일한 사원 정보 입력시 에러
INSERT INTO employee01 values(null,'하길동',4000);
INSERT INTO employee01(ename, sal) values('신길동',5000);
-- NULL을 동일하여도 에러발생하지 않음..
SELECT * FROM employee01;
SELECT *
FROM  sys.all_constraints
WHERE table_name = 'EMPLOYEE01';
-- # primary key : not, unique를 동시에 처리할 수 있는 제약으로
--   일반적으로 행단위 식별 컬럼을 지정할 때, 사용된다.
CREATE TABLE EMPLOYEES02(
	empno number(4) PRIMARY KEY  -- 제약조건을 자동 설정
);
-- SYS_C007097
CREATE TABLE employees03(
	empno number(4) CONSTRAINT employees03_empno_pk PRIMARY key
);
SELECT *
FROM  sys.all_constraints
WHERE table_name in( 'EMPLOYEES02','EMPLOYEES03');
INSERT INTO EMPLOYEES02 values(1000);
INSERT INTO EMPLOYEES02 values(1001);
INSERT INTO EMPLOYEES02 values(1001);
INSERT INTO EMPLOYEES02 values(1002);
INSERT INTO EMPLOYEES02 values(null);
SELECT * FROM EMPLOYEES02;
--  ex) product02 테이블에  pid(물건 식별자-),
--         물건명(not null), 가격 설정하여  sys.all_constraints
--      테이블 확인, 입력 처리하세요.
CREATE TABLE product02(
	pid NUMBER CONSTRAINT product02_pid_pk PRIMARY key,
	name varchar2(50) NOT NULL,
	price number
);



SELECT *
FROM  sys.all_constraints
WHERE table_name = 'PRODUCT02';
INSERT INTO product02 values(1000, '사과',3000);
INSERT INTO product02 values(1000, '바나나',2000);
INSERT INTO product02 values(null, '수박',15000);
INSERT INTO product02 values(1002, null,5000);
INSERT INTO product02 values(1002, '오렌지',2000);
SELECT * FROM product02;
-- ex) sequence 예제  1100으로 시작하는 sequence을 만들어서
--  product02 테이블에 10개 데이터를 입력 처리하세요..
CREATE SEQUENCE seq1100
	START WITH 1100;
INSERT INTO product02 values(seq1100.nextval,'과일',NULL);
-
