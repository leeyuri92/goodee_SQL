t_letitbe�� �ι� �о ó���Ѵ� - �Ѱ��� ��������
�� ��Ī�� A�� �����߳�

SELECT
              *
  FROM (
                 SELECT
                              seq_vc
                             ,decode(mod(seq_vc,2),1, words_vc) A
                    FROM t_letitbe  
                UNION ALL
                 SELECT
                              seq_vc
                             ,decode(mod(seq_vc,2),0, words_vc) A
                    FROM t_letitbe               
             )    ;
             
             
SELECT loc FROM dept
UNION ALL
SELECT dname FROM dept;

SELECT count(comm), count(empno) FROM emp;

SELECT decode(JOB,'CLERK', sal, NULL) FROM emp;


SELECT deptno, sum(sal), count(sal), max(sal), min(sal), avg(sal)
FROM emp
GROUP BY deptno;

SELECT -from�� ���̿� ���ǹ��� ����� �� �ִ�.
1) DECODE - ũ��, �۴ٴ� ����� �� ����.

SELECT decode(sign(1-2),1,'�տ� ���ڰ� ũ��.',-1, '�ڿ����ڰ�ũ��' 0, '����')
FROM dual;

SELECT greatest(1,5,3)

2) case��

SELECT deptno,
       CASE deptno
         WHEN 10 THEN 'ACCOUNTING'
         WHEN 20 THEN 'RESEARCH'
         WHEN 30 THEN 'SALES'
         ELSE 'OPERATIONS'
       END AS "Dept Name"
  FROM dept;
 


1. tmep�� �ڷḦ salary�� �з��Ͽ� 30,000,000���ϴ� 'D', 30,000,000 �ʰ� 50,000,000���ϴ� 'C'
50,000,000 �ʰ� 70,000,000���ϴ� 'B', 70,000,000 �ʰ��� 'A'��� ����� �з��Ͽ� ��޺� �ο����� �˰� �ʹ�.

SELECT   
           COUNT(CASE  WHEN salary > 70000000 THEN 'A' END) A ,
           COUNT(CASE WHEN salary BETWEEN 50000001 AND 70000000 THEN 'B' END) B,
           COUNT(CASE WHEN salary BETWEEN 30000001 AND 50000000 THEN 'C' END) C,
           COUNT(CASE WHEN salary <= 30000000 THEN 'D' END) D
FROM temp;

SELECT ���, count(���)
FROM(   
           SELECT
               CASE
                   WHEN salary <= 30000000 THEN 'D' 
                   WHEN salary <= 50000000 THEN 'C' 
                   WHEN salary <= 70000000 THEN 'B' 
                   WHEN salary > 70000000 THEN 'A' 
               END AS "���"               
            FROM temp
            )
 GROUP BY ���
 ORDER BY ���;

 SELECT
             CASE WHEN salary <= 30000000 THEN 'D'
             WHEN salary <=50000000 THEN 'C'
             WHEN salary <=70000000 THEN 'B'
             WHEN salary > 70000000 THEN 'A'
             END c,
             count(*)
  FROM temp
  GROUP BY  CASE WHEN salary <= 30000000 THEN 'D'
             WHEN salary <=50000000 THEN 'C'
             WHEN salary <=70000000 THEN 'B'
             WHEN salary > 70000000 THEN 'A'
             END  ; 
             
             
2. 
�ǸŰ��� : INDATE_VC �� sum(QTY_NU), 
�ǸŰ��� : count * PRICE_NU

SELECT INDATE_VC AS �Ǹų�¥, sum(QTY_NU)||'��' AS �ǸŰ���, sum(QTY_NU*price_nu)||'��' AS �ǸŰ���
FROM T_ORDERBASKET
GROUP BY INDATE_VC ;


SELECT GUBUN_VC, count(QTY_NU) ����
FROM T_ORDERBASKET
GROUP BY GUBUN_VC;

 
SELECT INDATE_VC AS �Ǹų�¥, GUBUN_VC, QTY_NU*price_nu
FROM T_ORDERBASKET;


SELECT INDATE_VC AS �Ǹų�¥, sum(QTY_NU)||'��' AS �ǸŰ���, sum(QTY_NU*price_nu)||'��' AS �ǸŰ���
FROM T_ORDERBASKET
GROUP BY INDATE_VC ;

SELECT sum(A.tot) 
FROM (
             SELECT ROWNUM rno 
             FROM dept 
             WHERE ROWNUM < 3);
                                  
SELECT decode(b.rno,1,indate_vc,2,'�Ѱ�') FROM t_orderbasket,
(SELECT ROWNUM rno FROM dept WHERE ROWNUM <3)b
GROUP BY decode(b.rno,1,indate_vc,2,'�Ѱ�');

SELECT *
FROM t_orderbasket,
                                  (SELECT ROWNUM rno 
                                  FROM dept 
                                  WHERE ROWNUM < 3);

SELECT indate_vc 
FROM t_orderbasket,
                                  (SELECT ROWNUM rno 
                                  FROM dept 
                                  WHERE ROWNUM < 3);
                                  
SELECT 1 FROM dual
UNION ALL
SELECT 2 FROM dual;
                                  
                                  
                                  
SELECT decode(b.rno,1,indate_vc,2,'�Ѱ�') FROM t_orderbasket,
(SELECT ROWNUM rno FROM dept WHERE ROWNUM <3)b
GROUP BY decode(b.rno,1,indate_vc,2,'�Ѱ�');


SELECT decode(b.rno,1,indate_vc,2,'�Ѱ�') AS �Ǹų�¥, 
             sum(QTY_NU)||'��' AS �ǸŰ���, 
             sum(QTY_NU*price_nu)||'��' AS �ǸŰ���
FROM t_orderbasket,
                                  (SELECT ROWNUM rno 
                                  FROM dept 
                                  WHERE ROWNUM < 3) b
GROUP BY decode(b.rno, 1, indate_vc, 2, '�Ѱ�')
ORDER BY �Ǹų�¥;

3����

�� �ٸ� ���� �� - CASE...when������ Ȱ���Ұ�
member1 ���̺��� �̿��Ͽ� ���̵� �������� ������ -1�� ��ȯ�ϰ�
���̵� �����ϸ� ������� ���Ͽ� ������ 1�� ��ȯ�ϰ�
�ٸ��� 0�� ��ȯ�ϴ� select���� �ۼ��Ͻÿ�.

SELECT m_name
FROM member1
WHERE m_id =:ID
AND m_pw=:pw;

-- �Ʒ������� ������ �������� ���� �� 2���� ��ȸ�ȴ�.
-- �ΰǿ� ���� ��� ���ϰ� ����� ��ȯ�ϱ� ����
SELECT CASE WHEN m_id =:ID  THEN 0 ELSE -1 END FROM member1;

-- ���� ȸ������ 5������ ��� 5������ ��ȸ�Ѵٴ� ���̴ϱ� ��ȿ����
-- �׷��ٸ� ������ �� �Ǹ� ����ص� �Ǵ°Ŵϱ� ù��° �ο츸 ����ϸ� �ȴ�.
-- �׷��� rownum�̶�� ���� ����Ͽ��� , �̰��� stop key�� ������ �Ѵ�.
         
SELECT CASE WHEN m_id =:ID THEN 0 END FROM member1
WHERE ROWNUM =1;
-- �����ȣ�� ä���ϴµ� �ִ밪���� 1�� ���Ѱ��� ���ο� ����� ������� ä���ϴ� ��츦 �����غ���..
SELECT max(empno) FROM emp;

SELECT /*+index_desc(emp pk_emp) */ empno
FROM emp;

SELECT /*+index_desc(emp pk_emp) */ empno+1
FROM emp;

SELECT /*+index_desc(emp pk_emp) */ empno+1
FROM emp
WHERE ROWNUM=1;

-1�̸� ���̵� ���������ʴ´�
1�̸� ���̵�� ��� ��� ��ġ�Ѵ�
0�̸� ���̵�� ���������� ����� ����ġ

SELECT CASE WHEN m_id =:ID THEN 0
              ELSE -1
              END
   FROM member1
WHERE ROWNUM =1;
          

SELECT result
FROM (
            SELECT CASE WHEN m_id =:ID THEN 
                             CASE WHEN m_pw=:pw THEN 1
                             ELSE 0
                             END
                         ELSE -1
                        END AS result
            FROM member1
            ORDER BY result desc)
WHERE ROWNUM =1;


SELECT ROWNUM rno FROM emp;

SELECT ROWNUM rno, MOD(ROWNUM,3) mno FROM emp;        

SELECT ROWNUM "����"
           , MOD(ROWNUM,3) AS "y����ǥ��"
           , CEIL(ROWNUM/3) AS "�ο찪"
  FROM emp;   


SELECT * FROM test11;

 SELECT
                A.dept, b.rno AS "�г�"
               ,decode(b.rno,1,A.fre, 2, A.sup, 3, A.jun, 4, A.sen) AS "������"
   FROM  (
                 SELECT dept, fre, sup, jun, sen FROM test11
                 WHERE dept = '�װ����ְ��а�'
               ) A,
               (
                  SELECT ROWNUM rno FROM dept WHERE ROWNUM  <= 4               
               )b;
               
SELECT *               
FROM(SELECT dept, fre, sup, jun, sen FROM test11
                 WHERE dept = '�װ����ְ��а�'
               ) A,
               (
                  SELECT ROWNUM rno FROM dept WHERE ROWNUM  <= 4               
               )b;
               
               
SELECT *
FROM dept;


SELECT *
FROM emp;

SELECT 
             decode(JOB, 'CLERK',sal) CLERK,
             decode(JOB,'MANAGER',sal)MANAGER,
             decode(JOB,'CLERK',NULL,'MANAGER',NULL,sal)                         
FROM emp;

SELECT deptno,
             sum(decode(JOB, 'CLERK',sal)) CLERK,
             sum(decode(JOB,'MANAGER',sal)) MANAGER,
             sum(decode(JOB,'CLERK',NULL,'MANAGER',NULL,sal)),
             sum(sal)            
FROM emp
GROUP BY deptno;

SELECT dname,
             sum(decode(JOB, 'CLERK',sal)) CLERK,
             sum(decode(JOB,'MANAGER',sal)) MANAGER,
             sum(decode(JOB,'CLERK',NULL,'MANAGER',NULL,sal)) ETC,
             sum(sal) DEPT_SAL           
FROM emp, dept
WHERE emp.deptno=dept.deptno
GROUP BY dept.dname;

SELECT dname,
             sum(decode(JOB, 'CLERK',sal)) CLERK,
             sum(decode(JOB,'MANAGER',sal)) MANAGER,
             sum(decode(JOB,'CLERK',NULL,'MANAGER',NULL,sal)) ETC,
             sum(sal) DEPT_SAL           
FROM emp, dept
WHERE emp.deptno=dept.deptno
GROUP BY dept.dname
UNION ALL
SELECT '�Ѱ�',
             sum(decode(JOB, 'CLERK',sal)) ,
             sum(decode(JOB,'MANAGER',sal)) ,
             sum(decode(JOB,'CLERK',NULL,'MANAGER',NULL,sal)),
             sum(sal)            
FROM emp;
-----------------------------------------------------------------------
-- ���̺��� �ѹ��� �а� ó���ϱ�

SELECT *
FROM (
            SELECT deptno,
             sum(decode(JOB, 'CLERK',sal)) ,
             sum(decode(JOB,'MANAGER',sal)) ,
             sum(decode(JOB,'CLERK',NULL,'MANAGER',NULL,sal)),
             sum(sal)
             FROM emp
             GROUP BY deptno
           );
 
-- ������������ ����� �÷��� ���������� ���Ұ������� �ζ��κ信�� ����� �÷���
          
 SELECT dname,CLERK, MANAGER, ETC
 FROM(
             SELECT *
             FROM (
                          SELECT deptno,
                                       sum(decode(JOB, 'CLERK',sal))CLERK ,
                                       sum(decode(JOB,'MANAGER',sal))MANAGER ,
                                       sum(decode(JOB,'CLERK',NULL,'MANAGER',NULL,sal)) ETC,
                                       sum(sal) 
                           FROM emp
             GROUP BY deptno
           )
       )E, dept d
WHERE E.deptno = d.deptno;




SELECT decode(b.rno,1,dname,2,'�Ѱ�') AS DNAME,CLERK, MANAGER, ETC
FROM (
            SELECT dname, 
                              sum(DECODE (JOB, 'CLERK', sal)) AS "CLERK",
                              sum(DECODE (JOB, 'MANAGER', sal)) AS "MANAGER",
                              sum(DECODE (JOB,  'CLERK', NULL,  'MANAGER', NULL, sal)) AS "ETC",
                              sum(sal)
            FROM dept, emp
WHERE dept.deptno=emp.deptno ), (SELECT ROWNUM rno FROM dept WHERE ROWNUM < 3)b
GROUP BY decode(b.rno,1,dname,2,'�Ѱ�')
ORDER BY DNAME ;



SELECT ROWNUM rno FROM dept WHERE ROWNUM < 3;


SELECT dname, 
             decode(JOB, 'CLERK',sal) CLERK,
             decode(JOB,'MANAGER',sal)MANAGER,
             decode(JOB,'CLERK',NULL,'MANAGER',NULL,sal) ETC
FROM dept,emp
WHERE dept.deptno=emp.deptno;


SELECT dname, 
             decode(JOB, 'CLERK',sal) CLERK,
             decode(JOB,'MANAGER',sal)MANAGER,
             decode(JOB,'CLERK',NULL,'MANAGER',NULL,sal) ETC
FROM dept,emp
WHERE dept.deptno=emp.deptno
;

SELECT 
        decode(b.rno,1,dname,2,'�Ѱ�') AS "dname",sum(clerk) AS "CLERK" , sum(MANAGER) AS "MANAGER", sum(etc) AS "ETC",sum(DEPT_SAL) AS DEPT_SAL
FROM 
        (
        SELECT dname, clerk, MANAGER, etc, dept_sal
         FROM
            (
            SELECT 
                    deptno, CLERK, MANAGER, ETC, DEPT_SAL        
             FROM
                    (  
                    SELECT deptno,
                              sum(DECODE (JOB, 'CLERK', sal)) AS "CLERK",
                              sum(DECODE (JOB, 'MANAGER', sal)) AS "MANAGER",
                              sum(DECODE (JOB,  'CLERK', NULL,  'MANAGER', NULL, sal)) AS "ETC",
                              sum(sal) AS "DEPT_SAL"
                     FROM emp 
                    GROUP BY deptno
                    )
            )E, dept d
        WHERE E.deptno = d.deptno
        )A,
        (SELECT ROWNUM rno FROM dept WHERE ROWNUM < 3)b
GROUP BY decode(b.rno,1,dname,2,'�Ѱ�')
ORDER BY decode(b.rno,1,dname,2,'�Ѱ�');


SELECT decode(b.rno,1,dname,2,'�Ѱ�') DNAME, sum(CLERK) CLERK, sum(MANAGER) MANAGER, sum(ETC) ETC ,sum(sal) DEPT_SAL
FROM (
            SELECT dname, 
             decode(JOB, 'CLERK',sal) CLERK,
             decode(JOB,'MANAGER',sal) MANAGER,
             decode(JOB,'CLERK',NULL,'MANAGER',NULL,sal) ETC,
             sal
FROM dept, emp
WHERE dept.deptno=emp.deptno ), (SELECT ROWNUM rno FROM dept WHERE ROWNUM < 3)b
GROUP BY decode(b.rno,1,dname,2,'�Ѱ�')
ORDER BY DNAME ;

SALESMAN

-------------------------------------------------
SELECT 
        decode(b.rno,1,dname,2,'�Ѱ�') AS "dname",sum(clerk) AS "CLERK" , sum(SALESMAN) AS "SALESMAN", sum(etc) AS "ETC",sum(DEPT_SAL) AS DEPT_SAL
FROM 
        (
        SELECT dname, clerk, SALESMAN, etc, dept_sal
         FROM
            (
            SELECT 
                    deptno, CLERK, SALESMAN, ETC, DEPT_SAL        
             FROM
                    (  
                    SELECT deptno,
                              sum(DECODE (JOB, 'CLERK', sal)) AS "CLERK",
                              sum(DECODE (JOB, 'SALESMAN', sal)) AS "SALESMAN",
                              sum(DECODE (JOB,  'CLERK', NULL,  'SALESMAN', NULL, sal)) AS "ETC",
                              sum(sal) AS "DEPT_SAL"
                     FROM emp 
                    GROUP BY deptno
                    )
            )E, dept d
        WHERE E.deptno = d.deptno
        )A,
        (SELECT ROWNUM rno FROM dept WHERE ROWNUM < 3)b
GROUP BY decode(b.rno,1,dname,2,'�Ѱ�')
ORDER BY decode(b.rno,1,dname,2,'�Ѱ�');
-------------------------------------------------
SELECT decode(b.rno,1,dname,2,'�Ѱ�') DNAME, sum(CLERK) CLERK, sum(SALESMAN) SALESMAN, sum(ETC) ETC ,sum(sal) DEPT_SAL
FROM (
            SELECT dname, 
             decode(JOB,'CLERK',sal) CLERK,
             decode(JOB,'SALESMAN',sal) SALESMAN,
             decode(JOB,'CLERK',NULL,'SALESMAN',NULL,sal) ETC,
             sal
FROM dept, emp
WHERE dept.deptno=emp.deptno ), (SELECT ROWNUM rno FROM dept WHERE ROWNUM < 3)b
GROUP BY decode(b.rno,1,dname,2,'�Ѱ�')
ORDER BY DNAME ;


SELECT *
FROM (
            SELECT dname, 
             decode(JOB, 'CLERK',sal) CLERK,
             decode(JOB,'SALESMAN',sal) SALESMAN,
             decode(JOB,'CLERK',NULL,'SALESMAN',NULL,sal) ETC,
             sal
FROM dept, emp
WHERE dept.deptno=emp.deptno ), (SELECT ROWNUM rno FROM dept WHERE ROWNUM < 3)b


-------------------------
�����ϴٸ� ���̺��� �� ���� �о ó���Ѵ�
����� ���� ���δ� > �ζ��κ� �Ǵ� GROUP BY
������ �ϱ� ���� �̸� ���� �׷����� �Ѵ� (14���� 3������ �پ�����)
�׷����� �ϸ鼭 �׷��Լ��� �ʿ��� �κ�(sum(decode����))�� �ִٸ� ���� �ص� �ȴ�.
��뷮�����ͺ��̽� Ű���尡 �� å������ ������ �� �� �ִ� sum(decode())��
�� ������ ������ 
�μ���ȣ�� �ƴ϶� �μ����� ����ϴ� ���� �������̴ϱ�

