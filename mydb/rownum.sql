-- ROWNUM : 순번을 정해놓은 SUDO COLUMN 이다.
-- 조회되는 행의 수를 제한할때 사용
SELECT ROWNUM, bno, title, writer, content
FROM board
WHERE ROWNUM > 0 AND ROWNUM <= 10
-- WHERE ROWNUM > 10 AND ROWNUM <= 20 -> 1을 포함해야 조회됨
ORDER BY bno;

-- 11 ~ 20번 까지 검색
SELECT * FROM
(SELECT ROWNUM RN, bno, title, writer, content
FROM board)
WHERE RN > 11 AND RN <= 20; -- 별칭(RN)을 사용해야 함

-- ROWNUM의 올바른 사용
CREATE TABLE EX_SCORE(
    NAME    VARCHAR2(10),
    SCORE   NUMBER
);

INSERT INTO EX_SCORE VALUES ('김하나', 94);
INSERT INTO EX_SCORE VALUES ('이하나', 100);
INSERT INTO EX_SCORE VALUES ('박하나', 97);
INSERT INTO EX_SCORE VALUES ('정하나', 87);
INSERT INTO EX_SCORE VALUES ('조하나', 87);
INSERT INTO EX_SCORE VALUES ('안하나', 91);
INSERT INTO EX_SCORE VALUES ('유하나', 66);
INSERT INTO EX_SCORE VALUES ('오하나', 80);
INSERT INTO EX_SCORE VALUES ('한하나', 80);
INSERT INTO EX_SCORE VALUES ('성하나', 95);

SELECT * FROM EX_SCORE;

-- 점수가 높은 순으로 5명 검색 (잘못된 사용)
SELECT ROWNUM, NAME, SCORE
FROM EX_SCORE
WHERE ROWNUM <= 5
ORDER BY SCORE DESC;

-- 점수가 높은 순으로 5명 검색 (올바른 사용)
-- 내부쿼리(서브쿼리) 사용
SELECT ROWNUM, NAME, SCORE FROM
(SELECT ROWNUM, NAME, SCORE
 FROM EX_SCORE
 ORDER BY SCORE DESC)
WHERE ROWNUM <= 5;

-- 성적 순위
SELECT NAME,
       SCORE,
       -- COUNT(*) 학생수
       RANK() OVER(ORDER BY SCORE DESC) RANK,
       DENSE_RANK() OVER(ORDER BY SCORE DESC) DENSE_RANK
FROM EX_SCORE;

DROP TABLE EX_SCORE;