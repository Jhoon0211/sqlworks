-- 사원 테이블
CREATE TABLE emp(
        -- 칼럼 이름 자료형
        empno   NUMBER(3) PRIMARY KEY,      -- 사원번호
        --SQL에선 VARCHAR2를 씀
        ename   VARCHAR2(20) NOT NULL,       -- 사원명
        sal     NUMBER(10),                 -- 급여
        hire_date   DATE DEFAULT SYSDATE    -- 입사일
        );
        
-- 사원의 성별 칼럼 추가 (ALTER ~ ADD)
ALTER TABLE emp ADD gender VARCHAR2(4);

-- ename의 자료형을 변경 (ALTER ~ MODIFY)
ALTER TABLE emp MODIFY gender VARCHAR2(10);
        
-- 사원 추가
-- 사원 테이블
INSERT INTO emp VALUES (100, '이강', 2500000, SYSDATE);
INSERT INTO emp VALUES (101, '김산', 3000000, SYSDATE);
INSERT INTO emp VALUES (102, '오상식', 5000000, SYSDATE);
INSERT INTO emp VALUES (103, '박신입', '', SYSDATE);
INSERT INTO emp VALUES (104, '서울시', 1500000, SYSDATE, '여');

-- 사원번호, 사원이름, 급여를 검색하시오
SELECT empno as 사번, ename as 사원명, sal as 급여 FROM emp;

-- 급여가 없는 사원을 검색하시오
SELECT *
FROM emp
WHERE sal IS NULL;

-- 급여가 있는 사원을 검색하시오
SELECT *
FROM emp
WHERE sal IS NOT NULL;

-- 급여가 300만원 이하인 사원을 검색하시오
SELECT *
FROM emp
WHERE sal <= 3000000;
ORDER BY sal DESC;-- 사원 테이블        
        
-- 급여가 300만원 이하인 사원을 급여가 많은 순서로 정렬하시오
SELECT *
FROM emp
WHERE sal <= 3000000
ORDER BY sal DESC;

-- 급여가 많은 순서로 정렬하시오
SELECT *
FROM emp
ORDER BY sal DESC;

-- 사원의 전체 수를 구하시오
SELECT COUNT(*) as 사원수
FROM emp;

-- 사원 급여의 총 합계와 평균을 구하시오
SELECT SUM(sal) 급여합계, AVG(sal) 급여평균
FROM emp;

-- 이름이 서울시인 사원을 검색하시오
/*SELECT * FROM emp
WHERE empno = 104;*/

-- 성별이 '여'인 사원을 '여자'로 변경하시오 (UPDATE) - 자료수정
UPDATE emp
SET gender = '여자'
WHERE empno = 104;

-- 이름이 서울시인 사원 삭제 (퇴사)
DELETE FROM emp
WHERE ename = '서울시';

-- 사원 조회
SELECT * FROM emp;

-- 입력
COMMIT;

-- COMMIT 전이면 복원 가능 (뒤로가기 ctrl + z)
ROLLBACK;


