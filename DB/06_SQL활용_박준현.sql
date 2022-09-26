DROP TABLE film_actor;
DROP TABLE film;
DROP TABLE actor;

CREATE TABLE film_actor( 
    actor_id NUMBER ,
    film_id NUMBER,
    CONSTRAINT actor_id FOREIGN KEY(actor_id) REFERENCES actor(actor_id),
    CONSTRAINT film_id FOREIGN KEY(film_id) REFERENCES film(film_id)
);

CREATE TABLE film( 
    film_id NUMBER(5, 0) PRIMARY KEY,
    title VARCHAR2(255),
    description VARCHAR2(255),
    release_year NUMBER,
    production_company VARCHAR2(100)
);

CREATE TABLE actor( 
    actor_id NUMBER(5, 0) PRIMARY KEY,
    name VARCHAR2(45),
    birth_date DATE
);

DESC FILM_ACTOR;
DESC ACTOR;
DESC FILM;



INSERT INTO FILM_ACTOR VALUES(2, 1001);
INSERT INTO FILM_ACTOR VALUES(3, 1001);
INSERT INTO FILM_ACTOR VALUES(2, 1002);
INSERT INTO FILM_ACTOR VALUES(5, 1002);
INSERT INTO FILM_ACTOR VALUES(2, 1003);
INSERT INTO FILM_ACTOR VALUES(4, 1003);
INSERT INTO FILM_ACTOR VALUES(1, 1004);
INSERT INTO FILM_ACTOR VALUES(2, 1004);
INSERT INTO FILM_ACTOR VALUES(2, 1005);
INSERT INTO FILM_ACTOR VALUES(4, 1005);
INSERT INTO FILM_ACTOR VALUES(6, 1006);

INSERT INTO FILM VALUES(1001, '�ʷϹ����', '��â�������� ������', 1997, '�̽�Ʈ�ʸ�');
INSERT INTO FILM VALUES(1002, '����', 'PC����� ���� ��û�ڿ��� �����ϸ鼭 ����� �θǽ�', 1997, '���ʸ�');
INSERT INTO FILM VALUES(1003, '8����ũ��������', '����ȣ������ ������', 1998, '����ʸ�');
INSERT INTO FILM VALUES(1004, '����', '���� ø�� �׼� ������ ��ȭ', 1999, '(��)�������ʸ�');
INSERT INTO FILM VALUES(1005, '�ڹ̽��', '�̽��������� ������', 1999, '��ؾ��ʸ�');
INSERT INTO FILM VALUES(1006, '�ÿ���', '�̽��������� ������', 2000, '���̴���');

INSERT INTO ACTOR VALUES(1, '�۰�ȣ', '1967/01/27');
INSERT INTO ACTOR VALUES(2, '�Ѽ���', '1964/11/03');
INSERT INTO ACTOR VALUES(3, '������', '1953/05/28');
INSERT INTO ACTOR VALUES(4, '������', '1972/09/23');
INSERT INTO ACTOR VALUES(5, '������', '1973/02/11');
INSERT INTO ACTOR VALUES(6, '������', '1981/10/30');

SELECT * FROM FILM_ACTOR;
SELECT * FROM FILM;
SELECT * FROM ACTOR;



--1999�� ���Ŀ� ���۵� ��ȭ ���� ��ȸ�Ͻÿ�.
SELECT COUNT(*) AS "1999�� ���� ���� ��ȭ" FROM FILM WHERE RELEASE_YEAR >= '1999';

--1999�⿡ ������ ��ȭ�� ��ȸ�Ͻÿ�.
SELECT TITLE AS "1999�� ���� ��ȭ" FROM FILM WHERE RELEASE_YEAR = '1999';

--������ �⿬�� ��� �̸��� ��ȸ�Ͻÿ�. ��, ���ΰ� ���� ������ �ۼ��Ͻÿ�. 
SELECT NAME AS "���� �⿬ ���" FROM ACTOR 
WHERE ACTOR_ID IN (SELECT ACTOR_ID FROM FILM_ACTOR WHERE FILM_ID = 1004);

SELECT NAME AS "���� �⿬ ���" FROM ACTOR 
WHERE ACTOR_ID IN (SELECT ACTOR_ID FROM FILM F, FILM_ACTOR FA WHERE F.FILM_ID = FA.FILM_ID AND TITLE = '����');

--�Ѽ��� ��찡 �⿬�� ��ȭ ���� ��ȸ�Ͻÿ�. 
SELECT COUNT(*) || '��' AS "�Ѽ��� ��� ��ȭ ��" FROM FILM_ACTOR WHERE ACTOR_ID = 2;

--1970��뿡 �¾ ��� �̸��� ��������� ��ȸ�Ͻÿ�.
SELECT NAME AS "�̸�", BIRTH_DATE AS "�������" FROM ACTOR 
WHERE BIRTH_DATE >= TO_DATE('1970', 'YYYY') AND BIRTH_DATE <= TO_DATE('1979', 'YYYY');