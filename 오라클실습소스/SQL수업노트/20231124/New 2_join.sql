2�� �̻��� ���̺��� ������ �Ѵ�.
���հ� ������ ���谡 �ִ�.
�������� - 1:1, 1:N, N:M ����
N:M�� ������ ���� ���ǰ� �� �� ����̹Ƿ� ������ �ϸ� īŸ�þȰ��� �ȴ�.

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

3.temp�� emp_level�� �̿��� emp_level�� ���� ������ ���� ����/���� ���� ����
��� ������ �����, ����, ����, salary�� �о��.

SELECT *
FROM EMP_level;

SELECT *
FROM temp;

SELECT from_sal,to_sal
FROM emp_level
WHERE lev = '����';

SELECT emp_id, emp_name, lev, salary
FROM temp ,( 
                     SELECT from_sal,to_sal
                     FROM emp_level
                     WHERE lev = '����'
                     ) 
WHERE salary > from_sal AND salary < to_sal;

SELECT A.emp_id, A.emp_name, A.lev, A.salary
FROM temp A, emp_level b
WHERE b.lev = '����'
    AND salary >from_sal AND salary < to_sal;



tcom�� work_year = '2001'�� �ڷ�� temp�� ������� �����ؼ� join�� ��
comm�� �޴� ������ ����, salary + COMM�� ��ȸ�� ���ÿ�.

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
             b.emp_id ���
            ,b.emp_name ����
            ,b.salary ����
            ,A.from_sal ����
            ,A.to_sal ����
  FROM emp_level A, temp b
 WHERE A.lev(+) = b.lev;
 
 SELECT 
             b.emp_id ���
            ,b.emp_name ����
            ,b.salary ����
            ,A.from_sal ����
            ,A.to_sal ����
  FROM emp_level A, temp b
 WHERE A.lev = b.lev;
 
 tdept���̺� �ڽ��� ���� �μ� ������ �����ϰ� �ִ�.
�� ���̺��� �̿��Ͽ� �μ��ڵ�, �μ���, �����μ��ڵ�, �����μ����� �о���� 
������ ����� ����.

SELECT A.dept_code, A.dept_name,A.parent_dept,  b.dept_code, b.dept_name 
FROM Tdept A, tdept b
;


SELECT A.dept_name �μ���, b.dept_name �����μ���
FROM Tdept A, tdept b
WHERE A.parent_dept = b.dept_code;

SELECT A.dept_code �μ��ڵ�,
             A.dept_name �μ���, 
             b.dept_code �����μ��ڵ�,
             b.dept_name �����μ���
FROM Tdept A, tdept b
WHERE A.parent_dept = b.dept_code;

�̵� �������� �۾��ð��� ª�� �ɸ��� �ð� ������� 1���� 15������ ������ 
�Űܼ� ����Ͻÿ�.

SELECT * FROM t_worktime
