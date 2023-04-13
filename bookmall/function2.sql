-- function
-- NULL �� ó���ϱ�

-- ���̺� ����
CREATE TABLE K1 (
    ID VARCHAR2(3),
    CNT NUMBER(2)
);


-- �ڷ� �߰�
INSERT INTO K1 VALUES('��', 5);
INSERT INTO K1 VALUES('��', NULL);
INSERT INTO K1 VALUES('��', 5);
INSERT INTO K1 VALUES('��', NULL);
INSERT INTO K1 VALUES('��', 10);

-- �ڷ� ����
UPDATE K1
SET ID = '��'
WHERE CNT = '10';


-- �ڷ� �Է�

SELECT * FROM K1;

-- ��ü ����
SELECT COUNT(CNT) FROM K1;  -- 3��

-- NULL�� 0���� �ٲ� ��
SELECT COUNT(NVL(CNT, 0)) CNT FROM K1;   -- 5

-- �հ�
SELECT SUM(NVL(CNT, 0)) / 4 SUM FROM K1; -- 5

-- ���
SELECT AVG(NVL(CNT, 0)) AVERAGE FROM K1; -- 4

-- �ּҰ�, NULL�� 5�� ����
SELECT MIN(NVL(CNT, 5)) AVERAGE FROM K1; -- 5

SELECT *
FROM customer
WHERE phone IS NULL;

SELECT *
FROM orders;

-- NVL(null�׸�, 'null�� ������ �׸�')- ������ ������ ���������� �ƴϰ� ǥ�⸸ ���
-- NULL�� �ƴϸ� Į���� ���
SELECT custid, name, address, NVL(phone, '010-1234-5678') phone
FROM customer;

-- RANK() �Լ�
SELECT ename,
        sal,
        RANK() OVER(ORDER BY sal DESC) �޿�_RANK,
        DENSE_RANK() OVER(ORDER BY sal DESC) �޿�_DENSE_RANK
FROM employee;




