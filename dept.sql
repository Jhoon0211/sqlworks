-- �μ����̺�(dept)
CREATE TABLE dept (
    -- Į���̸� �ڷ���
    deptno VARCHAR2(4) PRIMARY KEY,
    deptname VARCHAR2(20) NOT NULL,
    office VARCHAR2(10)
    );
   
-- �̻� ���� �ذ�
-- �μ��ڵ� : �ĺ��� (Identifier) - �⺻Ű(PRIMARY KEY) �Ӽ� �߰�
-- �μ��� : �ʼ� �Է� ���� (NOT NULL �Ӽ� �߰�)
   
DESC dept;

-- �μ� �߰�
INSERT INTO dept(deptno, deptname, office) VALUES ('1000','�λ���','����');
INSERT INTO dept(deptno, deptname, office) VALUES ('1001', '������','����');
INSERT INTO dept(deptno, deptname, office) VALUES ('1002', '������','����');
INSERT INTO dept(deptno, deptname) VALUES ('1003', '������');


-- ���� �Ϸ� : Ʈ������� �� �κ�
COMMIT;

-- �μ� �ڷ� �˻�
SELECT deptname, office FROM dept;

-- �μ� �̸� �ֱ� (as - alias)
SELECT deptno as �μ��ڵ�, deptname as �μ��� FROM dept;
 
SELECT * FROM dept
WHERE deptno = '1002';

/* �μ� ���̺� ���� */
DROP TABLE dept;

-- �ڷ� ���� : ORDER BY Į���� (ASC/DESC)
SELECT * FROM dept
ORDER BY deptno DESC;

-- �μ���ȣ�� 1002���� �μ��� 'ȸ����'���� �����Ͻÿ�
UPDATE dept
SET deptname = 'ȸ����'
WHERE deptno = 1002;

-- �μ� ��ü �˻�
SELECT * FROM dept;

-- 1003�� �μ� ����
DELETE FROM dept
WHERE deptno = '1003';





