--오라클에 접근할 수 있도록 샘플로 만들어 놓은 교육용 계정
select * from tab;
desc tab;

--last_name의 ' ' 안에는 대소문자 구별해야 한다.
    select employee_id, salary from employees where last_name = 'Smith';
--잘못된 방식
    select employee_id, FIRST_NAME, salary from employees where last_name = 'smith';

--별칭 저장하는 방법
    select employee_id as "준이", salary as "샐러리" from employees;
    select employee_id "준이", salary "샐러리" from employees;
    select employee_id as "준이" from employees where last_name = 'Smith';

--중복 제거
    select distinct job_id from employees;

--sum()
    select sum(salary) from employees;

--count()
--count(*) : 조회된 전체행 건수를 반환
--count(칼럼) : 칼럼의 값이 null인 행은 카운트 하지 않음
--count(distinct 칼럼) : 칼럼 값의 중복을 제거하고, 칼럼의 값 건수를 반환
    select count(*) from employees;
    select count(first_name) from employees;
    select count(distinct first_name) from employees;

--avg()
    select avg(salary)from employees;
    select avg(salary)from employees where department_id = 80;
    select avg(salary)from employees where department_id = 50;

--max()
    select max(salary) from employees;
    select max(hire_date) from employees;
    select max(first_name) from employees;
    select max(salary), max(hire_date), max(first_name) from employees;

--min()
    select min(salary) from employees;
    select min(hire_date) from employees; 
    select min(first_name) from employees;
    select min(salary), min(hire_date), min(first_name) from employees;

----숫자형 함수
--dual 테이블은 사용하지 않는데 제공하는 dummy 테이블

--abs() 절대값
    select abs(23), abs(-23) from dual;

--sign() 양수는 1, 음수는 -1, 0은 0
    select sign(23) from dual;
    select sign(23), sign(-23),sign(0) from dual;

--round() 반올림
    select round(0.123), round(0.543) from dual;
--,뒤에 나오는 숫자의 자리수까지 반올림하여 표시
    select round(0.12345678, 6), round(2.3423455, 4) from dual;

--trunc()
    select trunc(1234.1234567) from dual;
--0번째 자리부터 잘라
    select trunc(1234.1234567, 0) from dual;
--소수 2번째 자리부터 잘라
    select trunc(1234.1234567, 2) from dual;
--양수 첫번째자리 부터 잘라 자른수는 0으로 표시
    select trunc(1234.123456, -1) from dual;

--ceil() 무조건 올려서 정수로
    select ceil(32.3), ceil(-32.3) from dual;

--floor() 소숫점 자리를 무조건 버림
    select floor(32.3), floor(-32.3) floor from dual;

--power() 제곱
    select power(4,2) power from dual;

--mod() 나머지
    select mod(7,4) mod from dual;

--sqrt() 제곱근
    select sqrt(2), sqrt(4) from dual;

----날짜형 함수

--add_months() 개월수 더하기
    select sysdate, add_months(sysdate, 7) from dual;    

--next_day() 현재 날짜에서 다음 일요일
    select sysdate, next_day(sysdate, '목요일') from dual;

--last_day() 해당 월의 마지막 날짜
    select sysdate, last_day(sysdate) from dual;
    
--months_between(date, date2) 두 날짜 사이의 개월 수를 반환
    select months_between(to_date('2022/11/10', 'yyyy/mm/dd'), to_date('2022/01/10', 'yyyy/mm/dd')) months from dual;

--날짜형 데이터에 숫자 값 연산을 하여 해당 숫자 만큼의 일 수를 연산한 날짜를 계산 가능하다.
--sysdate-1 : 어제
--sysdate : 오늘
--sysdate+1 : 내일
--sysdate+30 : 오늘부터 30일 뒤의 날짜 반환
--sysdate-30 : 오늘부터 30일 전의 날짜 반환

----문자열 함수

--concat(char1, char2)
--두 문자열을 연결하여 하나로 만듦
select concat('hello','bye'), concat('좋은아침','bad') from dual;

--|| 연산자 ( concat과 동일한 기능 )
--concat처럼 문자열을 연결하지만 이건 여러 문자열 연결 가능
select 'good' || 'bad' operators from dual;

--intcap(char)
--영어 단어의 첫 문자를 대문자로, 공백이나 알파벳이 아닌 문자를 만난 후 다음 첫 알파벳도 대문자로 바꿈
select initcap('good morning') from dual;
--/가 구분자라서 b가 대문자로 바뀐다.
select initcap('good/bad morning') from dual;

--lower(char), upper(char)
--intcap과 달리 모든 문자를 소문자, 대문자로 바꿈
    select lower('GOOD'), upper('good') from dual;
    
--lpad('문자열', 총 문자길이, '채울문자')
--지정한 길이 만큼 왼쪽부터 특정문자로 채워준다.
--특정문자를 지정하지 않으면 공백으로 채움
select lpad('good', 6) "lpad1", lpad('good', 7, '#') "lpad2", lpad('good', 8, 'L') "lpad3" from dual;

--rpad('문자열', 총 문자길이, '채울문자')
--지정한 길이 만큼 오른쪽부터 특정문자로 채워준다.
--한글은 2바이트를 차지
select rpad('good', 6) "rpad1", rpad('good', 7, '#') "rpad2", rpad('좋은이', 8, 'L') "rpad3" from dual;

--substr('문자열', 시작위치, 추출할 개수)
--문자열의 시작 위치 인덱스는 왼쪽에서 1부터 시작 ( jds = 1 2 3 )
--시작 위치 값이 음수일 경우 인덱스는 오른쪽에서 -1부터 시작 ( jds = -3 -2 -1 )
--만약 추출할 개수를 생략하면, 시작위치 인덱스부터 나머지 문자열의 끝까지 반환한다
--추출 할 개수를 0으로 설정하면, 아무것도 추출하지 않기 때문에 null을 반환한다.
--시작위치 인덱스를 0으로 적으면 문자열의 인덱스가 0부터 시작한다.
    SELECT SUBSTR('ABCDEFG', 2, 3) FROM dual;
    SELECT SUBSTR('ABCDEFG', -5, 3) FROM dual;    
    SELECT SUBSTR('ABCDEFG', 2) FROM dual;    
    SELECT SUBSTR('ABCDEFG', -5, 0) FROM dual;    
    
--length( 문자 값 )
--문자의 길이를 반환하는 함수     
    select length('ABCDEFG') from dual;

--instr(문자 값, 검색 문자 값, 시작위치, 개수)
--문자 값을 전달받아 검색문자를 시작위치부터 검색하여 원하는 개수의 시작위치를 반환하는 함수
    select instr('ABCDEFGABCDEFG', 'B', 1, 2) instr from dual;

--treim( leading or trailing 제거문자 from 문자 값)
--문자 값을 전달받아 앞(leading) 또는 뒤(trailing)에 존재하는 제거문자를 모두 제거하는 함수
    select treim(leading 'B' from 'ABCDEFG') from dual;

    

----null처리 함수

--nvl(expr1, expr2)
--expr1이 null을 포함하는 칼럼 표현식을, expr2에는 null을 대체하는 값을 작성
--expr1과 expr2는 반드시 데이터 타입이 일치해야 한다.
--expr1이 null 값이면 expr2를 반환, null값이 아니면 expr1값 그대로 반환
--위의 내용은 아래의 nvl2함수에도 동일하게 해당된다.

--nvl2(expr1, expr2, expr3)
--expr1이 null값이 아닌 경우 expr2를, null값인 경우 expr3를 반환

--nullif(expr1, expr2)
--expr1과 expr2가 동일한 경우 null을, 동일하지 않으면 expr1을 반환

--coalesce(a1, a2, a3, ..., an)
--a1부터 순서대로 탐색해서 null이 아닌 첫번째 값을 가져오고 모두 null이면 0(null)을 반환
    select coalesce(null,null,'a',null,'d',null) from dual;
    select coalesce(null,null,null,null,null,null) from dual;


----형변환 함수 : 자료형을 변환시키고자 할 때 사용하는 함수
--number <--> character <--> date
--to_number : 문자형을 숫자형으로 변환
--to_char : 날짜형 혹은 숫자형을 문자형으로 변환
--to_date : 문자형을 날짜형으로 변환

--to_char('날짜 데이터', '출력형식')
    select to_char(sysdate, 'yyyy'),to_char(sysdate, 'mm') from dual;
    select to_char(sysdate, 'day'), to_char(sysdate, 'dy') from dual;
    select to_char(sysdate, 'mm'), to_char(sysdate, 'mon') from dual;
    select to_char(sysdate, 'mi'), to_char(sysdate, 'ss') from dual;
--to_char('숫자형', '출력형식')
    select to_char(1000, '00000')from dual;
    select to_char(1000, '99999')from dual;
    select to_char(1000, 'L00000')from dual;
    select to_char(1000, '00000.00')from dual;
    select to_char(1000, '99,999')from dual;

--to_number('문자열', '출력형식')
--출력 형식의 자리 수와 형식은 바꿀 문자열과 같거나 많아야 한다.
SELECT TO_NUMBER('100,000', '999,999') FROM DUAL;
SELECT TO_NUMBER('80,000', '999,999') FROM DUAL;
SELECT TO_NUMBER('100,000', '999,999') - TO_NUMBER('80,000', '999,999') FROM DUAL;
--1000 : 정상적인 방법
    select to_number('1000', '0000') from dual;
--에러 : 0은 남는 자리 0으로 표시
    select to_number('1000', '00000') from dual;
--1000 : 정상적인 방법
    select to_number('1,000', '9,999') from dual;
--1000 : 9는 남는 자리 표시 안함
    select to_number('1,000', '99,999') from dual;

--to_date('문자열', '출력형식')
--문자열의 날짜 형식과 출력형식의 날짜 형식이 같아야 한다.
    select to_date('20070402', 'yyyy/mm/dd') from dual;
    select to_date('2007/04/02', 'yy-mm-dd') from dual;
    select to_date('0402', 'mm-dd') from dual;
    select to_date('04-02', 'mm/dd') from dual;
    select to_date('02', 'yy') from dual; 
    select to_date('02', 'mm') from dual;
    select to_date('02', 'dd') from dual;
--년도 혹은 월을 생략하면, 현재 시스템의 년도와 월을 입력하여 표시한다.
--하지만 일을 생략하면, 그냥 1일을 표시한다.



-------------------------------------------------------------------------------------
--계층형 쿼리    
    SELECT LEVEL, LPAD('',4*(LEVEL-1)) || FIRST_NAME || ' ' || LAST_NAME "이름"
    FROM EMPLOYEES
    START WITH MANAGER_ID IS NULL
    CONNECT BY MANAGER_ID = PRIOR EMPLOYEE_ID;
    
    SELECT JB.JOB_TITLE "직위", LPAD('',4*(LEVEL-1)) || EMP.FIRST_NAME || ' ' || LAST_NAME "이름"
    FROM EMPLOYEES EMP, JOBS JB
    WHERE EMP.JOB_ID = JB.JOB_ID
    START WITH EMP.MANAGER_ID IS NULL
    CONNECT BY EMP.MANAGER_ID = PRIOR EMP.EMPLOYEE_ID;
    

--ROLLUP : 집계 쿼리에 대한 계층화 구조의 부분합
--rollup : 그룹별 합계 정보를 추가해서 보여주는 함수
--조회 순서가 FROM 절 -> WHERE 절 -> SELECT 절 이기 때문에
--FROM 절에서 정의한 별칭을 SELECT 절에서 사용가능

    SELECT L.CITY, D.DEPARTMENT_NAME, E.JOB_ID,
    COUNT(*) 사원수, SUM(E.SALARY) 총급여
    FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
    WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
    AND D.LOCATION_ID = L.LOCATION_ID
    --도시별, 부서별, 직급별로 합계를 구하고 전체 합계를 구한다
    --도시 안에 부서안에 직급별로 합계를 구하고
    --도시 안에 부서 별로 합계를 구하고,
    --도시 별로 합계를 구하고
    --위에서 구해진 도시 별 합계를 모두 더해 전체 합계를 구한다.
    --각 합계는 해당 그룹별로 마지막 행에 표시된다.
    GROUP BY ROLLUP(L.CITY, D.DEPARTMENT_NAME, E.JOB_ID)
    --ROLLUP을 사용하면 부서별로 각각의 합계, 전체 합계가 나온다.
    ORDER BY L.CITY, D.DEPARTMENT_NAME, E.JOB_ID;
    