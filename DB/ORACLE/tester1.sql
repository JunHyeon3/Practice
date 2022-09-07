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
    
