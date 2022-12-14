# 1. DB 선택
use employees;

-- ----------------------------------------------------------------------
## [정렬] ##
## 정렬은 숫자, 문자열, 날짜 등 데이터 상관없이 가능
## <문법> 
## order by 칼럼명 asc 	: 오름차순, asc는 생략가능 
## order by 칼럼명 desc	: 내림차순
## order by 뒤에 2개 이상의 칼럼을 정렬하면, 앞에 칼럼을 1차 정렬 후 뒤의 칼럼으로 2차 정렬

# cf) desc절은 테이블의 정보
desc dept_emp;

## 직책을 오름차순, 시작일을 내림차순으로 하여 사원번호, 직책, 시작일, 종료일 조회
select * 
from titles 
order by title asc, from_date desc;

-- ----------------------------------------------------------------------
## [숫자 함수] ##

## 절대값 : abs()
select abs(100), abs(-100);

## 소수점 이하 (무조건)올림 : ceil()
select ceil(10.4), ceil(10.6);

## 소수점 이하 (무조건)내림 : floor()
select floor(10.4), floor(10.6);

## 소수점 이하 (5이상)반올림 : round()
select round(10.4), round(10.6);
# 반올림은 소수점 위치 지정 가능 (0:기본, 1:오른쪽으로 1칸이동, -1:왼쪽으로 1칸 이동)
select round(166.555, 0), round(166.555, 1), round(166.555, -1);

## 버림 : truncate()
select truncate(166.555, 0), truncate(166.555, 1), truncate(166.555, -1);

## 제곱 : power(x, y) -> x의 y승
select power(5, 2);

## 나머지 : mod(x, y) -> x를 y로 나눈 나머지
select mod(5, 2);

## 최댓값 : greatest()
select greatest(3, 10, 5, 20);

## 최솟값 : least()
select least(3, 10, 5, 20);

-- ----------------------------------------------------------------------
## [문자열 함수] ##

## 이어주기 : concat()
select concat('one', 'two');
select concat(first_name, ' 님') "이름", concat('성별 : ', gender) "성별"
from employees;

## 특정 위치에 추가 : insert(기존문자열, 변경위치, 변경개수, 변경할문자열)
# ex1) : 첫번째 인수의 2번재 자리부터 1개를 *로 변경
select insert('abcdefg', 2, 1, '*');
# ex2) : 첫번째 인수의 2번재 자리부터 0개를 *로 변경
select insert('abcdefg', 2, 0, '*');

## 교체 : replace()
select replace('abcdefg', 'bc', 'ONE');

## 위치 : instr(문자열1, 문자열2)
# 문자열1에서 문자열 2를 찾아 위치 반환
# 왼쪽 기준으로 1부터 시작하여, 없으면 0 반환
select instr('abcdefg', 'b');
select instr('abcdefg', 'z');

## [문제] bcd를 삭제하시오.
select insert('abcdefg', 2, 2, '');

## 문자열 반환
# left(문자열, 개수) 		: 문자열에서 왼쪽 기준으로 개수 만큼 반환
# right(문자열, 개수) 		: 문자열에서 오른쪽 기준으로 개수 만큼 반환
# mid(문자열, 위치, 개수)	: 문자열에서 왼쪽 기준으로 위치에서 개수 만큼 반환
select left('abcdefg', 3), right('abcdefg', 3), mid('abcdefg', 3, 2);

## cf) substring(문자열, 위치, 개수) : mid()와 동일
select substring('abcdefg', 3, 2), substring('abcdefg', 3);
select mid('abcdefg', 3, 2), mid('abcdefg', 3);

## 공백 제거
# ltrim(문자열)	: 왼쪽 공백 제거
# rtrim(문자열)	: 오른쪽 공백 제거
# trim(문자열)	: 양쪽 공백 제거
select concat('|', ltrim('      abc       '), '|');
select concat('|', rtrim('      abc       '), '|');
select concat('|', trim('      abc       '), '|');

## 대문자 변경 : ucase(문자열)
## 소문자 변경 : ㅣcase(문자열)
select ucase('aBcDe'), lcase('aBcDe');

## 역순 : reverse()
select reverse('aBcDe');

## 문자열 길이 : length()
select dept_name, length(dept_name)
from departments;

-- ----------------------------------------------------------------------
## [날짜 함수] ##

## 현재 날짜와 시간 : now(), sysdate()
select now(), sysdate();

## 현재 날짜 : current_date(), curdate()
select current_date(), curdate();

## 현재 시간 : current_time(), curtime()
select current_time(), curtime();

## 현재 날짜에 더한 값 : date_add(날짜, interval "값" "기준")
# 날짜에서 interval 만큼 더한 날짜 리턴
# interval 기준 : year, month, day, hour, minute, second

## 오늘 기준으로 100일 뒤 날짜는?
select now(), date_add(now(), interval 100 day);
select now(), date_add(now(), interval 1 day);

## 오늘 기준으로 100일 전 날짜는?
select now(), date_sub(now(), interval 100 day);

## 발령 7일전
select hire_date, date_sub(hire_date, interval 7 day) as "발령 7일 전"
from employees;

## 날짜 함수 : year(), month(), day(), hour(), minute(), second()
##			년		월		 일		시		분			초
select now(), year(now()), month(now()), day(now());
select now(), hour(now()), minute(now()), second(now());

## 월을 영어로 : monthname()
select now(), monthname(now());

## 요일을 숫자로 : dayofweek(), weekday()
# 일요일 1, 월요일 2, 화요일 3, 수요일 4, 목요일 5, 금요일 6, 토요일 7
select now(), dayofweek(now());
# 월요일 0, 화요일 1, 수요일 2, 목요일 3, 금요일 4, 토요일 5, 일요일 6
select now(), weekday(now());

## 일년을 기준으로 일 수 : dayofyear()
select now(), dayofyear(now());

## 일년을 기준으로 몇 번째 주 : week()
select now(), week(now());

## 형식 지정 : date_format(날짜, 형식)
# 대문자 소문자마다 다름
select now(), date_format(now(), '%Y년 %m월 %d일 %H시 %i분 %s초');