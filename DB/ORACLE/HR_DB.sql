--����Ŭ�� ������ �� �ֵ��� ���÷� ����� ���� ������ ����
select * from tab;
desc tab;

--last_name�� ' ' �ȿ��� ��ҹ��� �����ؾ� �Ѵ�.
    select employee_id, salary from employees where last_name = 'Smith';
--�߸��� ���
    select employee_id, FIRST_NAME, salary from employees where last_name = 'smith';

--��Ī �����ϴ� ���
    select employee_id as "����", salary as "������" from employees;
    select employee_id "����", salary "������" from employees;
    select employee_id as "����" from employees where last_name = 'Smith';

--�ߺ� ����
    select distinct job_id from employees;

--sum()
    select sum(salary) from employees;

--count()
--count(*) : ��ȸ�� ��ü�� �Ǽ��� ��ȯ
--count(Į��) : Į���� ���� null�� ���� ī��Ʈ ���� ����
--count(distinct Į��) : Į�� ���� �ߺ��� �����ϰ�, Į���� �� �Ǽ��� ��ȯ
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

----������ �Լ�
--dual ���̺��� ������� �ʴµ� �����ϴ� dummy ���̺�

--abs() ���밪
    select abs(23), abs(-23) from dual;

--sign() ����� 1, ������ -1, 0�� 0
    select sign(23) from dual;
    select sign(23), sign(-23),sign(0) from dual;

--round() �ݿø�
    select round(0.123), round(0.543) from dual;
--,�ڿ� ������ ������ �ڸ������� �ݿø��Ͽ� ǥ��
    select round(0.12345678, 6), round(2.3423455, 4) from dual;

--trunc()
    select trunc(1234.1234567) from dual;
--0��° �ڸ����� �߶�
    select trunc(1234.1234567, 0) from dual;
--�Ҽ� 2��° �ڸ����� �߶�
    select trunc(1234.1234567, 2) from dual;
--��� ù��°�ڸ� ���� �߶� �ڸ����� 0���� ǥ��
    select trunc(1234.123456, -1) from dual;

--ceil() ������ �÷��� ������
    select ceil(32.3), ceil(-32.3) from dual;

--floor() �Ҽ��� �ڸ��� ������ ����
    select floor(32.3), floor(-32.3) floor from dual;

--power() ����
    select power(4,2) power from dual;

--mod() ������
    select mod(7,4) mod from dual;

--sqrt() ������
    select sqrt(2), sqrt(4) from dual;

----��¥�� �Լ�

--add_months() ������ ���ϱ�
    select sysdate, add_months(sysdate, 7) from dual;    

--next_day() ���� ��¥���� ���� �Ͽ���
    select sysdate, next_day(sysdate, '�����') from dual;

--last_day() �ش� ���� ������ ��¥
    select sysdate, last_day(sysdate) from dual;
    
--months_between(date, date2) �� ��¥ ������ ���� ���� ��ȯ
    select months_between(to_date('2022/11/10', 'yyyy/mm/dd'), to_date('2022/01/10', 'yyyy/mm/dd')) months from dual;

--��¥�� �����Ϳ� ���� �� ������ �Ͽ� �ش� ���� ��ŭ�� �� ���� ������ ��¥�� ��� �����ϴ�.
--sysdate-1 : ����
--sysdate : ����
--sysdate+1 : ����
--sysdate+30 : ���ú��� 30�� ���� ��¥ ��ȯ
--sysdate-30 : ���ú��� 30�� ���� ��¥ ��ȯ

----���ڿ� �Լ�

--concat(char1, char2)
--�� ���ڿ��� �����Ͽ� �ϳ��� ����
select concat('hello','bye'), concat('������ħ','bad') from dual;

--|| ������ ( concat�� ������ ��� )
--concató�� ���ڿ��� ���������� �̰� ���� ���ڿ� ���� ����
select 'good' || 'bad' operators from dual;

--intcap(char)
--���� �ܾ��� ù ���ڸ� �빮�ڷ�, �����̳� ���ĺ��� �ƴ� ���ڸ� ���� �� ���� ù ���ĺ��� �빮�ڷ� �ٲ�
select initcap('good morning') from dual;
--/�� �����ڶ� b�� �빮�ڷ� �ٲ��.
select initcap('good/bad morning') from dual;

--lower(char), upper(char)
--intcap�� �޸� ��� ���ڸ� �ҹ���, �빮�ڷ� �ٲ�
    select lower('GOOD'), upper('good') from dual;
    
--lpad('���ڿ�', �� ���ڱ���, 'ä�﹮��')
--������ ���� ��ŭ ���ʺ��� Ư�����ڷ� ä���ش�.
--Ư�����ڸ� �������� ������ �������� ä��
select lpad('good', 6) "lpad1", lpad('good', 7, '#') "lpad2", lpad('good', 8, 'L') "lpad3" from dual;

--rpad('���ڿ�', �� ���ڱ���, 'ä�﹮��')
--������ ���� ��ŭ �����ʺ��� Ư�����ڷ� ä���ش�.
--�ѱ��� 2����Ʈ�� ����
select rpad('good', 6) "rpad1", rpad('good', 7, '#') "rpad2", rpad('������', 8, 'L') "rpad3" from dual;

--substr('���ڿ�', ������ġ, ������ ����)
--���ڿ��� ���� ��ġ �ε����� ���ʿ��� 1���� ���� ( jds = 1 2 3 )
--���� ��ġ ���� ������ ��� �ε����� �����ʿ��� -1���� ���� ( jds = -3 -2 -1 )
--���� ������ ������ �����ϸ�, ������ġ �ε������� ������ ���ڿ��� ������ ��ȯ�Ѵ�
--���� �� ������ 0���� �����ϸ�, �ƹ��͵� �������� �ʱ� ������ null�� ��ȯ�Ѵ�.
--������ġ �ε����� 0���� ������ ���ڿ��� �ε����� 0���� �����Ѵ�.
    SELECT SUBSTR('ABCDEFG', 2, 3) FROM dual;
    SELECT SUBSTR('ABCDEFG', -5, 3) FROM dual;    
    SELECT SUBSTR('ABCDEFG', 2) FROM dual;    
    SELECT SUBSTR('ABCDEFG', -5, 0) FROM dual;    
    
--length( ���� �� )
--������ ���̸� ��ȯ�ϴ� �Լ�     
    select length('ABCDEFG') from dual;

--instr(���� ��, �˻� ���� ��, ������ġ, ����)
--���� ���� ���޹޾� �˻����ڸ� ������ġ���� �˻��Ͽ� ���ϴ� ������ ������ġ�� ��ȯ�ϴ� �Լ�
    select instr('ABCDEFGABCDEFG', 'B', 1, 2) instr from dual;

--treim( leading or trailing ���Ź��� from ���� ��)
--���� ���� ���޹޾� ��(leading) �Ǵ� ��(trailing)�� �����ϴ� ���Ź��ڸ� ��� �����ϴ� �Լ�
    select treim(leading 'B' from 'ABCDEFG') from dual;

    

----nulló�� �Լ�

--nvl(expr1, expr2)
--expr1�� null�� �����ϴ� Į�� ǥ������, expr2���� null�� ��ü�ϴ� ���� �ۼ�
--expr1�� expr2�� �ݵ�� ������ Ÿ���� ��ġ�ؾ� �Ѵ�.
--expr1�� null ���̸� expr2�� ��ȯ, null���� �ƴϸ� expr1�� �״�� ��ȯ
--���� ������ �Ʒ��� nvl2�Լ����� �����ϰ� �ش�ȴ�.

--nvl2(expr1, expr2, expr3)
--expr1�� null���� �ƴ� ��� expr2��, null���� ��� expr3�� ��ȯ

--nullif(expr1, expr2)
--expr1�� expr2�� ������ ��� null��, �������� ������ expr1�� ��ȯ

--coalesce(a1, a2, a3, ..., an)
--a1���� ������� Ž���ؼ� null�� �ƴ� ù��° ���� �������� ��� null�̸� 0(null)�� ��ȯ
    select coalesce(null,null,'a',null,'d',null) from dual;
    select coalesce(null,null,null,null,null,null) from dual;


----����ȯ �Լ� : �ڷ����� ��ȯ��Ű���� �� �� ����ϴ� �Լ�
--number <--> character <--> date
--to_number : �������� ���������� ��ȯ
--to_char : ��¥�� Ȥ�� �������� ���������� ��ȯ
--to_date : �������� ��¥������ ��ȯ

--to_char('��¥ ������', '�������')
    select to_char(sysdate, 'yyyy'),to_char(sysdate, 'mm') from dual;
    select to_char(sysdate, 'day'), to_char(sysdate, 'dy') from dual;
    select to_char(sysdate, 'mm'), to_char(sysdate, 'mon') from dual;
    select to_char(sysdate, 'mi'), to_char(sysdate, 'ss') from dual;
--to_char('������', '�������')
    select to_char(1000, '00000')from dual;
    select to_char(1000, '99999')from dual;
    select to_char(1000, 'L00000')from dual;
    select to_char(1000, '00000.00')from dual;
    select to_char(1000, '99,999')from dual;

--to_number('���ڿ�', '�������')
--��� ������ �ڸ� ���� ������ �ٲ� ���ڿ��� ���ų� ���ƾ� �Ѵ�.
SELECT TO_NUMBER('100,000', '999,999') FROM DUAL;
SELECT TO_NUMBER('80,000', '999,999') FROM DUAL;
SELECT TO_NUMBER('100,000', '999,999') - TO_NUMBER('80,000', '999,999') FROM DUAL;
--1000 : �������� ���
    select to_number('1000', '0000') from dual;
--���� : 0�� ���� �ڸ� 0���� ǥ��
    select to_number('1000', '00000') from dual;
--1000 : �������� ���
    select to_number('1,000', '9,999') from dual;
--1000 : 9�� ���� �ڸ� ǥ�� ����
    select to_number('1,000', '99,999') from dual;

--to_date('���ڿ�', '�������')
--���ڿ��� ��¥ ���İ� ��������� ��¥ ������ ���ƾ� �Ѵ�.
    select to_date('20070402', 'yyyy/mm/dd') from dual;
    select to_date('2007/04/02', 'yy-mm-dd') from dual;
    select to_date('0402', 'mm-dd') from dual;
    select to_date('04-02', 'mm/dd') from dual;
    select to_date('02', 'yy') from dual; 
    select to_date('02', 'mm') from dual;
    select to_date('02', 'dd') from dual;
--�⵵ Ȥ�� ���� �����ϸ�, ���� �ý����� �⵵�� ���� �Է��Ͽ� ǥ���Ѵ�.
--������ ���� �����ϸ�, �׳� 1���� ǥ���Ѵ�.



-------------------------------------------------------------------------------------
--������ ����    
    SELECT LEVEL, LPAD('',4*(LEVEL-1)) || FIRST_NAME || ' ' || LAST_NAME "�̸�"
    FROM EMPLOYEES
    START WITH MANAGER_ID IS NULL
    CONNECT BY MANAGER_ID = PRIOR EMPLOYEE_ID;
    
    SELECT JB.JOB_TITLE "����", LPAD('',4*(LEVEL-1)) || EMP.FIRST_NAME || ' ' || LAST_NAME "�̸�"
    FROM EMPLOYEES EMP, JOBS JB
    WHERE EMP.JOB_ID = JB.JOB_ID
    START WITH EMP.MANAGER_ID IS NULL
    CONNECT BY EMP.MANAGER_ID = PRIOR EMP.EMPLOYEE_ID;
    

--ROLLUP : ���� ������ ���� ����ȭ ������ �κ���
--rollup : �׷캰 �հ� ������ �߰��ؼ� �����ִ� �Լ�
--��ȸ ������ FROM �� -> WHERE �� -> SELECT �� �̱� ������
--FROM ������ ������ ��Ī�� SELECT ������ ��밡��

    SELECT L.CITY, D.DEPARTMENT_NAME, E.JOB_ID,
    COUNT(*) �����, SUM(E.SALARY) �ѱ޿�
    FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
    WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
    AND D.LOCATION_ID = L.LOCATION_ID
    --���ú�, �μ���, ���޺��� �հ踦 ���ϰ� ��ü �հ踦 ���Ѵ�
    --���� �ȿ� �μ��ȿ� ���޺��� �հ踦 ���ϰ�
    --���� �ȿ� �μ� ���� �հ踦 ���ϰ�,
    --���� ���� �հ踦 ���ϰ�
    --������ ������ ���� �� �հ踦 ��� ���� ��ü �հ踦 ���Ѵ�.
    --�� �հ�� �ش� �׷캰�� ������ �࿡ ǥ�õȴ�.
    GROUP BY ROLLUP(L.CITY, D.DEPARTMENT_NAME, E.JOB_ID)
    --ROLLUP�� ����ϸ� �μ����� ������ �հ�, ��ü �հ谡 ���´�.
    ORDER BY L.CITY, D.DEPARTMENT_NAME, E.JOB_ID;
    