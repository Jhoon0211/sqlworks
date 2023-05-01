-- ��� ���̺�(�μ��� ���踦 ����)
CREATE TABLE employee(
        empno   NUMBER(3) PRIMARY KEY,      -- �����ȣ
        ename   VARCHAR2(20) NOT NULL,      -- �����
        sal     NUMBER(10),                 -- �޿�
        hire_date   DATE DEFAULT SYSDATE,   -- �����
        gender  VARCHAR2(10),
        -- �Ű�ü ����
        deptno VARCHAR2(4),
        -- �ַ�Ű (FOREIGN KEY) ��������
        -- �ַ�Ű�� �̸� : emp_fk
        CONSTRAINT emp_fk FOREIGN KEY(deptno)
        REFERENCES dept(deptno)
        -- ON DELETE CASACDE(�μ��� �����ϸ� �����ϰ� �ִ� ����� ���� ����)
        );
        
-- ���� ���Ἲ ���� ����
-- 1. ����� �Ҽӵ� �μ��� �����Ҷ� '�ڽ� ���ڵ尡 �ִ�'�� �����߻�
-- 2. �μ���ȣ�� ���� ��� �ڷḦ �߰��� �� '�θ�Ű�� ����'�� �����߻�
        
INSERT INTO employee VALUES (100, '�̰�', 2500000, SYSDATE, '����', '1000');
INSERT INTO employee VALUES (101, '�̻�', 2000000, SYSDATE, '����', '1001');
INSERT INTO employee VALUES (102, '�ڴ�', 1500000, SYSDATE, '����', '1002');
INSERT INTO employee VALUES (103, '���ϴ�', 3500000, SYSDATE, '', '1003');
INSERT INTO employee VALUES (104, '�����', 4500000, SYSDATE, '����', '1000');
INSERT INTO employee VALUES (105, '����', 2600000, SYSDATE, '����', '1000');
INSERT INTO employee VALUES (106, '��go', 2500000, SYSDATE, '����', '1000');



UPDATE employee
SET sal = '3500000'
WHERE empno = 103;

UPDATE employee
SET ename = '����'
WHERE empno = 106;

-- ������ �����̸鼭 �޿��� 250���� �̻��� ����� �˻��Ͻÿ�
SELECT *
FROM employee
WHERE gender = '����'
AND sal >= 2500000;

-- �޿��� 200�������� 300���� ������ ����� �˻��Ͻÿ�
SELECT *
FROM employee
WHERE sal >= 2000000
AND sal <= 3000000;

-- BETWEEN ~ AND
SELECT *
FROM employee
WHERE sal
BETWEEN 2000000 AND 3000000;

-- ���ڿ� �˻� : �Ϻ� ���� ���� LIKE %����%
-- ���� '��'�� ����� �˻��Ͻÿ�
SELECT *
FROM employee
WHERE ename LIKE '��%';

-- ��� �� �ο����� ���Ͻÿ�
SELECT COUNT(*) as �����
FROM employee;

-- �ߺ����� �μ���ȣ�� �˻��Ͻÿ� (DISTINCT Ű����)
SELECT DISTINCT deptno �μ���ȣ
FROM employee;

-- ��� �ڷ� �˻�
SELECT * FROM employee;

-- GROUP BY �� (�Ҽ� �� �׷�ȭ) ������ - HAVING  ���
-- �μ��� �޿� �Ѿ�
SELECT deptno �μ�, SUM(sal) �޿��Ѿ�, AVG(sal) �޿����
FROM employee
GROUP BY deptno

-- �μ��� �޿� ����� 300���� �̻��� ���
HAVING AVG(sal) >= 3000000
-- ����
ORDER BY AVG(sal) DESC;


