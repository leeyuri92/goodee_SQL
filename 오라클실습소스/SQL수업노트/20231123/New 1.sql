문제1:사원번호가 7500번 이상인 사원들의 이름과 입사일자 급여를 출력하시오.

컬럼명 : ename, hiredate, sal
조건절 : WHERE, HAVING(GROUP BY)
집합명 : emp


SELECT ename, hiredate, sal
FROM emp
WHERE empno >= 7500;

문제2:입사한 년도가 1981년인 사원들의 사번을 출력하시오.

hiredate
XXX인것 - 조건절 - decode, CASE WHEN
empno

SELECT empno
FROM emp
WHERE  hiredate = to_date(1981,'YYYY');

SELECT empno
FROM emp
WHERE to_char(hiredate,'YYYY') = '1981';

SELECT hiredate, to_date(1981,'YYYY')
FROM emp;

SELECT hiredate, to_char(hiredate,'YYYY')
FROM emp;


문제3:사원의 이름이 A로 시작되는 사원들의 사원번호를 출력하시오.

SELECT empno
FROM emp
WHERE ename LIKE 'A%';

SELECT empno, ename
FROM emp
WHERE ename LIKE :x ||'%';

문제4:입사일자가 1981년 2월1일 에서 1981년 6월30일사이에 있는 사원들의 사번과 명단을 출력하시오

SELECT empno, ename
FROM emp
WHERE hiredate BETWEEN '1981/02/01'  AND '1981/06/30';

문제5:급여가 1000불보다 크거나 같고 3000불보다 작거나 같은 직원들의 이름과 급여를 출력하시오.

SELECT ename, sal
FROM emp
WHERE sal BETWEEN 1000 AND 3000;

SELECT ename, sal
FROM emp
WHERE sal >= 1000 AND sal <= 3000;

SELECT deptno FROM emp
INTERSECT
SELECT deptno FROM dept;

문제6: 급여가 3000불이 아닌 사원들의 사번과 이름을 출력하시오.

SELECT empno, ename, sal
FROM emp
WHERE sal != 3000;
 
-- 아닌걸 찾을 때도 색인을 사용할 수 있나요?
--인덱스만 읽고도 조회가 된다?
--인덱스관리하는 테이블이 있다.
--인덱스키 + rowid

-- 힌트문에 대해서
-- 힌트문에 오타가 있으면 무시된다. - 원래 실행 계획대로 검색해준다.
-- RDBMS가 세운 실행계획보다 개발자가 세운 실행계획이 옳다 라고 판단될때
-- 옵티마이저에게 내 생각을 전달할 수 있는 유일한 방법이다.

-- 인덱스
-- pk가 아닌 일반컬럼도 인덱스 가질 수 있다.
-- 일반 컬럼에 인덱스를 생성할 때도 DDL 구문을 사용한다.
-- 인덱스가 있어도 조건에 사용되지 않으면 실행계획에 반영되지 않는다.

SELECT /*+index_desc(emp pk_emp)*/ 
             empno
FROM emp;

SELECT  
             empno
FROM emp
ORDER BY empno desc ;

SELECT /*+index_desc(emp pk_emp)*/ 
             empno, ename
FROM emp;

SELECT  
             empno, ename
FROM emp
ORDER BY empno desc ;

SELECT empno, ename
FROM emp;

SELECT empno, ename
FROM emp
WHERE empno != 7566;
-- 아닌것을 찾을 때는 인덱스가 있지만 인덱스를 사용 못한다. 속도향상

SELECT empno, ename
FROM emp
WHERE ename = 'SMITH';

CREATE INDEX i_ename ON emp(ename ASC);

SELECT ename
FROM emp; 

-- 인덱스를 오름차순으로 만들었지만 정렬이 되어있지 않다. 이유는?
-- 인덱스가 있지만 인덱스를 사용하지않고 있다.

SELECT ename
FROM emp
WHERE ename = ' '; 
-- 아닌걸 찾을 때도 색인을 사용할 수 있나요?

SELECT /*+rule*/ empno, ename
FROM emp
WHERE empno = 7566;

SELECT ename
FROM emp
WHERE ename != 'SMITH';
-- 아닌걸 찾을땐 인덱스 사용안한다며..이건 왜 인덱스를 사용하는거야

SELECT ename, hiredate
FROM emp
WHERE ename != 'SMITH';
-- 얘는 또 인덱스를 사용하냐 


문제7: 사원들의 부서별 급여평균을 구하시오.

SELECT deptno, avg(sal)
FROM emp
GROUP BY deptno;
