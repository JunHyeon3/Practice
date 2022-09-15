show user;

--�ǽ��� ������ ��������ϴ�.
select * from tab;
--�ۼ��� ���̺� ��� Ȯ��

--DUAL ���̺��̶�?
--DUAL ���̺��� �ٷ� ��� ������ ����� �� �ٷ� ��� ���ؼ� ����Ŭ����d
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

--�μ� ���̺� �����ϱ�
CREATE TABLE DEPT(
    DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13) 
);

-- ��� ���̺� �����ϱ�
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

 -- �޿� ���̺� �����ϱ�
CREATE TABLE SALGRADE(
    GRADE NUMBER,
    LOSAL NUMBER,
    HISAL NUMBER 
);

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
    SELECT ename, sal*12 FROM emp;
    SELECT ename, sal*12 as ���� FROM emp;
    SELECT ename, sal*12 ANNUAL FROM emp;

--�÷��̸��� ��Ī �����ؼ� ����ϱ� FROM DEPT (�μ� ���̺�)
    SELECT deptno as �μ���ȣ, dname "�μ���" FROM dept;

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

--EMP���̺��� SAL>=500 ��ȸ�ϱ�
    SELECT * FROM EMP WHERE SAL >= 500;
--SAL != 500
    SELECT * FROM EMP WHERE SAL ^= 500;
--�μ���ȣ�� 10�� ��� ��ȸ�ϱ�
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
--�� �� �� �����ڸ� ����Ͽ� 10�� �μ��̰ų�, ������ ������ ����� ��ȸ�ϱ�
    SELECT * FROM EMP WHERE DEPTNO = 10 OR job = '����';
--�� �� �� �����ڸ� ����Ͽ� 10�� �μ��� �ƴϰ�, ������ ������ ����� ��ȸ�ϱ�
    SELECT * FROM EMP WHERE NOT DEPTNO = 10 AND job = '����';
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
    
    
----------------------------------------09/05--------------------------------------

--ltrim(), rtrim()
--ltrim(���ڿ�, ���� ���ڿ�)
--���ڿ��� ���ʿ��� ���� ���ڿ��� ���� ���� ��ȯ
--���� ���� ���ں��� ������� ���� �� ������, �߰��̳� �������� ���ڴ� ������� ���� ���� ��ȯ
    select ltrim('goodbye','g'), ltrim('goodbye','o'), ltrim('goodbye','go') from dual;
                                 --o�� �߰��� �ֱ� ������ ���� �� ����.

--rtrim(���ڿ�, ���� ���ڿ�)
--���ڿ��� �����ʿ��� ���� ���ڿ��� ���� ���� ��ȯ
    select rtrim('goodbye','e'), rtrim('goodbye','o'), rtrim('goodbye','ye') from dual;
    
--substr(���ڿ�, ������ġ, ������ ����)
--���ڿ��� ������ġ �ε������� ������ ���� ��ŭ�� ���ڿ��� ��ȯ
--������ġ ���� �����  ��� �ε����� ���ʿ��� 1���� ����
--������ġ ���� ������ ��� �ε����� �����ʿ��� -1���� ����
--�ѱ��� ��쵵 �Ȱ��� �����Ѵ�.
    select substr('good morning john', 8, 4) from dual;
--r���� �������� ���    
    select substr('good morning john', 8) from dual;
--������ ���� 4����
    select substr('good morning john', -4) from dual;    
--0�� ���� null
    select substr('good morning john', -4, 0) from dual;
    
--substrb(���ڿ�, ������ġ, ����Ʈ��)
--���ڿ��� ���� �ε��� ���� ����Ʈ �� ��ŭ ���ڸ� ����
    select substrb('good morning john', 8, 4) from dual;    
--�ѱ��� �ε����� 2�� �����ϸ�, �� ���ڴ� 3~4����Ʈ�� �����Ѵ�.
    select substrb('���̻�����ĥ�ȱ���', 8, 17) from dual;    
    
--replace(���ڿ�, ���� ���ڿ�, �ٲ� ���ڿ�)    
--���ڿ� �ȿ��� ���� ���ڿ����� �ٲ� ���ڿ��� �����Ѵ�
--replace�� ������ ���ڿ� ������ ��ü
    select replace('good morning john', 'morning', 'evening') from dual;
    
--translate(���ڿ�, ���� ����, �ٲ� ����)
--���� ���ڵ�� �ٲ� ���ڵ��� �� �ε��� ������� 1:1 ��Ī�Ǿ� ����ȴ�.
--translate�� ���� ������ �ٲ�
    select translate('you are not alone', 'you', 'we') from dual;
--y���ڸ� w�� ����, o���ڸ� e�� ����, u���ڸ� ����

--trim()
--trim() �Լ��� ����ϴ� �μ� 3������ ���� �ش� ���ڿ��� �� or �� or ������ ���� ���� �����Ѵ�.
--�⺻������ trim�� ������ �����ϴ� ���� �⺻ ���̸� �ش� �뵵�� ���� ���ȴ�.
    select trim('      trim     ') from dual; 
    
    select trim(leading from '   good   '), 
           trim(trailing from '   good   '),
           trim(both from '   good   ')
    from dual;
--������ ���� ���ڸ� ����
    select trim(leading 't' from 'trimm  ') from dual;

    
--length()    
--  ���� �������� �� ����
    select length(trim(leading from '   good   ')), 
--  ������ �������� �� ����
            length(trim(trailing from '   good   ')),
--  ���� �������� �� ����
            length(trim(both from '   good   ')),
--  ���� ��������
            trim(both from '   good   ')
    from dual;

--instr(���ڿ�, ã�� ���� ��, ã�⸦ ������ ��ġ, ã�� ����� ����)
--���ڿ����� ���ϴ� ������ ��ġ�� ã�� ���� �Լ�
--��ҹ��ڸ� �����Ͽ� �˻��Ѵ�
--�������� ���ڸ� ã������ or������ ���
--1������ Ž���Ͽ�, ù ��° or�� �����ϴ� ��ġ
    select instr('good morning john','or',1) from dual;
--1������ Ž���Ͽ�, �� ��° o�� ������ ��ġ    
    select instr('good morning john','o',1, 2) from dual; 
    
--�������� ���������� ��ȯ�ϱ�
--0   �ڸ���, �ڸ����� ���� ������ 0���� ä��
--9   �ڸ���, �ڸ����� ���� �ʾƵ� ä���� ����
--L   �� ������ ��ȭ��ȣ�� �տ� ǥ��
--.   �Ҽ���
--,   õ �ڸ� ����

--��¥������ ��ȯ�ϴ� TO_DATA �Լ�
--TO_DATE('����', 'format');
--emp���̺��� 2007�� 4�� 2�Ͽ� �Ի��� ��� �˻��ϱ�
    select * from emp where hiredate = to_date('2007/04/02', 'yyyy-mm-dd');

--���������� ��ȯ�ϴ� to_number �Լ�
    select to_number('20,000', '99,999') - to_number('80,000', '99,999') from dual;
    
--�Ի��� �� �������� �߶󳻱� (to_char 2007/04/02 -> 2007/04/01 )
    select ename, hiredate, to_char(trunc(hiredate,'month'),'yyyy/mm/dd') from emp ;
    
--�� ��¥ ���� ������ ���ϴ� months_between �Լ�
--months_between(date1, date2)
--���ú��� �Ի��� ������ ������ ���ϱ�
    select ename, trunc(months_between(sysdate, hiredate)) �ٹ��޼� from emp;
    
--�������� ���ϴ� add_months �Լ�
--add_months(date,number)
--�Ի� ��¥�� 6���� ���ϱ�
    select ename, hiredate, add_months(hiredate,6) from emp;
    
--�ش� ��¥���� ���� ����� ������ ��¥�� ��ȯ�ϴ� next_day �Լ�
--next_day(date, ����)
--1�Ͽ��� 2������ 3ȭ���� 4������ 5����� 6�ݿ��� 7�����
--������ �������� ���ʷ� �����ϴ� �ݿ����� �����ΰ�
    select sysdate ����, next_day(sysdate, 6) �ݿ��� from dual;
    
    
--substr�� ����Ͽ� 9���� �Ի��� ��� ����ϱ�
    select * from emp where substr(hiredate, 4, 2) = '09';
--substr�� ����Ͽ� 2003�⿡ �Ի��� ��� ���
    select * from emp where substr(hiredate, 1, 2) = '03';
--substr�� ����Ͽ� �Ի����� �⵵(���ڸ�), ��(���ڸ�), ��(���ڸ�)�� ������ ���
    select hiredate, substr(hiredate,1,2) �⵵, substr(hiredate,4,2) ��, substr(hiredate,7,2) �� from emp;
--substr�� ����Ͽ� '��'�� ������ ��� ���
    select * from emp where substr(ename,2,1) = '��' or substr(ename, 3) = '��';
    select * from emp where substr(ename,-1,1) = '��'; --�ٸ� Ǯ�̹�
--substr�� ����Ͽ� �̸��� �ι�°�� '��'�� �ִ� ��� ���    
    select * from emp where substr(ename,2,1) = '��';
--instr�� ����Ͽ� �̸��� �ι�°�� '��'�� �ִ� ����� empno,ename ���    
    select empno,ename from emp where instr(ename,'��',1) = 2;
    
--decode �Լ�    
--swith, case�� ���� ����� �Ѵ�.
--�������� ��쿡 ���ؼ� ������ �� �ִ�.
--decode(ǥ����, ����1, ���1, ����2, ���2, ...,�⺻���)
    select ename, deptno, decode(deptno,10,'�渮��', 
                                        20,'�λ��', 
                                        30,'�����') 
    as DNAME from emp order by dname;

--case �Լ�
--if else if else�� ������ ������ ���´�.
--decode�� �������� ���ϴ� �񱳿����� ������ �ذ��� �Լ�
--�پ��� �񱳿����ڸ� ����Ͽ� ������ ������ �� �־� ������ ������ ���� �ִ�.
--CASE WHEN ����1 THEN ���1 WHEN ����2 THEN ���2 ... ELSE ��� END;
    select ename, deptno, case when deptno = 10 then '�渮��'
                               when deptno = 20 then '�λ��'
                               when deptno = 30 then '�����'
                               end
    as dname2 from emp order by dname2;


--���޿� ���� ������ ����� 5%, ������ ����� 10%, �븮�� ����� 15%, ����� ����� 20% �޿��λ��ϱ�
--EMPNO, ENAME, JOB, SAL Upsal�� ����ϱ�
    select empno, ename, job, sal, decode(job,'����', sal*1.05, 
                                              '����', sal*1.10, 
                                              '�븮', sal*1.15, 
                                              '���', sal*1.20) 
    as "SAL Upsal" from emp order by job;
    
--decode�� mod�� ����Ͽ� Ȧ�� ������� �Ի糯¥�� ��ȸ�ϱ� (¦�� ����� null)   
    select empno, ename, decode(mod(empno, 2), 1, hiredate, null) �Ի��� from emp; 
    --,null�� ��� ��
    
--round�� ����Ͽ� �ٹ��ϼ� ���ϱ�    
--round(date, fromat)ó�� format�� �����ϸ� ��¥�� ���ؼ��� �ݿø� �� �� �ִ�.
    select ename, to_char(sysdate) ���糯¥, to_char(hiredate) �Ի糯¥, to_char(round(sysdate-hiredate)) �ٹ��ϼ� from emp;
    
--�Ի����� ������ 2�ڸ�, ���� ����(MON), ������ ���(DY)�� �����Ͽ� ����ϱ�
    select hiredate, to_char(hiredate, 'yy/mon/dy') from emp;
    select hiredate, to_char(hiredate, 'yy'),
           to_char(hiredate, 'mon'), to_char(hiredate, 'dy') from emp;

--nvl�� ����Ͽ� ���ӻ���� ���� ����� empno,ename,���ӻ���� ceo�� ����ϱ�
    select empno, ename, nvl(to_char(mgr,'9999'),'ceo') as "���� ���" from emp where mgr is null;

----------------------------------------09/06--------------------------------------
----�׷��Լ�
--���̺��� ��ü �����Ϳ��� ������� ����� ���ϱ� ���� �Լ�
--�ϳ��̻��� ���� ���� �׷����� ����� �����Ͽ� ����� ��Ÿ��
--�� ���տ� �����Ͽ� �ϳ��� ����� ������
--sum : �׷��� ���� �԰�
--avg : �׷��� ���
--count : �׷��� �� ����
--max : �׷��� �ִ�
--min : �׷��� �ּڰ�
--stddev : �׷��� ǥ������
--variance : �׷��� �л�

--group by ��
--Ư�� Į���� �������� �׷��Լ��� ����� ��� � Į�� ���� �������� �׷��Լ��� �� ���� �����Ҷ� ����Ѵ�.
--select Į����, �׷��Լ� from ���̺�� where ���� group by Į����
--��� ���̺��� �μ� ��ȣ�� �׷� �����
    select deptno from emp group by deptno;

--�Ҽ� �μ��� �ִ� �޿��� �ּ� �޿� ���ϱ�     
    select deptno, max(sal), min(sal) from emp group by deptno;
    
    select deptno, sal from emp order by deptno,sal desc;
--���� �ΰ��� ��ģ �׷�� ����
    select deptno, max(sal), min(sal) from emp group by deptno order by deptno;

--�ְ� �޿�(���) ����ϱ�
    select max(avg(sal)) from emp group by deptno;
    
--having ��    
--select�������� ������ ����Ͽ� ����� ������ �� where�� ���������
--�׷��� ����� ������ ���� having ���� ����Ѵ�.

--�μ��� �޿� ����� 500�̻��� �μ��� ��ȣ�� �޿� ��� ���ϱ�
    select deptno, avg(sal) from emp group by deptno having avg(sal)>=500;
    
--���� ������ �˾ƺ��� �ùٸ��� ���غ���  ?????
    select deptno, ename, avg(sal) from emp group by deptno;
    --�������� : ����� group by ��ϰ� ��ġ���� �ʾ� ���� �߻�
    select deptno, ename, avg(sal) from emp group by deptno, ename;
   
--having���� ����Ͽ� ����� �����ϰ� �޿� �Ѿ��� 1000�̻��� ���޺� ���ڸ� ���ϰ� �޿� �Ѿ� ���ϱ� (sal������ ����)
    select job, count(*), sum(sal) from emp where job != '���' group by job having sum(sal) >= 1000 order by sum(sal);
    select job, count(*), sum(sal) from emp group by job having job != '���' and sum(sal) >= 1000 order by sum(sal);   
   
--�޿� �ְ��, ������, �Ѿ�, ��� ����ϱ� (round���)    
    select max(sal) �ְ��, min(sal) ������, sum(sal) �Ѿ�, round(avg(sal)) ��� from emp group by deptno;
    
--���޺� ������� ����ϱ�    
    select job, count(job) from emp group by job;
    
--������ ���� ��ȸ�� ����    
    select job, count(job) from emp group by job having job = '����';
    
--�޿� �ְ��, �޿� �������� ���� ����ϱ�
    select max(sal)-min(sal) ���� from emp;
    
--�μ��� ����� ��� �޿��� �ݿø��ϱ� ( �μ��׷� ���İ�, �μ���ȣ�� ������������ ���� )   
    select deptno �μ���ȣ, count(*) �����, round(avg(sal)) ��ձ޿� from emp group by deptno order by deptno asc;
    
--�μ���ȣ, �̸�, ������, �μ����� ��� ����� ��� �޿� ��� (decode ���)
    select deptno, decode(deptno, 10, '�渮��'
                                , 20, '�λ��'
                                , 30, '������'
                                , 40, '�����') DNAME,
                   decode(deptno, 10, '����'
                                , 20, '��õ'
                                , 30, '���'
                                , 40, '����') LOCATION,
           count(*) as "Number of People", round(avg(sal)) sal                
    from emp group by deptno;
    
    
--������ ��ųʸ� ????
--������ ��ųʸ��� ����ڰ� ���̺��� �����ϰų� ����ڸ� �����ϴ� ���� �۾��� �� ��
--������ ���̽� ������ ���� �ڵ����� ���ŵǴ� ���̺��̴�.
--����ڴ� ������ ��ųʸ��� ������ ���� �����ϰų� ������ �� ����
--����ڰ� ������ �� �ִ� �����͸� ������ �� �� �ֵ��� �ϱ� ���ؼ� �б� ���� �� ���·� ������ �����Ѵ�.
--��� ������ ��ƼƼ, �Ӽ��� �̸��� �ǹ̸� ������ ���� ������ �ǹ��Ѵ�.

--USER_ : �ڽ��� ������ ������ ��ü � ���� ���� ��ȸ
--ALL_ : �ڽ� ���� ���� �Ǵ� ������ �ο����� ��ü � ���� ���� ��ȸ
--DBA_ : ������ ���̽� �����ڸ� ���� ������ ��ü ���� ���� ����

--ALL_
    select owner, table_name from all_tables;
--DBA_ : dba�� �ý��� ������ ���� ����ڸ� ���ٰ���, ������ ������ ���� �߻�
    select owner, table_name from dba_tables;
    
--������ ���̽� �����ڸ� ���� ����, ���ѿ� ���� ������ ���� ��ųʸ�
    select * from dba_sys_privs;
    
--���̺� ����� <<������Ʈ �߰� �����Դϴ�>>
--���̺� ������� ���� ���̺� ���� ���� �ڼ��� ����ȭ ������ �ȴ�.
--�𵨸� ������ ���̺� ���� ������ ����Ǿ� ������ ���̺� �ϳ��ϳ��� ���� ��µ� ������ �ʿ��ϴ�.

--��ǥ���� �ý��� ����
--create session : �����ͺ��̽��� ������ �� �ִ� ����
--create table : ���̺��� ������ �� �ִ� ����
--create any table : �ٸ� user�� �̸����� ���̺��� ������ �� �ִ� ����
--create tablespace : ���̺� �����̽��� ���� �� �ִ� ����
--unlimited tablespace : ��뷮�� ���������� ����ϴ� ����
--select any table : ��� ���̺�, ��� �˻��� �� �� �ִ� ����
--create user : ���ο� ����ڸ� ����
--create view : ����� ��Ű������ �並 ������ �� �ִ� ����
--create sequence : ����� ��Ű������ �������� ������ �� �ִ� ����
--create procedure : ����� ��Ű������ �Լ��� ������ �� �ִ� ����
--drop user : ����ڸ� �����ϴ� ����
--drop any table : ������ ���̺��� ������ �� �ִ� ����
--
--���� �ο� ��� grant
--���� ȸ�� ��� revoke

--role ����
--  create role ���̸�:
--role ���� �ο�
--  grant ���� to ���̸�
--������ �ο��� ���� �������� �ο�
--  grant ���̸� to ����1, ����2,...;

--connect �� : ����ڰ� �����ϱ� ���Ͽ� ���� �⺻���� ���� 8������ ���� ����
--resource �� : ����ڰ� ��ü(���̺�, ��, �ε���)�� ������ �� �ֵ��� �ý��� ������ ���� ����
--dba �� : �ý��� ������ �ʿ��� ��� ������ �ο��� �� �ִ� ���� ������ ����

--DDL(Data Definition Language) : create ��, drop ��, alter ��
--���̺� ������ ����� create table ��
--create table ���̺��̸�( ���̸� �������� [default ǥ����], [���̸� ��������...]);

--���׷��� Ÿ���̶�
--���� �𵨿� �ǹ�(�Ǵ� �з�)�� �ο��ϰ� ���� �� ���
--<< �� >> ���̿� ���׷����� ����
--Ŭ������ �Ӹ� �ƴ϶� ��� ��ҿ� ���밡��
--uml������ ���׷��� Ÿ���� �̹� ���ǵǾ� ����
--�����ڰ� ���Ƿ� ������ ���� ����


--��������� �����ϱ� ���� ���̺� �����ϱ�
    drop table emp01;
    
    create table emp01(
        eno number(4),
        ename varchar2(14),
        sal number(7,3)
    );
    
    desc emp01;
    select * from emp01;
    
--������̺� ��¥ Ÿ���� ������ birth Į�� �߰��ϱ�    
    alter table emp01 add(birth date);
    desc emp01;
    select * from emp01;
    
--����̸� Į�� ũ�� 30���� �����ϱ�
    alter table emp01 modify ename varchar2(30);
    desc emp01;
    
--������̺��� �̸� �÷� �����ϱ�    
    alter table emp01 drop column ename;
    desc emp01;
    
--�ý����� �䱸�� ���� �� Į���� ������ �� �ֵ��� �ϳ� �̻��� Į���� unused�� ǥ��
--�����δ� ���̺��� �ش� Į���� ���ŵ����� ����
    alter table emp01 set unused(eno);    
    desc emp01;
    
--���̺��� unused�� ǥ�õ� ��� Į���� �����ϱ�
    alter table emp01 drop unused columns;
    desc emp01;
    
--���̺� ���� �����ϴ� rename��
--rename �����̸� to �ٲ��̸�
    rename emp01 to emp02;
    desc emp02;
    desc emp01;
    
    drop table emp02;
    desc emp02;
    
--rownum    
--���� �Լ��� �ƴ����� ���� ���Ǵ� ������
--����Ŭ���� ���������� �����Ǵ� ���� Į������ sql��ȸ ����� ������ ��Ÿ��
--�ڷḦ �̺κи� Ȯ���Ͽ� ó���Ҷ� ������
    select rownum "����", empno, ename, sal from emp where rownum<=3;
    
--insert�� : ������ ����
--insert into ���̺��̸�[(�Ӽ� ����Ʈ)] values(�Ӽ���_����Ʈ);
--into Ű����� �Բ� ������ ������ ���̺��� �̸��� �Ӽ��� �̸��� ����
--�Ӽ� ����Ʈ�� �����ϸ� ���̺��� ������ �� ������ �Ӽ��� ������� ���� ���ӵ�
--values Ű����� �Բ� ������ �Ӽ� ������ ����
--into ���� �Ӽ� �̸��� values ���� �Ӽ� ���� ������� �ϴ��� �����Ǿ����
    select * from dept01;
    drop table dept01;
    
    create table dept01(
        deptno number(02),
        dname varchar2(14),
        loc varchar2(13)
    );
    desc dept01;
    
    insert into dept01 values(10, '�渮��', '����');
    select * from dept01;
    
    insert into dept01 (deptno, loc, dname) values(20, '��õ', '�λ��');
    select * from dept01;

    insert into dept01 values(40, '�����', null);
    select * from dept01;

    insert into dept01 values(50, '��ȹ��', '');
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
    
    insert into emp02 values(1001, '����', '���', '2015/03/01', 20);
    select * from emp02;

    insert into emp02 values(1002, '�ѿ���', '�븮', to_date('2014,05,01','yyyy,mm,dd'), 20);
    select * from emp02;

    insert into emp02 values(1003, '����ȣ', '����', sysdate, 30);
    select * from emp02;
    
    desc emp02;
    

--���̺� ������ �����ϴ� update��
--update ���̺��̸� set �Ӽ��̸�1=��1, �Ӽ��̸�2=��2,... where �˻�����;

--dept01 ���̺��� 10�� �μ��� �μ����� ����η� ������Ʈ �ϱ�
    update dept01 set dname='�����'where deptno=10;
    select * from dept01;
--dept01 ���̺��� 20�� �μ��� �μ����� �����2, ��ġ�� �λ����� ������Ʈ �ϱ�
    update dept01 set dname='�����2',loc='�λ�' where deptno=20;
    select * from dept01;
    
    commit;
    
--��� dname�� �����3�� ������Ʈ�ϱ�
    update dept01 set dname='�����3';
    select * from dept01;

--������Ʈ �ϱ� ������ �ǵ�����
    rollback;
    select * from dept01;
    commit;

--delete��
--���̺� �ִ� ���� Ʃ���� �����ϴ� ���
--delete from ���̺�� where �˻�����;
--where���� �����ϸ� ������� ������
--10�� �μ��� Ư�� �ο츸 �����ϱ�
    delete dept01 where deptno=10;
    select * from dept01;
    
    rollback;
    commit;

    delete emp02 where deptno=20;    
    select * from emp02;

    rollback;
    commit;
    
    
--���̺� ����
    drop table employee03;
    
    create table employee03(
        empno number(4),
        ename varchar2(20),
        job varchar2(20),
        sal number(7,3)
    );
    desc employee03;
    
    insert into employee03 values(1000, '�ѿ��', '�·�', 100);
    insert into employee03 values(1010, '����', '�ܰ�', 150);
    insert into employee03 values(1020, '�ֽð�', '��������', 250);
    insert into employee03 values(1030, '���', null, 250);
    insert into employee03 values(1040, '��������', '', 200);
    select * from employee03;
    
    commit;
    
--�޿��� 200�� �ȵǴ� ������� 50�� �λ��ϱ�
    update employee03 set sal=sal+50 where sal<200;
    select * from employee03;

    rollback;
    
--���̺� ������ null�� ����� ��������� �����ϱ�
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

--employees2�� �����ϰ� ���̺� �����ϱ�    
    create table employees3 as select *from employees2;
    desc employees3;

--purge recyclebin;
--������ ���̺��� ����, �������� ����.
--���� ��ɾ� ���̺� ���� ������ �����.
    purge recyclebin;
    
--false ������ �������    
    drop table dept02;
    create table dept02 as select * from dept where 1=0;
--true ������ ������ �����Ѵ�    
    drop table dept02;
    create table dept02 as select * from dept where 1=1;
    
    desc dept02;
    select * from dept02;
    
--employees2�� manager_id �߰�        
    desc employees2;
    alter table employees2 add (
        manager_id varchar2(10)
    );
    desc employees2;
    
--���̺� ������ �Ŵ��� ���̵� �ʵ� �׸��� ����        
    desc employees2;
    alter table employees2 modify (
        manager_id varchar2(20)
    );
    desc employees2;

--Į���� ����
    desc employees2;
    alter table employees2 drop column manager_id;
    desc employees2;
    
--������ ������
--char, varchar, nchar �����ڵ� �������� ������������.
--nvarchar �����ڵ� �������� ������ ������, long(2GB) ��������


----------------------------------------09/07--------------------------------------

--�������� ���Ἲ ��������(Data Integrity Constraint Rule)�̶�
--���̺� �������� �ڷᰡ �ԷµǴ� ���� �����ϱ� ���ؼ� ���̺��� ������ ��
--�� Į���� ���ؼ� �����ϴ� �������� ��Ģ�� ���Ѵ�.

--���Ἲ ���������� ����
--not null : null�� ������� �ʴ´�.
--unique : �׻� ������ ���� ������ �ߺ��� ���� ������� �ʴ´�.
--primary key : null�� ������� �ʰ�, �ߺ��� ���� ������� �ʴ´�.
--              not null�� unique ������ ������ ����
--foreign key : �����Ǵ� ���̺��� Į���� ���� �����ϸ� ����Ѵ�.
--check : ���� ������ ������ ���� ������ ������ �����Ͽ�, ������ ���� ����Ѵ�.

--�������� Ȯ���ϱ�
--����Ŭ�� user_constraints ������ ��ųʸ��� �������ǿ� ���� �������� �˷��ش�.
--user_constraints ������ ��ųʸ��� ��ȸ�ϸ� �������� ���������� �������� ��ȸ�� �� �ִ�.

--�ش� ������ ������ �������� ��ȸ    
    desc user_constraints;
    select * from user_constraints;
    
--Ư�� Į���� ��ȸ
    select owner, constraint_name, constraint_type, table_name, search_condition, r_constraint_name from user_constraints;
    --user_constraints : ������ ��ųʸ��� ���� ���Ǵ� Į��
    --owner : ���������� ������ ����
    --constraint_name : �������� ��
    --constraint_type : �������� ����
    --table_name : ���������� ���� ���̺��
    --search_condition : check ������ ��쿡�� � ������ �������� ���Ǿ����� ����
    --r_constraint_name : foreign key�� ��� primary key�� ���� �ߴ����� ���� ����

--constraint_type�� �������� ������ �����ϴ� Į��
    select constraint_name, constraint_type, table_name from user_constraints; 
    --p : primary key
    --r : foreign key
    --u : unique
    --c : check, not null
    
--in �����ڸ� ����Ͽ� �ΰ��� ���̺� ���� ���� ������� �������� ��ȸ�ϱ�
    select * from user_constraints where table_name in ('EMP', 'DEPT');

--�⺻���� ���Ἲ ����
--�ǹ� : ������ ������ �𵨿��� ������ ���Ἲ ����
--�⺻Ű ���Ἲ ����, ���� ���Ἲ ����

--���̺��� ���Ἲ ����
--�ǹ� : ���̺��� �����ϰų� ���� �������� ���� ������ ���Ἲ ����
--not null, unique, check, default

--��Ÿ ���Ἲ ����
--���� �ش� �ȵǴ� �����
--����, Ʈ����

--�⺻Ű ���Ἲ ����
--���̺��� ���ڵ���� �ݵ�� �����ϰ� �ĺ��� �� �־�� �Ѵٴ� ����
--���� : �⺻Ű ���Ἲ ����
--�⺻Ű�� null���� ���� �� ������, 
--�⺻Ű�� ���� ������ ���ڵ尡 �ϳ��� ���̺� ���ÿ� �ΰ� �̻� ������ �� ����.

--���� ���� ����
--(1) �������� ��� ��Ģ (constraint name)
--    [���̺��]_[Į����]_[������������]
--(2) Į�� ���� �������� ����
--    [column_name] [data_type] constraint [constraint_name] [constraint_type]

--�������� �߰��ϱ�
--alter table ���̺�� add constraint ����� �������� (Į����);
--�������� �����ϱ�
--alter table ���̺�� modify constraint ����� �������� (Į����);
--�������� �����ϱ�
--alter table ���̺�� drop constraint ��������; 


-- ���������� ���� �� 
    drop table emp01;       
    create table emp01(
        empno number(4),
        ename varchar2(10),
        job varchar2(9),
        deptno number(2) );
    desc emp01;    
    insert into emp01 values(null, null, '���', 30);
    select * from emp01;
    
    -- Ư�� Į���� ��ȸ    
    select owner, constraint_name, constraint_type, table_name, search_condition, r_constraint_name
    --���̺� �̸����� ������ ��ȸ
    from user_constraints where table_name = 'EMP01';
    --���̺� ������ �ƹ��� ���������� ���� �ʾ����Ƿ� ��ȸ ����� ����.


--not null
--Ư�� �ʵ忡 ���ؼ� null ���� �Է��� ������� �ʴ´�
--�⺻Ű�� ���ǵ� �ʵ忡 ���ؼ��� ��������� not null ������ �������� �ʾƵ� �ȴ�
--���� : Į���� �ڷ��� not null;
--Į�� �����θ� ������ �� �ִ�.   
    drop table emp01;
    create table emp01(
        empno number(4) not null,
        ename varchar2(10) not null,
        job varchar2(9),
        deptno number(2) );
    desc emp01;   
    
    select owner, constraint_name, constraint_type, table_name, search_condition, r_constraint_name
    from user_constraints where table_name = 'EMP01';
    
    insert into emp01 values(null, null, '���', 30);
    --ORA-01400: cannot insert NULL into ("TESTER1"."EMP01"."EMPNO") ���� �߻�
    --������ ù ��° Į���� �ι�° Į���� not null���������� �ֱ⶧���� null���� ������ �� ����.
    insert into emp01 values(1000, '����', '���', 30);
    commit;
    select * from emp01;
    
    insert into emp01 values(1000, 'ȫ�浿', '����', 20);
    --ù��° Į���� not null �������������� �ߺ��� ���� ��� �ǹǷ� ���� ���Եȴ�.
    select * from emp01;
    

--unique
--Ư�� Į���� ���� �ڷᰡ �ߺ����� �ʵ���, ������ ���� ����ϴ� ��������
--null���� ����
--null���� �Էµ��� �ʵ��� ���� �Ϸ���, not null �������ǵ� ����ϸ� �ȴ�.
--constraint ����� unique (�ʵ� ����Ʈ)
    drop table emp03;
    create table emp03(
        empno number(4) unique,
        ename varchar2(10) not null,
        job varchar2(9),
        deptno number(2) );
    desc emp03;  
    
    insert into emp03 values(1000, '����', '���', 30);
    select * from emp03;
    
    insert into emp03 values(1000, 'ȫ�浿', '����', 30);
    --ORA-00001: unique constraint (TESTER1.SYS_C007026) violated �����߻�
    --ù��° Į���� ���� unique ���������� �ֱ� ������ �ߺ��� ���� ������� �ʴ´�.

    insert into emp03 values(null, '���߱�', '�븮', 20);
    insert into emp03 values(null, '�̼���', '����', 20);
    --ù��° Į���� �ߺ��� ���� ������� ������ null�� ���ȴ�.
    
    
    drop table emp04;
    create table emp04(
        empno number(4) constraint emp04_empno_uk unique,
        ename varchar2(10) constraint emp04_ename_nn not null,
        job varchar2(9),
        deptno number(2) );
    desc emp04;      
    
    -- emp04 ���̺��� ���������� ���캸��
    select constraint_name, constraint_type, table_name
    from user_constraints where table_name = 'emp04';
    --�� �ȳ������� ���� : table_name�� emp04�� �ҹ��ڷ� ��� �ȳ��´�.
    
    insert into emp04 values(1000, '����', '���', 30);
    insert into emp04 values(1000, 'ȫ�浿', '����', 20);
    --ORA-00001: unique constraint (TESTER1.EMP04_EMPNO_UK) violated ���� �߻�
    --ù��° Į���� unique ���������� �ֱ� ������ 1000�� �Էµ� �� ����.
 
 
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
    
    insert into emp05 values(1000, '����', '���', 30);
    select * from emp05;
    
    insert into emp05 values(1000, 'ȫ�浿', '����', 20);
    --ORA-00001: unique constraint (TESTER1.EMP05_EMPNO_PK) violated �����߻�
    --ù��° Į���� primary key�� not null�� unique�� ������ �����̹Ƿ� �ߺ��� ���� �Էµ� �� ����.
    
    insert into emp05 values(NULL, '�̼���', '����', 30);
    --ORA-01400: cannot insert NULL into ("TESTER1"."EMP05"."EMPNO") �����߻�   
    --ù��° Į���� primary key�� not null�� unique�� ������ �����̹Ƿ� null ���� �Էµ� �� ����.
    

--���� ���Ἲ�� ���� �������� foreign key
--�ڽ� ���̺��� ��� ���̺�(emp)�� �μ���ȣ(deptno)Į���� 
--�θ����̺��� �μ����̺�(dept)�� �μ���ȣ(deptno)�� �θ�Ű�� �����ϴ� ���̴�.
--�� ���̺��� ���ڵ尡 �ٸ� ���̺��� �����Ͽ�, 
--�����Ǵ� ���̺� �ش� ���ڵ尡 �ݵ�� �����ϰų� null���� ������.
--�� ������ �������� �ʴ´ٸ� �����ϴ� ���ڵ�� ������ �������� �ʴ� ���ڵ带 �����ϰ� �Ǵ� ������ �߻��Ѵ�.
--���� �������� �ʴ� �߸��� ���� ������� �ʵ��� �����ϴ� �����̴�.
--���� : constraint ����� foreign key (�ʵ帮��Ʈ1) references ���̺�� (�ʵ帮��Ʈ2)
--�ʵ帮��Ʈ1 : �ܷ�Ű�� �����ϴ� �ʵ���� ����Ʈ
--���̺�� : ���� ����� ���̺��� �̸�
--�ʵ帮��Ʈ2 : ���� ��� ���̺��� �⺻Ű
--constraint emp_empno_fk foreign key (deptno) references dept (deptno)

--alter table���� ����Ͽ� �ܷ�Ű�� ������ ����
--ex) alter table student
--    add constraint fk_dept foreign key (dept_id) references department (dept_id)
--    �л����̺��� �μ����̺��� �μ����̵� �����ϴ� �ܷ�Ű�� fk_dept�� �߰��Ѵ�
--�ܷ�Ű ����
--ex) alter table student drop constraint fk_dept;
--    �л����̺��� fk_dept ���� ������ ���ش�.

--���̺� �̸����� �������� ���캸��
    select constraint_name, constraint_type, table_name
    from user_constraints where table_name = 'EMP01';
    --SYS_C007029	C	EMP01 C�� not null�� �ɷ��ִ�.
--���������� ������ Į�� ���캸��
    select constraint_name, table_name, column_name
    from user_cons_columns where table_name = 'EMP01';
    
--alter�� ����Ͽ� emp01_empno_fk ���������� �߰��ϱ�    
    alter table emp01
    add constraint emp01_empno_fk foreign key (deptno)
    references dept (deptno);
--�߰��� emp01_empno_fk ���������� �����ϱ�    
    alter table emp01
    drop constraint emp01_empno_fk;
    
    
--���̺� �̸����� �������� ���캸��
    select constraint_name, constraint_type, table_name
    from user_constraints where table_name = 'EMP';
--���������� ������ Į�� ���캸��    
    select constraint_name, table_name, column_name
    from user_cons_columns where table_name = 'EMP';
    
    insert into dept(deptno, dname, loc) values (50,'��ȹ��', 'LA');
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
    
--���̺� �̸����� �������� ���캸��
    select constraint_name, constraint_type, table_name
    from user_constraints where table_name = 'EMP06';
--���������� ������ Į�� ���캸��    
    select constraint_name, table_name, column_name
    from user_cons_columns where table_name = 'EMP06';
    
    insert into emp06 values(1010, 'ȫ�浿', '���', 50);
    --���⼭ �˼� �ִ� �������� ���� ��� ��Ģ�̴�
    --dept(deptno) 50�� �μ� ��ȹ�ΰ� ���� ���� ������ �ɸ����̴�.
    --emp06 ���̺��� 1010 ȫ�浿 ��� 50 <== deptno
    --references dept(deptno) dept ���̺��� 50�� �μ� ��ȹ�� LA
    insert into emp06 values(1011, '�̼ҷ�', '����', 60);
    --ORA-02291: integrity constraint (TESTER1.EMP06_DEPTNO_FK) violated - parent key not found
    --�θ�Ű�� ������ dept ���̺��� deptno�� 60�� �μ��� �������� �ʾ� ������ �߻��Ѵ�.
    select * from user_constraints where table_name = 'EMP06';
    select * from emp06;


--check ��������
--�ԷµǴ� ���� üũ�Ͽ� ������ �� �̿��� ���� ������
--���� �޽����� �Բ� ����� ������� ���ϰ� �Ѵ�
--�������� �������� ���� ������ Ư�� ������ ���ڳ� ���� ���� ������ �� �ִ�.
--���� : constraint ����� check (���ǽ�)
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

    insert into emp07 values(1000, '����', 500, 'M');
    select * from emp07;
    
    insert into emp07 values(1000, '����', 200, 'A');
    --ORA-02290: check constraint (TESTER1.EMP07_GENDER_CK) violated
    --����° Į���� �׹�° Į���� ���������� check�̱� ������
    --�ش� check���ǿ� ���� �ʾ� ������ ������ ���� �ʴ´�
    --sal�� check������ 500�̻� 5000������ ������
    --gender�� check ������ 'M'�Ǵ� 'F'�� ������
    --empno�� pk�� �������ǿ� �ɸ����Ѵ�.
    

--default ��������
--�ƹ��� ���� �Է����� �ʾ��� �� null�� ��� ������ ���� �Է��� �ǵ��� �Ѵ�.

    drop table dept01;
    create table dept01(
        deptno number(2) primary key,
        dname varchar2(14),
        loc varchar2(13) default '����'
    );
    desc dept01;
    
    select constraint_name, constraint_type, r_constraint_name, table_name
    from user_constraints where table_name = 'DEPT01';
    select constraint_name, table_name, column_name
    from user_cons_columns where table_name = 'DEPT01';
    
--����Ʈ�� ������ ������ �� �ִ�.
--alter table student 
--alter column year set default 1;
--����Ʈ�� ������ ���� �ִ�.
--alter table student 
--alter column year drop default;

--����Ŭ�� default�� ���� ������ ���� �� ������ sql�� ǥ���� ������ �ʴ´�
--alter table student modify (year int default 1);
--alter table student modify (year int default null);

    insert into dept01(deptno, dname) values(10, '�渮��');
    select * from dept01;
    
    
    
    select * from emp01;
    drop table emp01;
    
    create table emp01(
        empno number(4) primary key,
        ename varchar2(10) not null,
        job varchar2(9) unique,
        deptno number(2) references dept(deptno)
            --foreign key ���������� �����Ѵ�. dept���̺��� deptnoĮ���� emp01���̺��� deptnoĮ���� �����Ѵ�.
    );
    desc emp01;
    select * from user_constraints where table_name = 'EMP01';
   
    

--���̺��� ������� �������� �����ϱ�
--���̺� ������ �������� ������ Į���� ��� �����ϰ� ����
--���̺� ���Ǹ� ������ ���� ���� ���� ������ Į���鿡 ���� ���������� �Ѳ����� �����ϴ� ���̴�.
--����Ű�� �⺻Ű�� ������ ��� Į�� ������ �ȵǰ� �ݵ�� ���̺� ���� ������� ������ �ۼ��ؾ߸� �Ѵ�.
--������ �ΰ� �̻��� Į���� �ϳ��� �⺻Ű�� �����Ҷ� �ۼ��ϴ°��̶�� ����ȴ�.
    drop table emp02;
    
    create table emp02(
        empno number(4),
        ename varchar2(10) not null,
        job varchar2(9),
        deptno number(2),
        unique(job),
        foreign key(deptno) references dept(deptno)
        --Į���� �����ϰ� �� �� �ٽ� ���������� ������ ����
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
        --���̺� ���� ������� �������� �����ϱ�
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
    --���������� ������ Į�� ���캸�� (����Ű���� ���캸����)        
    select constraint_name, table_name, column_name
    from user_cons_columns where table_name in('MEMBER01');   
    
    
----------------------------------------09/08--------------------------------------    
    
----���������� ����, ���� �� �� ������� �빮�ڷ� �Է��ؾ��Ѵ�
    drop table emp01;       
    create table emp01(
        empno number(4) unique,
        ename varchar2(10),
        job varchar2(9),
        deptno number(2) 
    );

--�������� �����ϱ�
--alter table ���̺�� modify constraint �������Ǹ� ��������(Į����);
    alter table emp01 modify empno constraint EMP01_EMPNO_NN not null;
    select * from user_constraints where table_name in('EMP01');

--�������� �����ϱ�
--alter table ���̺�� drop constraint �������Ǹ�;
    alter table emp01 drop constraint EMP01_EMPNO_NN;
    select * from user_constraints where table_name in('EMP01');
 
--�������� �߰��ϱ�
--alter table ���̺�� add constraint �������Ǹ� ��������(Į����);
    alter table emp01 add constraint EMP01_DEPTNO_FK 
    foreign key(deptno) references dept01(deptno) on delete cascade;
    select * from user_constraints where table_name in('EMP01');    
    
----�˾Ƶθ� ������ ��
--���ӵ� ��� ���������� �����ϱ�
    select * from user_constraints where table_name in('EMP01');
--���������� �ɷ��ִ� Į������ Ȯ���ϱ�
    select * from user_cons_columns where table_name = 'EMP01';   
    
    

--FK�� �����͸� ������ �� �߻��ϴ� ���� �˾ƺ���
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
    
    insert into dept01(deptno, dname) values(10, '�渮��');
    insert into emp01 values(1000,'����','���',10);
    
    select * from emp01;
    select * from dept01;

    delete from dept01 where deptno=10;
    --ORA-02292: integrity constraint (TESTER1.EMP01_DEPTNO_FK) violated - child record found �����߻�
    --why? �ڽ� Ű�� emp01 ���̺��� deptno Į������ 10�̶�� �μ��� ���� ������̶� ������ �� ������ �߻��Ѵ�.
    commit;
    
--�ذ���1. �������� Į���� emp01�� deptno�� �����͸� ���� �����Ѵ�.      
    delete from emp01 where deptno=10;
    delete from dept01 where deptno=10;
    rollback;
  
--�ذ���2. emp01���̺��� ������ �� deptno Į���� �������� ������ cascade�ɼ��� �ο��Ѵ�.
    drop table emp01;       
    create table emp01(
        empno number(4),
        ename varchar2(10) constraint emp01_ename_nn not null,
        job varchar2(9),
        deptno number(2), 
        constraint emp01_empno_pk primary key(empno),
        constraint emp01_job_uk unique(job),
        constraint emp01_deptno_fk foreign key(deptno) references dept01(deptno) on delete cascade
        --cascade �ɼ��� ������ �θ����̺��� Į������ ������ �� ���� �����Ѵ�
    );
    insert into emp01 values(1000,'����','���',10);
    delete from dept01 where deptno=10;
    commit;
    
    
--join�̶�?
--�� �̻��� ���̺��� �����Ͽ� �����͸� �˻��ϴ� ���

--join �����̶�?
--���� ���̺��� Ư�� �� ����
--where�� �ȿ� �� ���̺��� ����Ǵ� Į�� ��
--�� �̻��� ���̺��� �����Ͽ� ��� ���� ����
--�⺻ Ű �� �ܷ� Ű�� ���� �������� ���
--���̺��� �����Ϸ��� ������ ���̺��� ���������� ����ϴ� �� ���
    
--������ �ʿ伺
--������ �����ͺ��̽������� ���̺��� ���谡 �߿��ϱ� ������ 
--�ϳ� �̻��� ���̺��� ����� �����Ͽ� ���ȴ�.
--�Ѱ� �̻��� ���̺��� �����͸� ��ȸ�ϱ� ���ؼ� ���Ǵ� ���� �����̴�.
--Ư�� �μ� ��ȣ�� ���� �μ��̸��� ���������� �μ� ���̺�(dept)�� �ִ�
--Ư�� ����� ���� �μ����� �˾Ƴ��� ���ؼ��� �μ� ���̺��� ������ ��� �;� �Ѵ�.
--sql���� �ΰ� �̻��� ���̺��� �����ؾ߸� ���ϴ� ����� ������ ���� ��
--�ѹ��� ���Ƿ� ���ϴ� ����� ���� �� �ִ� ���� ����� �����Ѵ�.

--cross join
--Ư���� Ű���� ���� select ���� from���� �ΰ��� ���̺��� �޸��� �����ؼ� ��ȸ�ϴ� ����̴�.
    select ename, deptno from emp order by deptno;
    select deptno, dname from dept;
--������̺�� �μ����̺�� ũ�ν� �����ϱ�
    select * from emp,dept;
    
--table join
--join ����
--���� ��� ������ ����
--equi join : ���� Į���� �������� ����
--non-equi join :  ���� Į���� ���� �ٸ� ������ ����Ͽ� ����
--self join : �� ���̺����� ����
--outer join : ���� ���ǿ� �������� �ʴ� �൵ ��Ÿ��


--���� ���̺��� ����
--���̺� ����(alias) ���
--ī��� ��
--���̺� �̸��� ��Ī���
--���̺� ����(alias) - ���̺� alias�� column�� �ܼ� ��Ȯ�� �� �� ����
--    ������ select���ڿ� ���ؼ��� ��ȿ��
--    ���̺� alias�� ���̰� 30�ڱ��� �����ϳ� ª������ ���� ����
--    ���̺� alias�� �ǹ̰� �־����
--    from ���� ���̺� alias ���� �� �ش� ���̺�
--    alias�� select ���忡�� ���̺� �̸� ��ſ� ����ؾ� ��
    
    
--equl join
--equl join�� ���� ���� ����ϴ� ���� ������μ�
--���� ����� �Ǵ� �� ���̺��� �������� �����ϴ� Į���� ���� ��ġ�Ǵ�
--���� �����Ͽ� ����� �����ϴ� ���� ����̴�.
--���� ��� ���̺��� ���� Į���� '='(equl) �񱳸� ����
--���� ���� ������ ���� ����
--���� : select table1.column, table2.column from table1, table2 where table1.column1 = table2.column2;

    select * from emp,dept where emp.deptno= dept.deptno;

--�̹����� ����� �������� ����ϴ� �̸��� �Ҽ� �μ��� ����ϱ�
--emp���̺��� ����ϸ� emp.ename, dept.dname, emp.deptno
--equl join �������
    select emp.ename, dept.dname, emp.deptno
    from emp, dept
    where emp.deptno = dept.deptno and ename = '�̹���';
    
--Į�� �տ� ���̺��� ����ϱ� --> Į���� ��ȣ�� �ذ��� ���
--���̺� ��Ī �ο��ϱ�
--from emp e, dept d
--���̺�� ��Ī ���̺�� ��Ī
--������̺��� ��Ī���� e�� �μ����̺��� ��Ī���� d�� �ο�
--�ݵ�� ��Ī�� �ο��ؾ���
    select e.ename, d.dname, e.deptno
    from emp e, dept d
    where e.deptno = d.deptno and e.ename = '�̹���';
    
    select * from salgrade;    
    select ename, sal, grade
    from emp, salgrade
    where sal between losal and hisal
    order by grade;
    
--as��� �μ��� �߰��ؼ� �����ϱ�
    select e.ename, d.dname, e.sal, s.grade
    from emp e, dept d, salgrade s
    where e.deptno = d.deptno and e.sal between s.losal and s.hisal
    order by grade;
    
    
--non-equl join
--���� ���ǿ� Ư�� ���� ���� �ִ����� �����ϱ� ����
--where���� ���� ������ = ������ �̿��� �� �����ڸ� ����Ѵ�.
    select ename, sal, grade from emp, salgrade 
    where sal >= losal and sal <= hisal;


--��������
--������ �� �� �̻��� ���� �ٸ� ���̺��� ���� �����ϴ� �� �Ӹ� �ƴ϶�
--�ϳ��� ���̺� ������ ������ �ؾ߸� ���ϴ� �ڷḦ ��� ��찡 �����.
--self join�̶� �� �״�� �ڱ� �ڽŰ� ������ �δ°��� ���Ѵ�.

--Ư�� ����� �Ŵ����� �������� �˾Ƴ��� as "����̸�" "���ӻ���̸�"
--Ư�� ����� �Ŵ����� ������ mgr Į���� ���
    select employee.ename as "����̸�", manager.ename as "���ӻ���̸�"
    from emp employee, emp manager
    where employee.mgr = manager.empno;    
    

--ANSI join
--sql developer �Ӹ� �ƴ϶� ��κ��� ��� ������ ���̽� �ý��ۿ��� 
--ǥ�ؾ��� ANSI(�̱� ǥ�� ������) SQL���� ������ ǥ�� ����� ��κ� �ؼ��ϰ� �ִ�.
--ANSIǥ�� SQL ���� ������ �� ���� ���ο� Ű����� ���� �����Ͽ�,
--SELECT ���� FROM ������ ������ �Ϻ��ϰ� ������ �� �ִ�.

--inner join ��������, outer join �ܺ�����
--inner join ���� : select * from table1 inner join table2 on table1.column1 = table2.column2;
--�Ʒ��� ������ inner join���� �ٲ㼭 �غ���    
    select ename, dname
    from emp,dept
    where emp.deptno = dept.deptno;
    
    select ename, dname
    from emp inner join dept
    on emp.deptno = dept.deptno;
    
--�Ʊ�� �̹��� �渮�� 10�� inner join���� �ٲ㺸��
    select ename, dname, dept.deptno
    from emp inner join dept
    on emp.deptno = dept.deptno and ename = '�̹���';
    
    
--ANSI outer join
--�ܺ� ���ο����� full���� �����Ͽ� left,right,full 3������ �����Ѵ�.
--�ܺ� ������ ���� : 
--������ �������̺� ���� ������ �����ϴ� ���� ���,
--�� ���̺� null���� �߰��ؼ� ��� ���̺� ���Խ�Ű�� �����̴�.
--�ܺ� ���� ������ : + �� ������ ������ ���̺� null���� �߰���Ű�� ���� �������̴�.
--�ܺ����� ���� : 
--selecet���� where ���� ���� ������ ����� �� ��� ���� �� �̸��� �ܺ����� �����ڸ� ����Ѵ�.
--���ǻ��� : 
--�ݵ�� ������ �� �� ���̺��� ���� �����ڸ� �����ؾ� �Ѵ�.
--�ܺ� ������ �� 1 : emp���̺� �� ���� �ְ��� �ܺ� ���� ��� �����
--�̸��� �μ���ȣ, �μ��̸��� �μ���ȣ�� ������������ ����ϵ�, ���� �ƹ��� �ٹ����� �ʴ� �ż��μ��� �μ���ȣ�� �μ��̸��� ����Ѵ�
--�ܺ� ������ �� 2 : dept ���̺� �� ���� �߰��� �ܺ� ���� ��� ����� �̸��� �μ���ȣ,
--�μ��̸��� �μ���ȣ�� ������������ ����ϵ�, ���� �μ��� �������� ���� ���Ի���� �̸��� ����Ѵ�.
--���� : select * from table1 [left | right | full] outer join table2

    select member.ename as "����̸�", manager.ename as "���ӻ���̸�"
    from emp member left outer join emp manager
    on member.mgr = manager.empno;
    --�ȼ����� ���ӻ���̸��� null�� ��Ÿ��
    
--join�� �ΰ� �̻��� ���̺���� ������ ����̴�
--inner join�� ���̺��� ���谡 ��ġ�ϴ� ������ ����̰�
--outer join�� ���̺��� ���谡 ��ġ�ϴ� �Ͱ� ��ġ���� �ʴ� �� �� �� ���� ���̺��� ����� ������.
--left outer join�� ���� ���̺��� �������� right outer join�� ������ ���̺��� ������
--inner join�� ������
--outer join�� ������ + �� ���� ������ or �ϳ��� ���̺� ��ü + ������

--join�� �Ϲ������� �������� ����� �ǹ�, on�� ���ο� ���� ����
--where�� ����� ���� ���� ����

    select member.ename as "����̸�", manager.ename as "���ӻ���̸�"
    from emp member right outer join emp manager
    on member.mgr = manager.empno;
    
    select member.ename as "����̸�", manager.ename as "���ӻ���̸�"
    from emp member full outer join emp manager
    on member.mgr = manager.empno;
   
   
   
   
--���������� ��������
--��������
--���� ����(���� select��, ��ø�� select��)�� �ǹ��Ѵ�
--������������ ����� ���� ��ȯ�Ѵ�.
--��������
--�ܺ� ���Ǹ� �ǹ��Ѵ�.
--���������� ��ȯ�� ���� �̿��ؼ� ���������� �ϼ��ȴ�.

--���������� ���� 
--where ���� ������ �ڿ�, ��ȣ �ȿ� ���������� ����Ѵ�.
--select ���ø���Ʈ1 from ���̺� �̸�1 where ǥ���� op (select ���ø���Ʈ2 from ���̺� �̸�2);
--���������� Ư¡
--���������� ���������� ����Ǳ� ���� �ѹ��� ����ȴ�
--���������� ���� ����� ���������� �ϼ��ϴµ� ���ȴ�
--���������� select ���� from�� where�� having������ ����� �� �ִ�.
--where�� having ���� �ϳ� �̻��� ���������� ���������� and�� or�ο����Ͽ� ����� �� �ִ�.
--�������� �ۼ� ��Ģ
--���������� �ۼ��� ���� �ݵ�� �Ʒ� �ۼ� ��Ģ�� ����� �Ѵ�.
--���������� ��ȣ�� ��� ����ؾ� �Ѵ�
--���������� �� �������� ������ ��ġ�ؾ� �Ѵ�.
--���������� ORDER BY ���� ������ �� ����. (TOP�����ڿ� �Բ� �������� ����� �� �ִ�.)
--���� �� ������������ ���� �� �� ������(>,=, >=, <, <=, <>)�� ��� �����ϴ�.
--���� �� ������������ ���� �� �� ������(IN, ANY, ALL)�� ��� �����ϴ�.
--SELECT ���� FROM��, WHERE��, HAVING �������� ����� �� �ִ�.
--5) ���������� SELECT ���� �ʴ� �÷��� �� �������� ����� �� ����
--�������� �ȿ� ���������� ���� �ִ� --�׽����̶� �ϸ�,�޸𸮰� ����ϸ� ������ ��ø�� �����ϴ�

--���������� ����
--���������� ũ�� ������ �������� ������ �� �ִ�.
--1) ���� �� �������� : ���� ���ǿ��� �� �ϳ��� �ุ ��ȯ
--2) ���� �� �������� : ���� ���ǿ��� �ϳ� �̻��� �� ��ȯ      
--                   �����࿬���ڸ� ����Ͽ� IN,ANY,SOME,ALL,EXIST �ݴ�� NOT EXISTS ��밡����
--3) ���� �� �������� : ���� ���ǿ��� �ϳ� �̻��� �� ��ȯ

--���� �� ���������� Ư¡
--���� ���ǿ��� �� �ϳ��� �ุ ��ȯ�Ѵ�.
--���� �� ���������� �����ϴ� ���ǹ������� ���� �� �� �����ڸ�(=,>,>=,<,<=,<>) ��� �����ϴ�.  
--���������� SELECT ������ �׷� �Լ��� ����� �� �ִ�.
--���� �� �� �����ڸ� ����Ѵ�
--���� ��(Single Row) ���� ������ ���� ����� ���� �ϳ��� �ο�(��, row)���� ��ȯ�ϴ� ���� ������ ���� ���� ���Ѵ�

--�̹����� �μ��� ���ϱ�
    select dname from dept
    where deptno = (select deptno from emp where ename = '�̹���');
--�̹����� �μ���ȣ ���ϱ�
    select deptno from emp where ename = '�̹���';
    --���������� ����� ���������� ������ �Ǵµ� ���������� �ޟ�
    
--���� �� ���������� Ư¡
--���� ���ǿ��� �ϳ� �̻��� ���� ��ȯ�Ѵ�.
--���� �� ���������� �����ϴ� ���ǹ������� ���� �� �� �����ڸ� ��� �����ϴ�.
--���������� select ������ �׷� �Լ��� ����� �� �ִ�.
--���� �� ���������� ������������ ��ȯ�Ǵ� ����� �ϳ� �̻��� ���� �� ����ϴ� ���������̴�.
--���� �� ���������� �ݵ�� ���� �� �����ڿ� �Բ� ����ؾ� �Ѵ�.

--���� �� �� ������
--in �������� �������� ���������� ��ȯ�� ����� � ���� ������ ���Ѵ�
--����� �ϳ��� ��ġ�ϸ� �� ��
--in �����ڴ� ���� ������ �� ���ǿ��� ���������� ��� ����� �ϳ��� ��ġ�ϸ�
--���������� where ���� ���� �ǵ��� �ϴ� ������ �̴�.
--any, some ���� ���� �������� ���������� ��ȯ�� ����� ������ ���� ���Ѵ�.
--����� �ϳ� �̻��� ��ġ�ϸ� �� ��
--all�������� �� ������ ���������� ��ȯ�� ����� ��� ���� ���Ѵ�.
--����� ��� ���� ��ġ�ϸ� �� ��
--exist �������� �������� ���������� ��ȯ�� ����� � ���� ������ ���Ѵ�
--����� ���� �ϳ��� �����ϸ� �� ��
    
    select round(avg(sal)) "��ձ޿�" from emp;
--��� �޿����� �� ���� �޿��� �޴� ��� ����ϱ�
    select ename, sal from emp
    where sal > (select avg(sal) from emp);
    
--�޿��� 500�� �ʰ��ϴ� ����� �Ҽӵ� �μ��� �μ���ȣ ���
    select distinct deptno from emp 
    where sal > 500;
    
--���� �� �� ��� 
--���� ���� ���ϴ� ����� pairwise�� non-pairwise ������� ���еȴ�.
--pairwise �� : 
--�ΰ� �̻��� ���� ���� �̷�� �񱳵Ǵ� ���� �ǹ��Ѵ�.
--�ϳ��� where���� ����� �� �̷� �� ����� ���� �� �ִ�.
--non-pairwise �� : 
--������ ���� ������ �񱳵Ǵ� ���� �ǹ��Ѵ�.
--�������� where ���� ����� �� �̷� �� ����� ���� �� �ִ�.

    
    
----------------------------------------09/13--------------------------------------    
--�޿��� 30���μ��� � ����� ����, ������ 20���μ��� � ����� ���� ������� �˻��ϱ�
    SELECT ename, deptno, sal, job FROM emp 
    WHERE sal in(select sal from emp where deptno = 30)
    and job in (select job from emp where deptno = 20);
--30�� �μ��� ��� �޿�����Ʈ
--�ѿ��� �븮 250, ����ȣ ���� 500, �ŵ��� ���� 450
--�嵿�� ���� 480, ���켺 ���� 500, ����� ��� 280
--20�� �μ��� ��� ��������Ʈ
--���� ���, �̺��� ����, ������ null���, ������ ����


--ALL������
--ALL������ ���������� �������� ���������� �˻������ ��� ���� ��ġ�ϸ� ���̴�. 
--ã���� ���� ���ؼ� AND������ �ؼ� ��� ���̸� ���̵Ǵ� ���̴�. 
--ALL�� "��� �񱳰� ���� ũ��" �̰�, ���� ���� �ǹǷ� �ִ밪���� �� ũ�� ���� �ȴ�.

--30���μ��� �ִ�޿� ���ϱ�
    SELECT MAX(SAL) "�ִ�޿�" FROM EMP WHERE DEPTNO = 30;
    
--����) ���������� ALL �����ڸ� ����Ͽ� 30�� �μ��� �ִ�޿����� ���� ��� ��ȸ�ϱ�   
    SELECT ENAME, SAL FROM EMP 
    WHERE SAL > ALL(SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 30);
    
--����) ���������� ����Ͽ� 30�� �μ��� ��ձ޿����� ���� ��� ��ȸ�ϱ�   
    SELECT ENAME, SAL FROM EMP
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 30);
    
    
--ANY ������   
--ANY ������ ���������� �������� ���������� �˻������ �ϳ� �̻� ��ġ�ϸ� ���̴�.
--ANY�� ã���� �� �߿��� �ּҰ� ���� ũ�� ���� �ȴ�.

--����) ANY�����ڸ� ����Ͽ� 30�� �μ��� �ּұ޿����� ���� �޿��� �޴� ��� ���ϱ�
    SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30;
    SELECT ENAME, SAL FROM EMP
    WHERE SAL > ANY(SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30);
    
--����) ������ �񱳹������ 30�� �μ��� �ּұ޿����� ū �޿��� ��ȸ�ϱ�
    SELECT ENAME, SAL FROM EMP
    WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30);
    
    SELECT ENAME, SAL FROM EMP
    WHERE SAL > ANY(SELECT MIN(SAL) FROM EMP) 
    AND SAL > ANY(SELECT SAL FROM EMP WHERE DEPTNO = 30);
    
   
--EXISTS ������
--EXISTS �����ڴ� �������������� �ַ� ����ϸ�
--���������� ��� ���� ���� �����⸸ �ϸ� �ٷ� ���������� ��� ���� �����Ѵ�.
--���������� ��� ���� �������� �ʴ´ٸ� ���������� ��� ���� ���ϵ��� �ʴ´�.
--���� �ӵ� �鿡���� �������� ��� �� IN ���ٴ� EXISTS�� �ξ� ������.
--EXISTS�� �ݴ�� NOT EXISTS�� ����� �����ϴ�.

    SELECT * FROM DEPT 
    WHERE EXISTS(SELECT * FROM EMP WHERE DEPTNO = 10);

    SELECT * FROM DEPT 
    WHERE EXISTS(SELECT * FROM EMP WHERE EMP.DEPTNO = DEPT.DEPTNO);    

    SELECT * FROM DEPT 
    WHERE NOT EXISTS(SELECT * FROM EMP WHERE EMP.DEPTNO = DEPT.DEPTNO);    
    
    SELECT * FROM EMP;
    SELECT * FROM DEPT;
    
--����) ������ ������ ����� ���� �μ��� �μ���ȣ�� �μ���� ������ ��ȸ�ϱ� (IN ���)
    SELECT DEPTNO, DNAME, LOC FROM DEPT
    WHERE DEPTNO IN(SELECT DEPTNO FROM EMP WHERE JOB = '����');
    
--����) ���庸�� �޿��� ���� �޴� ������� �̸��� �޿��� ������ ��ȸ�ϱ� (ALL ���, ���� ����)
    SELECT ENAME, SAL, JOB FROM EMP
    WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB = '����');
    --������ ����� �޿��� 500, 450 �ΰ����� ���´�.
    --ALL�� ���� �ΰ��� ���� ���� �� �����ǹǷ� �ִ밪�� 500 �̻��� ������� ��ȸ�ǰ�,
    --ANY�� ���ԵǸ� �ϳ��� �����ǵ� ����ǹǷ� �ּҰ��� 450 �̻��� ������� ��ȸ�ȴ�.



--���� ����
--VIEW�� �������� ���̺��� �ٰ��� ������ ���� ���̺��̴�.
--��� �⺻���̺��� �Ļ��� ��ü�μ� �⺻���̺� ���� �ϳ��� �������̴�.
--��� '����'�� �ǹ̸� ���� �ִ� ���� �����غ��� �� �� �ֵ���
--���� ���̺� ����� �����͸� �並 ���ؼ� �� �� �ֵ��� �Ѵ�.
--����ڿ��� �־��� �並 ���ؼ� �⺻ ���̺��� ���������� ����ϰ� �ȴ�.
--���� ���ǿ� Ư¡
--���� : �ϳ� �̻��� ���̺��� �������� �κ��������� �����Ǵ� ������ ���̺�
--Ư¡ : ���̺� �Ӹ� �ƴ϶� �ٸ� �並 ���ʷ� ���� ����
--    �� ��ü�� �����͸� ���� ���������� ������, 
--    â�������� �ϴ� �並 ���ؼ� �������� �˻� �� ������ ����
--    �� ��Ī�� ����ؼ� ������ �信 ���ؼ��� �� ��Ī�� ����� ���۸� ����
--���� : ������ ���ؼ� DB�� ���� ������ ������ �� ����
--        ����ڴ� Ư�� ���̺��� ������ ��� ��� ���ǵ� Ư�� �κи��� ���� �ȴ�.
--    ������ ���Ǹ� �ܼ��� ���Ƿ� ��ȯ�� �� ����
--        ���� ���̺��� �並 �����ϸ� ���̺� ������ ���ʿ��ϰ� �ȴ�.
--        ��, �ַ� ����ϴ� �������� ������� ������ ������ ������ �� �ִ�.
--    ������ �������� ���
--        ���̺��� ����Ǿ ��� �״�� ������ �� �����Ƿ�,
--        ����ڿ� �������α׷��� ���� ������ �������� ������ �� �ִ�.
--    ������ �����Ϳ� ���ؼ� �ٸ� �並 ������ �� ����
--        ���ǿ� ���� �����Ϳ� �����ϴ� ����� �׷��� �з��ؼ�,
--        ���� ������ ���̺��� �ٸ� �並 ���ʷ� ������ ������ �� �� �ְ� �Ѵ�.
--���� : ũ�� �ܼ� ��� ���� ��� ���еȴ�.
--    �ܼ� ��(single view) : ���� �ϳ��� ���̺��� ���ʷ� ������ ��
--        ǥ���� � ���� �����Ͱ� ���۵� ��츦 �����ϸ�, �並 ���� ��� DML������ ������ ����
--    ���� ��(complex or join view) : ���� ���̺��� ���ʷ� ������ ��
--        ������ �׷��� �Ǵ� �׷��Լ��� ����ؼ� �� ���� ����
--        �並 ���� ��� DML�� �׻� �������� ����
--���� : CREATE VIEW ��ɹ��� ���������� �̿��ؼ� �����ϰ�
--    �䰡 ������ ���� �� �̸��� �� ���Ǵ� ������ ������ USER_VIEWS ���̺� ����ȴ�.
--    (1) CREATE VIEW ����� ���� ���������� �����ؼ� ������ ���鸸���� �並 �����Ѵ�.
--����) CREATE [FORCE | NOFORCE] VIEW ���̸� [(����Ī1[, ����Ī2, ...])] 
--    AS �������� [WITH CHECK OPTION [CONSTRAINT �����̸�]] [WITH READ ONLY];
--    �� ��Ī : ���������� ���� ���õ� ���̳� ǥ���Ŀ� ���� ��Ī�� ����
--    FORCE : �⺻ ���̺��� ���� ���ο� �����ϰ� �並 ����
--    NOFORCE : �⺻���̺��� ������ ���� �並 ����
--    WITH CHECK OPTION : �信 ���� ���� ������ �ุ ���� �Ǵ� ������ �� ������ ���
--    WITH READ ONLY : �信 ���ؼ� SELECT�� �����ϰ� �ٸ� DML������ �Ұ������� ���
    
--EMP���̺�� �Ȱ��� ���̺��� ����    
    CREATE TABLE EMP_COPY AS SELECT * FROM EMP;
    
--���� ���ۿ���
--1. ����ڰ� �信 ���ؼ� ���Ǹ� �ϸ� USER_VIEWS���� �信 ���� ���Ǹ� ��ȸ
--2. �⺻ ���̺� ���� ���� ���� ������ ����
--3. �信 ���� ���Ǹ� �⺻ ���̺� ���� ���Ƿ� ��ȯ
--4. �⺻ ���̺� ���� ���Ǹ� ���� �����͸� �˻���
--5. �˻��� ����� �����

    SELECT * FROM EMP_COPY;
    SELECT EMPNO, ENAME, DEPTNO FROM EMP_COPY WHERE DEPTNO = 30;
    DESC USER_VIEWS;
    --���� ���� ������ USER_VIEWS ������ ��ųʸ�
    
    SELECT VIEW_NAME, TEXT FROM USER_VIEWS;
    --���ǵ� �� Ȯ���ϱ�

    CREATE VIEW EMP_VIEW30 AS SELECT EMPNO, ENAME, DEPTNO FROM EMP_COPY WHERE DEPTNO = 30;
    --ORA-01031: insufficient privileges ���� �߻�
    --�並 �����ϱ� ���� ������ ���� ������ �߻��Ѵ�.
    GRANT CREATE VIEW TO TESTER1;
    --SYSTEM���� �並 �����ϱ� ���� ������ �ο��Ѵ�.
    
    SELECT VIEW_NAME, TEXT FROM USER_VIEWS;
    --���ǵ� �� Ȯ���ϱ�
    SELECT * FROM EMP_VIEW30;
    --���������� ������� �� ��ȸ
    
--�並 ����ϴ� ����
--1. �����ϰ� �� �������� ��� �����ϸ� ������ �ܼ�ȭ ��Ų��.
--2. ���ȿ� �����ϴ�.
--���� ���� �� ������ ���� �� ����
--1. ���� ���� 
--2. ���� ����
--3. ���� �� ����

--�� ���� : �並 ������ �� ����� ����� CREATE OR REPLACE VIEW ����� ����ؼ�,
--    �̹� �����ϴ� �並 ��ü�����ν� �並 �����ϰ� �ȴ�.
--    (1) CREATE OR REPLACE VIEW ����� ���� �̹� �����ϴ� �並 ���ְ� ���� �̸��� �並 ���� �����Ѵ�.
--        �� �����䰡 ���� ��쿡�� ���ο� �並 �����Ѵ�.
--    �� ������ Ư¡
--    (1) �̹� ������ �並 �״�� �ΰ� �����ϴ� ���� �ƴ϶�, �̹� ������ �並 �����ϰ� ���ο� �並 �����ؼ�
--        ��ü �����ν� �����ϴ� ȿ���� ��� �ȴ�.
--    (2) �䰡 �������� �ʴ� ��쿡�� ������ �߻����� �ʰ� �並 ���� �����Ѵ�.

--�� ���� : DROP VIEW ������� �並 ������ �� �ִ�.
--    (1) DROP VIEW �꿵�� ���� ������ ���� �̸��� ����Ѵ�.
--    (2) VIEW ������ Ư¡
--        1. �䰡 �����ϴ� �⺻ ���̺��� ������ ���� �ʰ� �丸 �����ȴ�.
--        2. ��, �����Ϳ� ���� �ս��� ���� �ʰ� ������ ���̺��� �丸 �����Ѵ�.
--        3. ������ �並 ������� ������ �䳪 ���ø����̼��� ��ȿȭ �ȴ�.
--        4. ���� ������ �Ǵ� DROP ANY VIEW ������ ���� ����ڸ� ������ �����ϴ�.

--�� Ȱ��
--    1. ���� Ȯ��
--    2. �並 ���� ������ �˻�
--    3. �� ������ ���� ����
--    4. �信���� dml���� ���� ��Ģ
--    5. WITH CHECK OPTION �ɼ�
--    6. WITH READ ONLY �ɼ�
--    7. �� �����ϱ� ���� OR REPLACE �ɼ�
    
    INSERT INTO EMP_VIEW30 VALUES(1111,'AAAA',30);
    --�䰡 ������� �⺻���̺� ������ ����
    
--���� �� ����
    SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME, D.LOC
    FROM EMP_COPY E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO; 
    
    CREATE VIEW EMP_VIEW_DEPT
    AS SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME, D.LOC
    FROM EMP_COPY E, DEPT D 
    WHERE E.DEPTNO = D.DEPTNO;
    --�� ���̺��� JOIN�� ���������� ���� �� ����
    --EMP_COPY ���̺��� �μ���ȣ�� DEPT ���̺��� �μ���ȣ�� ���� 
    --�����ȣ, �����, �޿�, �μ���ȣ, �μ��̸�, ��ġ�� ��ȸ�ϴ� �並 �����Ѵ�.
    
    SELECT * FROM EMP_VIEW_DEPT;
    --���� �� ��ȸ
    
--�� ����
    CREATE VIEW EMP_VIEW
    AS SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO FROM EMP;
    
    SELECT * FROM EMP_VIEW;
    --�� ��ȸ
    
--�� ����
    DROP VIEW EMP_VIEW_DEPT;

    SELECT * FROM EMP_VIEW_DEPT;

--�� ���� OR REPLACE
    CREATE OR REPLACE VIEW EMP_VIEW30
    AS SELECT EMPNO, ENAME, SAL, COMM, DEPTNO FROM EMP_COPY
    WHERE DEPTNO = 30;
    --���� �並 �����ϰ� ���� �����.
    SELECT * FROM EMP_VIEW30;
    
    DROP VIEW EMP_VIEW30;

    CREATE OR REPLACE VIEW EMP_VIEW30
    AS SELECT EMPNO, ENAME, SAL, COMM, DEPTNO FROM EMP_COPY
    WHERE DEPTNO = 30;
    --�������� �ʴ� �並 �����ص� ������ �߻����� �ʴ´�.

    
--�⺻ ���̺� ���� �並 �����ϱ� ���� FORCE �ɼ�
--�並 �����ϴ� ��쿡 �Ϲ������� �⺻ ���̺��� �����Ѵٴ� �����Ͽ��� �������� �ۼ��Ѵ�.
--���� �幰��� ������, �⺻ ���̺��� �������� �ʴ� ��쿡�� �並 �����ؾ��� ��� ����ϴ� ���� FORCE �ɼ��̴�.
--���� �Բ� �並 �����Ѵ�.

    CREATE OR REPLACE FORCE VIEW EMPLOYEES_VIEW
    AS SELECT EMPNO, ENAME, DEPTNO FROM EMPLOYEES
    WHERE DEPTNO = 30;
    --��� : ������ ������ �Բ� �䰡 �����ȴ�.
    SELECT * FROM EMPLOYEES_VIEW;
    
    DROP VIEW EMPLOYEES_VIEW;
    SELECT VIEW_NAME, TEXT FROM USER_VIEWS;
    
--����) EMP_VIEW30�� �޿��� 500�̻��� ����� 20�� �μ��� �̵��ϱ�
    UPDATE EMP_VIEW30 SET DEPTNO = 20 WHERE SAL >= 500;
    SELECT * FROM EMP_VIEW30;    
    --���� SQL�� �䰡 �����ϴ� �⺻ ���̺� �ݿ��Ǹ�, �信�� ���� SQL�� ����� �����Ͱ� ������ �ʰԵȴ�.
    --���� ������ ���� �� ���� ���� ���������� �⺻ ���̺� �ݿ��ǰ�, �� �������� �信 �ݿ���        
    
    --�信 ������ �ʴ� ������ �� ������ ���������� �������� WHERE DEPTNO = 30 ��� ������ �޷� �ֱ� ������
    --�� ��� �⺻���̺��� EMP_COPY ���̺��� ������ WHERE DEPTNO = 30 �� �����͸� ������ �� �ִ�.
    --�� ���� UPDATE �������� DEPTNO ���� 20���� ����� �����ʹ� ���� ������ �������� �ʱ� ������ ������ �ʴ´�.
    
--����) ����� ������� �ִ� 20�� �μ��� ��ȸ�ϱ�
    SELECT * FROM EMP_VIEW30 WHERE DEPTNO = 20;
    --EMP_VIEW30 ������ 30�� �μ��� ���Խ��Ѽ� 20�� �μ��� �ȳ��´�.
    
    SELECT * FROM EMP_VIEW WHERE DEPTNO = 20;
    
    SELECT * FROM EMP_COPY WHERE DEPTNO = 30;
    --DEPT�� 30�� EMP_VIEW30�� �ִ°ǵ� �μ���ȣ�� 30�� �߿����� �޿��� 500�̻��� ����� ��� ��������� ����.
    SELECT * FROM EMP_COPY WHERE DEPTNO = 20;
    --7��
    SELECT * FROM EMP WHERE DEPTNO = 20;
    --5�� �״���̴�.

--���� Į�� �� ���� ���ϰ� �ϴ� WITH CHECK OPTION
--�並 �����ϴ� ���� �������� WHERE���� �߰��Ͽ�
--�⺻ ���̺� �� Ư�� ���ǿ� �����ϴ� �ο�(��) ������ ������ �並 ������ �� �ִ�.
--�並 ������ �� WHERE���� �߰��Ͽ� �⺻ ���̺��� ������ ����Ǵ�
--������ �����ϰ� �Ǵµ� ���⿡ ���������� WITH CHECK OPTION�� ����Ͽ�
--�������ø� ���� ����� Į���� ���� �並 ���ؼ� ������� ���ϵ��� �� �� �ִ�.

    SELECT * FROM EMP_VIEW30;
    
    CREATE OR REPLACE VIEW EMP_VIEW30
    AS SELECT EMPNO, ENAME, SAL, COMM, DEPTNO FROM EMP_COPY
    WHERE DEPTNO = 30 WITH CHECK OPTION;
    
    UPDATE EMP_VIEW30 SET DEPTNO = 20 WHERE SAL >=200;
    --ORA-01402: view WITH CHECK OPTION where-clause violation ���� �߻�
    --WHY? WITH CHECK OPTION���� WHERE ���� ������ DEPTNO = 30 ���ǿ� ���� ������ ���� �Ұ���
    
    CREATE TABLE EMP_COPY2
    AS SELECT * FROM EMP;
    
    SELECT * FROM EMP_COPY2;
    
    CREATE OR REPLACE VIEW VIEW_CHK30
    AS SELECT EMPNO, ENAME, SAL, COMM, DEPTNO FROM EMP_COPY2
    WHERE DEPTNO = 30 WITH CHECK OPTION;
    
    SELECT * FROM VIEW_CHK30;
    
    UPDATE VIEW_CHK30 SET COMM = 1000;
    --WITH CHECK OPTION���� ���� �������� ������ �߰��ȴ�.
    --�μ���ȣ�� 30�� ����� COMM�� 1000���� ����
    --WITH CHECK OPTION���� ������ WHERE���� ������ �ƴ� �����ʹ� ������ �����ϴ�.
    
--WITH READ ONLY �ɼ�
--�信 ���ؼ� SELECT�� �����ϰ� �ٸ� DML ������ �Ұ����ϰ� �ϴ� �ɼ��̴�.
--WITH CHECK OPTION�� ���������� �� ������ �����ϴ� ���� ������ WHERE ���� ����Ѵ�.
    CREATE OR REPLACE VIEW VIEW_READ30
    AS SELECT EMPNO, ENAME, SAL, COMM, DEPTNO FROM EMP_COPY2
    WHERE DEPTNO = 30 WITH READ ONLY;
    
    UPDATE VIEW_READ30 SET COMM = 2000;
    --SQL ����: ORA-42399: cannot perform a DML operation on a read-only view �����߻�
    --�б� ���� �� �̱� ������ �ش� DML ����� ������ �� ����.
    
    
    CREATE OR REPLACE VIEW VIEW_HIRE
    AS SELECT EMPNO, ENAME, HIREDATE FROM EMP_COPY
    ORDER BY HIREDATE;
    
    SELECT * FROM VIEW_HIRE;
       
        
--ROWNUM Į�� ���� �ľ��ϱ�
--ROWNUM Į���� ����Ŭ�� ���������� �ο��Ǵ� INSERT���� �̿��Ͽ� �Է��ϸ�
--�Է��� ������ ���� 1�� �����Ǹ鼭 ���� �����ȴ�.
--�����Ͱ� �Էµ� �������� �����Ǵ� ROWNUM Į�� ���� �ٲ��� �ʴ´�.

--����) �Ի����� �������� �������� ������ �� ROWNUM Į���� ����ϱ�
--      (�Ի����� ���� 5���� VIEW_HIRE���� ��ȸ�ϱ�)
    SELECT ROWNUM, EMPNO, ENAME, HIREDATE 
    FROM VIEW_HIRE WHERE ROWNUM <= 5;
    
    SELECT ROWNUM, EMPNO, ENAME, HIREDATE 
    FROM EMP_COPY WHERE ROWNUM <= 5;

    SELECT ROWNUM, EMPNO, ENAME, HIREDATE 
    FROM EMP_COPY WHERE ROWNUM <= 5 ORDER BY HIREDATE;

--��� ROWNUM Į������ TOP-N ���ϱ�
--�Ի����� ���� ��� 5���� ������ ���ؼ� �Ի��� ������ �並�����ϰ�,
--�̸� �ٽ� ���� 5�� ������ ���ؼ� �並 SELECT ������ ��ȸ�ϸ鼭
--�並 ROWNUM Į���� WHERE ���� �������� ����

--�ζ��� ��� TOP-N ���ϱ�
--�ζ��� ��� SQL���忡�� ����ϴ� ���������� �����̴�.
--���� FROM���� ��ġ�ؼ� ���̺�ó�� ����Ѵ�.
--����) SELECT ... FROM ... (SELECT ...) ALIAS ... ;
--�������� (�ٱ��� ������) �������� (���� ������)
--SELECT ��ȸ ������ FROM ���� ���̺� ���� �ƴ� Ư�� ������ SELECT ������ �����͸� ��ȸ�Ͽ�,
--��ȸ�� ���� ��ȸ�� ���̺� ������ ����� ���� �ζ��� ���̴�.

--����) �Ի��ϼ����� 5�� ��ȸ�ϴ� ���� ������ �ζ��� ��� �ٲپ� ����
    SELECT ROWNUM, EMPNO, ENAME, HIREDATE
    --�ζ��κ�
    FROM (SELECT EMPNO, ENAME, HIREDATE FROM EMP_COPY ORDER BY HIREDATE)
    WHERE ROWNUM <= 5;
    
--����) �μ��� �ִ�޿��� �ּұ޿��� ����ϴ� SAL_VIEW �����
    CREATE VIEW SAL_VIEW
    AS SELECT D.DNAME, MAX(E.SAL) "MAX_SAL", MIN(E.SAL) "MIN_SAL"
    FROM EMP_COPY E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    GROUP BY D.DNAME;
    
    SELECT * FROM SAL_VIEW;
    
--����) �޿��� ���� �޴� ������� 3�� AS RANKING, EMPNO, ENAME, SAL��ȸ�ϴ� �ζ��κ�
    SELECT ROWNUM AS RANKING, EMPNO, ENAME, SAL
    FROM (SELECT EMPNO, ENAME, SAL FROM EMP_COPY ORDER BY SAL DESC)
    WHERE ROWNUM <= 3;

--���� ���� 
--OR REPLACE : ���ο� �並 ���� �� ���� �Ӹ� �ƴ϶� �̹� ���� �並 �������� ��Ȥ ���ο� ������ ��� ���氡��
--FORCE : �⺻ ���̺��� ���� ���ο� ������� �並 ����
--WITH CHECK : �ش� �並 ���ؼ� �� �� �ִ� ���� �������� UPDATE �Ǵ� INSERT�� �����ϰ� �ϴ� ����
--WITH READ ONLY : �並 ���ؼ��� �⺻ ���̺��� � �ʵ忡 ���ؼ��� ������ ���� ������ �� ������ �ϴ� ����


--������
--�������� ���̺� ���� ������ ���ڸ� �ڵ����� �����ϴ� �ڵ� ��ȣ �߻��� �̹Ƿ�
--�������� �⺻Ű�� ����ϰ� �Ǹ� ������� �δ��� ���� �� �ִ�.
--����Ŭ�ϰ� MYSQL�� �ο��ϴ� ����� �ٸ���.

--������ ������ ���� ����
--CREATE SEQUENCE ������_�̸�
--    [START WITH n]
--    [INCREMENT BY n]
--    [(MAXVALUE n | NOMAXVALUE)]
--    [(MINVALUE n | NOMINVALUE)]
--    [(CYCLE n | NOCYCLE)]
--    [(CACHE n | NOCACHE)]

--������ ����
    DROP SEQUENCE DEPT_DEPTNO_SEQ;
--������ ����    
    CREATE SEQUENCE DEPT_DEPTNO_SEQ
    INCREMENT BY 10
    START WITH 10;
--������ ���� Ȯ��    
    DESC USER_SEQUENCES;
--�ش� ������ ������ ��ȸ    
    SELECT * FROM USER_SEQUENCES;
    SELECT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE, INCREMENT_BY, CYCLE_FLAG
    FROM USER_SEQUENCES;

--START WITH 
--������ ��ȣ�� ���� ���� ������ �� ���
--INCREMENT BY 
--�������� ������ ��ȣ�� ����ġ�� ������ �� ���
--CYCLE | NOCYCLE
--CYCLE�� �ִ밪���� �����ϰ� ����, ���۰����� �ٽ� �����Ѵ�.
--NOCYCLE�� ������ �Ϸ�Ǹ� ������ ���߽�Ų��.
--CACHE | NOCACHE 
--CACHE�� �޸𸮻��� ������ �������� ����, �⺻���� 20
--NOCACHE�� �޸𸮻󿡼� �������� �������� ����

--NEXTVAL : ���� ������ �� 
    SELECT DEPT_DEPTNO_SEQ.NEXTVAL FROM DUAL;
--CURRVAL : ���� ������ ��
    SELECT DEPT_DEPTNO_SEQ.CURRVAL FROM DUAL;
--NEXTVAL, CURRVAL�� ����� �� �ִ°��
--���������� �ƴ� SELECT ��
--INSERT���� SELECT ��
--UPDATE���� SET��

--������ ��ü �����ϱ�
    CREATE SEQUENCE SAMPLE_SEQ;
    SELECT SAMPLE_SEQ.CURRVAL FROM DUAL;
    --������� �ʴ´�. WHY? NEXTVAL�� ���� ������ �־�� �Ѵ�.
    SELECT SAMPLE_SEQ.NEXTVAL FROM DUAL;

    
--������ ����
--������ ���� ���������� ������ ������ �ұ�Ģ�� ������ ����� ������ �߻��Ѵ�.

--�ѹ��� �߻��� ���
--�������� ������ ������ �ѹ��ϸ� Ŀ�� ���� �ѹ�ȴ�.
--������ ������ ������ ��ȣ�� ��� �Ұ� �ǹǷ� ���� �������� ������ �߻�

--�ý����� �ջ�� ��� 
--CACHE �ɼ����� �̸� �������� �����ؼ� �޸𸮿� �����ص� ���, 
--�ý����� �ջ����� ���������� ���ᰡ �Ǹ�
--�̸� ������ ������ ���� ��� �Ҿ������ �ǹǷ� ���� �������� ������ �߻�

--������ �������� �������̺��� ���� ��� ������ ���� �ұ�Ģ������ ����� �� �ִ�.
    
--����) ���۰�1, ���� 1�� ����, �ִ밪�� 100000�� EMP_SEQ ������ �����ϰ� ��ȸ�ϱ�    
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
    INSERT INTO EMP01 VALUES(EMP_SEQ.NEXTVAL, 'ȫ�浿', SYSDATE);
    INSERT INTO EMP01 VALUES(EMP_SEQ.NEXTVAL, '������', SYSDATE);
    INSERT INTO EMP01 VALUES(EMP_SEQ.NEXTVAL, 'JULIA', SYSDATE);    
    
    SELECT * FROM EMP01;
    
    
--������ ����   
--ALTER SEQUENCE ������� �������� ����ġ, �ִ밪, �ּҰ�, ����Ŭ �� ĳ�� �ɼ��� ������ �� �ִ�.
--������ �����ڳ� ALTER������ ���� ����ڸ� ������ �� �ִ�.
--����) ALTER SEQUENCE ������_�̸� 
--      [START WITH n]
--      [INCREMENT BY n]
--      [(MAXVALUE n | NOMAXVALUE)]
--      [(MINVALUE n | NOMINVALUE)]
--      [(CYCLE n | NOCYCLE)]
--      [(CACHE n | NOCACHE)];
--������ ���� ��ħ
--�������� �����ϸ� ���� ���� �����Ǵ� ������ ��ȣ���� ������ ��ģ��.
--�������� ������ �� �ٸ� ���� ��ȣ���� �ٽ� �����Ϸ��� ���� �������� �����ϰ� �ٽ� �����ؾ� �Ѵ�.
--��ȿ�� �˻縦 �ڵ����� �����Ѵ�.
--��) ���� ������ ��ȣ���� ���� ���� MAXVALUE�� �����ϸ� ������ ������ �ʴ´�.

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
    
    INSERT INTO DEPT_EXAMPLE VALUES(DEPT_EXAMPLE_SEQ.NEXTVAL, '�λ��', '����');
    INSERT INTO DEPT_EXAMPLE VALUES(DEPT_EXAMPLE_SEQ.NEXTVAL, '�渮��', '����');
    INSERT INTO DEPT_EXAMPLE VALUES(DEPT_EXAMPLE_SEQ.NEXTVAL, '�ѹ���', '����');
    INSERT INTO DEPT_EXAMPLE VALUES(DEPT_EXAMPLE_SEQ.NEXTVAL, '�����', '��õ');
    SELECT * FROM DEPT_EXAMPLE;   
    SELECT DEPT_EXAMPLE_SEQ.CURRVAL FROM DUAL;
    

--1. �ε�����?
--2. �ε��� �������
--3. �ε����� ������ ���� ���ʿ��� ���
--4. �ε��� Ȯ��
--5. �ε��� ����
    
--1. �ε�����?
--(1) �ε����� ����
--    �����͸� ����Ͽ� ���� �˻��� ������ �� �ִ� DB ��ü�̴�.    
--(2) �ε����� Ư¡
--    ���̺� �࿡ ���� �������̰� ���� �������� ������
--    �ε����� ����Ŭ ������ ���ؼ� �ڵ����� �����ǰų� ����ڿ� ���� ��������� ������ �� ����
--    �ε����� ����Ŭ ������ ���ؼ� �ڵ����� ���ǰ� ������
--    �ε����� ���̺���� ����, ���������� ������
--    �⺻ ���̺� ������ ���� �ʰ� �����ϰų� ������ �� ����
--    �⺻ ���̺��� �����ϸ�, �ε����� �ڵ����� ���ŵ�
--    �ε����� �ʹ� ���� �����ϸ� ������ DMLó���� ȿ���� ���Ͻ�Ŵ

--2. �ε��� �������
--    �ڵ� �ε��� ����
--        ���̺��� ������ �� PRIMARY KEY�� UNIQUE ���������� ���ǵ� ���� ���ؼ�
--        ����Ŭ ������ ������ �ε����� �ڵ����� �����Ѵ�.
--    ���� �ε��� ����    
--        �˻� �ӵ��� ����� ���� ����ڰ� CREATE INDEX ����� ����ؼ�
--        ��������� �������� �ʴ� �ε����� ������ �� �ִ�.
--        �ϳ� �̻��� ���� ���ؼ� �ϳ��� �ε����� ������ �� �ִ�.
--    CREATE INDEX �ε����� ON ���̺��(���̸�1,...);
--        ON���� � ���̺��� � ���� ���� �ε����� �������� ����Ѵ�,
--    ���� �ε��� ���� ��)
--        EMP���̺��� EMP_NAME ���� ���� �˻��� ����� �߻��ϹǷ�
--        �� �˻� �ӵ��� ��� ��ų �� �ֵ��� �ε����� �����Ѵ�.
        
--3. �ε����� ������ ���� ���ʿ��� ���
--    ������ ���
--    (1) ���� WHERE ���̳� ���� ���ǿ��� ���� ���Ǵ� ���
--    (2) ���� �������� ���� �����ϴ� ���
--    (3) ���� ���� ���� NULL���� �����ϴ� ���
--    (4) NULL ���� ���ؼ��� �ε����� �������� �����Ƿ� NULL���� �������� �ε����� ũ�Ⱑ �۾���
--    (5) �� �Ǵ� �� �̻��� ������ WHERE �� �Ǵ� ���� ���ǿ��� ���� �Բ� ���Ǵ� ���
--    (6) ���̺��� �����̰� ��κ��� ���ǰ� ���� 2~4% ���� ���� �о� ���� ������ ����Ǵ� ���
--    ���ʿ��� ���
--    (1) ���̺� ����� �������
--    (2) �ش� ���� ������ �������� ���� ������ �ʴ� ���
--    (3) ���̺��� ���� ���ŵǴ� ���(�ε��� ������ ���� DML�� ȿ���� ������)
--    (4) ��κ��� ���ǰ� ���� 2~4% �̻��� �о� ���� ������ ����Ǵ� ���
--        (�ε����� �����ϴ� ��� ���̺� ��ü�� �˻��ϴ� ���� ����)

--4. �ε��� Ȯ��
--    ������ ������ USER_INDEXES �� USER_IND_COLUMNS �信 ����� �ε��� ������ Ȯ���Ѵ�.
--    USER_INDEXES ������ ���� ��
--        �ε��� �̸��� �ε����� ���ϼ� �������� �����Ѵ�.
--    USER_IND_COLUMNS ������ ���� ��
--        �ε��� �̸�, ���̺� �̸�, �� �̸�, �� ��ġ ���� ���� ���� �����Ѵ�.
    
--5. �ε��� ����
--    DROP INDEX ����� ����ؼ� ������ �������� �ε����� �����Ѵ�.
--    DROP INDEX �ε��� ��;

--���ǻ���
--    �ε��� �����ڳ� DROP ANY INDEX ������ ���� ����ڸ� ������ �� ����
--    �ε����� ������ �� ������, ������ �ʿ��� ��� �����ϰ� �ٽ� �����ؾ���
    
    
    DROP TABLE DEPT01;
    CREATE TABLE DEPT01 AS SELECT * FROM DEPT WHERE 1 = 0;
    --WHERE1=0�� �����ʹ� ���������ʰ� ���̺� ������ �����´�.
    DESC DEPT01;
    SELECT * FROM DEPT01;
    
    INSERT INTO DEPT01 VALUES(10, '�λ��', '����');
    INSERT INTO DEPT01 VALUES(20, '�ѹ���', '����');
    INSERT INTO DEPT01 VALUES(30, '������', '����');   
    SELECT * FROM DEPT01;
    
    
--�ε��� ����    
--���� �ε���
--����� �ε���
--���� �ε���
--���� �ε���
--�Լ���� �ε���

--���� �ε���(���� �ε���) 
--    ����Ű ó�� ������ ���� ���� Į���� ���ؼ� �����ϴ� �ε���
--    ���� �ε����� �����Ϸ��� UNIQUE �ɼ��� �����ؾ� �Ѵ�.
--    ��) DEPTNO�� ����/����� �ε��� �Ѵ� ���� ����
    CREATE UNIQUE INDEX IDX_DEPT01_DEPTNO ON DEPT01(DEPTNO);
    
--����� �ε���
--    �ߺ��� �����Ͱ� ����� Į���� �ε����� ������ ��� ����� �ε����� �����ؾ� �Ѵ�.
--    UNIQUE �ɼ��� �����ϰ� �����Ѵ�.
    CREATE INDEX IDX_DEPT01_LOC ON DEPT01(LOC);

--���� �ε���
--    �μ���ȣ�� �μ����� �����Ͽ� �ε����� ������ �� �ִ�.
    CREATE INDEX IDX_DEPT01_COM ON DEPT01(DEPTNO, DNAME);

--�Լ���� �ε���
    CREATE INDEX IDX_EMP07_ANNSAL ON EMP07(SAL*12);

--�ε��� ��ȸ
    SELECT INDEX_NAME, TABLE_NAME, COLUMN_NAME FROM USER_IND_COLUMNS
    WHERE TABLE_NAME IN('EMP07', 'DEPT01');
    
    SELECT * FROM USER_INDEXES
    WHERE TABLE_NAME IN('DEPT01');
    
    SELECT * FROM USER_IND_COLUMNS
    WHERE TABLE_NAME IN('DEPT01');
    
    
--PL/SQL (Procedural Language/ SQL) --����
--����Ŭ���� �����ϴ� ���α׷��� ���
--�Ϲ� ���α׷��� ������� ��Ҹ� �� ������ �ְ� �����ͺ��̽� ������ ó���ϱ� ���� ����ȭ�� ���
--�⺻����
--�����(Declare) (�ɼ�): ��� ������ ����� �����ϴ� �κ�
--�����(Executable) (�ʼ�): begin ~ end ���, �ݺ���, �Լ� ���� ���� ������ ����ϴ� �κ�
--����ó����(Exeption) (�ɼ�): ���൵�߿� ���� �߻��� �ذ��ϱ� ���� ��ɵ��� ����ϴ� �κ�
--�����, �����, ����ó���δ� ;�� ������ �ʰ� ������ ������� ;�� ���δ�.
--�͸���(anonymous block) : �ַ� ��ȸ������ ����� ��� ���� ���
--������(stored block) : ������ ������ ���� �ֱ������� �ݺ��ؼ� ����� ��� ���

--��¹��� ��ũ��Ʈ ��¿��� �����ִ� ��ɾ�
    set serveroutput on;
--�ݴ�
    set serveroutput off;
    
--PL/SQL�� ORACLE'S Procedural Language extension to SQL�� ����
--SQL���忡�� ��������, ����ó��, �ݺ�ó�� ���� �����ϸ�,
--����Ŭ ��ü�� ����Ǿ� �ִ� ������ ���μ� SQL�� ������ �������ش�.

--���� ����Ŭ ��Ʈ��ȣ Ȯ�� 8080
    SELECT DBMS_XDB.GETHTTPPORT() FROM DUAL;
    
--��Ʈ ��ȣ ����
    EXEC DBMS_XDB.SETHTTPPORT(9090);
    --SYSTEM���� ��Ʈ��ȣ�� �����ؾ� �Ѵ�.
    
--<Hello World �����>
    SET SERVEROUTPUT ON;
    
    BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World');
    END;
    
--������ ���� ��Ģ    
--�ݵ�� ���ڷ� �����ؾ� �Ѵ�.
--���ڳ� ����, Ư�����ڸ� ������ �� �ִ�.
--�������� 30byte ���Ͽ��� �Ѵ�.
--�����(Ű����)�� ����ϸ� �ȵȴ�.

--������ ������ �����(declare)���� ����ǰ� ������ �ʱ�ȭ�� �����ϴ�
--����ο��� ����� ��� ���� �Ҵ� �ȴ�.
--���� ���α׷��� �Ķ���ͷ� ���� �Ǳ⵵ �ϸ�, ���� ���α׷��� ��� ����� �����ϱ⵵ �Ѵ�.

--������ ���� ��)
--    emp_no number(6,3) : ���ڷ� �����ϴ� ������ �� 6�ڸ��� �ǹ��ϸ� �Ҽ������� 3�ڸ��� �ǹ��Ѵ�.
--    emp_name varchar2(5) : ���ڸ� �����ϴ� ������ �� ����Ʈ ���̰� 5����Ʈ�� ������ �� �ִ�.
--    emp_date date : ��¥�� �����ϴ� ����

--������ ������ Ÿ��
--    char : ���� ������ ���ڸ� ����, �⺻ �ּҰ� 1, �ִ� 32,767����Ʈ ���� ����
--    varchar2 : ���� ������ ���ڸ� ����, �⺻���� ����, �ִ� 32,767����Ʈ ���� ����
--    number(��ü �ڸ���, �Ҽ��� ���� �ڸ���) : ��ü �ڸ����� �Ҽ��� ���� �ڸ����� ���� ���ڸ� ����
--        ��ü �ڸ����� 1~38���� �����ϰ�, �Ҽ��� �ڸ����� ������ -84~127���� ����
--    binary_double : �ε� �Ҽ��� ���� ����, 9����Ʈ �ʿ���
--    date : ��¥ �� �ð��� ����, �ʴ����� ����, ��¥�� ������ 4712 B.C ~ 9999 A.D
--    timestamp : date Ÿ���� Ȯ��, ����, ��, ��, ��, ��, ��, �Ҽ��� ǥ�õǴ� �ʴ����� ����
--        �ڸ����� ǥ���Ҷ��� 0~9 ������ ������ ���, �⺻���� 6

--���� ����
--    ���̺��.�ʵ��%Type
--    empNo employees.employee_id%TYPE
--    : EMPLOYEES ���̺��� EMPLOYEE_ID�� ������ ������ Ÿ������ ����

--    empRow employees%ROWTYPE
--    : EMPLOYEES ���̺��� ��� Į���� �Ѳ����� �����ϱ����� ������ ����
--    /(������) : �� ������ ����
    / 
    --�����
    DECLARE 
    CNT INTEGER;
    --�����
    BEGIN
    --�Ҵ翬���� := 
    CNT := CNT + 1;
    IF CNT IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('��� : CNT�� ���̴�');
    END IF;
    END;
    /
    
    DECLARE
    --������ 4�� NUMBER Ÿ�� ���� ����
        VEMPNO NUMBER(4);
    --������ 10�� VARCHAR2 Ÿ�� ���� ����
        VENAME VARCHAR2(10);
    BEGIN
        VEMPNO := 1001;
        VENAME := '����';
        DBMS_OUTPUT.PUT_LINE('  ���  �̸�');
        DBMS_OUTPUT.PUT_LINE('---------------');
        DBMS_OUTPUT.PUT_LINE(VEMPNO || ' ' || VENAME);
    END;
    /
    
--IF��
    DECLARE
    --VEMPNO ������ EMP���̺��� EMPNO Į���� ������ Ÿ���� ����
        VEMPNO EMP.EMPNO%TYPE;
    --VENAME ������ EMP���̺��� ENAME Į���� ������ Ÿ���� ����
        VENAME EMP.ENAME%TYPE;
    --VDEPTNO ������ EMP���̺��� DEPTNO Į���� ������ Ÿ���� ����
        VDEPTNO EMP.DEPTNO%TYPE;
    --VDNAME ������ VARCHAR2(20) ������Ÿ������ �����ϰ� NULL���� ����
        VDNAME VARCHAR2(20) := NULL;
    BEGIN
        --��ȸ�� ����
        SELECT EMPNO, ENAME, DEPTNO  
        --�� ������ �����Ͽ� ����
        INTO VEMPNO, VENAME, VDEPTNO
        FROM EMP WHERE EMPNO = 1001;
        VEMPNO := 1001;
        --���� VDEPTNO�� 10�̸�
        IF (VDEPTNO = 10) THEN
            --VDNAME ������ 'ACCOUNTING' ����
            VDNAME := 'ACCOUNTING';
        END IF;
        --���� VDEPTNO�� 20�̸�
        IF (VDEPTNO = 20) THEN
            --VDNAME ������ 'RESEARCH' ����
            VDNAME := 'RESEARCH';
        END IF;
        --���� VDEPTNO�� 30�̸�
        IF (VDEPTNO = 30) THEN
            --VDNAME ������ 'SALES' ����
            VDNAME := 'SALES';
        END IF;
        --���� VDEPTNO�� 40�̸�
        IF (VDEPTNO = 40) THEN
            --VDNAME ������ 'OPERATIONS' ����
            VDNAME := 'OPERATIONS';
        END IF;
        DBMS_OUTPUT.PUT_LINE('  ���  �̸�  �μ���');
        DBMS_OUTPUT.PUT_LINE('---------------');
        DBMS_OUTPUT.PUT_LINE(VEMPNO || ' ' || VENAME || ' ' || VDNAME);
    END;    
    /
    
--IF��
    DECLARE
        --VEMP ������ EMP���̺��� ��� ������ Ÿ���� �����Ѵ�.
        VEMP EMP%ROWTYPE;
        --ANNSAL ������ NUMBER(7,2) ������ Ÿ������ �����Ѵ�.
        ANNSAL NUMBER(7,2);
    BEGIN
        --��� �����͸� VEMP ������ ����
        SELECT * INTO VEMP
        FROM EMP
        WHERE ENAME = '����';
        
        --VEMP������ COMMĮ�� ���� NULL�� ���
        IF(VEMP.COMM IS NULL) THEN
            --ANNSAL ������ VEMP������ SALĮ�� ���� *12�� ���� ����
            ANNSAL := VEMP.SAL*12;
        --VEMP������ COMMĮ�� ���� NULL�� �ƴ� ���
        ELSE 
            --ANNSAL ������ VEMP������ SALĮ�� ���� *12�� COMMĮ�� ���� ���� ���� ����
            ANNSAL := VEMP.SAL*12 + VEMP.COMM;
        END IF;
        
        --��¹�
        DBMS_OUTPUT.PUT_LINE('  ���  �̸�  ����');
        DBMS_OUTPUT.PUT_LINE('---------------');
        DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO || ' ' || VEMP.ENAME || ' ' || ANNSAL);
    END;
    /
    
--LOOP �ݺ���
    DECLARE
        --N������ NUMBER Ÿ������ ������ 1�� ����
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
    
--FOR �ݺ���
    DECLARE
    BEGIN 
        --���� N�� �����ϰ� 1���� 4���� 1�� �����ϸ� �ݺ��Ѵ�.
        FOR N IN 1..4 LOOP
            DBMS_OUTPUT.PUT_LINE(N);
        END LOOP;
    END;
    /

--WHILE �ݺ���
    DECLARE
        N NUMBER := 1;
    BEGIN 
        --N�� ���� 5���� �۰ų� ������ �ݺ��Ѵ�.
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
    WHERE ENAME = '����';
    
--����) �����̸� �޿��� 10�� �λ��ϰ� �ƴϸ� 5�� �λ��ϱ� (PL/SQL)
    DECLARE
        VEMP S_EMP%ROWTYPE;
        VDEPTNO S_EMP.DEPTNO%TYPE;
        VPERCENT NUMBER(2);
    BEGIN
        --DEPT ���̺��� ��ȸ�� DEPTNO�� ���� VDEPTNO ������ ����
        SELECT DEPTNO INTO VDEPTNO FROM DEPT WHERE DNAME LIKE '%����%';
        --S_EMP ���̺��� ��ȸ�� ��� �����͸� VEMP ������ ����
        SELECT * INTO VEMP FROM S_EMP WHERE ENAME = '����';
        
        IF VEMP.DEPTNO = VDEPTNO THEN
            VPERCENT := 10;
        ELSE
            VPERCENT := 5;
        END IF;

        UPDATE S_EMP SET SAL = SAL + SAL*VPERCENT/100
        WHERE ENAME = '����';
        COMMIT;
    END;
    /
    SELECT ENAME, SAL FROM S_EMP WHERE ENAME = '����';
    
--����) ������� �ϱ�
--COMM Į�� ���� NULL�̸� ���� ��� ���� NULL�� ���´�.
--�׷��Ƿ� COMM�� NULL�̸� 0���� �ٲٱ�
    DECLARE
        VEMP EMP%ROWTYPE;
        ANNSAL NUMBER(7,2);
    BEGIN
        SELECT * INTO VEMP
        FROM EMP
        WHERE ENAME = '����';
        
        IF(VEMP.COMM IS NULL) THEN
            VEMP.COMM := 0;
        END IF;
        
        ANNSAL := VEMP.SAL*12 + VEMP.COMM;
        
        DBMS_OUTPUT.PUT_LINE('  ���  �̸�  ����');
        DBMS_OUTPUT.PUT_LINE('---------------');
        DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO || ' /' || VEMP.ENAME || ' /' || ANNSAL);
    END;
    /
    
--����) LOOP������ ������ 5�� ���
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
    
--����) �μ���ȣ�� 10�� ������Ű�� ����ϱ�    
    DECLARE
        VDEPT DEPT%ROWTYPE;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('�μ���ȣ / �μ��� / ������');
        DBMS_OUTPUT.PUT_LINE('------------------------');
    
        FOR CNT IN 1..4 LOOP
            SELECT * INTO VDEPT
            FROM DEPT WHERE DEPTNO = 10 * CNT;
            DBMS_OUTPUT.PUT_LINE(VDEPT.DEPTNO || '/' || VDEPT.DNAME || '/' || VDEPT.LOC);
        END LOOP;
    END;
    /       
    
--����) *��ȣ�� �Ѱ��� �߰���Ű�� ����ϱ�    
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
    

--������ ����
--BOM ���� ���� ��������, �θ��� �ڽĳ�� ����(������)���
    DROP TABLE BOM_SPHONE;
    
    CREATE TABLE BOM_SPHONE(
        ITEM_ID NUMBER(3) NOT NULL,
        PARENT_ID NUMBER(3),
        ITEM_NAME VARCHAR(20) NOT NULL,
        PRIMARY KEY (ITEM_ID)
    );
    
    --�θ� ���� �ֻ��� ��Ʈ
    INSERT INTO BOM_SPHONE VALUES(100, NULL, '����Ʈ��');
    --100 �θ�
    INSERT INTO BOM_SPHONE VALUES(101, 100, '���� PCD');
    INSERT INTO BOM_SPHONE VALUES(102, 100, '���͸�');
    --101 �θ�
    INSERT INTO BOM_SPHONE VALUES(103, 101, 'CPU');
    --101 �θ�
    INSERT INTO BOM_SPHONE VALUES(104, 101, '�޸�');
    INSERT INTO BOM_SPHONE VALUES(105, 101, '�������');

    SELECT * FROM BOM_SPHONE;
    
    --��������
    SELECT S1.ITEM_NAME, S1.ITEM_ID, S2.ITEM_NAME PARENT_NAME
    FROM  BOM_SPHONE S1, BOM_SPHONE S2
    --�ܺ����� (+)�� �̿��ؼ� ����Ǿ� ���� ���� NULL���� ��� �������� ��ȸ�Ѵ�.
    WHERE S1.PARENT_ID = S2.PARENT_ID (+)
    ORDER BY S1.ITEM_ID;
    
    --���� ������ ������ �ʴ´�. ����PCD �ؿ� CPU ������ ���;� �ϹǷ� �Ʒ� ������� ���ش�. 

--START WITH, CONNECT BY ���� �̿��ؼ� ������ ������ �Ҽ� �ִ�.
    --LPAD(����, 2*(LEVEL-1)) ���������� �����ִ� ����
    --�������� 3����� 2�� ��ȸ�Ѵ�.
    SELECT LPAD('', 2*(LEVEL-1)) || ITEM_NAME INEMNAME
    FROM BOM_SPHONE
    --�ֻ��� ��Ʈ�� NULL�� ������ ����
    START WITH PARENT_ID IS NULL
    CONNECT BY PARENT_ID = PRIOR ITEM_ID;
    
    
----------------------------------------09/14--------------------------------------    

  
--Ʈ����
--����Ŭ���� Ʈ���� ���� �ش� �ܾ��� �ǹ�ó�� � �̺�Ʈ�� �߻��ϸ� �ڵ������� 
--��Ƽ谡 ����� �Ѿ��� �߻�ǵ��� Ư�� ���̺��� ����Ǹ� �̸� �̺�Ʈ�� 
--�ٸ� ���̺��� �ڵ����� ����ǵ��� �ϱ� ���ؼ� ����Ѵ�.
--Ʈ���Ŵ� ���̺��̳� �䰡 INSERT, UPDATE, DELETE ���� DML ���� ���� 
--�����Ͱ� �Է�, ����, ������ ��� �ڵ����� ����Ǿ� ����.

--Ʈ���Ŷ�
--INSERT, UPDATE, DELETE ���� TABLE�� ���� ������ �� ���������� ����Ǵ� PROCEDURE �̴�.
--Ʈ���Ŵ� TABLE���� ������ DATABASE�� ����ȴ�.
--
--Ʈ���Ŵ� VIEW�� ���ؼ��� �ƴ϶� TABLE�� ���ؼ��� ���ǵ� �� �ִ�.
--�� Ʈ���� : Į���� ������ ���� ������ �� ��ȭ�� ���涧 ���� ����Ǹ�, �� ������ ���� �������� ������ �� �ִ�.
--���� Ʈ���� : Ʈ���� ��ǿ� ���� �� �ѹ��� ����Ǹ�, Į���� �� ������ ���� ���� �� �� ����.

--Ʈ������ Ÿ�̹�
--BEFORE : INSERT, UPDATE, DELETE ���� ����Ǳ� ���� Ʈ���Ű� ����ȴ�.
--AFTER : INSERT, UPDATE, DELETE ���� ����� �� Ʈ���Ű� ����ȴ�.
--TRIGGER_EVENT : INSERT, UPDATE, DELETE �߿��� �Ѱ� �̻� �� �� �ִ�.
--FOR EACH ROW : �� �ɼ��� ������ �� Ʈ���Ű� �ȴ�.

--Ʈ����
--� ���ǿ� �´� �̺�Ʈ�� �Ͼ�� �ļ� �̺�Ʈ�� �߻���Ŵ

--Ʈ������ 5���� ���
--Ʈ���� ���� : DML ������ Ʈ����, ����� ���ڵ� ������ Ʈ����
--Ʈ���� ���۽��� : Ʈ���� ���� ������ BEFORE, AFTER
--Ʈ���� �̺�Ʈ : Ʈ���Ÿ� �߻���ų �� ������ ����
--Ʈ���� ���� : ���ڵ� ������ Ʈ���ſ����� ������ �� �ִ� UPDATE �۾��� Ư�� ������ ����Ͽ�
--            ���ǿ� �´� ���ڵ��� ���濡���� Ʈ���� �̺�Ʈ�� �߻�
--Ʈ���� ��ü : BEGIN-END ���� ���� ����

--Ʈ���� ����
--CREATE [OR REPLACE] TRIGGER Ʈ���� �� 
--BEFORE|AFTER EVENT ON ���̺�� 
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
    
--AFTER Ʈ����    
    --PRINT_MSG��� Ʈ���� ����
    CREATE OR REPLACE TRIGGER PRINT_MSG
    --SAMPLE_DEPT ���̺� INSERT ����� ����Ǹ� Ʈ���Ÿ� ���߿� ����
    AFTER INSERT ON SAMPLE_DEPT
    BEGIN
        DBMS_OUTPUT.PUT_LINE('�μ��� �߰��Ǿ����ϴ�.');
    END;
    /
    
    INSERT INTO SAMPLE_DEPT VALUES(10, '�����ú�', '����');
    INSERT INTO SAMPLE_DEPT VALUES(20, 'ȫ����', '��õ');    
    
    SELECT * FROM SAMPLE_DEPT;
    
    
    DROP TABLE ITEM;
    CREATE TABLE ITEM ( --��ǰ
        CODE CHAR(6) PRIMARY KEY, --��ǰ �ڵ�
        NAME VARCHAR2(15) NOT NULL,
        COMPANY VARCHAR2(15),
        PRICE NUMBER(8),
        CNT NUMBER DEFAULT 0 --������
    );
    DESC ITEM;
    
    DROP TABLE WAREHOUSE;
    CREATE TABLE WAREHOUSE ( --����â��
        NUM NUMBER(6) PRIMARY KEY, --�԰� ��ȣ
        CODE CHAR(6) REFERENCES ITEM(CODE),
        INDATE DATE DEFAULT SYSDATE, --�԰� ��¥
        INCNT NUMBER(6),
        INPRICE NUMBER(6), --�ܰ�
        TOTALPRICE NUMBER(8) --�Ѿ�
    );
    DESC WAREHOUSE;
    
    INSERT INTO ITEM (CODE, NAME, COMPANY, PRICE)
    VALUES('C0001', '������', '�Ｚ', 1000000);
    INSERT INTO ITEM (CODE, NAME, COMPANY, PRICE)
    VALUES('C0002', '��ǳ��', 'LG', 50000);
    
    SELECT * FROM ITEM;
    SELECT * FROM WAREHOUSE;

--�ش� ������ Ʈ���� ��ȸ    
    SELECT * FROM USER_TRIGGERS;

--������ �߰��� ���� Ʈ���� ����    
    DROP TRIGGER CNT_ADD;
    --CNT_ADD��� Ʈ���� ����
    CREATE OR REPLACE TRIGGER CND_ADD
    --WAREHOUSE ���̺� INSERT ����� ����Ǹ� Ʈ���Ÿ� ���Ŀ� ����
    AFTER INSERT ON WAREHOUSE
    --�� �ο츶�� �ݺ�
    FOR EACH ROW
    --Ʈ���Ű� �ߵ��Ǹ� ����Ǵ� �κ�
    BEGIN
        --���ε� ����, NEW ����, CNTĮ���� INSERT�� ������ �����͸� ���ؼ�(NEW.INCNT) �����Ѵ�.
        --NEW ������ INSERT, UPDATE������ ���, OLD ������ DELETE�������� ���
        UPDATE ITEM SET CNT = CNT +:NEW.INCNT
        WHERE CODE =:NEW.CODE;
    END;
    /
    
    INSERT INTO WAREHOUSE (NUM, CODE, INCNT, INPRICE, TOTALPRICE)
    VALUES(1, 'C0001', 10, 900000, 9000000);

    SELECT * FROM ITEM;
    SELECT * FROM WAREHOUSE;
    
--������ ������ ���� Ʈ���� ����    
    DROP TRIGGER CNT_UPDATE;
    CREATE OR REPLACE TRIGGER CNT_UPDATE
    AFTER UPDATE ON WAREHOUSE
    FOR EACH ROW
    BEGIN
        --CNTĮ�� ���� ������ INCNT ���� ������ INCNT ���� ���ؼ� �����Ѵ�.
        UPDATE ITEM SET CNT = CNT - :OLD.INCNT + :NEW.INCNT
        WHERE CODE =:NEW.CODE;
    END;
    / 
    
    UPDATE WAREHOUSE SET INCNT = 7, INPRICE = 800000 WHERE CODE = 'C0001';
    
    SELECT * FROM ITEM;
    SELECT * FROM WAREHOUSE;    
    
--������ ���Ÿ� ���� Ʈ���� ����    
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
