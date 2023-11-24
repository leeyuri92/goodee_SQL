SELECT *
FROM emp;

SELECT *
FROM dept;

SELECT 1rno
FROM dual
UNION ALL
SELECT 2
FROM dual;

SELECT ROWNUM rno
FROM dept
WHERE ROWNUM <3;

SELECT deptno,
             decode(JOB,'CLERK',sal), 
             decode(JOB,'SALESMAN',sal), 
             decode(JOB,'CLERK',NULL,'SALESMAN',NULL,sal)
FROM emp;

SELECT deptno,
             sum(decode(JOB,'CLERK',sal)) CLERK, 
             sum(decode(JOB,'SALESMAN',sal)) SALESMAN, 
             sum(decode(JOB,'CLERK',NULL,'SALESMAN',NULL,sal)) ETC,
             sum(sal) DEPT_SAL             
FROM emp
GROUP BY deptno;

SELECT deptno, CLERK, SALESMAN, ETC, DEPT_SAL
FROM ( SELECT deptno,
                           sum(decode(JOB,'CLERK',sal)) CLERK, 
                           sum(decode(JOB,'SALESMAN',sal)) SALESMAN, 
                           sum(decode(JOB,'CLERK',NULL,'SALESMAN',NULL,sal)) ETC,
                           sum(sal) DEPT_SAL             
             FROM emp
             GROUP BY deptno) ;
             
SELECT deptno, dname
FROM dept;

SELECT *
FROM (
             SELECT deptno, CLERK, SALESMAN, ETC, DEPT_SAL
             FROM ( SELECT deptno,
                                        sum(decode(JOB,'CLERK',sal)) CLERK, 
                                        sum(decode(JOB,'SALESMAN',sal)) SALESMAN, 
                                        sum(decode(JOB,'CLERK',NULL,'SALESMAN',NULL,sal)) ETC,
                                        sum(sal) DEPT_SAL             
                           FROM emp
                           GROUP BY deptno) 
            ) A, ( 
                 SELECT deptno, dname
                 FROM dept            
            ) b;
             
SELECT *
FROM (
             SELECT deptno, CLERK, SALESMAN, ETC, DEPT_SAL
             FROM ( SELECT deptno,
                                        sum(decode(JOB,'CLERK',sal)) CLERK, 
                                        sum(decode(JOB,'SALESMAN',sal)) SALESMAN, 
                                        sum(decode(JOB,'CLERK',NULL,'SALESMAN',NULL,sal)) ETC,
                                        sum(sal) DEPT_SAL             
                           FROM emp
                           GROUP BY deptno) 
            ) A, ( 
                 SELECT deptno, dname
                 FROM dept            
            ) b
WHERE A.deptno=b.deptno; 
             
SELECT dname, A.deptno, CLERK, SALESMAN, ETC, DEPT_SAL
FROM (
             SELECT deptno, CLERK, SALESMAN, ETC, DEPT_SAL
             FROM ( SELECT deptno,
                                        sum(decode(JOB,'CLERK',sal)) CLERK, 
                                        sum(decode(JOB,'SALESMAN',sal)) SALESMAN, 
                                        sum(decode(JOB,'CLERK',NULL,'SALESMAN',NULL,sal)) ETC,
                                        sum(sal) DEPT_SAL             
                           FROM emp
                           GROUP BY deptno) 
            ) A, ( 
                 SELECT deptno, dname
                 FROM dept            
            ) b
WHERE A.deptno=b.deptno; 

SELECT *
FROM (
             SELECT dname, A.deptno, CLERK, SALESMAN, ETC, DEPT_SAL
             FROM (
                          SELECT deptno, CLERK, SALESMAN, ETC, DEPT_SAL
                          FROM ( SELECT deptno,
                                                     sum(decode(JOB,'CLERK',sal)) CLERK, 
                                                     sum(decode(JOB,'SALESMAN',sal)) SALESMAN, 
                                                     sum(decode(JOB,'CLERK',NULL,'SALESMAN',NULL,sal)) ETC,
                                                     sum(sal) DEPT_SAL             
                                        FROM emp
                                        GROUP BY deptno) 
                         ) A, ( 
                                 dept            
                                ) b
             WHERE A.deptno=b.deptno
            )c,(
                SELECT 1 rno
                FROM dual
                UNION ALL
                SELECT 2
                FROM dual
              )d;
              
              
SELECT decode(rno,1, dname,2,'ÃÑ°è'),CLERK, SALESMAN, ETC, DEPT_SAL              
FROM (
             SELECT dname, A.deptno, CLERK, SALESMAN, ETC, DEPT_SAL
             FROM (
                          SELECT deptno, CLERK, SALESMAN, ETC, DEPT_SAL
                          FROM ( SELECT deptno,
                                                     sum(decode(JOB,'CLERK',sal)) CLERK, 
                                                     sum(decode(JOB,'SALESMAN',sal)) SALESMAN, 
                                                     sum(decode(JOB,'CLERK',NULL,'SALESMAN',NULL,sal)) ETC,
                                                     sum(sal) DEPT_SAL             
                                        FROM emp
                                        GROUP BY deptno) 
                         ) A, ( 
                                  dept            
                                ) b
             WHERE A.deptno=b.deptno
            )c,(
                SELECT 1 rno
                FROM dual
                UNION ALL
                SELECT 2
                FROM dual
              )d;
             
SELECT decode(d.rno,1, dname,2,'ÃÑ°è') AS "dname" ,
             sum(CLERK) CLERK, 
             sum(SALESMAN) SALESMAN, 
             sum(ETC) ETC, 
             sum(DEPT_SAL) DEPT_SAL              
FROM (
             SELECT dname, A.deptno, CLERK, SALESMAN, ETC, DEPT_SAL
             FROM (
                          SELECT deptno, CLERK, SALESMAN, ETC, DEPT_SAL
                          FROM ( SELECT deptno,
                                                     sum(decode(JOB,'CLERK',sal)) CLERK, 
                                                     sum(decode(JOB,'SALESMAN',sal)) SALESMAN, 
                                                     sum(decode(JOB,'CLERK',NULL,'SALESMAN',NULL,sal)) ETC,
                                                     sum(sal) DEPT_SAL             
                                        FROM emp
                                        GROUP BY deptno) 
                         ) A, ( 
                                  dept            
                                ) b
             WHERE A.deptno=b.deptno
            )c,(
                SELECT 1 rno
                FROM dual
                UNION ALL
                SELECT 2
                FROM dual
              )d
GROUP BY decode(d.rno,1, dname,2,'ÃÑ°è')
ORDER BY decode(d.rno,1, dname,2,'ÃÑ°è');
             
             

