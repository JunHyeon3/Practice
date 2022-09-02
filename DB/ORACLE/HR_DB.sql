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
    select count(all employee_id) from employees;
    select count(all employee_id), count(distinct employee_id) from employees;
    select count(all first_name) from employees;
    select count(all first_name), count(distinct first_name) from employees;

--avg()
    select avg(salary)from employees;
    select avg(salary)from employees where department_id = 80;
    select avg(salary)from employees where department_id = 50;

--max()
    select max(salary) from employees;
    select max(hire_date) from employees;

--min()
    select min(salary) from employees;
    select min(hire_date) from employees; 

----������ �Լ�
--dual ���̺��� ������� �ʴµ� �����ϴ� dummy ���̺�

--abs() ���밪
    select abs(-23) from dual;
    select abs(23) from dual;

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
    select ceil(32.8) ceil from dual;
    select ceil(32.3) ceil from dual;

--floor() �Ҽ��� �ڸ��� ������ ����
    select floor(32.8) floor from dual;
    select floor(32.3) floor from dual;

--power() ����
    select power(4,2) power from dual;

--mod() ������
    select mod(7,4) mod from dual;

--sqrt() ������
    select sqrt(2), sqrt(4) from dual;

----��¥�� �Լ�

--add_months() ������ ���ϱ�
    select add_months(sysdate, 7) from dual;    

--next_day() ���� ��¥���� ���� �Ͽ���
    select next_day(sysdate, '�Ͽ���') from dual;

--last_day() �ش� ���� ������ ��¥
    select last_day(sysdate) from dual;
    
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
select to_char(sysdate, 'yyyy/mm/dd') from dual;
select to_char(sysdate, 'day') from dual;
select to_char(sysdate, 'dd') from dual;
select to_char(sysdate, 'dy') from dual;
select to_char(sysdate, 'mm') from dual;
select to_char(sysdate, 'mon') from dual;
select to_char(sysdate, 'mi') from dual;

--to_number('���ڿ�', '�������')
--��� ������ �ڸ� ���� ������ �ٲ� ���ڿ��� ���ų� ���ƾ� �Ѵ�.
--1000 : �������� ���
select to_number('1000', '0000') from dual;
--���� : 0�� ���� �ڸ� 0���� ǥ��
select to_number('1000', '00000') from dual;
--1000 : �������� ���
select to_number('1,000', '9,999') from dual;
--1000 : 9�� ���� �ڸ� ǥ�� ����
select to_number('1,000', '99,999') from dual;

--to_number('���ڿ�', '�������')
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
