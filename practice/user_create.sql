SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;

-- ���ǻ簡 '�½�����' �Ǵ� '���ѹ̵��'�� ������ �˻��Ͻÿ�
SELECT * FROM book
WHERE publisher = '�½�����' OR publisher = '���ѹ̵��';

SELECT * FROM book
WHERE publisher IN ('�½�����', '���ѹ̵��');

-- ���� �̸��� '�౸'�� ���Ե� ���ǻ縦 �˻��Ͻÿ�
SELECT * FROM book
WHERE bookname LIKE '%�౸%';

-- '�౸'�� ���� ���� �� ������ 20000�� �̻��� ������ �˻��Ͻÿ�
SELECT * FROM book
WHERE bookname LIKE '%�౸%' AND price > 20000;

-- ������ �̸������� �˻��Ͻÿ�(�������� ����)
SELECT * FROM book
ORDER BY bookname;

-- ������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �����Ͻÿ�
SELECT * FROM book
ORDER BY price DESC, bookname;

-- �ڷ��߰�
INSERT INTO book VALUES (11, 'ȥ�� �����ϴ� �ڹ�', '�Ѻ��̵��', 24000);

-- bookname�� 'ȥ�� �����ϴ� ���̽�'���� �����Ͻÿ�.
UPDATE book
SET bookname = 'ȥ�� �����ϴ� ���̽�'
WHERE bookid = 11;


