show user;

--실습할 계정을 만들었습니다.
select * from tab;
--작성된 테이블 목록 확인

--DUAL 테이블이란?
--DUAL 테이블을 바로 산술 연산의 결과를 한 줄로 얻기 위해서 오라클에서
--제공하는 테이블 입니다.
SELECT * FROM DUAL;
--DUAL 테이블은 사용자가 함수(계산)를 실행할 때 임시로 사용하는데 적합
--함수에 대한 쓰임을 알고 싶을 때 특정 테이블을 생성할 필요없이 DUAL 테이블을
--이용하여 함수의 값을 return 받을 수 있다
SELECT 24*60 FROM DUAL;
--dual 테이블을 이용하여 24*60 값 리턴


--데이터 타입
--CHAR 데이터 타입 : 고정 길이 데이터 타입
--name이란 컬럼을 CHAR(10)으로 데이터 타입을 지정한 후에
--'oracle'이란 데이터를 저장하였다면 다음과 같이 지정된 길이보다 짧은
--데이터가 입력되었기 때문에 나머지 공간이 공백으로 채워집니다.

--VARCHAR2 데이터 타입 : 가변 길이 데이터 타입
--VARCHAR2 역시 문자 데이터를 저장하기 위한 데이터 타입으로, 가변적인 길이의 문자열을 저장합니다.
--name 칼럼을 VARCHAR2(50)이라고 설정하였더라도 'oracle'이란 데이터를 저장한다면,
--저장할 데이터의 길이에 의해서 저장공간의 길이가 할당된다.

--NUMBER 데이터 타입
--NUMBER 는 10이나 12.3과 같은 수치 데이터를 저장하며 다음과 같은 형식으로 사용된다.
--EX) NUMBER(8)로 지정하면, 하나의 정수값만 저장된다.
--    NUMBER(predision, scale) EX) NUMBER(8,2)
--    둘다 지정하면 실수 형태의 값으로 저장된다.

--BLOB 대용랑의 바이너리 데이터를 저장하기 위한 타입 최대크기 4gb --> BFILE
--CLOB 대용량의 텍스트 데이터를 저장하기 위한 타입 최대크기 4gb

--ROWID 테이블 내 행의 고유주소를 가지는 64진수 문자타입 ---> 검색이 가능하다

--데이터 무결성과 제약 조건
--  NOT NULL제약조건
--  NULL은 할당 받지 않은 값, 아직 무엇인지 모르는 값을 의미합니다.
--  이상(anomaly) 현상이 일어나지 않도록 하기 위한 방법으로 제공되는 것이 바로  기본키로 제약조건입니다.
--  기본키로 지정한 컬럼은 널(NULL)값이나 중복된 값을 가질 수 없기 때문에 개체가 무결성을 유지할 수 있게 된다.

--외래 키 제약 조건
--관계형 데이터베이스는 데이터가 중복되어 저장하는 것을 지양합니다. 
--모 회사의 사원이 어느 부서에 소속되어 있는지에 대한 정보를 저장한 테이블입니다.

--부서 테이블 제거하기
DROP TABLE EMP;
--사원 테이블 제거하기
DROP TABLE DEPT;
--급여 테이블 제거하기
DROP TABLE SALGRADE;
DROP TABLE EMPLOYEE;
DROP TABLE DEPARTMENT;
DROP TABLE SALGRADE;

--부서 테이블 생성하기
CREATE TABLE DEPT(
    DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13) );

-- 사원 테이블 생성하기
CREATE TABLE EMP( 
  	 EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	 ENAME VARCHAR2(10),
 	 JOB   VARCHAR2(9),
	 MGR  NUMBER(4),
	 HIREDATE DATE,
	 SAL NUMBER(7,2),
	 COMM NUMBER(7,2),
	 DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);

 -- 급여 테이블 생성하기
CREATE TABLE SALGRADE(
	 GRADE NUMBER,
	 LOSAL NUMBER,
	 HISAL NUMBER );

-- 부서 테이블에 샘플 데이터 추가하기
INSERT INTO DEPT VALUES(10, '경리부', '서울');
INSERT INTO DEPT VALUES(20, '인사부', '인천');
INSERT INTO DEPT VALUES(30, '영업부', '용인'); 
INSERT INTO DEPT VALUES(40, '전산부', '수원');

-- 사원 테이블에 샘플 데이터 추가하기
INSERT INTO EMP VALUES(1001, '김사랑', '사원', 1013, to_date('2007-03-01','yyyy-mm-dd'), 300, NULL, 20);
INSERT INTO EMP VALUES(1002, '한예슬', '대리', 1005, to_date('2007-04-02','yyyy-mm-dd'), 250,   80, 30);
INSERT INTO EMP VALUES(1003, '오지호', '과장', 1005, to_date('2005-02-10','yyyy-mm-dd'), 500,  100, 30);
INSERT INTO EMP VALUES(1004, '이병헌', '부장', 1008, to_date('2003-09-02','yyyy-mm-dd'), 600, NULL, 20);
INSERT INTO EMP VALUES(1005, '신동협', '과장', 1005, to_date('2005-04-07','yyyy-mm-dd'), 450,  200, 30);
INSERT INTO EMP VALUES(1006, '장동건', '부장', 1008, to_date('2003-10-09','yyyy-mm-dd'), 480, NULL, 30);
INSERT INTO EMP VALUES(1007, '이문세', '부장', 1008, to_date('2004-01-08','yyyy-mm-dd'), 520, NULL, 10);
INSERT INTO EMP VALUES(1008, '감우성', '차장', 1003, to_date('2004-03-08','yyyy-mm-dd'), 500,    0, 30);
INSERT INTO EMP VALUES(1009, '안성기', '사장', NULL, to_date('1996-10-04','yyyy-mm-dd'),1000, NULL, 20);
INSERT INTO EMP VALUES(1010, '이병헌', '과장', 1003, to_date('2005-04-07','yyyy-mm-dd'), 500, NULL, 10);
INSERT INTO EMP VALUES(1011, '조향기', '사원', 1007, to_date('2007-03-01','yyyy-mm-dd'), 280, NULL, 30);
INSERT INTO EMP VALUES(1012, '강혜정', '사원', 1006, to_date('2007-08-09','yyyy-mm-dd'), 300, NULL, 20);
INSERT INTO EMP VALUES(1013, '박중훈', '부장', 1003, to_date('2002-10-09','yyyy-mm-dd'), 560, NULL, 20);
INSERT INTO EMP VALUES(1014, '조인성', '사원', 1006, to_date('2007-11-09','yyyy-mm-dd'), 250, NULL, 10);

-- 급여 테이블에 샘플 데이터 추가하기
INSERT INTO SALGRADE VALUES (1, 700,1200);
INSERT INTO SALGRADE VALUES (2, 1201,1400);
INSERT INTO SALGRADE VALUES (3, 1401,2000);
INSERT INTO SALGRADE VALUES (4, 2001,3000);
INSERT INTO SALGRADE VALUES (5, 3001,9999);
COMMIT;

--테이블 구조를 살펴보기 위한 DESC
--(1) 테이블에서 이터를 조회하기 위해서는 테이블의 구조를 알아야 한다.
--(2) 테이블의 구조를 확인하기 위한 명령어로는 DESCRIBE가 있다.
--(3) DESC 명령어는 테이블의 칼럼명, 데이터 형, 길이와 NULL 허용 유무 등과 같은 특정 테이블의 정보를 알려준다
--DUAL 테이블이란?
--DUAL 테이블을 바로 산술 연산의 결과를 한 줄로 얻기 위해서 오라클에서 제공하는 테이블
--DUAL 테이블은 사용자가 함수(계산)를 실행할 때 임시로 사용하는데 적합
--함수에 대한 쓰임을 알고 싶을 때 특정 테이블을 생성할 필요 없이 DUAL 테이블을 이용하여 함수의 값을 return 받을 수 있다.

desc emp;

--사원테이블 조회하기
SELECT * FROM emp;

--사원테이블에서 empno, ename 조회하기
SELECT empno, ename FROM emp;

--연봉구하기 : ename,sal,연봉 사원테이블에서
SELECT ename, sal*12 연봉 FROM emp;
SELECT ename, sal*12 as 연봉 FROM emp;
SELECT ename, sal*12 ANNUAL FROM emp;

--컬럼이름에 별칭 지정해서 출력하기 FROM DEPT (부서 테이블)
SELECT deptno as "부서번호", dname "부서명" FROM dept;

--SELECT는 데이터베이스 내에 저장되어 있는 테이블을 조회하기 위한 명령어이다
--SELECT 다음에는 보고자 하는 대상의 컬럼명을 기술한다.
--SELECT 다음에 *을 기술하면 지정된 테이블의 모든 컬럼을 조회한다.
--FORM 다음에는 보고자 하는 대상의 테이블 이름을 기술한다.

--AS로 컬럼에 별칭 부여하기
--컬럼명 대신 별칭을 출력하고자 하면 컬럼을 기술한 바로 뒤에 AS라는 키워드를 쓴 후 별칭을 기술한다.

--안되는 이유
SELECT ename, salary*12+nvl(commission,0) as 연봉 from emp;
--해결
SELECT ename, sal, job, sal*12, sal*12+comm, comm, deptno FROM emp;

--NVL 함수
--NVL("값","대체값")
--NULL 처리를 위한 함수로 해당 컬럼의 값이 NULL 값인 경우 다른 값으로 대체하여 출력

SELECT ename, sal*12+nvl(comm, 0) FROM emp;
--NULL 처리를 위한 NVL 함수
--NVL은 NULL 값을 다른 값으로 대체하기 위한 함수
--Syntax : NVL(expr1, expr2)
--expr1이 NULL이면 expr2를 리턴하고
--expr1이 NOT NULL이면 expr1을 리턴
--expr1과 expr2는 여러 데이터 타입을 가질 수 있는데
--서로 데이터 타입이 다르면 expr1의 데이터 타입을 리턴

--as 키워드 생략, ""(쌍 따옴표) 사용
SELECT ename, sal*12+nvl(comm,0) "Annsal" FROM emp;
--띄어쓰기와 같은 특수분자 사용
SELECT ename, sal*12+nvl(comm,0) AS "A n n s a l" FROM emp;

--중복된 데이터를 한번씩만 출력하게 하는 DISTINCT
--중복되는 부서번호를 한번씩만 출려하기 위해서는 키워드 DISTINCT를 사용한다.
SELECT DISTINCT DEPTNO FROM EMP;

--오라클에서는 여러개의 컬럼을 연결할 때 사용하기 위해서 CONCATENATION
--연산자를 제공해 줍니다. 영 문장처럼 보이도록 하기 위해서 "||"를 컬럼과
--문자열 사이에 기술하여 하나로 연결하여 출력하면 된다.
SELECT ENAME || '의 직급은' || JOB || '입니다' AS "직급" FROM EMP;

--EMP테이블에서 SAL>=500 조회
SELECT * FROM EMP WHERE SAL >= 500;
--SAL != 500
SELECT * FROM EMP WHERE SAL ^= 500;

SELECT * FROM EMP WHERE NOT DEPTNO = 10;

--특정 조건의 데이터만 조회하는 where 조건
--원하는 로우만 얻으려면 로우를 제한하는 조건을 select 문에 where 절을 추가하여 제시해야 한다.

--이문세인 사람만 조회하기
SELECT * FROM EMP WHERE ename = '이문세';
--invalid identifier 부정확한 식별자
SELECT * FROM EMP WHERE ename = "이문세";

--입사일이 2005/03/20 이전
SELECT * FROM EMP WHERE hiredate < to_date('2005/03/20', 'yyyy/mm/dd');
--to_date(문자열, 날짜 포맷)
--문자열을 날짜 데이터로 바꾸는 함수
--문자열이 작성된 형식과 날짜포맷 형식을 동일하게 맞춰야 한다.

--emp 테이블로부터 조건절에서 부서번호가 10인 부서를 조회하기
SELECT * FROM EMP WHERE DEPTNO = 10;

--비교 및 논리 연산자를 사용하여 10번 부서이고, 직급이 과장인 사람을 조회하기
SELECT * FROM EMP WHERE DEPTNO = 10 and job = '과장';
--논리 연산자 
--조건을 여러개 조합해서 결과를 얻어야 할 경우, 조건을 연결해주는 논리 연산자를 사용한다
--오라클에서 사용가능한 논리 연산자 and, or, not(<>) 이 있다.

--급여가 400~500인 사원 출력하기
SELECT * FROM EMP where sal between 400 and 500;
--between and 연산자
--특정 범위내에 속하는 데이터인지를 알아보기 위해서
--비교 연산자와 논리 연산자를 결합하여 표현할 수 있다.

--in연산자를 사용하여 커미션이 80이거나 100이거나 200인 사원 조회하기
SELECT * FROM EMP where comm in(80, 100, 200);
--in 연산자
--특정 필드의 값이 a이거나 b이거나 c중에 어느 하나만 만족하더라도 출력하는 연산자이다.

--hiredate와 between을 사용하여 2003년에 입사한 직원을 출력하기
select * from emp where hiredate 
between to_date('2003/01/01','yyyy/mm/dd') 
and to_date('2003/12/31','yyyy/mm/dd');

select * from emp where comm !=80 and comm <> 100 and comm ^=200;
--!=, <>, ^= 모두 not연산자
--in연산자를 사용하여 위와 같은 동작 구현하기
select * from emp where comm not in(80, 100, 200);



----------------------------------------09/02--------------------------------------

--like연산자와 와일드카드
--column_name like pattern
--like 다음에는 pattern을 기술해야 하는데 pattern에 다음과 같이 두가지 와일드 카드가 사용된다.
--% : 문자가 없거나, 하나 이상의 문자가 어떤값이 와도 상관없다.
--_ : 하나의 문자가 어떤값이 와도 상관없다.

--이씨성을 가진 사람을 like를 이용하여 출력하기
select * from emp where ename like '이%';

--'성'이 아무데나 들어가기만 해도 되는 이름을 조회하기
select * from emp where ename like '%성%';

--'성'이 뒤에만 들어가는 이름을 출력하기
select * from emp where ename like '%성';

--'성'이 가운데만 들어가는 이름을 출력하기
select * from emp where ename like '_성_';

--'성'이 가운데 안들어가는 이름을 출력하기
select * from emp where not ename like '_성_';

--null인 값을 찾기 위한 is null
--대상 칼럼 is(연산자) null(비교값);

--잘못된 방법이라 결과가 안나온다.
select * from emp where comm=null;
--커미션이 null인 사람을 조회하기
select * from emp where comm is null;
--커미션이 null이 아닌 사람을 조회하기
select * from emp where not comm is null;

--정렬을 위한 order by
--select 칼럼1, 칼럼2, ... from 테이블명 where 조건 order by 칼럼명 정렬방식
--order by 절 다음에는 어떤 칼럼을 기준으로 정렬할 것인지를 결정해야 하기에 칼럼 이름을 기술해야 한다.
--그 다음에는 오름차순으로 정렬(asc)일지, 내림차순(desc)일지 정렬방식을 기술해야 한다. 

--asc 오름차순
--숫자 : 작은 값 부터 정렬
--문자 : 사전 순서로 정렬
--날짜 : 빠른 날짜 순서로 정렬
--null : 가장 마지막

--desc 내림차순
--숫자 : 큰 값 부터 정렬
--문자 : 사전 반대 순서로 정렬
--날짜 : 늦은(최근) 날짜 순서로 정렬
--null : 가장 먼저

--급여를 많이 받는 순으로 출력, 급여가 같으면 이름순으로 출력 하기
  select * from emp order by sal desc, ename asc;

--입사날짜가 최근 순, 날짜가 같으면 이름순으로 출력하기
  select * from emp order by hiredate desc, ename asc;

----복습 퀴즈----

--1. 급여가 300이하인 사원의 사원번호, 사원이름, 급여 출력하기
     select empno, ename, sal from emp where sal<=300;
--2. 이름이 오지호인 사원의 사원번호, 사원이름, 급여 출력하기
    select empno, ename, sal from emp where ename = '오지호';
--3. 급여가 250이거나 300이거나 500인 사원의 사원번호, 사원명, 급여를 출력하기
    select empno, ename, sal from emp where sal in(250,300,500);
--4. 급여가 250이거나 300이거나 500도 아닌 사원들 검색하기
    select empno, ename, sal from emp where not sal in(250,300,500);
--5. like 연산자와 와일드 카드를 사용하여 사원들 중에서 
--이름이 "김" 으로 시작하는 사람과 이름중에 "기"를 포함하는 사원의 사원번호와 사원이름 출력하기
    select empno, ename from emp where ename like '김%' or ename like '%기%';
--6. 상관이 없는 사원을 출력하기
    select * from emp where ename = '안성기'; --좋지 않은 방법
    select * from emp where job = '사장'; --좋지 않은 방법
    select * from emp where mgr is null;
--7. 사원테이블에서 최근에 입사한 직원 순으로 사원번호, 사원이름, 직급, 입사일 출력하기
    select empno, ename, job, hiredate from emp order by hiredate desc; 
--8. 부서 번호가 빠른 사원부터 출력하되 같은 부서의 사원은 입사한지 오래된 사원부터 출력하기
    select deptno, ename, hiredate from emp order by deptno asc, hiredate asc; 
    
--GROUP_STAR와 SINGLE_STAR 테이블을 초기화
DROP TABLE GROUP_STAR;
DROP TABLE SINGLE_STAR;

--GROUP_STAR와 SINGLE_STAR 테이블을 생성
CREATE TABLE GROUP_STAR( NAME VARCHAR2(50));
CREATE TABLE SINGLE_STAR( NAME VARCHAR2(50));

--GROUP_STAR에 값을 입력
INSERT INTO GROUP_STAR VALUES('태연');
INSERT INTO GROUP_STAR VALUES('유리');
INSERT INTO GROUP_STAR VALUES('윤아');
INSERT INTO GROUP_STAR VALUES('효연');
INSERT INTO GROUP_STAR VALUES('티파니');
INSERT INTO GROUP_STAR VALUES('제시카');
INSERT INTO GROUP_STAR VALUES('수영');
INSERT INTO GROUP_STAR VALUES('써니');
INSERT INTO GROUP_STAR VALUES('서현');
INSERT INTO GROUP_STAR VALUES('탑');
INSERT INTO GROUP_STAR VALUES('지드래곤');
INSERT INTO GROUP_STAR VALUES('대성');
INSERT INTO GROUP_STAR VALUES('승리');
INSERT INTO GROUP_STAR VALUES('태양');

--SINGLE_STAR에 값을 입력
INSERT INTO SINGLE_STAR VALUES('태연');
INSERT INTO SINGLE_STAR VALUES('지드래곤');
INSERT INTO SINGLE_STAR VALUES('대성');
INSERT INTO SINGLE_STAR VALUES('태양');
INSERT INTO SINGLE_STAR VALUES('아이유');
INSERT INTO SINGLE_STAR VALUES('백지영');
INSERT INTO SINGLE_STAR VALUES('윤종신');
COMMIT;

--집합 연산자
--union 합집합, minus 차집합, intersect 교집합 에서는
--입력 테이블과 결과 테이블에서 중복된 레코드가 배제된다.
--union all, minus all, intersect all 에서는
--입력 테이블과 결과 테이블에 중복된 레코드가 허용된다.
--형식 : <쿼리1>집합연산자1 <쿼리2>집합연산자2 <쿼리n>

--union : 여러개의 쿼리 결과를 하나로 합치는 연산자인데, union은 중복된 영역을 제외하여 하나로 합치는 연산자.
--union all : union과 같은 여러 쿼리 결과물에 대한 합집합을 의미하며, 중복된 영역을 모두 포함시키는 연산자.
--intersect : 여러개의 select 결과에서 공통된 부분만 결과로 추출한다. 즉, 수행결과에 대한 교집합이라고 볼 수 있다.
--minus : 선행 select 결과에서 다음 select 결과와 겹치는 부분을 제외한 나머지 부분만 추출한다. 즉, 두 쿼리 결과물의 차집합이라 볼 수 있다.

--그룹활동과 싱글활동을 하는 가수이름을 중복하여 출력하기
    select * from group_star union all select * from single_star;
    
--그룹활동과 싱글활동을 하는 가수이름을 중복하지 않게 출력하기
    select * from group_star union select * from single_star;
    
--싱글활동만 하는 가수이름을 출력하기
    select * from single_star minus select * from group_star;
    
--그룹활동도 하고 싱글활동도 하는 가수이름을 출력하기
    select * from group_star intersect select * from single_star;
