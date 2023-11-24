SELECT empno FROM emp;

SELECT
  /*+ALL_ROWS*/ empno
  FROM emp;
  
  SELECT /*+index_desc(emp pk_emp)*/ empno FROM emp;
  
  SELECT empno FROM emp
  ORDER BY ename desc;
  
  양쪽집합에 있는 것만 나와 - natual JOIN
  
  SELECT empno, ename, dept.dname
  FROM emp, dept
  WHERE emp.deptno = dept.deptno;
  
  힌트 문을 통해서 옵티마이저에게 개발자가 생각하는 실행 계획을 전달할 수 있다.
  SELECT /*+ rule*/*
    FROM emp, dept
  WHERE emp.deptno = dept.deptno;
  
  
  실행계획을 세울 때 
  RULE base 옵티마이저와 COST base 옵티마이저가 있다
  COST base 옵티마이저의 경우네는 현재 데이터의 분포가 반영되어 있어야 올바른 선택을 기대할 수 있다.
  분포도를 처리해 주는 쿼리문이 있다. - DBA권한을 가짐
  
  인덱스는 기본적으로 오름차순 정렬이 적용되어 있다.
  
  
  
  SELECT rowid rid, ename FROM emp;
  
  SELECT ROWNUM rno, ename FROM emp;
  
  SELECT ROWNUM rno, empno, ename
  FROM(
             SELECT empno, ename FROM emp
             ORDER BY hiredate desc
             );
             
그룹함수 - 전체범위처리 - 속도 느리다
전체범위처리의 반댓말은 부분범위처리이다. (인라인뷰) - 일량을 줄여준다

SELECT sum(sal)
FROM emp;

SELECT sum(sal), ename
FROM emp;  -- 옳지 못한 처리문
-- ename에 max를 붙인건 문법적인 문제를 피하기 위함이다. 그 이상 의미는 없다.
SELECT sum(sal), max(ename)
FROM emp;

SELECT sum(sal), min(ename)
FROM emp;

그룹함수 + 일반컬럼을 쓰기 위한 방법1 ( 그룹함수와 일반 컬럼은 함께 쓸 수 없다.)
 
SELECT count(comm), max(ename)
FROM emp;

그룹함수 + 일반함수 쓰기 위한 방법2

SELECT count(comm), ename
FROM emp
GROUP BY ename;

as명은 where절에서 사용 불가능 - 집합에서 제공하는 컬럼명이 아니기 때문

SELECT mod(seq_vc,2) mno
             FROM t_letitbe
 WHERE mno = 1;

SELECT mod(seq_vc,2) mno
             FROM t_letitbe
 WHERE mod(seq_vc,2) = 1;


SELECT mno
FROM (
             SELECT mod(seq_vc,2) mno
             FROM t_letitbe
             )
 WHERE mno = 1;
 
 
 SELECT deptno FROM emp;
 
 SELECT DISTINCT(deptno) FROM emp;
 
 SELECT deptno FROM emp
 GROUP BY deptno;
 
 
 SELECT ename FROM emp;
 
  SELECT DISTINCT ename FROM emp; -- 중복제거할게 없다.
  
 -- 그룹바이를 해도 소용이 없다. 단 정렬은 바뀐다.
 -- 같은 이름이 존재하는지 비교해야하니까
  SELECT ename FROM emp
   GROUP BY ename;