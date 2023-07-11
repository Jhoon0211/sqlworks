-- 부서와 사원 테이블 만들기
use mydb;

create table department(
	deptid int primary key,
	deptname varchar(30) not null,
    location varchar(20) not null
);

-- 사원 테이블
CREATE TABLE employee(
	empid INT PRIMARY KEY,
    empname VARCHAR(30) NOT NULL,
    age INT,
    deptid INT NOT NULL,
    constraint fk_dept_employee foreign key(deptid)
    references department(deptid) -- 관계 설정 (외래키)
);

-- 부서 추가
insert into department values(10, '개발팀', '서울');
INSERT INTO department VALUES(20, '디자인팀', '성남');

-- 사원 추가
insert into employee values(101, '한라산', 27, 10);
insert into employee values(102, '동해', 30, 20);
insert into employee values(103, '서해', 23, 30); -- 부모키 없음(제약 조건 위배)

-- 부서 검색
select * from department;

-- 사원 employeedepartment검색
select * from employee;

-- 사원 이름이 '한라산' 인 사원의 이름과 부서 아이디를 검색하시오.
select empid, deptid from employee where empname = '한라산';

-- 부서 이름이 '개발팀'인 사무실의 위치를 검색하시오.
select location from department where deptname = '개발팀';

-- 사원번호가 102인 사원의 이름을 '동해'로 나이를 '30세'로 변경하시오.
update employee
set empname = '동해', age = 30
where empid = 102;

-- 트랜 잭션(transaction)(실행-commit, 취소-rollback)
rollback;

commit;
