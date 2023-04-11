-- ��� ���̺�
CREATE TABLE emp(
        -- Į�� �̸� �ڷ���
        empno   NUMBER(3) PRIMARY KEY,      -- �����ȣ
        --SQL���� VARCHAR2�� ��
        ename   VARCHAR2(20) NOT NULL,       -- �����
        sal     NUMBER(10),                 -- �޿�
        hire_date   DATE DEFAULT SYSDATE    -- �Ի���
        );
        
-- ����� ���� Į�� �߰� (ALTER ~ ADD)
ALTER TABLE emp ADD gender VARCHAR2(4);

-- ename�� �ڷ����� ���� (ALTER ~ MODIFY)
ALTER TABLE emp MODIFY gender VARCHAR2(10);
        
-- ��� �߰�
-- ��� ���̺�
INSERT INTO emp VALUES (100, '�̰�', 2500000, SYSDATE);
INSERT INTO emp VALUES (101, '���', 3000000, SYSDATE);
INSERT INTO emp VALUES (102, '�����', 5000000, SYSDATE);
INSERT INTO emp VALUES (103, '�ڽ���', '', SYSDATE);
INSERT INTO emp VALUES (104, '�����', 1500000, SYSDATE, '��');

-- �����ȣ, ����̸�, �޿��� �˻��Ͻÿ�
SELECT empno as ���, ename as �����, sal as �޿� FROM emp;

-- �޿��� ���� ����� �˻��Ͻÿ�
SELECT *
FROM emp
WHERE sal IS NULL;

-- �޿��� �ִ� ����� �˻��Ͻÿ�
SELECT *
FROM emp
WHERE sal IS NOT NULL;

-- �޿��� 300���� ������ ����� �˻��Ͻÿ�
SELECT *
FROM emp
WHERE sal <= 3000000;
ORDER BY sal DESC;-- ��� ���̺�        
        
-- �޿��� 300���� ������ ����� �޿��� ���� ������ �����Ͻÿ�
SELECT *
FROM emp
WHERE sal <= 3000000
ORDER BY sal DESC;

-- �޿��� ���� ������ �����Ͻÿ�
SELECT *
FROM emp
ORDER BY sal DESC;

-- ����� ��ü ���� ���Ͻÿ�
SELECT COUNT(*) as �����
FROM emp;

-- ��� �޿��� �� �հ�� ����� ���Ͻÿ�
SELECT SUM(sal) �޿��հ�, AVG(sal) �޿����
FROM emp;

-- �̸��� ������� ����� �˻��Ͻÿ�
/*SELECT * FROM emp
WHERE empno = 104;*/

-- ������ '��'�� ����� '����'�� �����Ͻÿ� (UPDATE) - �ڷ����
UPDATE emp
SET gender = '����'
WHERE empno = 104;

-- �̸��� ������� ��� ���� (���)
DELETE FROM emp
WHERE ename = '�����';

-- ��� ��ȸ
SELECT * FROM emp;

-- �Է�
COMMIT;

-- COMMIT ���̸� ���� ���� (�ڷΰ��� ctrl + z)
ROLLBACK;


