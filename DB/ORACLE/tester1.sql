show user;

--�ǽ��� ������ ��������ϴ�.
select * from tab;
--�ۼ��� ���̺� ��� Ȯ��

--DUAL ���̺��̶�?
--DUAL ���̺��� �ٷ� ��� ������ ����� �� �ٷ� ��� ���ؼ� ����Ŭ����
--�����ϴ� ���̺� �Դϴ�.
SELECT * FROM DUAL;
--DUAL ���̺��� ����ڰ� �Լ�(���)�� ������ �� �ӽ÷� ����ϴµ� ����
--�Լ��� ���� ������ �˰� ���� �� Ư�� ���̺��� ������ �ʿ���� DUAL ���̺���
--�̿��Ͽ� �Լ��� ���� return ���� �� �ִ�
SELECT 24*60 FROM DUAL;
--dual ���̺��� �̿��Ͽ� 24*60 �� ����


--������ Ÿ��
--CHAR ������ Ÿ�� : ���� ���� ������ Ÿ��
--name�̶� �÷��� CHAR(10)���� ������ Ÿ���� ������ �Ŀ�
--'oracle'�̶� �����͸� �����Ͽ��ٸ� ������ ���� ������ ���̺��� ª��
--�����Ͱ� �ԷµǾ��� ������ ������ ������ �������� ä�����ϴ�.

--VARCHAR2 ������ Ÿ�� : ���� ���� ������ Ÿ��
--VARCHAR2 ���� ���� �����͸� �����ϱ� ���� ������ Ÿ������, �������� ������ ���ڿ��� �����մϴ�.
--name Į���� VARCHAR2(50)�̶�� �����Ͽ����� 'oracle'�̶� �����͸� �����Ѵٸ�,
--������ �������� ���̿� ���ؼ� ��������� ���̰� �Ҵ�ȴ�.

--NUMBER ������ Ÿ��
--NUMBER �� 10�̳� 12.3�� ���� ��ġ �����͸� �����ϸ� ������ ���� �������� ���ȴ�.
--EX) NUMBER(8)�� �����ϸ�, �ϳ��� �������� ����ȴ�.
--    NUMBER(predision, scale) EX) NUMBER(8,2)
--    �Ѵ� �����ϸ� �Ǽ� ������ ������ ����ȴ�.

--BLOB ������ ���̳ʸ� �����͸� �����ϱ� ���� Ÿ�� �ִ�ũ�� 4gb --> BFILE
--CLOB ��뷮�� �ؽ�Ʈ �����͸� �����ϱ� ���� Ÿ�� �ִ�ũ�� 4gb

--ROWID ���̺� �� ���� �����ּҸ� ������ 64���� ����Ÿ�� ---> �˻��� �����ϴ�

--������ ���Ἲ�� ���� ����
--  NOT NULL��������
--  NULL�� �Ҵ� ���� ���� ��, ���� �������� �𸣴� ���� �ǹ��մϴ�.
--  �̻�(anomaly) ������ �Ͼ�� �ʵ��� �ϱ� ���� ������� �����Ǵ� ���� �ٷ�  �⺻Ű�� ���������Դϴ�.
--  �⺻Ű�� ������ �÷��� ��(NULL)���̳� �ߺ��� ���� ���� �� ���� ������ ��ü�� ���Ἲ�� ������ �� �ְ� �ȴ�.

--�ܷ� Ű ���� ����
--������ �����ͺ��̽��� �����Ͱ� �ߺ��Ǿ� �����ϴ� ���� �����մϴ�. 
--�� ȸ���� ����� ��� �μ��� �ҼӵǾ� �ִ����� ���� ������ ������ ���̺��Դϴ�.

--�μ� ���̺� �����ϱ�
DROP TABLE EMP;
--��� ���̺� �����ϱ�
DROP TABLE DEPT;
--�޿� ���̺� �����ϱ�
DROP TABLE SALGRADE;
DROP TABLE EMPLOYEE;
DROP TABLE DEPARTMENT;
DROP TABLE SALGRADE;

--�μ� ���̺� �����ϱ�
CREATE TABLE DEPT(
    DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13) );

-- ��� ���̺� �����ϱ�
CREATE TABLE EMP( 
  	 EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	 ENAME VARCHAR2(10),
 	 JOB   VARCHAR2(9),
	 MGR  NUMBER(4),
	 HIREDATE DATE,
	 SAL NUMBER(7,2),
	 COMM NUMBER(7,2),
	 DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);

 -- �޿� ���̺� �����ϱ�
CREATE TABLE SALGRADE(
	 GRADE NUMBER,
	 LOSAL NUMBER,
	 HISAL NUMBER );

-- �μ� ���̺� ���� ������ �߰��ϱ�
INSERT INTO DEPT VALUES(10, '�渮��', '����');
INSERT INTO DEPT VALUES(20, '�λ��', '��õ');
INSERT INTO DEPT VALUES(30, '������', '����'); 
INSERT INTO DEPT VALUES(40, '�����', '����');

-- ��� ���̺� ���� ������ �߰��ϱ�
INSERT INTO EMP VALUES(1001, '����', '���', 1013, to_date('2007-03-01','yyyy-mm-dd'), 300, NULL, 20);
INSERT INTO EMP VALUES(1002, '�ѿ���', '�븮', 1005, to_date('2007-04-02','yyyy-mm-dd'), 250,   80, 30);
INSERT INTO EMP VALUES(1003, '����ȣ', '����', 1005, to_date('2005-02-10','yyyy-mm-dd'), 500,  100, 30);
INSERT INTO EMP VALUES(1004, '�̺���', '����', 1008, to_date('2003-09-02','yyyy-mm-dd'), 600, NULL, 20);
INSERT INTO EMP VALUES(1005, '�ŵ���', '����', 1005, to_date('2005-04-07','yyyy-mm-dd'), 450,  200, 30);
INSERT INTO EMP VALUES(1006, '�嵿��', '����', 1008, to_date('2003-10-09','yyyy-mm-dd'), 480, NULL, 30);
INSERT INTO EMP VALUES(1007, '�̹���', '����', 1008, to_date('2004-01-08','yyyy-mm-dd'), 520, NULL, 10);
INSERT INTO EMP VALUES(1008, '���켺', '����', 1003, to_date('2004-03-08','yyyy-mm-dd'), 500,    0, 30);
INSERT INTO EMP VALUES(1009, '�ȼ���', '����', NULL, to_date('1996-10-04','yyyy-mm-dd'),1000, NULL, 20);
INSERT INTO EMP VALUES(1010, '�̺���', '����', 1003, to_date('2005-04-07','yyyy-mm-dd'), 500, NULL, 10);
INSERT INTO EMP VALUES(1011, '�����', '���', 1007, to_date('2007-03-01','yyyy-mm-dd'), 280, NULL, 30);
INSERT INTO EMP VALUES(1012, '������', '���', 1006, to_date('2007-08-09','yyyy-mm-dd'), 300, NULL, 20);
INSERT INTO EMP VALUES(1013, '������', '����', 1003, to_date('2002-10-09','yyyy-mm-dd'), 560, NULL, 20);
INSERT INTO EMP VALUES(1014, '���μ�', '���', 1006, to_date('2007-11-09','yyyy-mm-dd'), 250, NULL, 10);

-- �޿� ���̺� ���� ������ �߰��ϱ�
INSERT INTO SALGRADE VALUES (1, 700,1200);
INSERT INTO SALGRADE VALUES (2, 1201,1400);
INSERT INTO SALGRADE VALUES (3, 1401,2000);
INSERT INTO SALGRADE VALUES (4, 2001,3000);
INSERT INTO SALGRADE VALUES (5, 3001,9999);
COMMIT;

--���̺� ������ ���캸�� ���� DESC
--(1) ���̺��� ���͸� ��ȸ�ϱ� ���ؼ��� ���̺��� ������ �˾ƾ� �Ѵ�.
--(2) ���̺��� ������ Ȯ���ϱ� ���� ��ɾ�δ� DESCRIBE�� �ִ�.
--(3) DESC ��ɾ�� ���̺��� Į����, ������ ��, ���̿� NULL ��� ���� ��� ���� Ư�� ���̺��� ������ �˷��ش�
--DUAL ���̺��̶�?
--DUAL ���̺��� �ٷ� ��� ������ ����� �� �ٷ� ��� ���ؼ� ����Ŭ���� �����ϴ� ���̺�
--DUAL ���̺��� ����ڰ� �Լ�(���)�� ������ �� �ӽ÷� ����ϴµ� ����
--�Լ��� ���� ������ �˰� ���� �� Ư�� ���̺��� ������ �ʿ� ���� DUAL ���̺��� �̿��Ͽ� �Լ��� ���� return ���� �� �ִ�.

desc emp;

--������̺� ��ȸ�ϱ�
SELECT * FROM emp;

--������̺��� empno, ename ��ȸ�ϱ�
SELECT empno, ename FROM emp;

--�������ϱ� : ename,sal,���� ������̺���
SELECT ename, sal*12 ���� FROM emp;
SELECT ename, sal*12 as ���� FROM emp;
SELECT ename, sal*12 ANNUAL FROM emp;

--�÷��̸��� ��Ī �����ؼ� ����ϱ� FROM DEPT (�μ� ���̺�)
SELECT deptno as "�μ���ȣ", dname "�μ���" FROM dept;

--SELECT�� �����ͺ��̽� ���� ����Ǿ� �ִ� ���̺��� ��ȸ�ϱ� ���� ��ɾ��̴�
--SELECT �������� ������ �ϴ� ����� �÷����� ����Ѵ�.
--SELECT ������ *�� ����ϸ� ������ ���̺��� ��� �÷��� ��ȸ�Ѵ�.
--FORM �������� ������ �ϴ� ����� ���̺� �̸��� ����Ѵ�.

--AS�� �÷��� ��Ī �ο��ϱ�
--�÷��� ��� ��Ī�� ����ϰ��� �ϸ� �÷��� ����� �ٷ� �ڿ� AS��� Ű���带 �� �� ��Ī�� ����Ѵ�.

--�ȵǴ� ����
SELECT ename, salary*12+nvl(commission,0) as ���� from emp;
--�ذ�
SELECT ename, sal, job, sal*12, sal*12+comm, comm, deptno FROM emp;

--NVL �Լ�
--NVL("��","��ü��")
--NULL ó���� ���� �Լ��� �ش� �÷��� ���� NULL ���� ��� �ٸ� ������ ��ü�Ͽ� ���

SELECT ename, sal*12+nvl(comm, 0) FROM emp;
--NULL ó���� ���� NVL �Լ�
--NVL�� NULL ���� �ٸ� ������ ��ü�ϱ� ���� �Լ�
--Syntax : NVL(expr1, expr2)
--expr1�� NULL�̸� expr2�� �����ϰ�
--expr1�� NOT NULL�̸� expr1�� ����
--expr1�� expr2�� ���� ������ Ÿ���� ���� �� �ִµ�
--���� ������ Ÿ���� �ٸ��� expr1�� ������ Ÿ���� ����

--as Ű���� ����, ""(�� ����ǥ) ���
SELECT ename, sal*12+nvl(comm,0) "Annsal" FROM emp;
--����� ���� Ư������ ���
SELECT ename, sal*12+nvl(comm,0) AS "A n n s a l" FROM emp;

--�ߺ��� �����͸� �ѹ����� ����ϰ� �ϴ� DISTINCT
--�ߺ��Ǵ� �μ���ȣ�� �ѹ����� ����ϱ� ���ؼ��� Ű���� DISTINCT�� ����Ѵ�.
SELECT DISTINCT DEPTNO FROM EMP;

--����Ŭ������ �������� �÷��� ������ �� ����ϱ� ���ؼ� CONCATENATION
--�����ڸ� ������ �ݴϴ�. �� ����ó�� ���̵��� �ϱ� ���ؼ� "||"�� �÷���
--���ڿ� ���̿� ����Ͽ� �ϳ��� �����Ͽ� ����ϸ� �ȴ�.
SELECT ENAME || '�� ������' || JOB || '�Դϴ�' AS "����" FROM EMP;

--EMP���̺��� SAL>=500 ��ȸ
SELECT * FROM EMP WHERE SAL >= 500;
--SAL != 500
SELECT * FROM EMP WHERE SAL ^= 500;

SELECT * FROM EMP WHERE NOT DEPTNO = 10;

--Ư�� ������ �����͸� ��ȸ�ϴ� where ����
--���ϴ� �ο츸 �������� �ο츦 �����ϴ� ������ select ���� where ���� �߰��Ͽ� �����ؾ� �Ѵ�.

--�̹����� ����� ��ȸ�ϱ�
SELECT * FROM EMP WHERE ename = '�̹���';
--invalid identifier ����Ȯ�� �ĺ���
SELECT * FROM EMP WHERE ename = "�̹���";

--�Ի����� 2005/03/20 ����
SELECT * FROM EMP WHERE hiredate < to_date('2005/03/20', 'yyyy/mm/dd');
--to_date(���ڿ�, ��¥ ����)
--���ڿ��� ��¥ �����ͷ� �ٲٴ� �Լ�
--���ڿ��� �ۼ��� ���İ� ��¥���� ������ �����ϰ� ����� �Ѵ�.

--emp ���̺�κ��� ���������� �μ���ȣ�� 10�� �μ��� ��ȸ�ϱ�
SELECT * FROM EMP WHERE DEPTNO = 10;

--�� �� �� �����ڸ� ����Ͽ� 10�� �μ��̰�, ������ ������ ����� ��ȸ�ϱ�
SELECT * FROM EMP WHERE DEPTNO = 10 and job = '����';
--�� ������ 
--������ ������ �����ؼ� ����� ���� �� ���, ������ �������ִ� �� �����ڸ� ����Ѵ�
--����Ŭ���� ��밡���� �� ������ and, or, not(<>) �� �ִ�.

--�޿��� 400~500�� ��� ����ϱ�
SELECT * FROM EMP where sal between 400 and 500;
--between and ������
--Ư�� �������� ���ϴ� ������������ �˾ƺ��� ���ؼ�
--�� �����ڿ� �� �����ڸ� �����Ͽ� ǥ���� �� �ִ�.

--in�����ڸ� ����Ͽ� Ŀ�̼��� 80�̰ų� 100�̰ų� 200�� ��� ��ȸ�ϱ�
SELECT * FROM EMP where comm in(80, 100, 200);
--in ������
--Ư�� �ʵ��� ���� a�̰ų� b�̰ų� c�߿� ��� �ϳ��� �����ϴ��� ����ϴ� �������̴�.

--hiredate�� between�� ����Ͽ� 2003�⿡ �Ի��� ������ ����ϱ�
select * from emp where hiredate 
between to_date('2003/01/01','yyyy/mm/dd') 
and to_date('2003/12/31','yyyy/mm/dd');

select * from emp where comm !=80 and comm <> 100 and comm ^=200;
--!=, <>, ^= ��� not������
--in�����ڸ� ����Ͽ� ���� ���� ���� �����ϱ�
select * from emp where comm not in(80, 100, 200);



----------------------------------------09/02--------------------------------------

--like�����ڿ� ���ϵ�ī��
--column_name like pattern
--like �������� pattern�� ����ؾ� �ϴµ� pattern�� ������ ���� �ΰ��� ���ϵ� ī�尡 ���ȴ�.
--% : ���ڰ� ���ų�, �ϳ� �̻��� ���ڰ� ����� �͵� �������.
--_ : �ϳ��� ���ڰ� ����� �͵� �������.

--�̾����� ���� ����� like�� �̿��Ͽ� ����ϱ�
select * from emp where ename like '��%';

--'��'�� �ƹ����� ���⸸ �ص� �Ǵ� �̸��� ��ȸ�ϱ�
select * from emp where ename like '%��%';

--'��'�� �ڿ��� ���� �̸��� ����ϱ�
select * from emp where ename like '%��';

--'��'�� ����� ���� �̸��� ����ϱ�
select * from emp where ename like '_��_';

--'��'�� ��� �ȵ��� �̸��� ����ϱ�
select * from emp where not ename like '_��_';

--null�� ���� ã�� ���� is null
--��� Į�� is(������) null(�񱳰�);

--�߸��� ����̶� ����� �ȳ��´�.
select * from emp where comm=null;
--Ŀ�̼��� null�� ����� ��ȸ�ϱ�
select * from emp where comm is null;
--Ŀ�̼��� null�� �ƴ� ����� ��ȸ�ϱ�
select * from emp where not comm is null;

--������ ���� order by
--select Į��1, Į��2, ... from ���̺�� where ���� order by Į���� ���Ĺ��
--order by �� �������� � Į���� �������� ������ �������� �����ؾ� �ϱ⿡ Į�� �̸��� ����ؾ� �Ѵ�.
--�� �������� ������������ ����(asc)����, ��������(desc)���� ���Ĺ���� ����ؾ� �Ѵ�. 

--asc ��������
--���� : ���� �� ���� ����
--���� : ���� ������ ����
--��¥ : ���� ��¥ ������ ����
--null : ���� ������

--desc ��������
--���� : ū �� ���� ����
--���� : ���� �ݴ� ������ ����
--��¥ : ����(�ֱ�) ��¥ ������ ����
--null : ���� ����

--�޿��� ���� �޴� ������ ���, �޿��� ������ �̸������� ��� �ϱ�
  select * from emp order by sal desc, ename asc;

--�Ի糯¥�� �ֱ� ��, ��¥�� ������ �̸������� ����ϱ�
  select * from emp order by hiredate desc, ename asc;

----���� ����----

--1. �޿��� 300������ ����� �����ȣ, ����̸�, �޿� ����ϱ�
     select empno, ename, sal from emp where sal<=300;
--2. �̸��� ����ȣ�� ����� �����ȣ, ����̸�, �޿� ����ϱ�
    select empno, ename, sal from emp where ename = '����ȣ';
--3. �޿��� 250�̰ų� 300�̰ų� 500�� ����� �����ȣ, �����, �޿��� ����ϱ�
    select empno, ename, sal from emp where sal in(250,300,500);
--4. �޿��� 250�̰ų� 300�̰ų� 500�� �ƴ� ����� �˻��ϱ�
    select empno, ename, sal from emp where not sal in(250,300,500);
--5. like �����ڿ� ���ϵ� ī�带 ����Ͽ� ����� �߿��� 
--�̸��� "��" ���� �����ϴ� ����� �̸��߿� "��"�� �����ϴ� ����� �����ȣ�� ����̸� ����ϱ�
    select empno, ename from emp where ename like '��%' or ename like '%��%';
--6. ����� ���� ����� ����ϱ�
    select * from emp where ename = '�ȼ���'; --���� ���� ���
    select * from emp where job = '����'; --���� ���� ���
    select * from emp where mgr is null;
--7. ������̺��� �ֱٿ� �Ի��� ���� ������ �����ȣ, ����̸�, ����, �Ի��� ����ϱ�
    select empno, ename, job, hiredate from emp order by hiredate desc; 
--8. �μ� ��ȣ�� ���� ������� ����ϵ� ���� �μ��� ����� �Ի����� ������ ������� ����ϱ�
    select deptno, ename, hiredate from emp order by deptno asc, hiredate asc; 
    
--GROUP_STAR�� SINGLE_STAR ���̺��� �ʱ�ȭ
DROP TABLE GROUP_STAR;
DROP TABLE SINGLE_STAR;

--GROUP_STAR�� SINGLE_STAR ���̺��� ����
CREATE TABLE GROUP_STAR( NAME VARCHAR2(50));
CREATE TABLE SINGLE_STAR( NAME VARCHAR2(50));

--GROUP_STAR�� ���� �Է�
INSERT INTO GROUP_STAR VALUES('�¿�');
INSERT INTO GROUP_STAR VALUES('����');
INSERT INTO GROUP_STAR VALUES('����');
INSERT INTO GROUP_STAR VALUES('ȿ��');
INSERT INTO GROUP_STAR VALUES('Ƽ�Ĵ�');
INSERT INTO GROUP_STAR VALUES('����ī');
INSERT INTO GROUP_STAR VALUES('����');
INSERT INTO GROUP_STAR VALUES('���');
INSERT INTO GROUP_STAR VALUES('����');
INSERT INTO GROUP_STAR VALUES('ž');
INSERT INTO GROUP_STAR VALUES('���巡��');
INSERT INTO GROUP_STAR VALUES('�뼺');
INSERT INTO GROUP_STAR VALUES('�¸�');
INSERT INTO GROUP_STAR VALUES('�¾�');

--SINGLE_STAR�� ���� �Է�
INSERT INTO SINGLE_STAR VALUES('�¿�');
INSERT INTO SINGLE_STAR VALUES('���巡��');
INSERT INTO SINGLE_STAR VALUES('�뼺');
INSERT INTO SINGLE_STAR VALUES('�¾�');
INSERT INTO SINGLE_STAR VALUES('������');
INSERT INTO SINGLE_STAR VALUES('������');
INSERT INTO SINGLE_STAR VALUES('������');
COMMIT;

--���� ������
--union ������, minus ������, intersect ������ ������
--�Է� ���̺�� ��� ���̺��� �ߺ��� ���ڵ尡 �����ȴ�.
--union all, minus all, intersect all ������
--�Է� ���̺�� ��� ���̺� �ߺ��� ���ڵ尡 ���ȴ�.
--���� : <����1>���տ�����1 <����2>���տ�����2 <����n>

--union : �������� ���� ����� �ϳ��� ��ġ�� �������ε�, union�� �ߺ��� ������ �����Ͽ� �ϳ��� ��ġ�� ������.
--union all : union�� ���� ���� ���� ������� ���� �������� �ǹ��ϸ�, �ߺ��� ������ ��� ���Խ�Ű�� ������.
--intersect : �������� select ������� ����� �κи� ����� �����Ѵ�. ��, �������� ���� �������̶�� �� �� �ִ�.
--minus : ���� select ������� ���� select ����� ��ġ�� �κ��� ������ ������ �κи� �����Ѵ�. ��, �� ���� ������� �������̶� �� �� �ִ�.

--�׷�Ȱ���� �̱�Ȱ���� �ϴ� �����̸��� �ߺ��Ͽ� ����ϱ�
    select * from group_star union all select * from single_star;
    
--�׷�Ȱ���� �̱�Ȱ���� �ϴ� �����̸��� �ߺ����� �ʰ� ����ϱ�
    select * from group_star union select * from single_star;
    
--�̱�Ȱ���� �ϴ� �����̸��� ����ϱ�
    select * from single_star minus select * from group_star;
    
--�׷�Ȱ���� �ϰ� �̱�Ȱ���� �ϴ� �����̸��� ����ϱ�
    select * from group_star intersect select * from single_star;
