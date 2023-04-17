-- bookmall ���� ���̺�
SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;

-- ���� �ֹ��� ������ �� �Ǹž�
SELECT SUM(saleprice) ���Ǹž�
FROM orders;



-- ���� ���Ǹž� ���, �Ұ�, �Ѱ� ���ϱ�
-- ROLLUP(), CUBE()
-- CUBE () �μ��� ������ �Ѱ�
SELECT custid, bookid,
       SUM(saleprice) ���Ǹž�
FROM orders
GROUP BY ROLLUP (custid, bookid);

-- GROUPING SETS()
SELECT custid, bookid,
       SUM(saleprice) ���Ǹž�
FROM orders
GROUP BY GROUPING SETS(custid, bookid)
ORDER BY custid, bookid;

