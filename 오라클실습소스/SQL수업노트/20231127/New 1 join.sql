각 사번의 성명, salary, 연봉하한금액, 연봉상한금액을 보고자 한다.
temp와 emp_level을 조인하여 결과를 보여주되, 연봉의 상하한이 등록되어 있지 않은
'수습' 사원은 성명, 이름, salary 까지만이라도 나올 수 있도록 쿼리를 작성하시오.

SELECT emp_name, salary, from_sal, to_sal
FROM temp, emp_level
WHERE temp.lev = emp_level.lev(+) ;

OUTER JOIN
두 개 이상의 테이블 조인 시 한 쪽 테이블의 행에 대해 다른 쪽 테이블에 일치하는 행이 없더라도 다른 쪽 테이블의 행을 null로 하여 행을 리턴
연산자를 사용 할 수 있다(+)
한 편에만 올 수 있다
조인 시에 값이 없는 조인측에 (+) 기호를 위치시킨다.

SELECT empno, ename, dname
FROM emp, dept
WHERE emp.deptno(+) = dept.deptno;

SELECT empno, ename, dname
FROM emp RIGHT OUTER JOIN dept
    ON emp.deptno = dept.deptno;
    
SELECT empno, ename, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno(+);

SELECT empno, ename, dname
FROM emp LEFT OUTER JOIN dept
    ON emp.deptno = dept.deptno;
    
SELECT empno, ename, dname
FROM emp FULL OUTER JOIN dept
    ON emp.deptno = dept.deptno;

회원집합과 상품집합의 관계 형태는? N:M
    
SELECT * FROM t_giftmem;

SELECT * FROM t_giftpoint;

-- 카타시안곱

SELECT *
FROM t_giftmem, t_giftpoint;

-- non-equal join

SELECT *
FROM t_giftmem mem, t_giftpoint poi
WHERE poi.name_vc = '과자종합'
AND poi.point_nu <= mem.point_nu;

조인 방법과 방식
조인  방법 : natual JOIN(등가조인, equal), non-equal조인, Self조인, OUTER 조인
조인 방식 : - NESTED LOOP JOIN, HASH JOIN

self JOIN - 하나의 테이블에서 조인이 발생
나 자신과 1:1 또는 1:n 관계일 때 사용

SELECT A.ename  AS "매니저", b.ename
FROM emp A, emp b
WHERE A.empno=b.mgr;

temp와 tdept를 이용하여 다음 컬럼을 보여주는 SQL을 만들어 보자.
상위부서가 'CA0001'인 부서에 소속된 직원을 1.사번, 2.성명, 3.부서코드
4.부서명, 5.상위부서코드, 6.상위부서명, 7.상위부서장코드, 8.상위부서장성명
순서로 보여주면 된다.


SELECT emp_id, emp_name, A.dept_code
FROM tdept A, temp b
WHERE A.DEPT_CODE = b.dept_code;

SELECT emp_id, emp_name
FROM tdept, temp
WHERE TDEPT.BOSS_ID = temp.emp_id;

SELECT A.DEPT_CODE, A.dept_name, b.parent_dept, b.dept_name
FROM tdept A, tdept b
WHERE A.parent_dept = b.dept_code
AND A.PARENT_dept ='CA0001';


SELECT A.DEPT_CODE, A.dept_name, b.parent_dept, b.dept_name
FROM tdept A, tdept b
WHERE A.parent_dept = b.dept_code
AND A.PARENT_dept ='CA0001';

SELECT A.emp_id, 
             A.emp_name, 
             b.dept_code,
             b.dept_name,
             c.dept_code AS "상위부서코드",
             C.DEPT_NAME AS "상위부서명"
FROM temp A, tdept b ,tdept c
WHERE A.DEPT_CODE = b.dept_code
AND b.parent_dept = c.dept_code
AND c.dept_code ='CA0001' ;

SELECT A.emp_id, 
             A.emp_name, 
             b.dept_code,
             b.dept_name,
             c.dept_code AS "상위부서코드",
             C.DEPT_NAME AS "상위부서명",
             c.DEPT_CODE AS "상위 부서장 코드",
             d.emp_name AS "상위 부서장 성명"
FROM temp A, tdept b ,tdept c, temp d
WHERE A.DEPT_CODE = b.dept_code
AND b.parent_dept = c.dept_code
AND c.dept_code ='CA0001' 
AND c.boss_id = d.emp_id;