/*
  # 정규화
  1. 정규화와 이상현상
  	1) 이상 현상
  		불필요한 데이터의 중복으로 인해 릴레이션(테이블 연관관계)에 대한 데이터의 삽입, 수정, 삭제 연산을 수행할 때
  		발생하는 부작용을 말한다.
  	2) 정규화 과정
  		이러한 이상 현상을 제거하면서, 데이터베이스를 무결성있게 설계해 나가는 과정을 말한다.
  2. 이상 현상의 종류
  		- 삽입 이상: 새 데이터를 삽입하기 위해 불필요한 데이터도 함께 삽입해야 하는 문제
  			ex) empdept(통합테이블)의 경우
  				부서나 사원정보 중 하나만 입력하더라도 다른 정보를 null로 남겨두거나, 임의로 입력해야하는 상황이 발생함
  		- 갱신 이상: 중복 튜플 중, 일부만 변경하여 데이터가 불일치하게 되는 모습의 문제
  			ex) empdept(통합테이블)에서 부서명을 하나의 사원정보 단위로 수정할 때
  				오타로 공백이나 다른 부서명으로 수정할 시, 부서명이 통일되지 않는 상황 발생
  		- 삭제 이상: 튜플을 삭제하면, 꼭 필요한 데이터까지 삭제되는 데이터 손실의 문제
  			ex) empdept(통합테이블)에서 10부서를 삭제할 때, 연관되어 있는 사원 정보까지 모두 삭제되는 현상이 발생  
  	3. 정규화를 위한 단계적 학습 내용
  		1) 정규화 과정은 이러한 이상 현상을 효과적으로 처리하기 위해 단계별 과정을 가진다.
  		2) 이 과정을 각 단계별로 정규화를 효과적으로 처리하기 위한 내용이고, 이전 과정을 거쳐야 다음 과정을 처리하게 하고 있다.
  		3) 개괄적으로
  			제1정규화
  			제2정규화
  			제3정규화
  			BCNF 정규화
  			제4정규화
  			제5정규화
  			로 구분되는데, 실무적으로는 1~3정규화까지가 가장 많이 활용되고,
  			데이터의 용량과 복잡성에 따라 정규화과정에 의해서 무결성은 보장되지만, 속도이슈 때문에 역정규화 과정을 거치는 경우도 많다.
  		4) 정규화의 핵심을 1~3정규화에서 사용되는 함수 개념부터 확인하여야 한다.
  			- 데이터의 원자성
  			- 완전함수 종속성
  			- 이행적 함수 종속성
  # 제1정규화 처리
  1. 릴레이션의 모든 속성이 더는 분해되지 않는 원자값만 가지면 제1정규형을 만족한다.
  2. 제1정규형을 만족해야 관계 데이터베이스의 릴레이션이 될 자격이 있다.
 */
-- 제1정규화 전 테이블
CREATE TABLE nomalForm00(
	cu_id varchar2(50),	-- 고객 id
	event_no varchar2(100),	-- 이벤트 num
	ck_yn varchar2(50),	-- 당첨 여부
	grade varchar(10),	-- 등급
	discount NUMBER(4,2)	-- 할인율
);

INSERT INTO nomalForm00 values(
	'apple','E001,E005,E010','Y,N,Y','gold',0.1
);
INSERT INTO nomalForm00 values(
	'banana','E002,E005','N,Y','vip',0.1
);
INSERT INTO nomalForm00 values(
	'carrot','E003,E007,E010','Y,Y','gold',0.1
);
INSERT INTO nomalForm00 values(
	'orange','E004','N,Y','silver',0.1
);
-- ex) 제1정규화 테이블로 nomalForm01 테이블을 만들고 데이터 입력
