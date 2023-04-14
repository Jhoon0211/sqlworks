-- BOARD(�Խ���) ���̺�
CREATE TABLE board(
    bno NUMBER(5) PRIMARY KEY,      -- �۹�ȣ
    title VARCHAR(200) NOT NULL,    -- ������
    writer VARCHAR(20) NOT NULL,    -- �ۼ���
    content VARCHAR(2000) NOT NULL, -- �۳���
    regdate DATE DEFAULT SYSDATE    -- �����
);

-- ������ (�Ϸù�ȣ, �ڵ�����)
CREATE SEQUENCE seq;

-- ��õ�� Į���� �߰��Ͻÿ� (Į���� : cnt, �ڷ��� : NUMBER)
-- ALTER TABLE ���̺��̸� ADD Į���� �ڷ���
ALTER TABLE board ADD cnt NUMBER;

ALTER TABLE board MODIFY cnt NUMBER DEFAULT 0;

DESC board;

ROLLBACK;


-- �Խñ� �߰�
INSERT INTO board(bno, title, writer, content)
VALUES(seq.NEXTVAL, '�����λ�', '����', '�ȳ��ϼ���, �����λ� �����');
INSERT INTO board(bno, title, writer, content)
VALUES(seq.NEXTVAL, '��������', '������', '�����λ縦 �����ּ���');
INSERT INTO board(bno, title, writer, content)
VALUES(seq.NEXTVAL, '�����λ��Դϴ�.', '�̰�', '�ȳ��ϼ���~');
INSERT INTO board(bno, title, writer, content)
VALUES(seq.NEXTVAL, '�����λ��Դϴ�.', '�̰�', '�ȳ��ϼ���~');
INSERT INTO board(bno, title, writer, content)
VALUES(seq.NEXTVAL, '���� �Ϸ�', '���Ϸ�', '���� �Ϸ� �Ǽ���');

UPDATE board
SET writer = '������'
WHERE title = '�����λ�';

-- �ۼ��ڰ� �������� �Խñ��� �˻��Ͻÿ�
SELECT * FROM board
WHERE bno = 2;

-- �Խñ��� �ۼ��ڸ� �����ڿ��� admin���� �����ϼ���
-- UPDATE ���̺��̸�
-- SET ����Į�� = ���氪
-- WHERE ��
UPDATE board
SET writer = 'admin'
WHERE bno = 2;

-- 3�� �Խñ��� �����Ͻÿ�
-- DELETE FROM ���̺��̸� WHERE ��
DELETE FROM board
WHERE bno = 3;


SELECT * FROM board;