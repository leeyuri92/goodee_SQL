2개 이상의 테이블을 가지고 한다.
집합과 집합은 관계가 있다.
관계형태 - 1:1, 1:N, N:M 관계
N:M은 업무에 대한 정의가 덜 된 경우이므로 조인을 하면 카타시안곱이 된다.

SELECT empno, ename, dname
FROM emp, dept;

SELECT empno, ename, dname
FROM emp NATURAL JOIN dept;

SELECT empno, ename, dname
FROM emp A NATURAL JOIN dept B;

SELECT empno, ename, dname
FROM emp A JOIN dept B
    ON A.deptno = B.deptno;

SELECT empno, ename, dname
FROM emp, dept 
WHERE emp.deptno = dept.deptno;

non-equals JOIN

3.temp와 emp_level을 이용해 emp_level의 과장 직급의 연봉 상한/하한 범위 내에
드는 직원의 사번과, 성명, 직급, salary를 읽어보자.

SELECT *
FROM EMP_level;

SELECT *
FROM temp;

SELECT from_sal,to_sal
FROM emp_level
WHERE lev = '과장';

SELECT emp_id, emp_name, lev, salary
FROM temp ,( 
                     SELECT from_sal,to_sal
                     FROM emp_level
                     WHERE lev = '과장'
                     ) 
WHERE salary > from_sal AND salary < to_sal;

SELECT A.emp_id, A.emp_name, A.lev, A.salary
FROM temp A, emp_level b
WHERE b.lev = '과장'
    AND salary >from_sal AND salary < to_sal;



tcom의 work_year = '2001'인 자료와 temp를 사번으로 연결해서 join한 후
comm을 받는 직원의 성명, salary + COMM을 조회해 보시오.

SELECT *
FROM tcom;

SELECT *
FROM temp;

SELECT work_year, emp_id,comm
FROM tcom
WHERE work_year = 2001;

SELECT *
FROM temp, tcom
WHERE temp.emp_id=TCOM.emp_id;

SELECT emp_name, salary+ comm
FROM temp, tcom
WHERE temp.emp_id=TCOM.emp_id;

SELECT emp_name, salary+ comm
FROM temp NATURAL JOIN tcom
WHERE work_year = 2001;


SELECT emp_name, salary+comm
FROM temp, (
                      SELECT work_year, emp_id,comm
                      FROM tcom
                      WHERE work_year = 2001
                      ) b
WHERE temp.emp_id=b.emp_id;


SELECT empno, dept.deptno, dname
FROM emp, dept
WHERE emp.deptno(+)=dept.deptno;


SELECT 
             b.emp_id 사번
            ,b.emp_name 성명
            ,b.salary 연봉
            ,A.from_sal 하한
            ,A.to_sal 상한
  FROM emp_level A, temp b
 WHERE A.lev(+) = b.lev;
 
 SELECT 
             b.emp_id 사번
            ,b.emp_name 성명
            ,b.salary 연봉
            ,A.from_sal 하한
            ,A.to_sal 상한
  FROM emp_level A, temp b
 WHERE A.lev = b.lev;
 
 tdept테이블에 자신의 상위 부서 정보를 관리하고 있다.
이 테이블을 이용하여 부서코드, 부서명, 상위부서코드, 상위부서명을 읽어오는 
쿼리를 만들어 보자.