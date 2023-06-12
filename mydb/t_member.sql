-- 회원 테이블 생성
CREATE TABLE t_member(
    memberid     VARCHAR2(20) PRIMARY KEY,
    passwd     VARCHAR2(20) NOT NULL,
    name       VARCHAR2(30),
    gender     VARCHAR2(10),
    joindate   DATE DEFAULT SYSDATE
    
);

CREATE TABLE t_board(
    bnum     NUMBER(4) PRIMARY KEY,
    title    VARCHAR2(100) NOT NULL,
    content  VARCHAR2(2000) NOT NULL,
    regdate  TIMESTAMP DEFAULT SYSTIMESTAMP,
    modifydate TIMESTAMP,
    hit NUMBER DEFAULT 0,
    memberid VARCHAR2(20) NOT NULL,
    CONSTRAINT FK_MemberBoard FOREIGN KEY(memberid)
    REFERENCES t_member(memberid)
);
-- 글번호, 글제목, 글내용, 작성일, 수정일, 조회수, 회원아이디
-- 자동 순번(SEQUENCE)
CREATE SEQUENCE b_seq;

INSERT INTO t_member(memberid, passwd, name, gender)
VALUES ('cloud', 'm12345', '안재훈', '남');

INSERT INTO t_board (bnum, title, content, memberid)
VALUES (b_seq.NEXTVAL,'가입인사', '안녕하세요. 반갑습니다.', 'cloud');


SELECT * FROM t_member;

DROP TABLE t_member;