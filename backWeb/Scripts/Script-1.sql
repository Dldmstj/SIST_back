-- ex) emp11로 부서명, 사원명, 직책, 급여로 복사테이블 생성.
-- 		bonus컬럼 추가하고, default데이터 0 입력

CREATE table emp11
AS SELECT deptno, ename, job, sal FROM emp;

ALTER TABLE emp11
ADD bonus NUMBER DEFAULT 0;

SELECT * FROM emp11;

/*
 # 주의
 1) 오라클에서는 안타깝게도 컬럼명의 위치는 변경이 불가능
 2) 복사테이블 만들시, constraint는 복사가 되지 않으니 constraint 위 alter명령에 의해 제약조건을 처리해야 함 
 */