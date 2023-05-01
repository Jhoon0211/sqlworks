-- bookmall

SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;

-- JOIN (�������� - EQUI JOIN) - ����� �κ� (������, AND)
-- ���� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
ORDER BY cus.name;

-- '������' ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�
-- ORDER BY �ʿ����
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
    AND cus.name = '������';

-- ������ �ֹ��� ��� ������ �� �Ǹž��� ���Ͻÿ�(GROUP BY��, SUM() �Լ�)
SELECT cus.name, SUM(saleprice)
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name;

-- '�Ȼ�' ���� �ֹ��� ��� ������ �� �Ǹž��� ���Ͻÿ�(GROUP BY��, SUM() �Լ�)
-- GROUP BY���� ���� �߰��� ���� HAVING ���� ���
SELECT cus.name, SUM(saleprice) �Ǹűݾ�
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name
HAVING cus.name = '�Ȼ�';

-- ǥ�� SQL - INNER JOIN ON~
SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
     ON cus.custid = ord.custid
     ORDER BY cus.name;
     
-- 3�� ���̺� ����
SELECT cus.name, bk.bookname, ord.saleprice
FROM customer cus, orders ord, book bk
WHERE cus.custid = ord.custid
     AND bk.bookid = ord.bookid;
     
-- '������' ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�
-- ORDER BY �ʿ����
SELECT cus.name, bk.bookname, ord.saleprice, ord.orderdate
FROM customer cus, orders ord, book bk
WHERE cus.custid = ord.custid
     AND bk.bookid = ord.bookid
     AND cus.name = '������';

-- '������' ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�
-- ORDER BY �ʿ����, AND�� WHERE �������
SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
     ON cus.custid = ord.custid
     AND cus.name = '������';


-- �ܺ����� ('+' ������ ���) : JOIN ���ǿ� �����ϴ� �����Ͱ� �ƴϾ �˻��ϴ� ���
-- WHERE ������ ��� ��(cus,name)�� ��µǴ� (null ����)
-- ���̺��� �ݴ��� ���̺�(ord.saleprice)�� '+'�� ����
-- �ֹ��� ���� ���� �����Ͽ� ���� �̸��� �ֹ��� ������ �ǸŰ����� ã���ÿ�
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid(+);

-- ǥ��SQL - LEFT OUTER JOIN ON ~
SELECT cus.name, ord.saleprice
FROM customer cus LEFT OUTER JOIN orders ord
     ON cus.custid = ord.custid
     ORDER BY cus.name;
