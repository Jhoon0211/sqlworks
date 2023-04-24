-- 대한민국에 거주하는 고객의 이름과 도서를 주문한 고객의 이름 검색
-- join을 쓰지 않고 union을 사용
-- 대한민국에 거주하는 고객의 이름
SELECT * FROM customer;

SELECT name as 고객명
FROM customer
WHERE address LIKE '%대한민국%';

-- 도서를 주문한 고객의 이름 검색
SELECT name as 고객명
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;

-- 집합 연산 (더하기) 
SELECT name as 고객명
FROM customer
WHERE address LIKE '%대한민국%'
UNION
SELECT name as 고객명
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;