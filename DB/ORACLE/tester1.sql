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
    
