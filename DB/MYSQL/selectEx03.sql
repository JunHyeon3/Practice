# 1. DB 선택
use employees;

# 2. 사원의 성, 이름, 성별 조회
select last_name, first_name, gender 
from employees; 

# 3. 부서의 부서번호, 부서명 조회
select dept_no, dept_name 
from departments;

# 4. 사원의 사원번호, 연봉 조회
select emp_no, salary 
from salaries;

# 5. 사원의 사원번호, 직책 조회
select emp_no, title 
from titles;

-- ----------------------------------------------------------------------
## 산술 연산자 
select 10 + 10;
select 30*3, 20-2;

# 사원들의 연봉 계산 
# 연산된 결과는 DB에 저장되는것이 아닌, Memory에 저장된다.
# 칼럼명은 alias를 사용하여 표현한다.
select salary, salary + 10 as "연봉 10 증가", salary * 10 '연봉 10배'
from salaries
limit 20;

# [문제] 사원번호, 연봉, 10% 인상된 각 사원의 연봉 조회
select emp_no, salary, salary * 1.1 "10% 인상"
from salaries;

-- ----------------------------------------------------------------------
## 중복 제거 : distinct 
# 만일 조회 칼럼이 2개일 경우, 행의 데이터가 모두 중복이어야 중복이 제거된다.
select distinct dept_no, to_date
from dept_emp;

-- ----------------------------------------------------------------------
/*	
	where 절 조건에서 사용하는 연산자
	비교 			: =, <>, >, <, >=, <=
    범위 			: between A and B 
    집합 			: in (여러 값)
				: not in (여러 값)
	문자열 연산자 	: like
				: not like
                : 와일드 카드 - % 모든, _ 한 글자
    null		: is null
				: is not null
	복합 조건 		: and, or, not
*/

## d005 부서 매니저의 사원번호, 부서번호 조회
select emp_no, dept_no
from dept_manager
where dept_no = 'd005';

## [문제1] d003 부서 소속이 아닌 매니저들의 사원번호, 부서번호를 추출하시오
# 문자열 data를 비교할 때는 문자열 연산자인 not like를 사용하는것이 조금더 빠름
select emp_no, dept_no
from dept_manager
#where dept_no <> 'd003';
where dept_no not like 'd003';

## [문제2] 연봉이 150,000 이상인 사원들의 사원번호, 연봉을 추출하시오
select emp_no, salary
from salaries
where salary >= 150000;

## [문제3] 1986년 이후에 입사한 사원의 사원번호, 입사일, 이름을 추출하시오
# date 값은 문자처럼 보이지만 숫자로 처리된다. 문자는 아니지만 ''로 묶어줘야 한다.
select emp_no, hire_date, first_name
from employees
where hire_date >= '1986-01-01';

## [문제4] 1990년 이후부터 매니저로 근무하고 있는 사원들의 사원번호, 부서번호, 매니저 시작날짜를 추출하시오
select emp_no, dept_no, from_date
from dept_manager
where from_date >= '1990-01-01';

## [문제5] 1990년 이전 입사한 사원들의 사원번호, 입사일을 추출하시오
select emp_no, hire_date
from employees
where hire_date < '1991-01-01';

-- ----------------------------------------------------------------------
## and 연산자 ##

## [문제1] d001 부서 매니저 중 1990년 이후 부터 매니저인 사원의 사원번호, 부서번호, 매니저 시작일 조회
select emp_no, dept_no, from_date
from dept_manager
where dept_no like 'd001' and from_date >= '1990-1-1';

## [문제2] 1990년 이후 입사한 남자 사원의 사원번호, 성별, 입사일 조회
select emp_no, gender, hire_date
from employees
where hire_date >= '1990-01-01' and gender like 'M';

## [문제3] 1990년 이후 연봉을 60,000 이상 받는 사원의 사원번호, 연봉, 연봉 시작 날짜 조회
select emp_no, salary, from_date
from salaries
where from_date >= '1990-01-01' and salary >= 60000;

## [문제4] 연봉이 60,000 ~ 70,000인 사원의 사원번호, 연봉, 연봉 시작 날짜 조회
# 같은 칼럼을 비교하더라도, 조건 마다 칼럼명을 작성해야한다.
select emp_no, salary, from_date
from salaries
where salary >= 60000 and salary <= 70000;

## cf) between A and B
select emp_no, salary, from_date
from salaries
where salary between 60000 and 70000;

-- ----------------------------------------------------------------------
## not 연산자 ##

## [문제1] d003 부서 소속이 아닌 매니저들의 사원번호, 부서번호를 추출하시오
select emp_no, dept_no
from dept_manager
#where dept_no <> 'd003';
where dept_no not like 'd003'; 

## cf) not 연산자
select emp_no, dept_no
from dept_manager
where not dept_no like 'd003'; 

-- ----------------------------------------------------------------------
## in 연산자 ##
## 여러개가 같은지 비교할 때 사용한다.
## in 연산자의 ( )안에 쿼리문이 올 수 있고, 이러한 쿼리문을 sub query라고 부른다.

## d001 부서와 d002 부서 매니저의 사원번호, 부서번호 조회
select emp_no, dept_no
from dept_manager
#where dept_no like 'd001' or dept_no like = 'd002'
where dept_no in ('d001', 'd002');

-- ----------------------------------------------------------------------
## like 연산자 ##
## 칼럼명 왼쪽에 binary를 입력해주면 대소문자를 구분하여 비교해준다.
## like 연산자는 "같니"도 가능하지만, "~로 시작 or 끝 or 포함"도 가능하다.
## "~로 시작 or 끝 or 포함"을 사용할 때는 와일드 카드 %(모든 글자) or _(한 글자)을 사용한다.
## u로 시작하는	: u%
## u로 끝나는		: %u
## u를 포함하는	: %u%

## 성별이 남자인 사원의 사번, 이름, 성별 조회
select emp_no, first_name, gender
from employees
where binary gender like 'm';

## 이름이 G로 시작되는 사원의 사번, 이름 조회
select emp_no, first_name
from employees
where first_name like 'G%';

## 이름이 i로 시작되는 사원의 사번, 이름 조회
select emp_no, first_name
from employees
where first_name like '%i';

## 이름에 u가 포함되는 사원의 사번, 이름 조회
select emp_no, first_name
from employees
where first_name like '%u%';

## 이름의 두번째가 r인 사원의 사번, 이름 조회
select emp_no, first_name
from employees
where first_name like '_r_';

-- ----------------------------------------------------------------------
## is null 연산자 ##
# null은 =로 조건 비교를 할 수 없기 때문에 반드시 is null을 사용해준다.
desc titles;

select *
from titles;

update titles
set to_date = null
where emp_no = 10002;

select *
from titles
where to_date is null;