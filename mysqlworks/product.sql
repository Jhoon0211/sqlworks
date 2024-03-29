use javaweb;

-- Product 테이블 생성
CREATE TABLE product(
	p_id			VARCHAR(10) PRIMARY KEY,
    p_name  		VARCHAR(30),
    p_unitPrice  	INTEGER,
    p_description 	TEXT,
    p_category		VARCHAR(20),
    p_manufacturer 	VARCHAR(20),
    p_unitsInstock	LONG,
    p_condition		VARCHAR(20),
    p_productImage	VARCHAR(20)
);

-- 상품 추가
INSERT INTO product VALUES ('P1234', 'iPhone 6s', 1200000, 
'1334X750 Retina HD Display', 'Smart Phone', 'Apple', 1000, 'New', 'P1234.png');

DELETE from product where p_id = 'P1235';
select * from product;