-- function
-- NULL 값 처리하기

-- 테이블 생성
CREATE TABLE K1 (
    ID VARCHAR2(3),
    CNT NUMBER(2)
);


-- 자료 추가
INSERT INTO K1 VALUES('가', 5);
INSERT INTO K1 VALUES('나', NULL);
INSERT INTO K1 VALUES('다', 5);
INSERT INTO K1 VALUES('라', NULL);
INSERT INTO K1 VALUES('다', 10);

-- 자료 수정
UPDATE K1
SET ID = '마'
WHERE CNT = '10';


-- 자료 입력

SELECT * FROM K1;

-- 전체 개수
SELECT COUNT(CNT) FROM K1;  -- 3개

-- NULL을 0으로 바꾼 것
SELECT COUNT(NVL(CNT, 0)) CNT FROM K1;   -- 5

-- 합계
SELECT SUM(NVL(CNT, 0)) / 4 SUM FROM K1; -- 5

-- 평균
SELECT AVG(NVL(CNT, 0)) AVERAGE FROM K1; -- 4

-- 최소값, NULL을 5로 변경
SELECT MIN(NVL(CNT, 5)) AVERAGE FROM K1; -- 5

SELECT *
FROM customer
WHERE phone IS NULL;

SELECT *
FROM orders;

-- NVL(null항목, 'null에 삽입할 항목')- 데이터 삽입은 실질적으로 아니고 표출만 기능
-- NULL이 아니면 칼럼값 출력
SELECT custid, name, address, NVL(phone, '010-1234-5678') phone
FROM customer;

-- RANK() 함수
SELECT ename,
        sal,
        RANK() OVER(ORDER BY sal DESC) 급여_RANK,
        DENSE_RANK() OVER(ORDER BY sal DESC) 급여_DENSE_RANK
FROM employee;




