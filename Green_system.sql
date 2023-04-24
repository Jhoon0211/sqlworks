-- bookmall

SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;

-- JOIN (동등조인 - EQUI JOIN) - 공통된 부분 (교집합, AND)
-- 고객과 고객의 주문에 도서의 판매가격을 구하시오
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
ORDER BY cus.name;

-- '박지성' 고객이 주문한 도서의 판매가격을 구하시오
-- ORDER BY 필요없음
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
    AND cus.name = '박지성';

-- 고객별로 주문한 모든 도서의 총 판매액을 구하시오(GROUP BY절, SUM() 함수)
SELECT cus.name, SUM(saleprice)
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name;

-- '안산' 고객이 주문한 모든 도서의 총 판매액을 구하시오(GROUP BY절, SUM() 함수)
-- GROUP BY에서 조건 추가할 때는 HAVING 구문 사용
SELECT cus.name, SUM(saleprice) 판매금액
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name
HAVING cus.name = '안산';

-- 표준 SQL - INNER JOIN ON~
SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
     ON cus.custid = ord.custid
     ORDER BY cus.name;
     
-- 3개 테이블 조인
SELECT cus.name, bk.bookname, ord.saleprice
FROM customer cus, orders ord, book bk
WHERE cus.custid = ord.custid
     AND bk.bookid = ord.bookid;
     
-- '박지성' 고객이 주문한 도서의 판매가격을 구하시오
-- ORDER BY 필요없음
SELECT cus.name, bk.bookname, ord.saleprice, ord.orderdate
FROM customer cus, orders ord, book bk
WHERE cus.custid = ord.custid
     AND bk.bookid = ord.bookid
     AND cus.name = '박지성';

-- '박지성' 고객이 주문한 도서의 판매가격을 구하시오
-- ORDER BY 필요없음, AND나 WHERE 상관없음
SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
     ON cus.custid = ord.custid
     AND cus.name = '박지성';


-- 외부조인 ('+' 연산자 사용) : JOIN 조건에 충족하는 데이터가 아니어도 검색하는 방식
-- WHERE 절에서 모든 행(cus,name)이 출력되는 (null 포함)
-- 테이블의 반대편 테이블(ord.saleprice)에 '+'를 붙임
-- 주문이 없는 고객을 포함하여 고객의 이름과 주문한 도서의 판매가격을 찾으시오
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid(+);

-- 표준SQL - LEFT OUTER JOIN ON ~
SELECT cus.name, ord.saleprice
FROM customer cus LEFT OUTER JOIN orders ord
     ON cus.custid = ord.custid
     ORDER BY cus.name;
