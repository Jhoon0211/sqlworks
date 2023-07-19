-- jdbc 테스트 용 'user' 테이블 생성
CREATE TABLE myuser(
    id NUMBER PRIMARY KEY,
    pwd VARCHAR2(20) NOT NULL,
    name VARCHAR2(30) NOT NULL,
    phone VARCHAR2(20)
);

drop table myuser;
rollback;