-- Members 프로젝트
use mydb;

-- 회원 테이블
create table t_member(
	memberid	varchar(20),
    passwd		varchar(20) not null,
    name		varchar(30) not null,
    gender		varchar(10),
    joindate	timestamp default now(),
    primary key(memberid)
);

-- 게시판 테이블
create table t_board(
	bnum		int primary key auto_increment,
    title 		varchar(100) not null,
    content 	text,
    regdate 	timestamp default now(),
    modifydate  timestamp,
    hit 		int default 0,
    memberid	varchar(20),
    fileupload	varchar(50),
    constraint fk_member_board foreign key(memberid)
    references t_member(memberid) on delete cascade
);

-- 댓글 추가
insert into t_reply(bnum, rcontent, replyer)
values(1, '내용에 대한 댓글입니다.', 'hibibo');

-- 댓글 테이블
create table t_reply(
	rno int primary key auto_increment,		-- 댓글 번호
    bnum int not null,						-- 게시글 번호
    rcontent text not null,					-- 댓글 내용
    replyer varchar(30) not null,			-- 작성자
    rdate timestamp default now(),			-- 작성일
    rupdate timestamp,						-- 수정일
	constraint fk_reply_board foreign key(bnum)	-- 외래키 제약조건
    references t_board(bnum) on delete cascade
);


-- 게시글 쓰기
insert into t_board(title, content, memberid)
values('가입인사', '안녕하세요 가입했어요 루삥뽕', 'admin');
insert into t_board(title, content, memberid)
values('가입인사', '안녕하세요 가입했어요 루삥뽕', 'admin');
insert into t_board(title, content, memberid)
values('가입인사', '안녕하세요 가입했어요 루삥뽕', 'admin');

-- 검색
select * from t_member;
select * from t_board ;
select * from t_reply ;

-- limit (시작, 끝)
-- 0~10 : 1page, 11-20 : 2page
select * from t_board order by bnum desc l0imit 0, 6;

-- 댓글 삭제
delete from t_reply where rno = 1;

-- 특정 댓글 검색
select * from t_reply where rno = 3;

-- 댓글 수정
update t_reply set rcontent="내용수정"
where rno= 3;

commit;