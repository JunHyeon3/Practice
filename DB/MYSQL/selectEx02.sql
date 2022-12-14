# DB 목록 조회
show databases;

# DB 선택
use employees;

# employees 테이블 목록
show tables;
 
# employees 테이블 구조
desc employees;

# 직원 정보를 모두 추출
select * from employees;	

# 매니저의 모든 정보를 추출
select * from dept_manager;

# 부서의 모든 정보를 추출
select * from departments;