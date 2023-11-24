t_letitbe를 두번 읽어서 처리한다 - 한가지 문제제기
왜 별칭을 A로 통일했나

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

SELECT -from절 사이에 조건문을 사용할 수 있다.
1) DECODE - 크다, 작다는 비료할 수 없다.

SELECT decode(sign(1-2),1,'앞에 숫자가 크다.',-1, '뒤에숫자가크다' 0, '같다')
FROM dual;

SELECT greatest(1,5,3)

2) case문

SELECT deptno,
       CASE deptno
         WHEN 10 THEN 'ACCOUNTING'
         WHEN 20 THEN 'RESEARCH'
         WHEN 30 THEN 'SALES'
         ELSE 'OPERATIONS'
       END AS "Dept Name"
  FROM dept;
 


1. tmep의 자료를 salary로 분류하여 30,000,000이하는 'D', 30,000,000 초과 50,000,000이하는 'C'
50,000,000 초과 70,000,000이하는 'B', 70,000,000 초과는 'A'라고 등급을 분류하여 등급별 인원수를 알고 싶다.

SELECT   
           COUNT(CASE  WHEN salary > 70000000 THEN 'A' END) A ,
           COUNT(CASE WHEN salary BETWEEN 50000001 AND 70000000 THEN 'B' END) B,
           COUNT(CASE WHEN salary BETWEEN 30000001 AND 50000000 THEN 'C' END) C,
           COUNT(CASE WHEN salary <= 30000000 THEN 'D' END) D
FROM temp;

SELECT 등급, count(등급)
FROM(   
           SELECT
               CASE
                   WHEN salary <= 30000000 THEN 'D' 
                   WHEN salary <= 50000000 THEN 'C' 
                   WHEN salary <= 70000000 THEN 'B' 
                   WHEN salary > 70000000 THEN 'A' 
               END AS "등급"               
            FROM temp
            )
 GROUP BY 등급
 ORDER BY 등급;

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
판매개수 : INDATE_VC 별 sum(QTY_NU), 
판매가격 : count * PRICE_NU

SELECT INDATE_VC AS 판매날짜, sum(QTY_NU)||'개' AS 판매개수, sum(QTY_NU*price_nu)||'원' AS 판매가격
FROM T_ORDERBASKET
GROUP BY INDATE_VC ;


SELECT GUBUN_VC, count(QTY_NU) 개수
FROM T_ORDERBASKET
GROUP BY GUBUN_VC;

 
SELECT INDATE_VC AS 판매날짜, GUBUN_VC, QTY_NU*price_nu
FROM T_ORDERBASKET;


SELECT INDATE_VC AS 판매날짜, sum(QTY_NU)||'개' AS 판매개수, sum(QTY_NU*price_nu)||'원' AS 판매가격
FROM T_ORDERBASKET
GROUP BY INDATE_VC ;

SELECT sum(A.tot) 
FROM (
             SELECT ROWNUM rno 
             FROM dept 
             WHERE ROWNUM < 3);
                                  
SELECT decode(b.rno,1,indate_vc,2,'총계') FROM t_orderbasket,
(SELECT ROWNUM rno FROM dept WHERE ROWNUM <3)b
GROUP BY decode(b.rno,1,indate_vc,2,'총계');

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
                                  
                                  
                                  
SELECT decode(b.rno,1,indate_vc,2,'총계') FROM t_orderbasket,
(SELECT ROWNUM rno FROM dept WHERE ROWNUM <3)b
GROUP BY decode(b.rno,1,indate_vc,2,'총계');


SELECT decode(b.rno,1,indate_vc,2,'총계') AS 판매날짜, 
             sum(QTY_NU)||'개' AS 판매개수, 
             sum(QTY_NU*price_nu)||'원' AS 판매가격
FROM t_orderbasket,
                                  (SELECT ROWNUM rno 
                                  FROM dept 
                                  WHERE ROWNUM < 3) b
GROUP BY decode(b.rno, 1, indate_vc, 2, '총계')
ORDER BY 판매날짜;

3문제

또 다른 문제 더 - CASE...when구분을 활용할것
member1 테이블을 이용하여 아이디가 존재하지 않으면 -1을 반환하고
아이디가 존재하면 비번까지 비교하여 같으면 1을 반환하고
다르면 0을 반환하는 select문을 작성하시오.

SELECT m_name
FROM member1
WHERE m_id =:ID
AND m_pw=:pw;

-- 아래문장은 조건을 만족하지 않을 때 2건이 조회된다.
-- 두건에 대해 모두 비교하고 결과를 반환하기 때문
SELECT CASE WHEN m_id =:ID  THEN 0 ELSE -1 END FROM member1;

-- 만일 회원수가 5만명일 결우 5만건을 조회한다는 것이니까 비효율적
-- 그렇다면 맨위에 한 건만 사용해도 되는거니까 첫번째 로우만 출력하면 된다.
-- 그래서 rownum이라는 예약어를 사용하였다 , 이것이 stop key의 역할을 한다.
         
SELECT CASE WHEN m_id =:ID THEN 0 END FROM member1
WHERE ROWNUM =1;
-- 사원번호를 채번하는데 최대값에서 1을 더한값을 새로운 사원의 사번으로 채번하는 경우를 생각해보면..
SELECT max(empno) FROM emp;

SELECT /*+index_desc(emp pk_emp) */ empno
FROM emp;

SELECT /*+index_desc(emp pk_emp) */ empno+1
FROM emp;

SELECT /*+index_desc(emp pk_emp) */ empno+1
FROM emp
WHERE ROWNUM=1;

-1이면 아이디가 존재하지않는다
1이면 아이디와 비번 모두 일치한다
0이면 아이디는 존재하지만 비번은 불일치

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

SELECT ROWNUM "순번"
           , MOD(ROWNUM,3) AS "y축좌표값"
           , CEIL(ROWNUM/3) AS "로우값"
  FROM emp;   


SELECT * FROM test11;

 SELECT
                A.dept, b.rno AS "학년"
               ,decode(b.rno,1,A.fre, 2, A.sup, 3, A.jun, 4, A.sen) AS "정원수"
   FROM  (
                 SELECT dept, fre, sup, jun, sen FROM test11
                 WHERE dept = '항공우주공학과'
               ) A,
               (
                  SELECT ROWNUM rno FROM dept WHERE ROWNUM  <= 4               
               )b;
               
SELECT *               
FROM(SELECT dept, fre, sup, jun, sen FROM test11
                 WHERE dept = '항공우주공학과'
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
SELECT '총계',
             sum(decode(JOB, 'CLERK',sal)) ,
             sum(decode(JOB,'MANAGER',sal)) ,
             sum(decode(JOB,'CLERK',NULL,'MANAGER',NULL,sal)),
             sum(sal)            
FROM emp;
-----------------------------------------------------------------------
-- 테이블을 한번만 읽고 처리하기

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
 
-- 서브쿼리에서 사용한 컬럼은 주쿼리에서 사용불가하지만 인라인뷰에서 사용한 컬럼은
          
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




SELECT decode(b.rno,1,dname,2,'총계') AS DNAME,CLERK, MANAGER, ETC
FROM (
            SELECT dname, 
                              sum(DECODE (JOB, 'CLERK', sal)) AS "CLERK",
                              sum(DECODE (JOB, 'MANAGER', sal)) AS "MANAGER",
                              sum(DECODE (JOB,  'CLERK', NULL,  'MANAGER', NULL, sal)) AS "ETC",
                              sum(sal)
            FROM dept, emp
WHERE dept.deptno=emp.deptno ), (SELECT ROWNUM rno FROM dept WHERE ROWNUM < 3)b
GROUP BY decode(b.rno,1,dname,2,'총계')
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
        decode(b.rno,1,dname,2,'총계') AS "dname",sum(clerk) AS "CLERK" , sum(MANAGER) AS "MANAGER", sum(etc) AS "ETC",sum(DEPT_SAL) AS DEPT_SAL
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
GROUP BY decode(b.rno,1,dname,2,'총계')
ORDER BY decode(b.rno,1,dname,2,'총계');


SELECT decode(b.rno,1,dname,2,'총계') DNAME, sum(CLERK) CLERK, sum(MANAGER) MANAGER, sum(ETC) ETC ,sum(sal) DEPT_SAL
FROM (
            SELECT dname, 
             decode(JOB, 'CLERK',sal) CLERK,
             decode(JOB,'MANAGER',sal) MANAGER,
             decode(JOB,'CLERK',NULL,'MANAGER',NULL,sal) ETC,
             sal
FROM dept, emp
WHERE dept.deptno=emp.deptno ), (SELECT ROWNUM rno FROM dept WHERE ROWNUM < 3)b
GROUP BY decode(b.rno,1,dname,2,'총계')
ORDER BY DNAME ;

SALESMAN

-------------------------------------------------
SELECT 
        decode(b.rno,1,dname,2,'총계') AS "dname",sum(clerk) AS "CLERK" , sum(SALESMAN) AS "SALESMAN", sum(etc) AS "ETC",sum(DEPT_SAL) AS DEPT_SAL
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
GROUP BY decode(b.rno,1,dname,2,'총계')
ORDER BY decode(b.rno,1,dname,2,'총계');
-------------------------------------------------
SELECT decode(b.rno,1,dname,2,'총계') DNAME, sum(CLERK) CLERK, sum(SALESMAN) SALESMAN, sum(ETC) ETC ,sum(sal) DEPT_SAL
FROM (
            SELECT dname, 
             decode(JOB,'CLERK',sal) CLERK,
             decode(JOB,'SALESMAN',sal) SALESMAN,
             decode(JOB,'CLERK',NULL,'SALESMAN',NULL,sal) ETC,
             sal
FROM dept, emp
WHERE dept.deptno=emp.deptno ), (SELECT ROWNUM rno FROM dept WHERE ROWNUM < 3)b
GROUP BY decode(b.rno,1,dname,2,'총계')
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
가능하다면 테이블은 한 번만 읽어서 처리한다
경우의 수를 줄인다 > 인라인뷰 또는 GROUP BY
조인을 하기 전에 미리 먼저 그룹핑을 한다 (14건이 3건으로 줄어들었다)
그룹핑을 하면서 그룹함수가 필요한 부분(sum(decode패턴))이 있다면 같이 해도 된다.
대용량데이터베이스 키워드가 들어간 책에서는 무조건 볼 수 있는 sum(decode())문
왜 조인을 했을까 
부서번호가 아니라 부서명을 출력하는 것이 직관적이니까

