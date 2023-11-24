CREATE TABLE TEMP (
 EMP_ID      NUMBER NOT NULL PRIMARY KEY,
 EMP_NAME    VARCHAR2(10) NOT NULL,
 BIRTH_DATE  DATE,
 DEPT_CODE   VARCHAR2(06) NOT NULL,
 EMP_TYPE    VARCHAR2(04),
 USE_YN      VARCHAR2(01) NOT NULL,
 TEL         VARCHAR2(15),
 HOBBY       VARCHAR2(30),
 SALARY      NUMBER,
 LEV         VARCHAR2(04)
);

CREATE TABLE TDEPT (
 DEPT_CODE   VARCHAR2(06) NOT NULL PRIMARY KEY,
 DEPT_NAME   VARCHAR2(20) NOT NULL,
 PARENT_DEPT VARCHAR2(06) NOT NULL,
 USE_YN      VARCHAR2(01) NOT NULL,
 AREA        VARCHAR2(10),
 BOSS_ID     NUMBER
);

SELECT*FROM temp;

SELECT*FROM tdept;

SELECT ENAME
FROM emp;

-- ���̺��� ����̺� �� �� (������ ���� ��) �ε��� ���� �д´�
-- ���̺��� ������ �����ʰ� �� �ε��� ���������ε� ��ȸ�� �ȴ�.
-- �̷� �������� ��ġ��
SELECT EMPNO, rowid RID
FROM emp;

SELECT ENAME
FROM emp
WHERE rowid = 'AAARE8AAEAAAACTAAA';




SELECT empno
FROM emp;
-- empno�� pk�̿��� �ε��� �̱� ������ �ڵ����� ���������� �Ǿ��ִ�.
-- �������� ���Ľ� order by empno desc�� �߰��ϸ� �ȴ�.
-- ��Ƽ�������� ������ �����ϴ� ������ ���� ã�ƿ´�.
-- ����ó�� ����, Ŭ������ ����



-- �������� �ĺ��� - �ڹٿ����� �ƴ� 

-- īŸ�þȰ� :  ������ �����ؼ� ����, �Ұ�, �踦 ���� �� �����
SELECT dept.dname, emp.deptno, dept.deptno
FROM emp, dept;

-- �����Ⱚ�� ���ԵǾ� ���ݾ�? �̰� �����������
-- natural Join
-- 1:n����
SELECT dept.dname, emp.deptno, dept.deptno
FROM emp, dept
WHERE emp.deptno=dept.deptno;

DELETE FROM dept WHERE deptno IN(60,80,90);

COMMIT;

SELECT * FROM dept;

ROLLBACK;

SELECT count(empno) FROM emp;

SELECT count(comm) FROM emp;
SELECT max(sal), min(sal) FROM emp;

INSERT INTO TEMP VALUES (19970101,'��浿',TO_DATE('19740125','YYYYMMDD'),'AA0001','����','Y','','���',100000000,'����');
INSERT INTO TEMP VALUES (19960101,'ȫ�浿',TO_DATE('19730322','YYYYMMDD'),'AB0001','����','Y','','����',72000000,'����');
INSERT INTO TEMP VALUES (19970201,'�ڹ���',TO_DATE('19750415','YYYYMMDD'),'AC0001','����','Y','','�ٵ�',50000000,'����');
INSERT INTO TEMP VALUES (19930331,'������',TO_DATE('19760525','YYYYMMDD'),'BA0001','����','Y','','�뷡',70000000,'����');
INSERT INTO TEMP VALUES (19950303,'�̼���',TO_DATE('19730615','YYYYMMDD'),'BB0001','����','Y','','',56000000,'�븮');
INSERT INTO TEMP VALUES (19966102,'������',TO_DATE('19720705','YYYYMMDD'),'BC0001','����','Y','','',45000000,'����');
INSERT INTO TEMP VALUES (19930402,'������',TO_DATE('19720815','YYYYMMDD'),'CA0001','����','Y','','',64000000,'����');
INSERT INTO TEMP VALUES (19960303,'����ġ',TO_DATE('19710925','YYYYMMDD'),'CB0001','����','Y','','',35000000,'���');
INSERT INTO TEMP VALUES (19970112,'�����',TO_DATE('19761105','YYYYMMDD'),'CC0001','����','Y','','',45000000,'�븮');
INSERT INTO TEMP VALUES (19960212,'�����',TO_DATE('19721215','YYYYMMDD'),'CD0001','����','Y','','',39000000,'����');

INSERT INTO TDEPT VALUES ('AA0001','�濵����','AA0001','Y','����',19940101);
INSERT INTO TDEPT VALUES ('AB0001','�繫','AA0001','Y','����',19960101);
INSERT INTO TDEPT VALUES ('AC0001','�ѹ�','AA0001','Y','����',19970201);
INSERT INTO TDEPT VALUES ('BA0001','�������','BA0001','Y','��õ',19930301);
INSERT INTO TDEPT VALUES ('BB0001','H/W����','BA0001','Y','��õ',19950303);
INSERT INTO TDEPT VALUES ('BC0001','S/W����','BA0001','Y','��õ',19966102);
INSERT INTO TDEPT VALUES ('CA0001','����','CA0001','Y','����',19930402);
INSERT INTO TDEPT VALUES ('CB0001','������ȹ','CA0001','Y','����',19950103);
INSERT INTO TDEPT VALUES ('CC0001','����1','CA0001','Y','����',19970112);
INSERT INTO TDEPT VALUES ('CD0001','����2','CA0001','Y','����',19960212);

COMMIT;


-- 1. �� �޿��� ������ 18�� ������ Ȧ�� �޿��� ������ 1/18�� ���޵ǰ�
-- ¦���޿��¿����� 2/18�� ���޵ȴٰ� ���������� Ȧ�� �ް� ¦���޿� ���� �ݾ��� ��Ÿ���ÿ�.


SELECT
    TO_CHAR(round(salary/18,-1), '999,999,999')||'�� ' AS Ȧ���ޱ޿�, 
    TO_CHAR(round(salary*2/18,-1), '999,999,999')||'�� ' AS ¦���ޱ޿� 
 FROM temp;



-- 2. ������ ���� �� �޿��� ����� 10������ ���޵ȴٸ�(¦������ 20����)���� ������ ��� �ٲ��� �ۼ��� ���ÿ�.
SELECT
    TO_CHAR(round(salary/18+100000,-1), '999,999,999')||'�� ' AS Ȧ����, 
    TO_CHAR(round(salary*2/18+100000,-1), '999,999,999')||'�� ' AS ¦���� 
 FROM temp;

-- 3. TEMP ���̺��� ��̰� NULL �� �ƴ� ����� ������ �о���ÿ�.
SELECT emp_name 
FROM temp
WHERE hobby IS NOT NULL;

-- 3-1. hobby��  ����̰ų� ������ ���
SELECT emp_name, hobby
FROM temp
WHERE hobby  IN('���','����');

-- 3-2. 
SELECT emp_name, hobby
FROM temp
WHERE hobby ='���' 
        OR hobby IS NULL;
-- 3-3. 
SELECT emp_name, hobby
FROM temp
 MINUS
 SELECT emp_name, hobby
 FROM temp
 WHERE hobby IS NULL
 OR hobby = '����';
-- 4. TEMP ���̺��� ��̰� NULL�� ����� ��� HOBBY�� ���������̶�� ���� ġȯ�Ͽ� �������� �������� �״�� ���� �о���ÿ�.
SELECT emp_name ,NVL(hobby,'����')
FROM temp;

-- 5. TEMP�� �ڷ� �� HOBBY�� ���� NULL�� ����� ����ꡯ���� ġȯ���� �� HOBBY�� ������� ����� ������ �������� ������ �ۼ��Ͻÿ�.
UPDATE temp 
set hobby = '���'
WHERE hobby IS NULL;

SELECT emp_name
FROM temp
WHERE hobby = '���';

SELECT emp_name
FROM(
 SELECT emp_name ,NVL(hobby,'���') AS ���
FROM temp)
WHERE ��� = '���';

SELECT emp_name, hobby
FROM temp
WHERE NVL(hobby,'���') = '���';


-- 6. TEMP�� �ڷ� �� EMP_ID�� EMP_NAME�� ���� �������,���������� ǥ�õǾ� DISPLAY�ǵ��� COLUMN ALLIAS�� �ο��Ͽ� SELECT �Ͻÿ�.
SELECT emp_id AS ���, emp_name AS ����
FROM temp;

SELECT ���, ����
FROM ( SELECT emp_id "���", emp_name "����"
FROM temp);

-- 7. TEMP�� �ڷḦ ���� ��(LEV)�� ASCENDING�ϸ鼭 ��������� �ٽ� ��� ������ DESCENDING�ϰ� �ϴ� ORDER BY�ϴ� ������ ����� ���ÿ�. 
SELECT lev, emp_id
FROM temp
ORDER BY lev, emp_id desc;

ROLLBACK;