show user;

--실습할 계정을 만들었습니다.
select * from tab;
--작성된 테이블 목록 확인

--DUAL 테이블이란?
--DUAL 테이블을 바로 산술 연산의 결과를 한 줄로 얻기 위해서 오라클에서d
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

--부서 테이블 생성하기
CREATE TABLE DEPT(
    DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13) 
);

-- 사원 테이블 생성하기
CREATE TABLE EMP( 
    EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB   VARCHAR2(9),
    MGR  NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);

 -- 급여 테이블 생성하기
CREATE TABLE SALGRADE(
    GRADE NUMBER,
    LOSAL NUMBER,
    HISAL NUMBER 
);

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
    SELECT ename, sal*12 FROM emp;
    SELECT ename, sal*12 as 연봉 FROM emp;
    SELECT ename, sal*12 ANNUAL FROM emp;

--컬럼이름에 별칭 지정해서 출력하기 FROM DEPT (부서 테이블)
    SELECT deptno as 부서번호, dname "부서명" FROM dept;

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

--EMP테이블에서 SAL>=500 조회하기
    SELECT * FROM EMP WHERE SAL >= 500;
--SAL != 500
    SELECT * FROM EMP WHERE SAL ^= 500;
--부서번호가 10인 사람 조회하기
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
--비교 및 논리 연산자를 사용하여 10번 부서이거나, 직급이 과장인 사람을 조회하기
    SELECT * FROM EMP WHERE DEPTNO = 10 OR job = '과장';
--비교 및 논리 연산자를 사용하여 10번 부서가 아니고, 직급이 과장인 사람을 조회하기
    SELECT * FROM EMP WHERE NOT DEPTNO = 10 AND job = '과장';
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
    
    
----------------------------------------09/05--------------------------------------

--ltrim(), rtrim()
--ltrim(문자열, 지울 문자열)
--문자열의 왼쪽에서 지울 문자열을 지운 값을 반환
--왼쪽 끝의 글자부터 순서대로 지울 수 있으며, 중간이나 오른쪽의 문자는 못지우고 원래 값을 반환
    select ltrim('goodbye','g'), ltrim('goodbye','o'), ltrim('goodbye','go') from dual;
                                 --o는 중간에 있기 때문에 지울 수 없다.

--rtrim(문자열, 지울 문자열)
--문자열의 오른쪽에서 지울 문자열을 지운 값을 반환
    select rtrim('goodbye','e'), rtrim('goodbye','o'), rtrim('goodbye','ye') from dual;
    
--substr(문자열, 시작위치, 추출할 개수)
--문자열의 시작위치 인덱스부터 추출할 개수 만큼의 문자열을 반환
--시작위치 값이 양수일  경우 인덱스는 왼쪽에서 1부터 시작
--시작위치 값이 음수일 경우 인덱스는 오른쪽에서 -1부터 시작
--한글의 경우도 똑같이 동작한다.
    select substr('good morning john', 8, 4) from dual;
--r부터 나머지를 출력    
    select substr('good morning john', 8) from dual;
--오른쪽 부터 4글자
    select substr('good morning john', -4) from dual;    
--0인 경우는 null
    select substr('good morning john', -4, 0) from dual;
    
--substrb(문자열, 시작위치, 바이트수)
--문자열의 시작 인덱스 부터 바이트 수 만큼 문자를 추출
    select substrb('good morning john', 8, 4) from dual;    
--한글은 인덱스를 2씩 차지하며, 각 글자당 3~4바이트를 차지한다.
    select substrb('일이삼사오육칠팔구십', 8, 17) from dual;    
    
--replace(문자열, 기존 문자열, 바꿀 문자열)    
--문자열 안에서 기존 문자열들을 바꿀 문자열로 변경한다
--replace는 지정된 문자열 단위로 교체
    select replace('good morning john', 'morning', 'evening') from dual;
    
--translate(문자열, 기존 문자, 바꿀 문자)
--기존 문자들과 바꿀 문자들은 각 인덱스 순서대로 1:1 매칭되어 변경된다.
--translate는 문자 단위로 바꿈
    select translate('you are not alone', 'you', 'we') from dual;
--y문자를 w로 변경, o문자를 e로 변경, u문자를 없앰

--trim()
--trim() 함수는 사용하는 인수 3종류에 따라 해당 문자열의 앞 or 뒤 or 양쪽의 지정 값을 제거한다.
--기본적으로 trim은 공백을 제거하는 것이 기본 값이며 해당 용도로 많이 사용된다.
    select trim('      trim     ') from dual; 
    
    select trim(leading from '   good   '), 
           trim(trailing from '   good   '),
           trim(both from '   good   ')
    from dual;
--왼쪽의 지정 문자를 제거
    select trim(leading 't' from 'trimm  ') from dual;

    
--length()    
--  왼쪽 공백제거 후 길이
    select length(trim(leading from '   good   ')), 
--  오른쪽 공백제거 후 길이
            length(trim(trailing from '   good   ')),
--  양쪽 공백제거 후 길이
            length(trim(both from '   good   ')),
--  양쪽 공백제거
            trim(both from '   good   ')
    from dual;

--instr(문자열, 찾을 문자 값, 찾기를 시작할 위치, 찾은 결과의 순번)
--문자열에서 원하는 문자의 위치를 찾기 위한 함수
--대소문자를 구별하여 검색한다
--여러개의 문자를 찾을때는 or연산자 사용
--1번부터 탐색하여, 첫 번째 or가 시작하는 위치
    select instr('good morning john','or',1) from dual;
--1번부터 탐색하여, 두 번째 o가 나오는 위치    
    select instr('good morning john','o',1, 2) from dual; 
    
--숫자형을 문자형으로 변환하기
--0   자릿수, 자릿수가 맞지 않으면 0으로 채움
--9   자릿수, 자릿수가 맞지 않아도 채우지 않음
--L   각 지역별 통화기호를 앞에 표시
--.   소숫점
--,   천 자리 구분

--날짜형으로 변환하는 TO_DATA 함수
--TO_DATE('문자', 'format');
--emp테이블에서 2007년 4월 2일에 입사한 사원 검색하기
    select * from emp where hiredate = to_date('2007/04/02', 'yyyy-mm-dd');

--숫자형으로 변환하는 to_number 함수
    select to_number('20,000', '99,999') - to_number('80,000', '99,999') from dual;
    
--입사일 달 기준으로 잘라내기 (to_char 2007/04/02 -> 2007/04/01 )
    select ename, hiredate, to_char(trunc(hiredate,'month'),'yyyy/mm/dd') from emp ;
    
--두 날짜 사이 간격을 구하는 months_between 함수
--months_between(date1, date2)
--오늘부터 입사일 사이의 개월수 구하기
    select ename, trunc(months_between(sysdate, hiredate)) 근무달수 from emp;
    
--개월수를 더하는 add_months 함수
--add_months(date,number)
--입사 날짜에 6개월 더하기
    select ename, hiredate, add_months(hiredate,6) from emp;
    
--해당 날짜에서 가장 가까운 요일의 날짜를 반환하는 next_day 함수
--next_day(date, 요일)
--1일요일 2월요일 3화요일 4수요일 5목요일 6금요일 7토요일
--오늘을 기준으로 최초로 도래하는 금요일은 언제인가
    select sysdate 오늘, next_day(sysdate, 6) 금요일 from dual;
    
    
--substr을 사용하여 9월에 입사한 사원 출력하기
    select * from emp where substr(hiredate, 4, 2) = '09';
--substr을 사용하여 2003년에 입사한 사원 출력
    select * from emp where substr(hiredate, 1, 2) = '03';
--substr을 사용하여 입사일자 년도(두자리), 월(두자리), 일(두자리)을 나누어 출력
    select hiredate, substr(hiredate,1,2) 년도, substr(hiredate,4,2) 월, substr(hiredate,7,2) 일 from emp;
--substr을 사용하여 '기'로 끝나는 사원 출력
    select * from emp where substr(ename,2,1) = '기' or substr(ename, 3) = '기';
    select * from emp where substr(ename,-1,1) = '기'; --다른 풀이법
--substr을 사용하여 이름의 두번째에 '동'이 있는 사원 출력    
    select * from emp where substr(ename,2,1) = '동';
--instr을 사용하여 이름의 두번째에 '동'이 있는 사원의 empno,ename 출력    
    select empno,ename from emp where instr(ename,'동',1) = 2;
    
--decode 함수    
--swith, case와 같은 기능을 한다.
--여러가지 경우에 대해서 선택할 수 있다.
--decode(표현식, 조건1, 결과1, 조건2, 결과2, ...,기본결과)
    select ename, deptno, decode(deptno,10,'경리부', 
                                        20,'인사과', 
                                        30,'전산부') 
    as DNAME from emp order by dname;

--case 함수
--if else if else와 유사한 구조를 갖는다.
--decode가 제공하지 못하는 비교연산의 단점을 해결한 함수
--다양한 비교연산자를 사용하여 조건을 제시할 수 있어 범위를 지정할 수도 있다.
--CASE WHEN 조건1 THEN 결과1 WHEN 조건2 THEN 결과2 ... ELSE 결과 END;
    select ename, deptno, case when deptno = 10 then '경리부'
                               when deptno = 20 then '인사과'
                               when deptno = 30 then '전산부'
                               end
    as dname2 from emp order by dname2;


--직급에 따라 부장인 사원은 5%, 과장인 사원은 10%, 대리인 사원은 15%, 사원인 사원은 20% 급여인상하기
--EMPNO, ENAME, JOB, SAL Upsal로 출력하기
    select empno, ename, job, sal, decode(job,'부장', sal*1.05, 
                                              '과장', sal*1.10, 
                                              '대리', sal*1.15, 
                                              '사원', sal*1.20) 
    as "SAL Upsal" from emp order by job;
    
--decode와 mod를 사용하여 홀수 사번들의 입사날짜를 조회하기 (짝수 사번은 null)   
    select empno, ename, decode(mod(empno, 2), 1, hiredate, null) 입사일 from emp; 
    --,null은 없어도 됨
    
--round를 사용하여 근무일수 구하기    
--round(date, fromat)처럼 format을 지정하면 날짜에 대해서도 반올림 할 수 있다.
    select ename, to_char(sysdate) 현재날짜, to_char(hiredate) 입사날짜, to_char(round(sysdate-hiredate)) 근무일수 from emp;
    
--입사일을 연도는 2자리, 월은 숫자(MON), 요일은 약어(DY)로 지정하여 출력하기
    select hiredate, to_char(hiredate, 'yy/mon/dy') from emp;
    select hiredate, to_char(hiredate, 'yy'),
           to_char(hiredate, 'mon'), to_char(hiredate, 'dy') from emp;

--nvl을 사용하여 직속상관이 없는 사원의 empno,ename,직속상관을 ceo로 출력하기
    select empno, ename, nvl(to_char(mgr,'9999'),'ceo') as "직속 상관" from emp where mgr is null;

----------------------------------------09/06--------------------------------------
----그룹함수
--테이블의 전체 데이터에서 통계적인 결과를 구하기 위한 함수
--하나이상의 행을 묶어 그룹으로 만들어 연산하여 결과를 나타냄
--행 집합에 적용하여 하나의 결과를 생산함
--sum : 그룹의 누적 함계
--avg : 그룹의 평균
--count : 그룹의 총 개수
--max : 그룹의 최댓값
--min : 그룹의 최솟값
--stddev : 그룹의 표준편차
--variance : 그룹의 분산

--group by 절
--특정 칼럼을 기준으로 그룹함수를 사용할 경우 어떤 칼럼 값을 기준으로 그룹함수를 줄 지를 결정할때 사용한다.
--select 칼럼명, 그룹함수 from 테이블명 where 조건 group by 칼럼명
--사원 테이블을 부서 번호로 그룹 만들기
    select deptno from emp group by deptno;

--소속 부서별 최대 급여와 최소 급여 구하기     
    select deptno, max(sal), min(sal) from emp group by deptno;
    
    select deptno, sal from emp order by deptno,sal desc;
--위의 두개를 합친 그룹과 정렬
    select deptno, max(sal), min(sal) from emp group by deptno order by deptno;

--최고 급여(평균) 출력하기
    select max(avg(sal)) from emp group by deptno;
    
--having 절    
--select절에서는 조건을 사용하여 결과를 제한할 때 where을 사용하지만
--그룹의 결과를 제한할 때는 having 절을 사용한다.

--부서별 급여 평균이 500이상인 부서의 번호와 급여 평균 구하기
    select deptno, avg(sal) from emp group by deptno having avg(sal)>=500;
    
--에러 이유를 알아보고 올바르게 구해보기  ?????
    select deptno, ename, avg(sal) from emp group by deptno;
    --에러이유 : 목록이 group by 목록과 일치하지 않아 에러 발생
    select deptno, ename, avg(sal) from emp group by deptno, ename;
   
--having절을 사용하여 사원을 제외하고 급여 총액이 1000이상인 직급별 숫자를 구하고 급여 총액 구하기 (sal순으로 정렬)
    select job, count(*), sum(sal) from emp where job != '사원' group by job having sum(sal) >= 1000 order by sum(sal);
    select job, count(*), sum(sal) from emp group by job having job != '사원' and sum(sal) >= 1000 order by sum(sal);   
   
--급여 최고액, 최저액, 총액, 평균 출력하기 (round사용)    
    select max(sal) 최고액, min(sal) 최저액, sum(sal) 총액, round(avg(sal)) 평균 from emp group by deptno;
    
--직급별 사원수를 출력하기    
    select job, count(job) from emp group by job;
    
--과장의 수를 조회해 보기    
    select job, count(job) from emp group by job having job = '과장';
    
--급여 최고액, 급여 최저액의 차액 출력하기
    select max(sal)-min(sal) 차액 from emp;
    
--부서별 사원수 평균 급여를 반올림하기 ( 부서그룹 정렬과, 부서번호를 오름차순으로 정렬 )   
    select deptno 부서번호, count(*) 사원수, round(avg(sal)) 평균급여 from emp group by deptno order by deptno asc;
    
--부서번호, 이름, 지역명, 부서내의 모든 사원의 평균 급여 출력 (decode 사용)
    select deptno, decode(deptno, 10, '경리부'
                                , 20, '인사부'
                                , 30, '영업부'
                                , 40, '전산부') DNAME,
                   decode(deptno, 10, '서울'
                                , 20, '인천'
                                , 30, '용산'
                                , 40, '수원') LOCATION,
           count(*) as "Number of People", round(avg(sal)) sal                
    from emp group by deptno;
    
    
--데이터 딕셔너리 ????
--데이터 딕셔너리는 사용자가 테이블을 생성하거나 사용자를 변경하는 등의 작업을 할 때
--데이터 베이스 서버에 의해 자동으로 갱신되는 테이블이다.
--사용자는 데이터 딕셔너리의 내용을 직접 수행하거나 삭제할 수 없고
--사용자가 이해할 수 있는 데이터를 산출해 줄 수 있도록 하기 위해서 읽기 전용 뷰 형태로 정보를 제공한다.
--용어 사전은 엔티티, 속성의 이름의 의미를 설명해 놓은 사전을 의미한다.

--USER_ : 자신의 계정이 소유한 객체 등에 관한 정보 조회
--ALL_ : 자신 계정 소유 또는 권한을 부여받은 객체 등에 관한 정보 조회
--DBA_ : 데이터 베이스 관리자만 접근 가능한 객체 등의 정보 조외

--ALL_
    select owner, table_name from all_tables;
--DBA_ : dba나 시스템 권한을 가진 사용자만 접근가능, 권한이 없으면 오류 발생
    select owner, table_name from dba_tables;
    
--데이터 베이스 관리자만 접근 가능, 권한에 대한 정보를 갖는 딕셔너리
    select * from dba_sys_privs;
    
--테이블 기술서 <<프로젝트 추가 서류입니다>>
--테이블 기술서는 개별 테이블에 대한 보다 자세한 문서화 수단이 된다.
--모델링 도구에 테이블에 대한 정보가 저장되어 있지만 테이블 하나하나에 대한 출력된 문서가 필요하다.

--대표적인 시스템 권한
--create session : 데이터베이스에 접속할 수 있는 권한
--create table : 테이블을 생성할 수 있는 권한
--create any table : 다른 user의 이름으로 테이블을 생성할 수 있는 권한
--create tablespace : 테이블 스페이스를 만들 수 있는 권한
--unlimited tablespace : 사용량을 무제한으로 허용하는 권한
--select any table : 어느 테이블, 뷰라도 검색을 할 수 있는 권한
--create user : 새로운 사용자를 생성
--create view : 사용자 스키마에서 뷰를 생성할 수 있는 권한
--create sequence : 사용자 스키마에서 시퀀스를 생성할 수 있는 권한
--create procedure : 사용자 스키마에서 함수를 생성할 수 있는 권한
--drop user : 사용자를 삭제하는 권한
--drop any table : 임의의 테이블을 삭제할 수 있는 권한
--
--권한 부여 명령 grant
--권한 회수 명령 revoke

--role 생성
--  create role 롤이름:
--role 권한 부여
--  grant 권한 to 롤이름
--권한이 부여된 롤을 유저에게 부여
--  grant 롤이름 to 유저1, 유저2,...;

--connect 롤 : 사용자가 접속하기 위하여 가장 기본적인 권한 8가지를 묶어 놓음
--resource 롤 : 사용자가 객체(테이블, 뷰, 인덱스)를 생성할 수 있도록 시스템 권한을 묶어 놓음
--dba 롤 : 시스템 관리에 필요한 모든 권한을 부여할 수 있는 가장 강력한 권한

--DDL(Data Definition Language) : create 문, drop 문, alter 문
--테이블 구조를 만드는 create table 문
--create table 테이블이름( 열이름 데이터형 [default 표현식], [열이름 데이터형...]);

--스테레오 타입이란
--설계 모델에 의미(또는 분류)를 부여하고 싶을 때 사용
--<< 와 >> 사이에 스테레오명 정의
--클래스명 뿐만 아니라 모든 요소에 적용가능
--uml에서의 스테레오 타입이 이미 정의되어 있음
--설계자가 임의로 지정할 수도 있음


--사원정보를 저장하기 위한 테이블 생성하기
    drop table emp01;
    
    create table emp01(
        eno number(4),
        ename varchar2(14),
        sal number(7,3)
    );
    
    desc emp01;
    select * from emp01;
    
--사원테이블에 날짜 타입을 가지는 birth 칼럼 추가하기    
    alter table emp01 add(birth date);
    desc emp01;
    select * from emp01;
    
--사원이름 칼럼 크기 30으로 변경하기
    alter table emp01 modify ename varchar2(30);
    desc emp01;
    
--사원테이블에서 이름 컬럼 제거하기    
    alter table emp01 drop column ename;
    desc emp01;
    
--시스템의 요구가 적을 때 칼럼을 제거할 수 있도록 하나 이상의 칼럼을 unused로 표시
--실제로는 테이블에서 해당 칼럼이 제거되지는 않음
    alter table emp01 set unused(eno);    
    desc emp01;
    
--테이블에서 unused로 표시된 모든 칼럼을 제거하기
    alter table emp01 drop unused columns;
    desc emp01;
    
--테이블 명을 변경하는 rename문
--rename 이전이름 to 바꿀이름
    rename emp01 to emp02;
    desc emp02;
    desc emp01;
    
    drop table emp02;
    desc emp02;
    
--rownum    
--내장 함수는 아니지만 자주 사용되는 문법임
--오라클에서 내부적으로 생성되는 가상 칼럼으로 sql조회 결과의 순번을 나타냄
--자료를 이부분만 확인하여 처리할때 유용함
    select rownum "순번", empno, ename, sal from emp where rownum<=3;
    
--insert문 : 데이터 삽입
--insert into 테이블이름[(속성 리스트)] values(속성값_리스트);
--into 키워드와 함께 투플을 삽입할 테이블의 이름과 속성의 이름을 나열
--속성 리스트를 생략하면 테이블을 정의할 때 지정한 속성의 순서대로 값이 삽임됨
--values 키워드와 함께 삽입할 속성 값들을 나열
--into 절의 속성 이름과 values 절의 속성 값은 순서대로 일대일 대응되어야함
    select * from dept01;
    drop table dept01;
    
    create table dept01(
        deptno number(02),
        dname varchar2(14),
        loc varchar2(13)
    );
    desc dept01;
    
    insert into dept01 values(10, '경리부', '서울');
    select * from dept01;
    
    insert into dept01 (deptno, loc, dname) values(20, '인천', '인사부');
    select * from dept01;

    insert into dept01 values(40, '전산부', null);
    select * from dept01;

    insert into dept01 values(50, '기획부', '');
    select * from dept01;
    
    desc dept01;
    
    
    drop table emp02;
    
    create table emp02(
        empno number(4),
        ename varchar2(10),
        job varchar2(9),
        hiredate date,
        deptno number(2)
    );
    desc emp02;
    
    insert into emp02 values(1001, '김사랑', '사원', '2015/03/01', 20);
    select * from emp02;

    insert into emp02 values(1002, '한예슬', '대리', to_date('2014,05,01','yyyy,mm,dd'), 20);
    select * from emp02;

    insert into emp02 values(1003, '오지호', '과장', sysdate, 30);
    select * from emp02;
    
    desc emp02;
    

--테이블에 내용을 수정하는 update문
--update 테이블이름 set 속성이름1=값1, 속성이름2=값2,... where 검색조건;

--dept01 테이블에서 10번 부서의 부서명을 생산부로 업데이트 하기
    update dept01 set dname='생산부'where deptno=10;
    select * from dept01;
--dept01 테이블에서 20번 부서의 부서명은 생산부2, 위치를 부산으로 업데이트 하기
    update dept01 set dname='생산부2',loc='부산' where deptno=20;
    select * from dept01;
    
    commit;
    
--모든 dname을 생산부3로 업데이트하기
    update dept01 set dname='생산부3';
    select * from dept01;

--업데이트 하기 전으로 되돌리기
    rollback;
    select * from dept01;
    commit;

--delete문
--테이블에 있는 기존 튜플을 삭제하는 명령
--delete from 테이블명 where 검색조건;
--where절을 생략하면 모든행이 삭제됨
--10번 부서의 특정 로우만 삭제하기
    delete dept01 where deptno=10;
    select * from dept01;
    
    rollback;
    commit;

    delete emp02 where deptno=20;    
    select * from emp02;

    rollback;
    commit;
    
    
--테이블 생성
    drop table employee03;
    
    create table employee03(
        empno number(4),
        ename varchar2(20),
        job varchar2(20),
        sal number(7,3)
    );
    desc employee03;
    
    insert into employee03 values(1000, '한용운', '승려', 100);
    insert into employee03 values(1010, '허준', '외관', 150);
    insert into employee03 values(1020, '주시경', '국어학자', 250);
    insert into employee03 values(1030, '계백', null, 250);
    insert into employee03 values(1040, '선덕여왕', '', 200);
    select * from employee03;
    
    commit;
    
--급여가 200이 안되는 사원에게 50을 인상하기
    update employee03 set sal=sal+50 where sal<200;
    select * from employee03;

    rollback;
    
--테이블에 직업이 null인 사람의 사원정보를 삭제하기
    delete employee03 where job is null;
    select * from employee03;

    rollback;
    
    
    
    desc employees2;
    create table employees2(
        employee_id number(10),
        name varchar2(20),
        salary number(7,2)
    );
    desc employees2;

--employees2와 동일하게 테이블 생성하기    
    create table employees3 as select *from employees2;
    desc employees3;

--purge recyclebin;
--쓰레기 테이블을 삭제, 휴지통을 비운다.
--남은 명령어 테이블에 대한 정보를 지운다.
    purge recyclebin;
    
--false 구조만 만들어짐    
    drop table dept02;
    create table dept02 as select * from dept where 1=0;
--true 데이터 내용을 복사한다    
    drop table dept02;
    create table dept02 as select * from dept where 1=1;
    
    desc dept02;
    select * from dept02;
    
--employees2에 manager_id 추가        
    desc employees2;
    alter table employees2 add (
        manager_id varchar2(10)
    );
    desc employees2;
    
--테이블 구조를 매니저 아이디 필드 항목을 수정        
    desc employees2;
    alter table employees2 modify (
        manager_id varchar2(20)
    );
    desc employees2;

--칼럼을 삭제
    desc employees2;
    alter table employees2 drop column manager_id;
    desc employees2;
    
--문자형 데이터
--char, varchar, nchar 유니코드 고정길이 문자형데이터.
--nvarchar 유니코드 가변길이 문자형 데이터, long(2GB) 가변길이


----------------------------------------09/07--------------------------------------

--데이터의 무결성 제약조건(Data Integrity Constraint Rule)이란
--테이블에 부적절한 자료가 입력되는 것을 방지하기 위해서 테이블을 생성할 때
--각 칼럼에 대해서 정의하는 여러가지 규칙을 말한다.

--무결성 제약조건의 종류
--not null : null을 허용하지 않는다.
--unique : 항상 유일한 값을 갖도록 중복된 값을 허용하지 않는다.
--primary key : null을 허용하지 않고, 중복된 값을 허용하지 않는다.
--              not null과 unique 조건이 결합한 형태
--foreign key : 참조되는 테이블의 칼럼의 값이 존재하면 허용한다.
--check : 저장 가능한 데이터 값이 범위나 조건을 지정하여, 설정한 값만 허용한다.

--제약조건 확인하기
--오라클은 user_constraints 데이터 딕셔너리로 제약조건에 관한 정보들을 알려준다.
--user_constraints 데이터 딕셔너리를 조회하면 내가만든 제약조건의 정보들을 조회할 수 있다.

--해당 계정이 소유한 제약조건 조회    
    desc user_constraints;
    select * from user_constraints;
    
--특정 칼럼만 조회
    select owner, constraint_name, constraint_type, table_name, search_condition, r_constraint_name from user_constraints;
    --user_constraints : 데이터 딕셔너리의 자주 사용되는 칼럼
    --owner : 제약조건을 소유한 계정
    --constraint_name : 제약조건 명
    --constraint_type : 제약조건 유형
    --table_name : 제약조건이 속한 테이블명
    --search_condition : check 조건일 경우에는 어떤 내용이 조건으로 사용되었는지 설명
    --r_constraint_name : foreign key인 경우 primary key를 참조 했는지에 대한 정보

--constraint_type은 제약조건 유형을 저장하는 칼럼
    select constraint_name, constraint_type, table_name from user_constraints; 
    --p : primary key
    --r : foreign key
    --u : unique
    --c : check, not null
    
--in 연산자를 사용하여 두개의 테이블에 대한 현재 사용자의 제약조건 조회하기
    select * from user_constraints where table_name in ('EMP', 'DEPT');

--기본적인 무결성 제약
--의미 : 관계형 데이터 모델에서 정의한 무결성 제약
--기본키 무결성 제약, 참조 무결성 제약

--테이블의 무결성 제약
--의미 : 테이블을 정의하거나 변경 과정에서 실행 가능한 무결성 제약
--not null, unique, check, default

--기타 무결성 제약
--위에 해당 안되는 제약들
--주장, 트리거

--기본키 무결성 제약
--테이블에서 레코드들이 반드시 유일하게 식별될 수 있어야 한다는 조건
--정의 : 기본키 무결성 제약
--기본키는 null값을 가질 수 없으며, 
--기본키의 값이 동일한 레코드가 하나의 테이블에 동시에 두개 이상 존재할 수 없다.

--제약 조건 설정
--(1) 제약조건 명명 규칙 (constraint name)
--    [테이블명]_[칼럼명]_[제약조건유형]
--(2) 칼럼 레벨 제약조건 설정
--    [column_name] [data_type] constraint [constraint_name] [constraint_type]

--제약조건 추가하기
--alter table 테이블명 add constraint 제약명 제약조건 (칼럼명);
--제약조건 변경하기
--alter table 테이블명 modify constraint 제약명 제약조건 (칼럼명);
--제약조건 삭제하기
--alter table 테이블명 drop constraint 제약조건; 


-- 제약조건이 없을 때 
    drop table emp01;       
    create table emp01(
        empno number(4),
        ename varchar2(10),
        job varchar2(9),
        deptno number(2) );
    desc emp01;    
    insert into emp01 values(null, null, '사원', 30);
    select * from emp01;
    
    -- 특정 칼럼만 조회    
    select owner, constraint_name, constraint_type, table_name, search_condition, r_constraint_name
    --테이블 이름으로 조건을 조회
    from user_constraints where table_name = 'EMP01';
    --테이블 생성시 아무런 제약조건을 주지 않았으므로 조회 결과가 없다.


--not null
--특정 필드에 대해서 null 값의 입력을 허용하지 않는다
--기본키로 정의된 필드에 대해서는 명시적으로 not null 조건을 설정하지 않아도 된다
--형식 : 칼럼명 자료형 not null;
--칼럼 레벨로만 정의할 수 있다.   
    drop table emp01;
    create table emp01(
        empno number(4) not null,
        ename varchar2(10) not null,
        job varchar2(9),
        deptno number(2) );
    desc emp01;   
    
    select owner, constraint_name, constraint_type, table_name, search_condition, r_constraint_name
    from user_constraints where table_name = 'EMP01';
    
    insert into emp01 values(null, null, '사원', 30);
    --ORA-01400: cannot insert NULL into ("TESTER1"."EMP01"."EMPNO") 오류 발생
    --이유는 첫 번째 칼럼과 두번째 칼럼에 not null제약조건이 있기때문에 null값을 삽입할 수 없다.
    insert into emp01 values(1000, '허준', '사원', 30);
    commit;
    select * from emp01;
    
    insert into emp01 values(1000, '홍길동', '과장', 20);
    --첫번째 칼럼이 not null 제약조건이지만 중복된 값은 허용 되므로 값이 삽입된다.
    select * from emp01;
    

--unique
--특정 칼럼에 대해 자료가 중복되지 않도록, 유일한 값만 허용하는 제약조건
--null값은 예외
--null값도 입력되지 않도록 제한 하려면, not null 제약조건도 기술하면 된다.
--constraint 제약명 unique (필드 리스트)
    drop table emp03;
    create table emp03(
        empno number(4) unique,
        ename varchar2(10) not null,
        job varchar2(9),
        deptno number(2) );
    desc emp03;  
    
    insert into emp03 values(1000, '허준', '사원', 30);
    select * from emp03;
    
    insert into emp03 values(1000, '홍길동', '과장', 30);
    --ORA-00001: unique constraint (TESTER1.SYS_C007026) violated 오류발생
    --첫번째 칼럼의 값에 unique 제약조건이 있기 때문에 중복된 값을 허용하지 않는다.

    insert into emp03 values(null, '안중근', '대리', 20);
    insert into emp03 values(null, '이순신', '부장', 20);
    --첫번째 칼럼은 중복된 값을 허용하지 않지만 null은 허용된다.
    
    
    drop table emp04;
    create table emp04(
        empno number(4) constraint emp04_empno_uk unique,
        ename varchar2(10) constraint emp04_ename_nn not null,
        job varchar2(9),
        deptno number(2) );
    desc emp04;      
    
    -- emp04 테이블의 제약조건을 살펴보기
    select constraint_name, constraint_type, table_name
    from user_constraints where table_name = 'emp04';
    --왜 안나오는지 이유 : table_name을 emp04로 소문자로 적어서 안나온다.
    
    insert into emp04 values(1000, '허준', '사원', 30);
    insert into emp04 values(1000, '홍길동', '과장', 20);
    --ORA-00001: unique constraint (TESTER1.EMP04_EMPNO_UK) violated 오류 발생
    --첫번째 칼럼에 unique 제약조건이 있기 때문에 1000이 입력될 수 없다.
 
 
--primary key
    drop table emp05;
    create table emp05(
        empno number(4) constraint emp05_empno_pk primary key,
        ename varchar2(10) constraint emp05_ename_nn not null,
        job varchar2(9),
        deptno number(2) );
    desc emp05;   
    
    select constraint_name, constraint_type, table_name
    from user_constraints where table_name = 'EMP05';
    
    insert into emp05 values(1000, '허준', '사원', 30);
    select * from emp05;
    
    insert into emp05 values(1000, '홍길동', '과장', 20);
    --ORA-00001: unique constraint (TESTER1.EMP05_EMPNO_PK) violated 오류발생
    --첫번째 칼럼은 primary key로 not null과 unique가 합쳐진 형태이므로 중복된 값이 입력될 수 없다.
    
    insert into emp05 values(NULL, '이순신', '부장', 30);
    --ORA-01400: cannot insert NULL into ("TESTER1"."EMP05"."EMPNO") 오류발생   
    --첫번째 칼럼은 primary key로 not null과 unique가 합쳐진 형태이므로 null 값이 입력될 수 없다.
    

--참조 무결성을 위한 제약조건 foreign key
--자식 테이블인 사원 테이블(emp)의 부서번호(deptno)칼럼을 
--부모테이블인 부서테이블(dept)의 부서번호(deptno)를 부모키로 설정하는 것이다.
--한 테이블의 레코드가 다른 테이블을 참조하여, 
--참조되는 테이블에 해당 레코드가 반드시 존재하거나 null값을 가진다.
--이 조건이 지켜지지 않는다면 참조하는 레코드는 실제로 존재하지 않는 레코드를 참조하게 되는 오류가 발생한다.
--실제 존재하지 않는 잘못된 값이 저장되지 않도록 보장하는 수단이다.
--형식 : constraint 제약명 foreign key (필드리스트1) references 테이블명 (필드리스트2)
--필드리스트1 : 외래키로 정의하는 필드들의 리스트
--테이블명 : 참조 대상인 테이블의 이름
--필드리스트2 : 참조 대상 테이블의 기본키
--constraint emp_empno_fk foreign key (deptno) references dept (deptno)

--alter table문을 사용하여 외래키를 별도로 설정
--ex) alter table student
--    add constraint fk_dept foreign key (dept_id) references department (dept_id)
--    학생테이블에서 부서테이블의 부서아이디를 참조하는 외래키인 fk_dept를 추가한다
--외래키 삭제
--ex) alter table student drop constraint fk_dept;
--    학생테이블에서 fk_dept 제약 조건을 없앤다.

--테이블 이름으로 제약조건 살펴보기
    select constraint_name, constraint_type, table_name
    from user_constraints where table_name = 'EMP01';
    --SYS_C007029	C	EMP01 C는 not null이 걸려있다.
--제약조건이 지정된 칼럼 살펴보기
    select constraint_name, table_name, column_name
    from user_cons_columns where table_name = 'EMP01';
    
--alter를 사용하여 emp01_empno_fk 제약조건을 추가하기    
    alter table emp01
    add constraint emp01_empno_fk foreign key (deptno)
    references dept (deptno);
--추가한 emp01_empno_fk 제약조건을 제거하기    
    alter table emp01
    drop constraint emp01_empno_fk;
    
    
--테이블 이름으로 제약조건 살펴보기
    select constraint_name, constraint_type, table_name
    from user_constraints where table_name = 'EMP';
--제약조건이 지정된 칼럼 살펴보기    
    select constraint_name, table_name, column_name
    from user_cons_columns where table_name = 'EMP';
    
    insert into dept(deptno, dname, loc) values (50,'기획부', 'LA');
    select * from dept;
        
    drop table emp06;
    create table emp06(
        empno number(4) constraint emp06_empno_pk primary key,
        ename varchar2(10) constraint emp06_ename_nn not null,
        job varchar2(9),
        deptno number(2) constraint emp06_deptno_fk references dept(deptno) 
    );
    desc emp06;  
    select * from emp06;
    select * from dept;
    
--테이블 이름으로 제약조건 살펴보기
    select constraint_name, constraint_type, table_name
    from user_constraints where table_name = 'EMP06';
--제약조건이 지정된 칼럼 살펴보기    
    select constraint_name, table_name, column_name
    from user_cons_columns where table_name = 'EMP06';
    
    insert into emp06 values(1010, '홍길동', '사원', 50);
    --여기서 알수 있는 제약조건 명은 명명 규칙이다
    --dept(deptno) 50번 부서 기획부가 참조 제약 조건이 걸린것이다.
    --emp06 테이블에서 1010 홍길동 사원 50 <== deptno
    --references dept(deptno) dept 테이블에서 50번 부서 기획부 LA
    insert into emp06 values(1011, '이소룡', '부장', 60);
    --ORA-02291: integrity constraint (TESTER1.EMP06_DEPTNO_FK) violated - parent key not found
    --부모키로 설정된 dept 테이블의 deptno에 60번 부서가 존재하지 않아 오류가 발생한다.
    select * from user_constraints where table_name = 'EMP06';
    select * from emp06;


--check 제약조건
--입력되는 값을 체크하여 설정된 값 이외의 값이 들어오면
--오류 메시지와 함께 명령이 수행되지 못하게 한다
--조건으로 데이터의 값의 범위나 특정 패턴의 숫자나 문자 값을 설정할 수 있다.
--형식 : constraint 제약명 check (조건식)
--      constraint emp_year_ck check (year >= 1 and year <=4)
    
    drop table emp07;
    create table emp07(
        empno number(4) constraint emp07_empno_pk primary key,
        ename varchar2(10) constraint emp07_ename_nn not null,
        sal number(7,2)constraint emp07_sal_ck check (sal between 500 and 5000),
        gender varchar2(1) constraint emp07_gender_ck check (gender in('M','F')) 
    );
    desc emp07; 
    
    select constraint_name, constraint_type, r_constraint_name, table_name
    from user_constraints where table_name = 'EMP07';
    select constraint_name, table_name, column_name
    from user_cons_columns where table_name = 'EMP07';

    insert into emp07 values(1000, '허준', 500, 'M');
    select * from emp07;
    
    insert into emp07 values(1000, '허준', 200, 'A');
    --ORA-02290: check constraint (TESTER1.EMP07_GENDER_CK) violated
    --세번째 칼럼과 네번째 칼럼의 제약조건이 check이기 때문에
    --해당 check조건에 맞이 않아 데이터 삽입이 되지 않는다
    --sal의 check조건은 500이상 5000이하의 데이터
    --gender의 check 조건은 'M'또는 'F'의 데이터
    --empno도 pk라 제약조건에 걸리긴한다.
    

--default 제약조건
--아무런 값을 입력하지 않았을 때 null값 대신 지정한 값이 입력이 되도록 한다.

    drop table dept01;
    create table dept01(
        deptno number(2) primary key,
        dname varchar2(14),
        loc varchar2(13) default '서울'
    );
    desc dept01;
    
    select constraint_name, constraint_type, r_constraint_name, table_name
    from user_constraints where table_name = 'DEPT01';
    select constraint_name, table_name, column_name
    from user_cons_columns where table_name = 'DEPT01';
    
--디폴트를 별도로 설정할 수 있다.
--alter table student 
--alter column year set default 1;
--디폴트를 해제할 수도 있다.
--alter table student 
--alter column year drop default;

--오라클은 default에 대한 별도의 설정 및 해제에 sql을 표준을 따르지 않는다
--alter table student modify (year int default 1);
--alter table student modify (year int default null);

    insert into dept01(deptno, dname) values(10, '경리부');
    select * from dept01;
    
    
    
    select * from emp01;
    drop table emp01;
    
    create table emp01(
        empno number(4) primary key,
        ename varchar2(10) not null,
        job varchar2(9) unique,
        deptno number(2) references dept(deptno)
            --foreign key 제약조건을 설정한다. dept테이블의 deptno칼럼을 emp01테이블의 deptno칼럼이 참조한다.
    );
    desc emp01;
    select * from user_constraints where table_name = 'EMP01';
   
    

--테이블레벨 방식으로 제약조건 지정하기
--테이블 레벨의 제약조건 지정은 칼럼을 모두 정의하고 나서
--테이블 정의를 마무리 짓기 전에 따로 생성된 칼럼들에 대한 제약조건을 한꺼번에 지정하는 것이다.
--복합키로 기본키를 지정할 경우 칼럼 형식은 안되고 반드시 테이블 레벨 방식으로 형식을 작성해야만 한다.
--간단히 두개 이상의 칼럼이 하나의 기본키로 구성할때 작성하는것이라고 보면된다.
    drop table emp02;
    
    create table emp02(
        empno number(4),
        ename varchar2(10) not null,
        job varchar2(9),
        deptno number(2),
        unique(job),
        foreign key(deptno) references dept(deptno)
        --칼럼을 정의하고 난 후 다시 제약조건을 지정한 형태
    );
    select constraint_name, constraint_type, r_constraint_name, table_name
    from user_constraints where table_name = 'EMP02';

    
    drop table emp03;
    
    create table emp03(
        empno number(4),
        ename varchar2(10) constraint emp03_ename_nn not null,
        job varchar2(9),
        deptno number(2),
        constraint emp03_empno_pk primary key (empno),
        constraint emp03_job_pk unique (job),
        constraint emp03_deptno_fk foreign key (deptno) references dept(deptno)
        --테이블 레벨 방식으로 제약조건 지정하기
    );   
    select constraint_name, constraint_type, r_constraint_name, table_name
    from user_constraints where table_name = 'EMP03';
    
    drop table member01;
    create table member01(
        name varchar2(10),
        address varchar2(30),
        hphome varchar2(16),
        constraint member01_combo_pk primary key(name, hphome)
    );   
    
    select constraint_name, constraint_type, r_constraint_name, table_name
    from user_constraints where table_name in('MEMBER01');
    --제약조건이 지정된 칼럼 살펴보기 (복합키인지 살펴보려고)        
    select constraint_name, table_name, column_name
    from user_cons_columns where table_name in('MEMBER01');   
    
    
----------------------------------------09/08--------------------------------------    
    
----제약조건을 변경, 제거 할 때 제약명은 대문자로 입력해야한다
    drop table emp01;       
    create table emp01(
        empno number(4) unique,
        ename varchar2(10),
        job varchar2(9),
        deptno number(2) 
    );

--제약조건 변경하기
--alter table 테이블명 modify constraint 제약조건명 제약조건(칼럼명);
    alter table emp01 modify empno constraint EMP01_EMPNO_NN not null;
    select * from user_constraints where table_name in('EMP01');

--제약조건 제거하기
--alter table 테이블명 drop constraint 제약조건명;
    alter table emp01 drop constraint EMP01_EMPNO_NN;
    select * from user_constraints where table_name in('EMP01');
 
--제약조건 추가하기
--alter table 테이블명 add constraint 제약조건명 제약조건(칼럼명);
    alter table emp01 add constraint EMP01_DEPTNO_FK 
    foreign key(deptno) references dept01(deptno) on delete cascade;
    select * from user_constraints where table_name in('EMP01');    
    
----알아두면 간편한 것
--종속된 모든 제약조건을 삭제하기
    select * from user_constraints where table_name in('EMP01');
--제약조건이 걸려있는 칼럼명을 확인하기
    select * from user_cons_columns where table_name = 'EMP01';   
    
    

--FK인 데이터를 삭제할 때 발생하는 문제 알아보기
    drop table emp01;       
    create table emp01(
        empno number(4),
        ename varchar2(10) constraint emp01_ename_nn not null,
        job varchar2(9),
        deptno number(2), 
        constraint emp01_empno_pk primary key(empno),
        constraint emp01_job_uk unique(job),
        constraint emp01_deptno_fk foreign key(deptno) references dept01(deptno)
    );
    
    insert into dept01(deptno, dname) values(10, '경리부');
    insert into emp01 values(1000,'허준','사원',10);
    
    select * from emp01;
    select * from dept01;

    delete from dept01 where deptno=10;
    --ORA-02292: integrity constraint (TESTER1.EMP01_DEPTNO_FK) violated - child record found 오류발생
    --why? 자식 키인 emp01 테이블의 deptno 칼럼에서 10이라는 부서의 값을 사용중이라서 삭제할 때 오류가 발생한다.
    commit;
    
--해결방법1. 참조중인 칼럼인 emp01의 deptno의 데이터를 먼저 삭제한다.      
    delete from emp01 where deptno=10;
    delete from dept01 where deptno=10;
    rollback;
  
--해결방법2. emp01테이블을 생성할 때 deptno 칼럼에 제약조건 지정서 cascade옵션을 부여한다.
    drop table emp01;       
    create table emp01(
        empno number(4),
        ename varchar2(10) constraint emp01_ename_nn not null,
        job varchar2(9),
        deptno number(2), 
        constraint emp01_empno_pk primary key(empno),
        constraint emp01_job_uk unique(job),
        constraint emp01_deptno_fk foreign key(deptno) references dept01(deptno) on delete cascade
        --cascade 옵션은 참조한 부모테이블의 칼럼값이 삭제될 때 같이 삭제한다
    );
    insert into emp01 values(1000,'허준','사원',10);
    delete from dept01 where deptno=10;
    commit;
    
    
--join이란?
--둘 이상의 테이블을 연결하여 데이터를 검색하는 방법

--join 조건이란?
--여러 테이블에서 특정 열 선택
--where절 안에 두 데이블의 공통되는 칼럼 비교
--둘 이상의 테이블을 쿼리하여 결과 집합 생성
--기본 키 및 외래 키를 조인 조건으로 사용
--테이블을 조인하려면 지정한 테이블에서 공통적으로 사용하는 열 사용
    
--조인의 필요성
--관계형 데이터베이스에서는 테이블간의 관계가 중요하기 때문에 
--하나 이상의 테이블이 빈번히 결합하여 사용된다.
--한개 이상의 테이블에서 데이터를 조회하기 위해서 사용되는 것이 조인이다.
--특정 부서 번호에 대한 부서이름은 무엇인지는 부서 테이블(dept)에 있다
--특정 사원에 대한 부서명을 알아내기 위해서는 부서 테이블에서 정보를 얻어 와야 한다.
--sql에서 두개 이상의 테이블을 결합해야만 원하는 결과를 얻을수 있을 때
--한번의 질의로 원하는 결과를 얻을 수 있는 조인 기능을 제공한다.

--cross join
--특별한 키워드 없이 select 문의 from절에 두개의 테이블을 콤마로 연결해서 조회하는 방법이다.
    select ename, deptno from emp order by deptno;
    select deptno, dname from dept;
--사원테이블과 부서테이블로 크로스 조인하기
    select * from emp,dept;
    
--table join
--join 조건
--여러 결과 집합의 결합
--equi join : 동일 칼럼을 기준으로 조인
--non-equi join :  통일 칼럼이 없이 다른 조건을 사용하여 조인
--self join : 한 테이블내에서 조인
--outer join : 조인 조건에 만족하지 않는 행도 나타냄


--여러 테이블의 집합
--테이블에 예명(alias) 사용
--카디션 곱
--테이블 이름에 별칭사용
--테이블 예명(alias) - 테이블 alias로 column을 단순 명확히 할 수 있음
--    현재의 select문자에 대해서만 유효함
--    테이블 alias는 길이가 30자까지 가능하나 짧을수록 더욱 좋음
--    테이블 alias는 의미가 있어야함
--    from 절에 테이블 alias 설정 시 해당 테이블
--    alias는 select 문장에서 테이블 이름 대신에 사용해야 함
    
    
--equl join
--equl join은 가장 많이 사용하는 조인 방법으로서
--조인 대상이 되는 두 테이블에서 공통으로 존재하는 칼럼의 값이 일치되는
--행을 연결하여 결과를 생성하는 조인 방법이다.
--조인 대상 테이블에서 공통 칼럼을 '='(equl) 비교를 통해
--같은 값을 가지는 행을 연결
--형식 : select table1.column, table2.column from table1, table2 where table1.column1 = table2.column2;

    select * from emp,dept where emp.deptno= dept.deptno;

--이문세인 사람의 정보만을 출력하는 이름과 소속 부서명 출력하기
--emp테이블을 사용하면 emp.ename, dept.dname, emp.deptno
--equl join 방식으로
    select emp.ename, dept.dname, emp.deptno
    from emp, dept
    where emp.deptno = dept.deptno and ename = '이문세';
    
--칼럼 앞에 테이블을 명시하기 --> 칼럼의 모호성 해결한 결과
--테이블에 별칭 부여하기
--from emp e, dept d
--테이블명 별칭 테이블명 별칭
--사원테이블의 별칭으도 e를 부서테이블의 별칭으로 d를 부여
--반드시 별칭을 부여해야함
    select e.ename, d.dname, e.deptno
    from emp e, dept d
    where e.deptno = d.deptno and e.ename = '이문세';
    
    select * from salgrade;    
    select ename, sal, grade
    from emp, salgrade
    where sal between losal and hisal
    order by grade;
    
--as사용 부서를 추가해서 조인하기
    select e.ename, d.dname, e.sal, s.grade
    from emp e, dept d, salgrade s
    where e.deptno = d.deptno and e.sal between s.losal and s.hisal
    order by grade;
    
    
--non-equl join
--조인 조건에 특정 범위 내에 있는지를 조사하기 위해
--where절에 조인 조건을 = 연산자 이외의 비교 연산자를 사용한다.
    select ename, sal, grade from emp, salgrade 
    where sal >= losal and sal <= hisal;


--셀프조인
--조인은 두 개 이상의 서로 다른 테이블을 서로 연결하는 것 뿐만 아니라
--하나의 테이블 내에서 조인을 해야만 원하는 자료를 얻는 경우가 생긴다.
--self join이란 말 그대로 자기 자신과 조인을 맺는것을 말한다.

--특정 사원의 매니저가 누구인지 알아내기 as "사원이름" "직속상관이름"
--특정 사원은 매니저의 정보는 mgr 칼럼에 등록
    select employee.ename as "사람이름", manager.ename as "직속상관이름"
    from emp employee, emp manager
    where employee.mgr = manager.empno;    
    

--ANSI join
--sql developer 뿐만 아니라 대부분의 사용 데이터 베이스 시스템에서 
--표준언어로 ANSI(미국 표준 연구소) SQL에서 제시한 표준 기능을 대부분 준수하고 있다.
--ANSI표준 SQL 조인 구문은 몇 가지 새로운 키워드와 절을 제공하여,
--SELECT 문의 FROM 절에서 조인을 완벽하게 지정할 수 있다.

--inner join 내부조인, outer join 외부조인
--inner join 형식 : select * from table1 inner join table2 on table1.column1 = table2.column2;
--아래의 예제를 inner join으로 바꿔서 해보기    
    select ename, dname
    from emp,dept
    where emp.deptno = dept.deptno;
    
    select ename, dname
    from emp inner join dept
    on emp.deptno = dept.deptno;
    
--아까나온 이문제 경리부 10도 inner join으로 바꿔보기
    select ename, dname, dept.deptno
    from emp inner join dept
    on emp.deptno = dept.deptno and ename = '이문세';
    
    
--ANSI outer join
--외부 조인에서는 full까지 지원하여 left,right,full 3가지를 지원한다.
--외부 조인의 정의 : 
--조인할 한쪽테이블에 조인 조건을 만족하는 행이 없어도,
--그 테이블에 null행을 추가해서 결과 테이블에 포함시키는 연산이다.
--외부 조인 연산자 : + 는 정보가 부족한 테이블에 null행을 추가시키기 위한 연산자이다.
--외부조인 형식 : 
--selecet문의 where 절에 조인 조건을 기술할 때 어느 한쪽 열 이름에 외부조인 연산자를 명시한다.
--유의사항 : 
--반드시 조인할 한 쪽 테이블에만 조인 연산자를 지정해야 한다.
--외부 조인의 예 1 : emp테이블에 널 행을 주가한 외부 조인 모든 사원의
--이름과 부서번호, 부서이름을 부서번호의 오름차순으로 출력하되, 아직 아무도 근무하지 않는 신설부서의 부서번호와 부서이름도 출력한다
--외부 조인의 예 2 : dept 테이블에 널 행을 추가한 외부 조인 모든 사원의 이름과 부서번호,
--부서이름을 부서번호의 오름차순으로 출력하되, 아직 부서가 정해지지 않은 신입사원의 이름도 출력한다.
--형식 : select * from table1 [left | right | full] outer join table2

    select member.ename as "사원이름", manager.ename as "직속상관이름"
    from emp member left outer join emp manager
    on member.mgr = manager.empno;
    --안성기의 직속상관이름이 null로 나타남
    
--join은 두개 이상의 테이블들을 조합한 결과이다
--inner join은 테이블의 관계가 일치하는 경위의 결과이고
--outer join은 테이블의 관계가 일치하는 것과 일치하지 않는 것 중 한 쪽의 테이블을 결과로 가진다.
--left outer join은 왼쪽 테이블을 기준으로 right outer join은 오른쪽 테이블을 기준임
--inner join은 교집합
--outer join은 교집합 + 한 쪽의 차집합 or 하나의 테이블 전체 + 교집합

--join은 일반적으로 내부조인 방식을 의미, on은 조인에 대한 조건
--where은 결과에 대한 필터 조건

    select member.ename as "사원이름", manager.ename as "직속상관이름"
    from emp member right outer join emp manager
    on member.mgr = manager.empno;
    
    select member.ename as "사원이름", manager.ename as "직속상관이름"
    from emp member full outer join emp manager
    on member.mgr = manager.empno;
   
   
   
   
--메인쿼리와 서브쿼리
--서브쿼리
--내부 질의(내부 select문, 중첩된 select문)를 의미한다
--메인쿼리에서 사용할 값을 반환한다.
--메인쿼리
--외부 질의를 의미한다.
--서브쿼리가 반환한 값을 이용해서 메인쿼리가 완성된다.

--서브쿼리의 형식 
--where 절의 연산자 뒤에, 괄호 안에 서브쿼리를 기술한다.
--select 선택리스트1 from 테이블 이름1 where 표현식 op (select 선택리스트2 from 테이블 이름2);
--서브쿼리의 특징
--서브쿼리는 메인쿼리가 실행되기 전에 한번만 실행된다
--서브쿼리의 실행 결과는 메인쿼리를 완성하는데 사용된다
--서브쿼리는 select 문의 from절 where절 having절에서 사용할 수 있다.
--where나 having 절에 하나 이상의 서브쿼리를 논리연산자인 and나 or로연결하여 사용할 수 있다.
--서브쿼리 작성 규칙
--서브쿼리를 작성할 때는 반드시 아래 작성 규칙을 따라야 한다.
--서브쿼리는 괄호로 묶어서 기술해야 한다
--서브쿼리는 비교 연산자의 우측에 위치해야 한다.
--서브쿼리에 ORDER BY 절을 포함할 수 없다. (TOP연산자와 함께 있을때는 사용할 수 있다.)
--단일 행 서브쿼리에는 단일 행 비교 연산자(>,=, >=, <, <=, <>)만 사용 가능하다.
--다중 행 서브쿼리에는 다중 행 비교 연산자(IN, ANY, ALL)만 사용 가능하다.
--SELECT 문의 FROM절, WHERE절, HAVING 절에서만 사용할 수 있다.
--5) 서브쿼리를 SELECT 하지 않는 컬럼은 주 쿼리에서 사용할 수 없다
--서브쿼리 안에 서브쿼리가 들어갈수 있다 --네스팅이라 하며,메모리가 허용하면 무제한 중첩이 가능하다

--서브쿼리의 유형
--서브쿼리는 크게 세가지 유형으로 구분할 수 있다.
--1) 단일 행 서브쿼리 : 내부 질의에서 단 하나의 행만 반환
--2) 다중 행 서브쿼리 : 내부 질의에서 하나 이상의 행 반환      
--                   다중행연산자를 사용하여 IN,ANY,SOME,ALL,EXIST 반대는 NOT EXISTS 사용가능함
--3) 다중 열 서브쿼리 : 내부 질의에서 하나 이상의 열 반환

--단일 행 서브쿼리의 특징
--내부 질의에서 단 하나의 행만 반환한다.
--단일 행 서브쿼리를 포함하는 질의문에서는 단일 행 비교 연산자만(=,>,>=,<,<=,<>) 사용 가능하다.  
--서브쿼리의 SELECT 절에서 그룹 함수를 사용할 수 있다.
--단일 행 비교 연산자를 사용한다
--단일 행(Single Row) 서브 쿼리는 수행 결과가 오직 하나의 로우(행, row)만을 반환하는 서브 쿼리를 갖는 것을 말한다

--이문세의 부서명 구하기
    select dname from dept
    where deptno = (select deptno from emp where ename = '이문세');
--이문세의 부서번호 구하기
    select deptno from emp where ename = '이문세';
    --서브쿼리의 결과는 메인쿼리에 보내게 되는데 메인쿼리의 메읹
    
--다중 행 서브쿼리의 특징
--내부 질의에서 하나 이상의 행을 반환한다.
--다중 행 서브쿼리를 포함하는 질의문에서는 다중 행 비교 연산자만 사용 가능하다.
--서브쿼리의 select 절에서 그룹 함수를 사용할 수 있다.
--다중 행 서브쿼리는 서브쿼리에서 반환되는 결과가 하나 이상의 행일 때 사용하는 서브쿼리이다.
--다중 행 서브쿼리는 반드시 다중 행 연산자와 함께 사용해야 한다.

--다중 행 비교 연산자
--in 메인쿼리 비교조건이 서브쿼리가 반환한 목록의 어떤 값이 같은지 비교한다
--결과중 하나라도 일치하면 참 값
--in 연산자는 메인 쿼리의 비교 조건에서 서브쿼리의 출력 결과와 하나라도 일치하면
--메인쿼리의 where 절의 참이 되도록 하는 연산자 이다.
--any, some 메인 쿼리 비교조건이 서브쿼리가 반환한 목록의 각각의 값과 비교한다.
--결과와 하나 이상이 일치하면 참 값
--all메인쿼리 비교 조건이 서브쿼리가 반환한 목록의 모든 값과 비교한다.
--결과와 모든 값이 일치하면 참 값
--exist 메인쿼리 비교조건이 서브쿼리가 반환한 목록의 어떤 값과 같은지 비교한다
--결과중 값이 하나라도 존재하면 참 값
    
    select round(avg(sal)) "평균급여" from emp;
--평균 급여보다 더 많은 급여를 받는 사람 출력하기
    select ename, sal from emp
    where sal > (select avg(sal) from emp);
    
--급여가 500을 초과하는 사원의 소속된 부서의 부서번호 출력
    select distinct deptno from emp 
    where sal > 500;
    
--다중 열 비교 방식 
--다중 열을 비교하는 방식은 pairwise와 non-pairwise 방식으로 구분된다.
--pairwise 비교 : 
--두개 이상의 열이 쌍을 이루어 비교되는 것을 의미한다.
--하나의 where절을 사용할 때 이런 비교 결과를 얻을 수 있다.
--non-pairwise 비교 : 
--각각의 열이 별개로 비교되는 것을 의미한다.
--여러개의 where 절을 사용할 때 이런 비교 결과를 얻을 수 있다.

    
    
----------------------------------------09/13--------------------------------------    
--급여는 30번부서의 어떤 사원과 같고, 업무는 20번부서의 어떤 사원과 같은 모든사원을 검색하기
    SELECT ename, deptno, sal, job FROM emp 
    WHERE sal in(select sal from emp where deptno = 30)
    and job in (select job from emp where deptno = 20);
--30번 부서의 모든 급여리스트
--한예슬 대리 250, 오지호 과장 500, 신동엽 과장 450
--장동건 부장 480, 감우성 차장 500, 조향기 사원 280
--20번 부서의 모든 업무리스트
--김사랑 사원, 이변형 부장, 강혜정 null사원, 박중훈 부장


--ALL연산자
--ALL조건은 메인쿼리의 비교조건이 서브쿼리의 검색결과와 모든 값이 일치하면 참이다. 
--찾아진 값에 대해서 AND연산을 해서 모두 참이면 참이되는 셈이다. 
--ALL은 "모든 비교값 보다 크냐" 이고, 묻는 것이 되므로 최대값보다 더 크면 참이 된다.

--30번부서의 최대급여 구하기
    SELECT MAX(SAL) "최대급여" FROM EMP WHERE DEPTNO = 30;
    
--문제) 서브쿼리와 ALL 연산자를 사용하여 30번 부서의 최대급여보다 많은 사원 조회하기   
    SELECT ENAME, SAL FROM EMP 
    WHERE SAL > ALL(SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30);
    
--문제) 서브쿼리를 사용하여 30번 부서의 평균급여보다 많은 사원 조회하기   
    SELECT ENAME, SAL FROM EMP
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 30);
    
    
--ANY 연산자   
--ANY 조건은 메인쿼리의 비교조건이 서브쿼리의 검색결과와 하나 이상만 일치하면 참이다.
--ANY는 찾아진 값 중에서 최소값 보다 크면 참이 된다.

--문제) ANY연산자를 사용하여 30번 부서의 최소급여보다 많은 급여를 받는 사원 구하기
    SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30;
    SELECT ENAME, SAL FROM EMP
    WHERE SAL > ANY(SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30);
    
--문제) 다중행 비교방식으로 30번 부서의 최소급여보다 큰 급여를 조회하기
    SELECT ENAME, SAL FROM EMP
    WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30);
    
    SELECT ENAME, SAL FROM EMP
    WHERE SAL > ANY(SELECT MIN(SAL) FROM EMP) 
    AND SAL > ANY(SELECT SAL FROM EMP WHERE DEPTNO = 30);
    
   
--EXISTS 연산자
--EXISTS 연산자는 서브쿼리문에서 주로 사용하며
--서브쿼리의 결과 값이 참이 나오기만 하면 바로 메인쿼리의 결과 값을 리턴한다.
--서브쿼리의 결과 값이 존재하지 않는다면 메인쿼리의 어떠한 값도 리턴되지 않는다.
--쿼리 속도 면에서는 서브쿼리 사용 시 IN 보다는 EXISTS가 훨씬 빠르다.
--EXISTS의 반대로 NOT EXISTS도 사용이 가능하다.

    SELECT * FROM DEPT 
    WHERE EXISTS(SELECT * FROM EMP WHERE DEPTNO = 10);

    SELECT * FROM DEPT 
    WHERE EXISTS(SELECT * FROM EMP WHERE EMP.DEPTNO = DEPT.DEPTNO);    

    SELECT * FROM DEPT 
    WHERE NOT EXISTS(SELECT * FROM EMP WHERE EMP.DEPTNO = DEPT.DEPTNO);    
    
    SELECT * FROM EMP;
    SELECT * FROM DEPT;
    
--문제) 직급이 과장인 사원이 속한 부서의 부서번호와 부서명과 지역을 조회하기 (IN 사용)
    SELECT DEPTNO, DNAME, LOC FROM DEPT
    WHERE DEPTNO IN(SELECT DEPTNO FROM EMP WHERE JOB = '과장');
    
--문제) 과장보다 급여를 많이 받는 사원들의 이름과 급여와 직급을 조회하기 (ALL 사용, 과장 생략)
    SELECT ENAME, SAL, JOB FROM EMP
    WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB = '과장');
    --과장인 사람의 급여는 500, 450 두가지가 나온다.
    --ALL을 쓰면 두개의 값이 참일 때 성립되므로 최대값인 500 이상인 사람들이 조회되고,
    --ANY를 쓰게되면 하나만 성립되도 실행되므로 최소값인 450 이상인 사람들이 조회된다.



--뷰의 개념
--VIEW는 물리적인 테이블을 근거한 논리적인 가상 테이블이다.
--뷰는 기본테이블에서 파생된 객체로서 기본테이블에 대한 하나의 쿼리문이다.
--뷰란 '보다'란 의미를 갖고 있는 점을 감안해보면 알 수 있듯이
--실제 테이블에 저장된 데이터를 뷰를 통해서 볼 수 있도록 한다.
--사용자에게 주어진 뷰를 통해서 기본 테이블을 제한적으로 사용하게 된다.
--뷰의 정의와 특징
--정의 : 하나 이상의 테이블의 데이터의 부분집합으로 구성되는 논리적인 테이블
--특징 : 테이블 뿐만 아니라 다른 뷰를 기초로 생성 가능
--    뷰 자체는 데이터를 직접 포함하지는 않지만, 
--    창문역할을 하는 뷰를 통해서 데이터의 검색 및 수정이 가능
--    열 별칭을 사용해서 생성된 뷰에 대해서는 열 별칭을 사용한 조작만 가능
--장점 : 보안을 위해서 DB에 대한 접근을 제한할 수 있음
--        사용자는 특정 테이블의 데이터 가운데 뷰로 정의된 특정 부분만을 보게 된다.
--    복잡한 질의를 단순한 질의로 변환할 수 있음
--        다중 테이블에서 뷰를 생성하면 테이블 조인이 불필요하게 된다.
--        즉, 주로 사용하는 정보만을 대상으로 데이터 조작을 수행할 수 있다.
--    데이터 독립성을 허용
--        테이블이 변경되어도 뷰는 그대로 유지할 수 있으므로,
--        사용자와 응용프로그램에 대한 데이터 독립성을 제공할 수 있다.
--    동일한 데이터에 대해서 다른 뷰를 생성할 수 있음
--        조건에 따라 데이터에 접근하는 사용자 그룹을 분류해서,
--        각각 동일한 테이블의 다른 뷰를 기초로 데이터 조작을 할 수 있게 한다.
--종류 : 크게 단순 뷰와 복합 뷰로 구분된다.
--    단순 뷰(single view) : 오직 하나의 테이블만을 기초로 생성된 뷰
--        표현식 등에 의해 데이터가 조작된 경우를 제외하면, 뷰를 통한 모든 DML연산의 수행이 가능
--    복합 뷰(complex or join view) : 다중 테이블을 기초로 생성된 뷰
--        데이터 그룹핑 또는 그룹함수를 사용해서 뷰 생성 가능
--        뷰를 통한 모든 DML이 항상 가능하지 않음
--생성 : CREATE VIEW 명령문에 서브쿼리를 이용해서 생성하고
--    뷰가 생성된 다음 뷰 이름과 뷰 정의는 데이터 사전의 USER_VIEWS 테이블에 저장된다.
--    (1) CREATE VIEW 명령의 형식 서브쿼리를 수행해서 가져온 열들만으로 뷰를 생성한다.
--형식) CREATE [FORCE | NOFORCE] VIEW 뷰이름 [(열별칭1[, 열별칭2, ...])] 
--    AS 서브쿼리 [WITH CHECK OPTION [CONSTRAINT 제약이름]] [WITH READ ONLY];
--    열 별칭 : 서브쿼리에 의해 선택된 열이나 표현식에 대한 별칭을 지정
--    FORCE : 기본 테이블의 존재 여부와 무관하게 뷰를 생성
--    NOFORCE : 기본테이블이 존재할 때만 뷰를 생성
--    WITH CHECK OPTION : 뷰에 의해 접근 가능한 행만 삽입 또는 수정될 수 있음을 명시
--    WITH READ ONLY : 뷰에 대해서 SELECT만 가능하고 다른 DML연산은 불가능함을 명시
    
--EMP테이블과 똑같은 테이블을 생성    
    CREATE TABLE EMP_COPY AS SELECT * FROM EMP;
    
--뷰의 동작원리
--1. 사용자가 뷰에 대해서 질의를 하면 USER_VIEWS에서 뷰에 대한 정의를 조회
--2. 기본 테이블에 대한 뷰의 접근 권한을 살핌
--3. 뷰에 대한 질의를 기본 테이블에 대한 질의로 변환
--4. 기본 테이블에 대한 질의를 통해 데이터를 검색함
--5. 검색된 결과를 출력함

    SELECT * FROM EMP_COPY;
    SELECT EMPNO, ENAME, DEPTNO FROM EMP_COPY WHERE DEPTNO = 30;
    DESC USER_VIEWS;
    --뷰의 내부 구조와 USER_VIEWS 데이터 딕셔너리
    
    SELECT VIEW_NAME, TEXT FROM USER_VIEWS;
    --정의된 뷰 확인하기

    CREATE VIEW EMP_VIEW30 AS SELECT EMPNO, ENAME, DEPTNO FROM EMP_COPY WHERE DEPTNO = 30;
    --ORA-01031: insufficient privileges 오류 발생
    --뷰를 생성하기 위한 권한이 없어 오류가 발생한다.
    GRANT CREATE VIEW TO TESTER1;
    --SYSTEM에서 뷰를 생성하기 위한 권한을 부여한다.
    
    SELECT VIEW_NAME, TEXT FROM USER_VIEWS;
    --정의된 뷰 확인하기
    SELECT * FROM EMP_VIEW30;
    --서브쿼리로 만들어진 뷰 조회
    
--뷰를 사용하는 이유
--1. 복잡하고 긴 쿼리문을 뷰로 정의하면 접근을 단순화 시킨다.
--2. 보안에 유리하다.
--뷰의 수정 및 삭제와 복합 뷰 생성
--1. 뷰의 수정 
--2. 뷰의 삭제
--3. 복합 뷰 생성

--뷰 수정 : 뷰를 생성할 때 사용한 명령인 CREATE OR REPLACE VIEW 명령을 사용해서,
--    이미 존재하는 뷰를 대체함으로써 뷰를 수정하게 된다.
--    (1) CREATE OR REPLACE VIEW 명령의 형식 이미 존재하는 뷰를 없애고 같은 이름의 뷰를 새로 생성한다.
--        단 기존뷰가 없는 경우에도 새로운 뷰를 생성한다.
--    뷰 수정의 특징
--    (1) 이미 생성된 뷰를 그대로 두고 수정하는 것이 아니라, 이미 생성된 뷰를 제거하고 새로운 뷰를 생성해서
--        대체 함으로써 수정하는 효과를 얻게 된다.
--    (2) 뷰가 존재하지 않는 경우에도 오류가 발생하지 않고 뷰를 새로 생성한다.

--뷰 삭제 : DROP VIEW 명령으로 뷰를 삭제할 수 있다.
--    (1) DROP VIEW 멸영의 형식 삭제할 뷰의 이름을 명시한다.
--    (2) VIEW 삭제의 특징
--        1. 뷰가 기초하는 기본 테이블에는 영향을 주지 않고 뷰만 삭제된다.
--        2. 즉, 데이터에 전혀 손실을 주지 않고 논리적인 테이블인 뷰만 삭제한다.
--        3. 삭제된 뷰를 기반으로 생성된 뷰나 어플리케이션은 무효화 된다.
--        4. 뷰의 생성자 또는 DROP ANY VIEW 권한을 가진 사용자만 삭제가 가능하다.

--뷰 활용
--    1. 뷰의 확인
--    2. 뷰를 통한 데이터 검색
--    3. 뷰 질의의 수행 과정
--    4. 뷰에서의 dml연산 수행 규칙
--    5. WITH CHECK OPTION 옵션
--    6. WITH READ ONLY 옵션
--    7. 뷰 수정하기 위한 OR REPLACE 옵션
    
    INSERT INTO EMP_VIEW30 VALUES(1111,'AAAA',30);
    --뷰가 만들어진 기본테이블에 데이터 삽입
    
--복합 뷰 생성
    SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME, D.LOC
    FROM EMP_COPY E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO; 
    
    CREATE VIEW EMP_VIEW_DEPT
    AS SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME, D.LOC
    FROM EMP_COPY E, DEPT D 
    WHERE E.DEPTNO = D.DEPTNO;
    --두 테이블을 JOIN한 서브쿼리로 복합 뷰 생성
    --EMP_COPY 테이블의 부서번호와 DEPT 테이블의 부서번호가 같은 
    --사원번호, 사원명, 급여, 부서번호, 부서이름, 위치를 조회하는 뷰를 생성한다.
    
    SELECT * FROM EMP_VIEW_DEPT;
    --복합 뷰 조회
    
--뷰 생성
    CREATE VIEW EMP_VIEW
    AS SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO FROM EMP;
    
    SELECT * FROM EMP_VIEW;
    --뷰 조회
    
--뷰 제거
    DROP VIEW EMP_VIEW_DEPT;

    SELECT * FROM EMP_VIEW_DEPT;

--뷰 수정 OR REPLACE
    CREATE OR REPLACE VIEW EMP_VIEW30
    AS SELECT EMPNO, ENAME, SAL, COMM, DEPTNO FROM EMP_COPY
    WHERE DEPTNO = 30;
    --기존 뷰를 삭제하고 새로 만든다.
    SELECT * FROM EMP_VIEW30;
    
    DROP VIEW EMP_VIEW30;

    CREATE OR REPLACE VIEW EMP_VIEW30
    AS SELECT EMPNO, ENAME, SAL, COMM, DEPTNO FROM EMP_COPY
    WHERE DEPTNO = 30;
    --존재하지 않는 뷰를 수정해도 오류가 발생하지 않는다.

    
--기본 테이블 없이 뷰를 생성하기 위한 FORCE 옵션
--뷰를 생성하는 경우에 일반적으로 기본 테이블이 존재한다는 가정하에서 쿼리문을 작성한다.
--극히 드물기는 하지만, 기본 테이블이 존재하지 않는 경우에도 뷰를 생성해야할 경우 사용하는 것이 FORCE 옵션이다.
--경고와 함께 뷰를 생성한다.

    CREATE OR REPLACE FORCE VIEW EMPLOYEES_VIEW
    AS SELECT EMPNO, ENAME, DEPTNO FROM EMPLOYEES
    WHERE DEPTNO = 30;
    --경고 : 컴파일 오류와 함께 뷰가 생성된다.
    SELECT * FROM EMPLOYEES_VIEW;
    
    DROP VIEW EMPLOYEES_VIEW;
    SELECT VIEW_NAME, TEXT FROM USER_VIEWS;
    
--문제) EMP_VIEW30에 급여가 500이상인 사원을 20번 부서로 이동하기
    UPDATE EMP_VIEW30 SET DEPTNO = 20 WHERE SAL >= 500;
    SELECT * FROM EMP_VIEW30;    
    --위의 SQL이 뷰가 참조하는 기본 테이블에 반영되며, 뷰에는 위의 SQL로 변경된 데이터가 보이지 않게된다.
    --뷰의 데이터 변경 시 삽입 때와 마찬가지로 기본 테이블에 반영되고, 그 변경점이 뷰에 반영됨        
    
    --뷰에 보이지 않는 이유는 뷰 생성시 서브퀄이의 조건절에 WHERE DEPTNO = 30 라는 조건이 달려 있기 때문에
    --이 뷰는 기본테이블인 EMP_COPY 테이블에서 조건이 WHERE DEPTNO = 30 인 데이터만 보여줄 수 있다.
    --즉 위의 UPDATE 구문으로 DEPTNO 값이 20으로 변경된 데이터는 뷰의 조건을 만족하지 않기 때문에 보이지 않는다.
    
--문제) 변경된 사원들이 있는 20번 부서를 조회하기
    SELECT * FROM EMP_VIEW30 WHERE DEPTNO = 20;
    --EMP_VIEW30 생성시 30번 부서만 포함시켜서 20번 부서는 안나온다.
    
    SELECT * FROM EMP_VIEW WHERE DEPTNO = 20;
    
    SELECT * FROM EMP_COPY WHERE DEPTNO = 30;
    --DEPT가 30인 EMP_VIEW30에 있는건데 부서번호가 30인 중에서는 급여가 500이상인 사원이 없어서 변경사항이 없다.
    SELECT * FROM EMP_COPY WHERE DEPTNO = 20;
    --7명
    SELECT * FROM EMP WHERE DEPTNO = 20;
    --5명 그대로이다.

--조건 칼럼 값 변경 못하게 하는 WITH CHECK OPTION
--뷰를 정의하는 서브 쿼리문에 WHERE절을 추가하여
--기본 테이블 중 특정 조건에 만족하는 로우(행) 만으로 구성된 뷰를 생성할 수 있다.
--뷰를 생성할 때 WHERE절을 추가하여 기본 테이블에서 정보가 추출되는
--조건을 제시하게 되는데 여기에 연속적으로 WITH CHECK OPTION을 기술하여
--조건제시를 위해 사용한 칼럼의 값이 뷰를 통해서 변경되지 못하도록 할 수 있다.

    SELECT * FROM EMP_VIEW30;
    
    CREATE OR REPLACE VIEW EMP_VIEW30
    AS SELECT EMPNO, ENAME, SAL, COMM, DEPTNO FROM EMP_COPY
    WHERE DEPTNO = 30 WITH CHECK OPTION;
    
    UPDATE EMP_VIEW30 SET DEPTNO = 20 WHERE SAL >=200;
    --ORA-01402: view WITH CHECK OPTION where-clause violation 오류 발생
    --WHY? WITH CHECK OPTION으로 WHERE 절로 지정한 DEPTNO = 30 조건에 대한 내용은 변경 불가능
    
    CREATE TABLE EMP_COPY2
    AS SELECT * FROM EMP;
    
    SELECT * FROM EMP_COPY2;
    
    CREATE OR REPLACE VIEW VIEW_CHK30
    AS SELECT EMPNO, ENAME, SAL, COMM, DEPTNO FROM EMP_COPY2
    WHERE DEPTNO = 30 WITH CHECK OPTION;
    
    SELECT * FROM VIEW_CHK30;
    
    UPDATE VIEW_CHK30 SET COMM = 1000;
    --WITH CHECK OPTION으로 인해 서브쿼리 조건이 추가된다.
    --부서번호가 30인 사원의 COMM만 1000으로 설정
    --WITH CHECK OPTION으로 지정된 WHERE절의 조건이 아닌 데이터는 변경이 가능하다.
    
--WITH READ ONLY 옵션
--뷰에 대해서 SELECT만 가능하고 다른 DML 연산은 불가능하게 하는 옵션이다.
--WITH CHECK OPTION과 마찬가지로 뷰 생성시 참조하는 서브 쿼리의 WHERE 절에 기술한다.
    CREATE OR REPLACE VIEW VIEW_READ30
    AS SELECT EMPNO, ENAME, SAL, COMM, DEPTNO FROM EMP_COPY2
    WHERE DEPTNO = 30 WITH READ ONLY;
    
    UPDATE VIEW_READ30 SET COMM = 2000;
    --SQL 오류: ORA-42399: cannot perform a DML operation on a read-only view 오류발생
    --읽기 전용 뷰 이기 때문에 해당 DML 명령을 수행할 수 없다.
    
    
    CREATE OR REPLACE VIEW VIEW_HIRE
    AS SELECT EMPNO, ENAME, HIREDATE FROM EMP_COPY
    ORDER BY HIREDATE;
    
    SELECT * FROM VIEW_HIRE;
       
        
--ROWNUM 칼럼 성격 파악하기
--ROWNUM 칼럼은 오라클의 내부적으로 부여되는 INSERT문을 이용하여 입력하면
--입력한 순서에 따라 1씩 증가되면서 값이 지정된다.
--데이터가 입력된 시점에서 결정되는 ROWNUM 칼럼 값은 바뀌지 않는다.

--문제) 입사일을 기준으로 오름차순 정렬한 후 ROWNUM 칼럼을 출력하기
--      (입사일이 빠른 5명을 VIEW_HIRE에서 조회하기)
    SELECT ROWNUM, EMPNO, ENAME, HIREDATE 
    FROM VIEW_HIRE WHERE ROWNUM <= 5;
    
    SELECT ROWNUM, EMPNO, ENAME, HIREDATE 
    FROM EMP_COPY WHERE ROWNUM <= 5;

    SELECT ROWNUM, EMPNO, ENAME, HIREDATE 
    FROM EMP_COPY WHERE ROWNUM <= 5 ORDER BY HIREDATE;

--뷰와 ROWNUM 칼럼으로 TOP-N 구하기
--입사일이 빠른 사원 5명만을 얻어오기 위해서 입사일 순으로 뷰를생성하고,
--이를 다시 상위 5명만 얻어오기 위해서 뷰를 SELECT 문으로 조회하면서
--뷰를 ROWNUM 칼럼을 WHERE 절의 조건으로 제시

--인라인 뷰로 TOP-N 구하기
--인라인 뷰는 SQL문장에서 사용하는 서브쿼리의 일종이다.
--보통 FROM절에 위치해서 테이블처럼 사용한다.
--형식) SELECT ... FROM ... (SELECT ...) ALIAS ... ;
--메인쿼리 (바깥쪽 쿼리문) 서브쿼리 (안쪽 쿼리문)
--SELECT 조회 구문의 FROM 절에 테이블 명이 아닌 특정 조건의 SELECT 문으로 데이터를 조회하여,
--조회를 위한 일회용 테이블 형식을 만드는 것이 인라인 뷰이다.

--문제) 입사일순으로 5명 조회하는 위의 예제를 인라인 뷰로 바꾸어 보기
    SELECT ROWNUM, EMPNO, ENAME, HIREDATE
    --인라인뷰
    FROM (SELECT EMPNO, ENAME, HIREDATE FROM EMP_COPY ORDER BY HIREDATE)
    WHERE ROWNUM <= 5;
    
--문제) 부서별 최대급여와 최소급여를 출력하는 SAL_VIEW 만들기
    CREATE VIEW SAL_VIEW
    AS SELECT D.DNAME, MAX(E.SAL) "MAX_SAL", MIN(E.SAL) "MIN_SAL"
    FROM EMP_COPY E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    GROUP BY D.DNAME;
    
    SELECT * FROM SAL_VIEW;
    
--문제) 급여를 많이 받는 순서대로 3명만 AS RANKING, EMPNO, ENAME, SAL조회하는 인라인뷰
    SELECT ROWNUM AS RANKING, EMPNO, ENAME, SAL
    FROM (SELECT EMPNO, ENAME, SAL FROM EMP_COPY ORDER BY SAL DESC)
    WHERE ROWNUM <= 3;

--복습 설명 
--OR REPLACE : 새로운 뷰를 만들 수 있을 뿐만 아니라 이미 만든 뷰를 삭제하지 안혹 새로운 구조의 뷰로 변경가능
--FORCE : 기본 테이블의 존재 여부에 상관없이 뷰를 생성
--WITH CHECK : 해당 뷰를 통해서 볼 수 있는 범위 내에서만 UPDATE 또는 INSERT가 가능하게 하는 조건
--WITH READ ONLY : 뷰를 통해서는 기본 테이블의 어떤 필드에 대해서도 내용을 절대 변경할 수 없도록 하는 조건


--시퀀스
--시퀀스는 테이블 내의 유일한 숫자를 자동으로 생성하는 자동 번호 발생기 이므로
--시퀀스를 기본키로 사용하게 되면 사용자의 부담을 줄일 수 있다.
--오라클하고 MYSQL이 부여하는 방식이 다르다.

--시퀀스 생성에 대한 형식
--CREATE SEQUENCE 시퀀스_이름
--    [START WITH n]
--    [INCREMENT BY n]
--    [(MAXVALUE n | NOMAXVALUE)]
--    [(MINVALUE n | NOMINVALUE)]
--    [(CYCLE n | NOCYCLE)]
--    [(CACHE n | NOCACHE)]

--시퀀스 제거
    DROP SEQUENCE DEPT_DEPTNO_SEQ;
--시퀀스 생성    
    CREATE SEQUENCE DEPT_DEPTNO_SEQ
    INCREMENT BY 10
    START WITH 10;
--시퀀스 구조 확인    
    DESC USER_SEQUENCES;
--해당 계정의 시퀀스 조회    
    SELECT * FROM USER_SEQUENCES;
    SELECT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE, INCREMENT_BY, CYCLE_FLAG
    FROM USER_SEQUENCES;

--START WITH 
--시퀀스 번호의 시작 값을 지정할 때 사용
--INCREMENT BY 
--연속적인 시퀀스 번호의 증가치를 지정할 때 사용
--CYCLE | NOCYCLE
--CYCLE은 최대값까지 증가하고 나면, 시작값에서 다시 시작한다.
--NOCYCLE은 증가가 완료되면 에러를 유발시킨다.
--CACHE | NOCACHE 
--CACHE는 메모리상의 시퀀스 관리값을 관리, 기본값은 20
--NOCACHE는 메모리상에서 시퀀스를 관리하지 않음

--NEXTVAL : 다음 시퀀스 값 
    SELECT DEPT_DEPTNO_SEQ.NEXTVAL FROM DUAL;
--CURRVAL : 현재 시퀀스 값
    SELECT DEPT_DEPTNO_SEQ.CURRVAL FROM DUAL;
--NEXTVAL, CURRVAL을 사용할 수 있는경우
--서브쿼리가 아닌 SELECT 문
--INSERT문의 SELECT 절
--UPDATE문의 SET절

--시퀀스 객체 생성하기
    CREATE SEQUENCE SAMPLE_SEQ;
    SELECT SAMPLE_SEQ.CURRVAL FROM DUAL;
    --실행되지 않는다. WHY? NEXTVAL을 먼저 실행해 주어야 한다.
    SELECT SAMPLE_SEQ.NEXTVAL FROM DUAL;

    
--시퀀스 오류
--다음과 같은 이유때문에 시퀀스 값에서 불규칙한 간격이 생기는 오류가 발생한다.

--롤백이 발생한 경우
--시퀀스를 포함한 문장을 롤백하면 커밋 이후 롤백된다.
--이전에 생성된 시퀀스 번호를 모두 잃게 되므로 이후 시퀀스에 간격이 발생

--시스템이 손상된 경우 
--CACHE 옵션으로 미리 시퀀스를 생성해서 메모리에 저장해둔 경우, 
--시스템의 손상으로 비정상적인 종료가 되면
--미리 생성한 시퀀스 값을 모두 잃어버리게 되므로 이후 시퀀스에 간격이 발생

--동일한 시퀀스가 다중테이블에서 사용된 경우 시퀀스 값이 불규칙적으로 변경될 수 있다.
    
--문제) 시작값1, 값이 1씩 증가, 최대값이 100000인 EMP_SEQ 시퀀스 생성하고 조회하기    
    CREATE SEQUENCE EMP_SEQ
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100000;
    
    SELECT * FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'EMP_SEQ';
    
    DROP TABLE EMP01;
    CREATE TABLE  EMP01(
        EMPNO NUMBER(4) PRIMARY KEY,
        ENAME VARCHAR2(10),
        HIREDATE DATE
    );
    INSERT INTO EMP01 VALUES(EMP_SEQ.NEXTVAL, '홍길동', SYSDATE);
    INSERT INTO EMP01 VALUES(EMP_SEQ.NEXTVAL, '강감찬', SYSDATE);
    INSERT INTO EMP01 VALUES(EMP_SEQ.NEXTVAL, 'JULIA', SYSDATE);    
    
    SELECT * FROM EMP01;
    
    
--시퀀스 수정   
--ALTER SEQUENCE 명령으로 시퀀스의 증가치, 최대값, 최소값, 사이클 및 캐쉬 옵션을 변경할 수 있다.
--시퀀스 생성자나 ALTER권한을 가진 사용자만 수정할 수 있다.
--형식) ALTER SEQUENCE 시퀀스_이름 
--      [START WITH n]
--      [INCREMENT BY n]
--      [(MAXVALUE n | NOMAXVALUE)]
--      [(MINVALUE n | NOMINVALUE)]
--      [(CYCLE n | NOCYCLE)]
--      [(CACHE n | NOCACHE)];
--시퀀스 수정 지침
--시퀀스를 수정하면 수정 이후 생성되는 시퀀스 번호에만 영향을 미친다.
--시퀀스를 생성할 때 다른 시작 번호부터 다시 생성하려면 기존 시퀀스를 삭제하고 다시 생성해야 한다.
--유효성 검사를 자동으로 수행한다.
--예) 현재 시퀀스 번호보다 작은 수로 MAXVALUE를 수정하면 수정이 허용되지 않는다.

    DROP SEQUENCE DEPT_DEPTNO_SEQ;

    CREATE SEQUENCE DEPT_DEPTNO_SEQ
    START WITH 10
    INCREMENT BY 10
    MAXVALUE 30;

    SELECT * FROM USER_SEQUENCES;
    
    SELECT DEPT_DEPTNO_SEQ.NEXTVAL FROM DUAL;
    SELECT DEPT_DEPTNO_SEQ.CURRVAL FROM DUAL;    
    
    ALTER SEQUENCE DEPT_DEPTNO_SEQ
    MAXVALUE 100
    CYCLE
    CACHE 2;

    SELECT * FROM USER_SEQUENCES;


----------------------------------------09/14--------------------------------------    


    DROP TABLE DEPT_EXAMPLE;
    CREATE TABLE DEPT_EXAMPLE (
        DEPTNO NUMBER(2) PRIMARY KEY,
        DNAME VARCHAR2(15),
        LOC VARCHAR2(15)
    );
    SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME IN('DEPT_EXAMPLE');
    
    SELECT CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME
    FROM USER_CONS_COLUMNS
    WHERE TABLE_NAME IN('DEPT_EXAMPLE');
    
    
    DROP SEQUENCE DEPT_EXAMPLE_SEQ;
    CREATE SEQUENCE DEPT_EXAMPLE_SEQ
    INCREMENT BY 10
    START WITH 10
    NOCYCLE;
    SELECT * FROM USER_SEQUENCES;   
    
    INSERT INTO DEPT_EXAMPLE VALUES(DEPT_EXAMPLE_SEQ.NEXTVAL, '인사과', '서울');
    INSERT INTO DEPT_EXAMPLE VALUES(DEPT_EXAMPLE_SEQ.NEXTVAL, '경리과', '서울');
    INSERT INTO DEPT_EXAMPLE VALUES(DEPT_EXAMPLE_SEQ.NEXTVAL, '총무과', '대전');
    INSERT INTO DEPT_EXAMPLE VALUES(DEPT_EXAMPLE_SEQ.NEXTVAL, '기술과', '인천');
    SELECT * FROM DEPT_EXAMPLE;   
    SELECT DEPT_EXAMPLE_SEQ.CURRVAL FROM DUAL;
    

--1. 인덱스란?
--2. 인덱스 생성방법
--3. 인덱스가 유용한 경우와 불필요한 경우
--4. 인덱스 확인
--5. 인덱스 삭제
    
--1. 인덱스란?
--(1) 인덱스의 정의
--    포인터를 사용하여 행의 검색을 촉진할 수 있는 DB 객체이다.    
--(2) 인덱스의 특징
--    테이블 행에 대한 직접적이고 빠른 엑세스를 제공함
--    인덱스는 오라클 서버에 의해서 자동으로 생성되거나 사용자에 의해 명시적으로 생성될 수 있음
--    인덱스는 오라클 서버에 의해서 자동으로 사용되고 유지됨
--    인덱스는 테이블과는 논리적, 물리겆으로 독립적
--    기본 테이블에 영향을 주지 않고 생성하거나 제거할 수 있음
--    기본 테이블을 제거하면, 인덱스도 자동으로 제거됨
--    인덱스를 너무 많이 생성하면 오히려 DML처리의 효율을 저하시킴

--2. 인덱스 생성방법
--    자동 인덱스 생성
--        테이블을 생성할 때 PRIMARY KEY나 UNIQUE 제약조건이 정의된 열에 대해서
--        오라클 서버가 유일한 인덱스를 자동으로 생성한다.
--    수동 인덱스 생성    
--        검색 속도의 향상을 위해 사용자가 CREATE INDEX 명령을 사용해서
--        명시적으로 유일하지 않는 인덱스를 생성할 수 있다.
--        하나 이상의 열에 대해서 하나의 인덱스를 생성할 수 있다.
--    CREATE INDEX 인덱스명 ON 테이블명(열이름1,...);
--        ON절에 어떤 테이블의 어떤 열에 대해 인덱스를 생성할지 명시한다,
--    수동 인덱스 생성 예)
--        EMP테이블의 EMP_NAME 열에 대한 검색이 빈번히 발생하므로
--        이 검색 속도를 향상 시킬 수 있도록 인덱스를 생성한다.
        
--3. 인덱스가 유용한 경우와 불필요한 경우
--    유용한 경우
--    (1) 열이 WHERE 절이나 조인 조건에서 자주 사용되는 경우
--    (2) 열이 광범위한 값을 포함하는 경우
--    (3) 열이 많은 수의 NULL값을 포함하는 경우
--    (4) NULL 값에 대해서는 인덱스가 생성되지 않으므로 NULL값이 많을수록 인덱스의 크기가 작아짐
--    (5) 둘 또는 그 이상의 열들이 WHERE 절 또는 조인 조건에서 자주 함께 사용되는 경우
--    (6) 테이블이 대형이고 대부분의 질의가 행의 2~4% 보다 적게 읽어 들일 것으로 예상되는 경우
--    불필요한 경우
--    (1) 테이블 사이즈가 작은경우
--    (2) 해당 열이 질의의 조건으로 자주 사용되지 않는 경우
--    (3) 테이블이 자주 갱신되는 경우(인덱스 유지를 위해 DML의 효율이 나빠짐)
--    (4) 대부분의 질의가 행의 2~4% 이상을 읽어 들일 것으로 예상되는 경우
--        (인덱스를 생성하는 대신 테이블 전체를 검색하는 것이 좋음)

--4. 인덱스 확인
--    데이터 사전의 USER_INDEXES 및 USER_IND_COLUMNS 뷰에 저장된 인덱스 정보를 확인한다.
--    USER_INDEXES 데이터 사전 뷰
--        인덱스 이름과 인덱스의 유일성 정보등을 포함한다.
--    USER_IND_COLUMNS 데이터 사전 뷰
--        인덱스 이름, 테이블 이름, 열 이름, 열 위치 등의 정보 등을 포함한다.
    
--5. 인덱스 삭제
--    DROP INDEX 명령을 사용해서 데이터 사전에서 인덱스를 삭제한다.
--    DROP INDEX 인덱스 명;

--주의사항
--    인덱스 소유자나 DROP ANY INDEX 권한을 가진 사용자만 삭제할 수 있음
--    인덱스는 수정될 수 없으며, 수정이 필요한 경우 삭제하고 다시 생성해야함
    
    
    DROP TABLE DEPT01;
    CREATE TABLE DEPT01 AS SELECT * FROM DEPT WHERE 1 = 0;
    --WHERE1=0은 데이터는 가져오지않고 테이블 구조만 가져온다.
    DESC DEPT01;
    SELECT * FROM DEPT01;
    
    INSERT INTO DEPT01 VALUES(10, '인사과', '서울');
    INSERT INTO DEPT01 VALUES(20, '총무과', '대전');
    INSERT INTO DEPT01 VALUES(30, '교육팀', '대전');   
    SELECT * FROM DEPT01;
    
    
--인덱스 종류    
--고유 인덱스
--비고유 인덱스
--단일 인덱스
--결합 인덱스
--함수기반 인덱스

--고유 인덱스(유일 인덱스) 
--    유일키 처럼 유일한 값을 갖는 칼럼에 대해서 생성하는 인덱스
--    고유 인덱스를 지정하려면 UNIQUE 옵션을 지정해야 한다.
--    예) DEPTNO는 고유/비고유 인덱스 둘다 설정 가능
    CREATE UNIQUE INDEX IDX_DEPT01_DEPTNO ON DEPT01(DEPTNO);
    
--비고유 인덱스
--    중복된 데이터가 저장된 칼럼을 인덱스로 지정할 경우 비고유 인덱스로 지정해야 한다.
--    UNIQUE 옵션은 생략하고 지정한다.
    CREATE INDEX IDX_DEPT01_LOC ON DEPT01(LOC);

--결합 인덱스
--    부서번호와 부서명을 결합하여 인덱스를 설정할 수 있다.
    CREATE INDEX IDX_DEPT01_COM ON DEPT01(DEPTNO, DNAME);

--함수기반 인덱스
    CREATE INDEX IDX_EMP07_ANNSAL ON EMP07(SAL*12);

--인덱스 조회
    SELECT INDEX_NAME, TABLE_NAME, COLUMN_NAME FROM USER_IND_COLUMNS
    WHERE TABLE_NAME IN('EMP07', 'DEPT01');
    
    SELECT * FROM USER_INDEXES
    WHERE TABLE_NAME IN('DEPT01');
    
    SELECT * FROM USER_IND_COLUMNS
    WHERE TABLE_NAME IN('DEPT01');
    
    
--PL/SQL (Procedural Language/ SQL) --엔진
--오라클에서 제공하는 프로그래밍 언어
--일반 프로그래밍 언어적인 요소를 다 가지고 있고 데이터베이스 업무를 처리하기 위한 최적화된 언어
--기본구조
--선언부(Declare) (옵션): 모든 변수나 상수를 선언하는 부분
--실행부(Executable) (필수): begin ~ end 제어문, 반복문, 함수 정의 등의 로직을 기술하는 부분
--예외처리부(Exeption) (옵션): 실행도중에 에러 발생시 해결하기 위한 명령들을 기술하는 부분
--선언부, 실행부, 예외처리부는 ;을 붙이지 않고 나머지 문장들은 ;을 붙인다.
--익명블록(anonymous block) : 주로 일회성으로 사용할 경우 많이 사용
--저장블록(stored block) : 서버에 저장해 놓고 주기적으로 반복해서 사용할 경우 사용

--출력문을 스크립트 출력에서 보여주는 명령어
    set serveroutput on;
--반대
    set serveroutput off;
    
--PL/SQL은 ORACLE'S Procedural Language extension to SQL의 약자
--SQL문장에서 변수정의, 조건처리, 반복처리 등을 지원하며,
--오라클 자체에 내장되어 있는 절차적 언어로서 SQL의 단점을 보완해준다.

--현재 오라클 포트번호 확인 8080
    SELECT DBMS_XDB.GETHTTPPORT() FROM DUAL;
    
--포트 번호 변경
    EXEC DBMS_XDB.SETHTTPPORT(9090);
    --SYSTEM에서 포트번호를 변경해야 한다.
    
--<Hello World 만들기>
    SET SERVEROUTPUT ON;
    
    BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World');
    END;
    
--변수의 생성 규칙    
--반드시 문자로 시작해야 한다.
--문자나 숫자, 특수문자를 포함할 수 있다.
--변수명은 30byte 이하여야 한다.
--예약어(키워드)를 사용하면 안된다.

--변수의 선언은 선언부(declare)에서 선언되고 값으로 초기화가 가능하다
--실행부에서 실행될 경우 값이 할당 된다.
--서브 프로그램의 파라미터로 전달 되기도 하며, 서브 프로그램의 출력 결과를 저장하기도 한다.

--변수의 선언 예)
--    emp_no number(6,3) : 숫자로 저장하는 변수로 총 6자리를 의미하며 소수점이하 3자리를 의미한다.
--    emp_name varchar2(5) : 문자를 저장하는 변수로 총 바이트 길이가 5바이트를 저장할 수 있다.
--    emp_date date : 날짜를 저장하는 변수

--변수의 데이터 타입
--    char : 고정 길이의 문자를 저장, 기본 최소값 1, 최대 32,767바이트 값을 저장
--    varchar2 : 가변 길이의 문자를 저장, 기본값은 없고, 최대 32,767바이트 값을 저장
--    number(전체 자리수, 소수점 이하 자리수) : 전체 자리수와 소수점 이하 자리수를 가진 숫자를 저장
--        전체 자리수는 1~38까지 가능하고, 소수점 자리수의 범위는 -84~127까지 가능
--    binary_double : 부동 소수점 수를 저장, 9바이트 필요함
--    date : 날짜 및 시간을 저장, 초단위로 저장, 날짜의 범위는 4712 B.C ~ 9999 A.D
--    timestamp : date 타입을 확장, 연도, 월, 일, 시, 분, 초, 소수로 표시되는 초단위를 저장
--        자리수를 표현할때는 0~9 범위의 정수를 사용, 기본값은 6

--참조 변수
--    테이블명.필드명%Type
--    empNo employees.employee_id%TYPE
--    : EMPLOYEES 테이블의 EMPLOYEE_ID와 동일한 데이터 타입으로 선언

--    empRow employees%ROWTYPE
--    : EMPLOYEES 테이블의 모든 칼럼을 한꺼번에 저장하기위한 변수로 선언
--    /(슬래시) : 블럭 단위로 실행
    / 
    --선언부
    DECLARE 
    CNT INTEGER;
    --실행부
    BEGIN
    --할당연산자 := 
    CNT := CNT + 1;
    IF CNT IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('결과 : CNT는 널이다');
    END IF;
    END;
    /
    
    DECLARE
    --사이즈 4의 NUMBER 타입 변수 선언
        VEMPNO NUMBER(4);
    --사이즈 10의 VARCHAR2 타입 변수 선언
        VENAME VARCHAR2(10);
    BEGIN
        VEMPNO := 1001;
        VENAME := '김사랑';
        DBMS_OUTPUT.PUT_LINE('  사번  이름');
        DBMS_OUTPUT.PUT_LINE('---------------');
        DBMS_OUTPUT.PUT_LINE(VEMPNO || ' ' || VENAME);
    END;
    /
    
--IF문
    DECLARE
    --VEMPNO 변수는 EMP테이블의 EMPNO 칼럼의 데이터 타입을 참조
        VEMPNO EMP.EMPNO%TYPE;
    --VENAME 변수는 EMP테이블의 ENAME 칼럼의 데이터 타입을 참조
        VENAME EMP.ENAME%TYPE;
    --VDEPTNO 변수는 EMP테이블의 DEPTNO 칼럼의 데이터 타입을 참조
        VDEPTNO EMP.DEPTNO%TYPE;
    --VDNAME 변수는 VARCHAR2(20) 데이터타입으로 선언하고 NULL값을 대입
        VDNAME VARCHAR2(20) := NULL;
    BEGIN
        --조회한 값을
        SELECT EMPNO, ENAME, DEPTNO  
        --각 변수에 대응하여 대입
        INTO VEMPNO, VENAME, VDEPTNO
        FROM EMP WHERE EMPNO = 1001;
        VEMPNO := 1001;
        --만일 VDEPTNO가 10이면
        IF (VDEPTNO = 10) THEN
            --VDNAME 변수에 'ACCOUNTING' 대입
            VDNAME := 'ACCOUNTING';
        END IF;
        --만일 VDEPTNO가 20이면
        IF (VDEPTNO = 20) THEN
            --VDNAME 변수에 'RESEARCH' 대입
            VDNAME := 'RESEARCH';
        END IF;
        --만일 VDEPTNO가 30이면
        IF (VDEPTNO = 30) THEN
            --VDNAME 변수에 'SALES' 대입
            VDNAME := 'SALES';
        END IF;
        --만일 VDEPTNO가 40이면
        IF (VDEPTNO = 40) THEN
            --VDNAME 변수에 'OPERATIONS' 대입
            VDNAME := 'OPERATIONS';
        END IF;
        DBMS_OUTPUT.PUT_LINE('  사번  이름  부서명');
        DBMS_OUTPUT.PUT_LINE('---------------');
        DBMS_OUTPUT.PUT_LINE(VEMPNO || ' ' || VENAME || ' ' || VDNAME);
    END;    
    /
    
--IF문
    DECLARE
        --VEMP 변수는 EMP테이블의 모든 데이터 타입을 참조한다.
        VEMP EMP%ROWTYPE;
        --ANNSAL 변수는 NUMBER(7,2) 데이터 타입으로 선언한다.
        ANNSAL NUMBER(7,2);
    BEGIN
        --모든 데이터를 VEMP 변수에 대입
        SELECT * INTO VEMP
        FROM EMP
        WHERE ENAME = '김사랑';
        
        --VEMP변수의 COMM칼럼 값이 NULL인 경우
        IF(VEMP.COMM IS NULL) THEN
            --ANNSAL 변수에 VEMP변수의 SAL칼럼 값의 *12한 값을 대입
            ANNSAL := VEMP.SAL*12;
        --VEMP변수의 COMM칼럼 값이 NULL이 아닌 경우
        ELSE 
            --ANNSAL 변수에 VEMP변수의 SAL칼럼 값의 *12와 COMM칼럼 값을 더한 값을 대입
            ANNSAL := VEMP.SAL*12 + VEMP.COMM;
        END IF;
        
        --출력문
        DBMS_OUTPUT.PUT_LINE('  사번  이름  연봉');
        DBMS_OUTPUT.PUT_LINE('---------------');
        DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO || ' ' || VEMP.ENAME || ' ' || ANNSAL);
    END;
    /
    
--LOOP 반복문
    DECLARE
        --N변수를 NUMBER 타입으로 선언후 1을 대입
        N NUMBER := 1;
    BEGIN 
        LOOP
            DBMS_OUTPUT.PUT_LINE(N);
            N := N + 1;
            IF N > 5 THEN
                EXIT;
            END IF;
        END LOOP;    
    END;
    /
    
--FOR 반복문
    DECLARE
    BEGIN 
        --변수 N을 선언하고 1부터 4까지 1씩 증가하며 반복한다.
        FOR N IN 1..4 LOOP
            DBMS_OUTPUT.PUT_LINE(N);
        END LOOP;
    END;
    /

--WHILE 반복문
    DECLARE
        N NUMBER := 1;
    BEGIN 
        --N의 값이 5보다 작거나 같으면 반복한다.
        WHILE N <= 5 LOOP
            DBMS_OUTPUT.PUT_LINE(N);
            N := N + 1;
        END LOOP;
    END;
    /

    
    DROP TABLE S_EMP;
    CREATE TABLE S_EMP
    AS SELECT * FROM EMP;
    
    SELECT * FROM S_EMP;
    
    SELECT ENAME, SAL FROM S_EMP
    WHERE ENAME = '김사랑';
    
--문제) 영업이면 급여를 10퍼 인상하고 아니면 5퍼 인상하기 (PL/SQL)
    DECLARE
        VEMP S_EMP%ROWTYPE;
        VDEPTNO S_EMP.DEPTNO%TYPE;
        VPERCENT NUMBER(2);
    BEGIN
        --DEPT 테이블에서 조회된 DEPTNO의 값을 VDEPTNO 변수에 저장
        SELECT DEPTNO INTO VDEPTNO FROM DEPT WHERE DNAME LIKE '%영업%';
        --S_EMP 테이블에서 조회된 모든 데이터를 VEMP 변수에 저장
        SELECT * INTO VEMP FROM S_EMP WHERE ENAME = '김사랑';
        
        IF VEMP.DEPTNO = VDEPTNO THEN
            VPERCENT := 10;
        ELSE
            VPERCENT := 5;
        END IF;

        UPDATE S_EMP SET SAL = SAL + SAL*VPERCENT/100
        WHERE ENAME = '김사랑';
        COMMIT;
    END;
    /
    SELECT ENAME, SAL FROM S_EMP WHERE ENAME = '김사랑';
    
--문제) 연봉계산 하기
--COMM 칼럼 값이 NULL이면 연산 결과 역시 NULL이 나온다.
--그러므로 COMM이 NULL이면 0으로 바꾸기
    DECLARE
        VEMP EMP%ROWTYPE;
        ANNSAL NUMBER(7,2);
    BEGIN
        SELECT * INTO VEMP
        FROM EMP
        WHERE ENAME = '김사랑';
        
        IF(VEMP.COMM IS NULL) THEN
            VEMP.COMM := 0;
        END IF;
        
        ANNSAL := VEMP.SAL*12 + VEMP.COMM;
        
        DBMS_OUTPUT.PUT_LINE('  사번  이름  연봉');
        DBMS_OUTPUT.PUT_LINE('---------------');
        DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO || ' /' || VEMP.ENAME || ' /' || ANNSAL);
    END;
    /
    
--문제) LOOP문으로 구구단 5단 출력
    DECLARE
        DAN NUMBER := 5;
        I NUMBER := 1;
    BEGIN
        LOOP
            DBMS_OUTPUT.PUT_LINE( DAN || '*' || I || '=' || (DAN*I) );
            I := I + 1;
            IF I > 9 THEN
                EXIT;
            END IF; 
        END LOOP;
    END;    
    /
    
--문제) 부서번호를 10씩 증가시키며 출력하기    
    DECLARE
        VDEPT DEPT%ROWTYPE;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('부서번호 / 부서명 / 지역명');
        DBMS_OUTPUT.PUT_LINE('------------------------');
    
        FOR CNT IN 1..4 LOOP
            SELECT * INTO VDEPT
            FROM DEPT WHERE DEPTNO = 10 * CNT;
            DBMS_OUTPUT.PUT_LINE(VDEPT.DEPTNO || '/' || VDEPT.DNAME || '/' || VDEPT.LOC);
        END LOOP;
    END;
    /       
    
--문제) *기호를 한개씩 추가시키며 출력하기    
    DECLARE
        V_CNT NUMBER := 1;
        V_STR VARCHAR2(10) := NULL;
    BEGIN
        WHILE V_CNT <= 5 LOOP
            V_STR := V_STR || '*';
            DBMS_OUTPUT.PUT_LINE(V_STR);
            V_CNT := V_CNT + 1;
        END LOOP;
    END;
    /    
    

--계층형 쿼리
--BOM 자재 명세서 계층구조, 부모노드 자식노드 리프(마지막)노드
    DROP TABLE BOM_SPHONE;
    
    CREATE TABLE BOM_SPHONE(
        ITEM_ID NUMBER(3) NOT NULL,
        PARENT_ID NUMBER(3),
        ITEM_NAME VARCHAR(20) NOT NULL,
        PRIMARY KEY (ITEM_ID)
    );
    
    --부모가 없는 최상위 루트
    INSERT INTO BOM_SPHONE VALUES(100, NULL, '스마트폰');
    --100 부모
    INSERT INTO BOM_SPHONE VALUES(101, 100, '메인 PCD');
    INSERT INTO BOM_SPHONE VALUES(102, 100, '배터리');
    --101 부모
    INSERT INTO BOM_SPHONE VALUES(103, 101, 'CPU');
    --101 부모
    INSERT INTO BOM_SPHONE VALUES(104, 101, '메모리');
    INSERT INTO BOM_SPHONE VALUES(105, 101, '블루투스');

    SELECT * FROM BOM_SPHONE;
    
    --셀프조인
    SELECT S1.ITEM_NAME, S1.ITEM_ID, S2.ITEM_NAME PARENT_NAME
    FROM  BOM_SPHONE S1, BOM_SPHONE S2
    --외부조인 (+)을 이용해서 연결되어 있지 않은 NULL값도 모두 나오도록 조회한다.
    WHERE S1.PARENT_ID = S2.PARENT_ID (+)
    ORDER BY S1.ITEM_ID;
    
    --계층 구조로 나오지 않는다. 메인PCD 밑에 CPU 순으로 나와야 하므로 아래 방식으로 해준다. 

--START WITH, CONNECT BY 절을 이용해서 계층형 쿼리를 할수 있다.
    --LPAD(공백, 2*(LEVEL-1)) 계층형으로 보여주는 공식
    --계층형이 3개라면 2로 조회한다.
    SELECT LPAD('', 2*(LEVEL-1)) || ITEM_NAME INEMNAME
    FROM BOM_SPHONE
    --최상위 루트가 NULL인 값으로 지정
    START WITH PARENT_ID IS NULL
    CONNECT BY PARENT_ID = PRIOR ITEM_ID;
    
    
----------------------------------------09/14--------------------------------------    

  
--트리거
--오라클에서 트리거 역시 해당 단어의 의미처럼 어떤 이벤트가 발생하면 자동적으로 
--방아쇠가 당겨져 총알이 발사되듯이 특정 테이블이 변경되면 이를 이벤트로 
--다른 데이블이 자동으로 변경되도록 하기 위해서 사용한다.
--트리거는 테이블이나 뷰가 INSERT, UPDATE, DELETE 등의 DML 문에 의해 
--데이터가 입력, 수정, 삭제될 경우 자동으로 실행되어 진다.

--트리거란
--INSERT, UPDATE, DELETE 문이 TABLE에 대해 행해질 때 묵시적으로 수행되는 PROCEDURE 이다.
--트리거는 TABLE과는 별도로 DATABASE에 저장된다.
--
--트리거는 VIEW에 대해서가 아니라 TABLE에 관해서만 정의될 수 있다.
--행 트리거 : 칼럼의 각각의 행의 데이터 행 변화가 생길때 마다 실행되며, 그 데이터 행의 실제값을 제어할 수 있다.
--문장 트리거 : 트리거 사건에 의해 단 한번만 실행되며, 칼럼의 각 데이터 행을 제어 할 수 없다.

--트리거의 타이밍
--BEFORE : INSERT, UPDATE, DELETE 문이 실행되기 전에 트리거가 실행된다.
--AFTER : INSERT, UPDATE, DELETE 문이 실행된 후 트리거가 실행된다.
--TRIGGER_EVENT : INSERT, UPDATE, DELETE 중에서 한개 이상 올 수 있다.
--FOR EACH ROW : 이 옵션이 있으면 행 트리거가 된다.

--트리거
--어떤 조건에 맞는 이벤트가 일어나면 후속 이벤트를 발생시킴

--트리거의 5가지 요소
--트리거 유형 : DML 단위의 트리거, 변경된 레코드 단위의 트리거
--트리거 동작시점 : 트리거 동작 시점은 BEFORE, AFTER
--트리거 이벤트 : 트리거를 발생시킬 것 인지를 결정
--트리거 조건 : 레코드 단위의 트리거에서만 설정할 수 있는 UPDATE 작업시 특정 조건을 명시하여
--            조건에 맞는 레코드의 변경에서만 트리거 이벤트를 발생
--트리거 몸체 : BEGIN-END 절로 동작 정의

--트리거 형식
--CREATE [OR REPLACE] TRIGGER 트리거 명 
--BEFORE|AFTER EVENT ON 테이블명 
--[FOR EACH ROW] [WHEN CONDITION] 
--BEGIN
--...
--END;

    SET SERVEROUTPUT ON;
    
    DROP TABLE SAMPLE_DEPT;
    CREATE TABLE SAMPLE_DEPT (
        DEPT_ID NUMBER,
        DEPT_NAME VARCHAR2(15),
        LOC VARCHAR2(10)
    );
    DESC SAMPLE_DEPT;
    
--AFTER 트리거    
    --PRINT_MSG라는 트리거 생성
    CREATE OR REPLACE TRIGGER PRINT_MSG
    --SAMPLE_DEPT 테이블에 INSERT 명령이 수행되면 트리거를 나중에 실행
    AFTER INSERT ON SAMPLE_DEPT
    BEGIN
        DBMS_OUTPUT.PUT_LINE('부서가 추가되었습니다.');
    END;
    /
    
    INSERT INTO SAMPLE_DEPT VALUES(10, '마케팅부', '서울');
    INSERT INTO SAMPLE_DEPT VALUES(20, '홍보부', '인천');    
    
    SELECT * FROM SAMPLE_DEPT;
    
    
    DROP TABLE ITEM;
    CREATE TABLE ITEM ( --상품
        CODE CHAR(6) PRIMARY KEY, --물품 코드
        NAME VARCHAR2(15) NOT NULL,
        COMPANY VARCHAR2(15),
        PRICE NUMBER(8),
        CNT NUMBER DEFAULT 0 --재고수량
    );
    DESC ITEM;
    
    DROP TABLE WAREHOUSE;
    CREATE TABLE WAREHOUSE ( --물류창고
        NUM NUMBER(6) PRIMARY KEY, --입고 번호
        CODE CHAR(6) REFERENCES ITEM(CODE),
        INDATE DATE DEFAULT SYSDATE, --입고 날짜
        INCNT NUMBER(6),
        INPRICE NUMBER(6), --단가
        TOTALPRICE NUMBER(8) --총액
    );
    DESC WAREHOUSE;
    
    INSERT INTO ITEM (CODE, NAME, COMPANY, PRICE)
    VALUES('C0001', '에어컨', '삼성', 1000000);
    INSERT INTO ITEM (CODE, NAME, COMPANY, PRICE)
    VALUES('C0002', '선풍기', 'LG', 50000);
    
    SELECT * FROM ITEM;
    SELECT * FROM WAREHOUSE;

--해당 계정의 트리거 조회    
    SELECT * FROM USER_TRIGGERS;

--재고수령 추가를 위한 트리거 생성    
    DROP TRIGGER CNT_ADD;
    --CNT_ADD라는 트리거 생성
    CREATE OR REPLACE TRIGGER CND_ADD
    --WAREHOUSE 테이블에 INSERT 명령이 실행되면 트리거를 이후에 실행
    AFTER INSERT ON WAREHOUSE
    --각 로우마다 반복
    FOR EACH ROW
    --트리거가 발동되면 실행되는 부분
    BEGIN
        --바인딩 변수, NEW 선언문, CNT칼럼에 INSERT를 삽입한 데이터를 더해서(NEW.INCNT) 설정한다.
        --NEW 선언은 INSERT, UPDATE문에서 사용, OLD 선언은 DELETE문에서만 사용
        UPDATE ITEM SET CNT = CNT +:NEW.INCNT
        WHERE CODE =:NEW.CODE;
    END;
    /
    
    INSERT INTO WAREHOUSE (NUM, CODE, INCNT, INPRICE, TOTALPRICE)
    VALUES(1, 'C0001', 10, 900000, 9000000);

    SELECT * FROM ITEM;
    SELECT * FROM WAREHOUSE;
    
--재고수령 변경을 위한 트리거 생성    
    DROP TRIGGER CNT_UPDATE;
    CREATE OR REPLACE TRIGGER CNT_UPDATE
    AFTER UPDATE ON WAREHOUSE
    FOR EACH ROW
    BEGIN
        --CNT칼럼 값을 수정전 INCNT 값과 수정후 INCNT 값을 더해서 수정한다.
        UPDATE ITEM SET CNT = CNT - :OLD.INCNT + :NEW.INCNT
        WHERE CODE =:NEW.CODE;
    END;
    / 
    
    UPDATE WAREHOUSE SET INCNT = 7, INPRICE = 800000 WHERE CODE = 'C0001';
    
    SELECT * FROM ITEM;
    SELECT * FROM WAREHOUSE;    
    
--재고수령 제거를 위한 트리거 생성    
    DROP TRIGGER CNT_SUB;
    CREATE OR REPLACE TRIGGER CNT_SUB
    AFTER DELETE ON WAREHOUSE
    FOR EACH ROW
    BEGIN
        UPDATE ITEM SET CNT = CNT-:OLD.INCNT
        WHERE CODE =:OLD.CODE;
    END;
    /
    
    DELETE FROM WAREHOUSE WHERE CODE = 'C0001';
    
    SELECT * FROM ITEM;
    SELECT * FROM WAREHOUSE;    
