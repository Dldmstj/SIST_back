/*
# 계층적 질의문
1. 데이터베이스를 처리하면서 여러가지 업무 처리에 따라 테이블을 구성할 수 있는데, 간혹 계층적으로
	하나의 테이블 안에 처리가 필요한 경우가 나타난다.
2. 게시물에 답글을 계층적으로 달아야 하는 경우, 직급에 있어서 상위 관리자와 하위 관리자를 구분하여 처리하는 경우
	메뉴항목에 있어서 상위 메뉴와 하위 메뉴를 처리하여야 하는 경우 등, 여러가지 경우가 발생한다.
3. 이 때, 간혹 여러 테이블을 만들어서 계층적으로 처리하는 경우도 있지만, 계층적으로 하나의 테이블에 데이터를 처리하고
	오라클에서 사용하는 계층적 질의문을 처리하면 원하는 데이터가 계층적으로 출력되는 경우가 많다.
4. 계층적 질의문을 위한 테이블 구조
	1) 계층적 질의문 처리를 위해서는 테이블의 특정 컬럼의 계층구조가 되어있어야 한다.
		우리가 많이 아는 emp테이블의 empno와 mgr이 전형적인 계층적 구조를 가진 컬럼구조로, empnodhk
		mgr은 사원번호와 관리자번호라는 관계가 다시 mgr은 empno에 연결관계가 있기 때문이다.
		결국, 최상위 관리자의 mgr분윙
	
5. 계층적 질의문의 기본 형식
	1) select 명령문에서 start with와 connect by 절 이용
	2) 계층적 질의문에는 계층적인 출력 형식과 시작위치 제어
	3) 출력 형식은 top-down 또는 bottom-up 방식이 있다
	4) 사용코드
		select level, 컬럼명
		from 테이블명
		where 조건
		start with 조건1
		connect by prior 조건2
		
		level : 계층 레벨을 가져온다. 위 공과대학은 1level 멀티미디어학과는 3level을 가져온다.
		조건1: 계층구조가 시작하는 조건을 말한다. 테이블의 여러 계층이 있더라도 최상위에서 시작할 수도 있고,
			중간계층에서 시작할 수 있기 때문이다.
		조건2: 계층구조에서 상위와 하위를 연결하는 컬럼을 말한다.
			emp의 경우 empno = mgr, 위학과 정보의 경우 deptno 와 col을 들 수 있다.
6. 계층적 질의문의 옵션
7. 여러가지 적용 예시
 
 */
CREATE SEQUENCE scott.pt01_seq
INCREMENT BY 1
START WITH 100
MINVALUE 100
MAXVALUE 999;

CREATE TABLE part01 (
	deptno NUMBER PRIMARY key,
	dname varchar2(50),
	col number
);

INSERT INTO part01 values(pt01_seq.nextval,'공과대학',null);
INSERT INTO part01 values(pt01_seq.nextval,'정보미디어학부',100);
INSERT INTO part01 values(pt01_seq.nextval,'메카트로닉스학부',100);
INSERT INTO part01 values(pt01_seq.nextval,'컴퓨터공학과',101);
INSERT INTO part01 values(pt01_seq.nextval,'멀티미디어학과',101);
INSERT INTO part01 values(pt01_seq.nextval,'전자공학과',102);
INSERT INTO part01 values(pt01_seq.nextval,'기계공학과',102);

SELECT * FROM part01;

SELECT LEVEL, p.*
FROM PART01 p
START WITH deptno=100
CONNECT BY PRIOR deptno = col;