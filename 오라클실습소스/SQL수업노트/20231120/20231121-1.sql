CREATE TABLE LECTURE (LEC_ID VARCHAR2(05),LEC_TIME NUMBER,LEC_POINT NUMBER);
INSERT INTO LECTURE VALUES('L0001',3,3);
INSERT INTO LECTURE VALUES('L0002',3,2);
INSERT INTO LECTURE VALUES('L0003',2,3);
INSERT INTO LECTURE VALUES('L0004',2,2);
INSERT INTO LECTURE VALUES('L0005',3,1);
COMMIT;

IF A = B THEN
RETURN 'T';
END IF;

SELECT DECODE (1,1,'T')
            ,DECODE (1,1,'T','F')
            FROM dual;
            
-- ����1 - �ִ� ���ǽð��� ������ ������ '�Ϲݰ���'�� ���� �޴� �������� �ۼ��Ͻÿ�.            
SELECT decode(lec_time, lec_point,'��ġ') 
FROM lecture;
-- �������� �������� �ʴ� ��쿡�� null�� ��ȯ�Ѵٴ� ���� �� �� �ִ�.
SELECT decode(lec_time, lec_point,'�Ϲݰ���',NULL) 
FROM lecture;
 

-- ���� 2. �ִ簭�ǽð��� ������ ���� ������  �� �����  ����ϴ� �������� �ۼ��Ͻÿ�
SELECT count( decode(lec_time, lec_point,'��ġ'))
FROM lecture;

-- ����3. ���ǽð��� ������ ���ų� ���ǽð��� �������� ������ '�Ϲݰ���'�� �����ް� 
-- ���ǽð��� �������� ū ��츸 '�������'�̶�� �����ް� �ʹٸ� ��� ó���� �� ���� ���?

SELECT decode(sign(lec_time-lec_point),1,'�������','�Ϲݰ���')
FROM lecture;
-- ���� 3-1. lec_time�� ũ�� '�������', lec_point�� ũ�� '��Ÿ����', ���� ������ ' �Ϲݰ���'���� ���� �����޴� �������� �ۼ��Ͻÿ�.
SELECT decode(sign(lec_time-lec_point),1,'�������',-1,'��Ÿ����',0,'�Ϲݰ���')
FROM lecture;

SELECT sign(1+100),sign(-5000),sign(100-100)
FROM dual;

SELECT decode(sign(100-200), 1, '���', -1, '����', 0, '0')
FROM dual;
-- null�� ���������ʾҴ�, �𸥴ٶ�� �����̹Ƿ� ������ �� �� ����.
-- 
SELECT comm 
FROM emp
ORDER BY comm ASC;

����. ���ǽð��� ������ ������ '�Ϲݰ���'�� ���� ���� �� ���ĵ� �ϰ�ʹٸ�?
SELECT decode(lec_time, lec_point, '�Ϲݰ���') AS ����
FROM lecture
ORDER BY ����;



 ����: �����Ͽ� �ش����ڿ� 01�� �ٿ��� 4�ڸ� ��ȣ�� �����, 
 ȭ���Ͽ� 11, �����Ͽ� 21, ����Ͽ�, 31, �ݿ��Ͽ� 41, ����Ͽ� 51,�Ͽ��Ͽ� 61�� �ٿ��� 4�ڸ� ��ȣ�� ����ٰ� �� �� 
 ��ȣ�� SELECT�ϴ� SQL�� ����� ���ÿ�.

-- ����ȯ�Լ�
-- to_char, to_number, to_date

SELECT to_char(sysdate,'YYYY-MM-DD')
FROM dual;

SELECT to_char(sysdate,'day')
FROM dual;

SELECT to_char(sysdate,'DD') || decode(to_char(sysdate,'day'), 'ȭ����', '11')
FROM dual;

SELECT 
            to_char(sysdate,'DD') || 
            decode(to_char(sysdate,'day'), '������', '01',
                                                               'ȭ����', '11',
                                                               '������', '21',
                                                               '�����', '31',
                                                               '�ݿ���', '41',
                                                               '�����', '51',
                                                               '�Ͽ���', '61') AS ��ȣ
FROM dual;

--��������
--���� : ������̺��� job�� clerk�� ����� �޿� ��,  salesman�� �����
--�޿��� ���� ���ϰ� ������ job�� ���ؼ��� ��Ÿ ������ ���Ͻÿ�.

SELECT *
FROM emp;

SELECT  sum(decode(JOB,'CLERK',sal,NULL)) ,
              sum(decode(JOB,'SALESMAN',sal,NULL)),
              sum(decode(JOB,'CLERK',NULL,'SALESMAN',NULL, sal)) etc_sal,
              sum(sal)
FROM emp;

SELECT  sum(decode(JOB,'CLERK',sal,NULL)) AS CLERK  ,
              sum(decode(JOB,'MANAGER',sal) )AS MANAGER ,
              sum(decode(JOB,'CLERK',NULL,'MANAGER',NULL,sal))AS ETC
FROM dept, emp
WHERE dept.deptno=emp.deptno;

SELECT dname, sum(decode(JOB,'CLERK',sal,NULL)) AS CLERK  ,
                          sum(decode(JOB,'MANAGER',sal) )AS MANAGER ,
                          sum(decode(JOB,'CLERK',NULL,'MANAGER',NULL,sal))AS ETC                          
FROM dept, emp
WHERE dept.deptno=emp.deptno
GROUP BY dname;

SELECT dname,
             decode(emp.JOB,'CLERK',sal,NULL) AS CLERK  ,
             decode(emp.JOB,'MANAGER',sal,NULL) AS MANAGER ,
             decode(emp.JOB,'CLERK',NULL,'MANAGER',NULL,sal) AS ETC          
FROM dept, emp
WHERE dept.deptno=emp.deptno
ORDER BY dname;

SELECT dname,
             sum(decode(emp.JOB,'CLERK',sal,NULL)) AS CLERK  ,
             sum(decode(emp.JOB,'MANAGER',sal,NULL)) AS MANAGER ,
             sum(decode(emp.JOB,'CLERK',NULL,'MANAGER',NULL,sal)) AS ETC          
FROM dept, emp
WHERE dept.deptno=emp.deptno
GROUP BY grouping SETS(dname,emp.JOB,emp.mgr);

SELECT dname , CLERK , MANAGER , ETC
FROM (SELECT dname,
             decode(emp.JOB,'CLERK',sal,NULL) AS CLERK  ,
             decode(emp.JOB,'MANAGER',sal,NULL) AS MANAGER ,
             decode(emp.JOB,'CLERK',NULL,'MANAGER',NULL,sal) AS ETC          
FROM dept, emp
WHERE dept.deptno=emp.deptno
ORDER BY dname);


�������� 
- �ο쿡 �ִ� �̸��� �÷������� ���� ����� �� �ִ�.
emp ���̺��� ����̸��� �� �࿡ ���, ������ 3�� �����ִ� �������� �ۼ��Ͻÿ�

SELECT * FROM emp;

SELECT empno, listagg(ENAME,',') WITHIN GROUP BY

CREATE TABLE TEST11 (
    COLL   VARCHAR2(20),         
    DEPT   VARCHAR2(20),                  
    FRE    NUMBER,   
    SUP    NUMBER,   
    JUN    NUMBER,   
    SEN    NUMBER,
    CONSTRAINT TEST11_PK PRIMARY KEY (COLL,DEPT)
                    );  
INSERT INTO TEST11 VALUES('��������','�װ����ְ��а�',120, 140, 140, 120);
INSERT INTO TEST11 VALUES('��������','�����а�',    240, 260, 240, 240);
INSERT INTO TEST11 VALUES('��������','�������а�',    118, 138, 136, 126);
INSERT INTO TEST11 VALUES('��������','������а�',    123, 141, 140, 120);
INSERT INTO TEST11 VALUES('��������','���ڰ��а�',    126, 141, 140, 128);
INSERT INTO TEST11 VALUES('��������','�����а�',    128, 132, 142, 126);
INSERT INTO TEST11 VALUES('��������','ȭ�а��а�',    122, 141, 141, 122);
INSERT INTO TEST11 VALUES('��������','������а�',    120, 140, 140, 120);
INSERT INTO TEST11 VALUES('��������','��ǻ�Ͱ��а�',  124, 145, 142, 121);
INSERT INTO TEST11 VALUES('��������','�������а�',    126, 144, 140, 120);
INSERT INTO TEST11 VALUES('��������','�ڵ�ȭ���а�',  122, 142, 144, 125);
INSERT INTO TEST11 VALUES('��������','����ڰ��а�',  121, 142, 143, 124);
COMMIT;

SELECT * FROM test11;

SELECT columntorow (

-- �÷������� �ִ� �а��� �������� �ο췹���� ������ ����Ͻÿ�