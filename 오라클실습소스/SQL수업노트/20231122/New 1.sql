SELECT empno FROM emp;

SELECT
  /*+ALL_ROWS*/ empno
  FROM emp;
  
  SELECT /*+index_desc(emp pk_emp)*/ empno FROM emp;
  
  SELECT empno FROM emp
  ORDER BY ename desc;
  
  �������տ� �ִ� �͸� ���� - natual JOIN
  
  SELECT empno, ename, dept.dname
  FROM emp, dept
  WHERE emp.deptno = dept.deptno;
  
  ��Ʈ ���� ���ؼ� ��Ƽ���������� �����ڰ� �����ϴ� ���� ��ȹ�� ������ �� �ִ�.
  SELECT /*+ rule*/*
    FROM emp, dept
  WHERE emp.deptno = dept.deptno;
  
  
  �����ȹ�� ���� �� 
  RULE base ��Ƽ�������� COST base ��Ƽ�������� �ִ�
  COST base ��Ƽ�������� ���״� ���� �������� ������ �ݿ��Ǿ� �־�� �ùٸ� ������ ����� �� �ִ�.
  �������� ó���� �ִ� �������� �ִ�. - DBA������ ����
  
  �ε����� �⺻������ �������� ������ ����Ǿ� �ִ�.
  
  
  
  SELECT rowid rid, ename FROM emp;
  
  SELECT ROWNUM rno, ename FROM emp;
  
  SELECT ROWNUM rno, empno, ename
  FROM(
             SELECT empno, ename FROM emp
             ORDER BY hiredate desc
             );
             
�׷��Լ� - ��ü����ó�� - �ӵ� ������
��ü����ó���� �ݴ��� �κй���ó���̴�. (�ζ��κ�) - �Ϸ��� �ٿ��ش�

SELECT sum(sal)
FROM emp;

SELECT sum(sal), ename
FROM emp;  -- ���� ���� ó����
-- ename�� max�� ���ΰ� �������� ������ ���ϱ� �����̴�. �� �̻� �ǹ̴� ����.
SELECT sum(sal), max(ename)
FROM emp;

SELECT sum(sal), min(ename)
FROM emp;

�׷��Լ� + �Ϲ��÷��� ���� ���� ���1 ( �׷��Լ��� �Ϲ� �÷��� �Բ� �� �� ����.)
 
SELECT count(comm), max(ename)
FROM emp;

�׷��Լ� + �Ϲ��Լ� ���� ���� ���2

SELECT count(comm), ename
FROM emp
GROUP BY ename;

as���� where������ ��� �Ұ��� - ���տ��� �����ϴ� �÷����� �ƴϱ� ����

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
 
  SELECT DISTINCT ename FROM emp; -- �ߺ������Ұ� ����.
  
 -- �׷���̸� �ص� �ҿ��� ����. �� ������ �ٲ��.
 -- ���� �̸��� �����ϴ��� ���ؾ��ϴϱ�
  SELECT ename FROM emp
   GROUP BY ename;