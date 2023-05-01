-- bookmall 관련 테이블
SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;

-- 고객이 주문한 도서의 총 판매액
SELECT SUM(saleprice) 총판매액
FROM orders;



-- 고객별 총판매액 계산, 소계, 총계 구하기
-- ROLLUP(), CUBE()
-- CUBE () 부서별 도서별 총계
SELECT custid, bookid,
       SUM(saleprice) 총판매액
FROM orders
GROUP BY ROLLUP (custid, bookid);

-- GROUPING SETS()
SELECT custid, bookid,
       SUM(saleprice) 총판매액
FROM orders
GROUP BY GROUPING SETS(custid, bookid)
ORDER BY custid, bookid;

