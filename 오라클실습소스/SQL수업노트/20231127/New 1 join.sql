�� ����� ����, salary, �������ѱݾ�, �������ѱݾ��� ������ �Ѵ�.
temp�� emp_level�� �����Ͽ� ����� �����ֵ�, ������ �������� ��ϵǾ� ���� ����
'����' ����� ����, �̸�, salary �������̶� ���� �� �ֵ��� ������ �ۼ��Ͻÿ�.

SELECT emp_name, salary, from_sal, to_sal
FROM temp, emp_level
WHERE temp.lev = emp_level.lev(+) ;

OUTER JOIN
�� �� �̻��� ���̺� ���� �� �� �� ���̺��� �࿡ ���� �ٸ� �� ���̺� ��ġ�ϴ� ���� ������ �ٸ� �� ���̺��� ���� null�� �Ͽ� ���� ����
�����ڸ� ��� �� �� �ִ�(+)
�� ���� �� �� �ִ�
���� �ÿ� ���� ���� �������� (+) ��ȣ�� ��ġ��Ų��.

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

ȸ�����հ� ��ǰ������ ���� ���´�? N:M
    
SELECT * FROM t_giftmem;

SELECT * FROM t_giftpoint;

-- īŸ�þȰ�

SELECT *
FROM t_giftmem, t_giftpoint;

-- non-equal join

SELECT *
FROM t_giftmem mem, t_giftpoint poi
WHERE poi.name_vc = '��������'
AND poi.point_nu <= mem.point_nu;

���� ����� ���
����  ��� : natual JOIN(�����, equal), non-equal����, Self����, OUTER ����
���� ��� : - NESTED LOOP JOIN, HASH JOIN

self JOIN - �ϳ��� ���̺��� ������ �߻�
�� �ڽŰ� 1:1 �Ǵ� 1:n ������ �� ���

SELECT A.ename  AS "�Ŵ���", b.ename
FROM emp A, emp b
WHERE A.empno=b.mgr;

temp�� tdept�� �̿��Ͽ� ���� �÷��� �����ִ� SQL�� ����� ����.
�����μ��� 'CA0001'�� �μ��� �Ҽӵ� ������ 1.���, 2.����, 3.�μ��ڵ�
4.�μ���, 5.�����μ��ڵ�, 6.�����μ���, 7.�����μ����ڵ�, 8.�����μ��强��
������ �����ָ� �ȴ�.


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
             c.dept_code AS "�����μ��ڵ�",
             C.DEPT_NAME AS "�����μ���"
FROM temp A, tdept b ,tdept c
WHERE A.DEPT_CODE = b.dept_code
AND b.parent_dept = c.dept_code
AND c.dept_code ='CA0001' ;

SELECT A.emp_id, 
             A.emp_name, 
             b.dept_code,
             b.dept_name,
             c.dept_code AS "�����μ��ڵ�",
             C.DEPT_NAME AS "�����μ���",
             c.DEPT_CODE AS "���� �μ��� �ڵ�",
             d.emp_name AS "���� �μ��� ����"
FROM temp A, tdept b ,tdept c, temp d
WHERE A.DEPT_CODE = b.dept_code
AND b.parent_dept = c.dept_code
AND c.dept_code ='CA0001' 
AND c.boss_id = d.emp_id;