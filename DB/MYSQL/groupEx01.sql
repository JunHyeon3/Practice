-- ----------------------------------------------------------------------
## [그룹 함수] ##
/* 
[집계함수]
- count(칼럼명)	: 로우 개수
- sum(칼럼명)		: 합
- avg(칼럼명)		: 평균
- max(칼럼명)		: 최댓값
- min(칼럼명)		: 최솟값

[select 문의 순서]
select 	칼럼명, 칼럼명
from 	테이블명
where	조건
group by 칼럼명, 칼럼명
having 	조건
order by 칼럼명;
*/
-- ----------------------------------------------------------------------
## count() : null을 제외한 row의 개수를 반환한다.
## 사원 총 수
select count(emp_no) as "총사원수"
from employees;
## 직책 테이블의 총 로우 수
select count(emp_no), count(to_date)
from titles;

## sum(), max(), min()
## 직원들의 급여 총 합, 최고, 최저
select sum(salary), max(salary), min(salary)
from salaries;
-- ----------------------------------------------------------------------
## 남과 여 직원수
select gender, count(emp_no)
from employees
group by gender;

## 직책별 직원수
select title, count(emp_no)
from titles
group by title;

## 직책별 직원 수에서 직원 수가 5만명 이상인 직책만 조회
select title, count(emp_no)
from titles
group by title
having count(emp_no) >= 50000;