����1:�����ȣ�� 7500�� �̻��� ������� �̸��� �Ի����� �޿��� ����Ͻÿ�.

�÷��� : ename, hiredate, sal
������ : WHERE, HAVING(GROUP BY)
���ո� : emp


SELECT ename, hiredate, sal
FROM emp
WHERE empno >= 7500;

����2:�Ի��� �⵵�� 1981���� ������� ����� ����Ͻÿ�.

hiredate
XXX�ΰ� - ������ - decode, CASE WHEN
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


����3:����� �̸��� A�� ���۵Ǵ� ������� �����ȣ�� ����Ͻÿ�.

SELECT empno
FROM emp
WHERE ename LIKE 'A%';

SELECT empno, ename
FROM emp
WHERE ename LIKE :x ||'%';

����4:�Ի����ڰ� 1981�� 2��1�� ���� 1981�� 6��30�ϻ��̿� �ִ� ������� ����� ����� ����Ͻÿ�

SELECT empno, ename
FROM emp
WHERE hiredate BETWEEN '1981/02/01'  AND '1981/06/30';

����5:�޿��� 1000�Һ��� ũ�ų� ���� 3000�Һ��� �۰ų� ���� �������� �̸��� �޿��� ����Ͻÿ�.

SELECT ename, sal
FROM emp
WHERE sal BETWEEN 1000 AND 3000;

SELECT ename, sal
FROM emp
WHERE sal >= 1000 AND sal <= 3000;

SELECT deptno FROM emp
INTERSECT
SELECT deptno FROM dept;

����6: �޿��� 3000���� �ƴ� ������� ����� �̸��� ����Ͻÿ�.

SELECT empno, ename, sal
FROM emp
WHERE sal != 3000;
 
-- �ƴѰ� ã�� ���� ������ ����� �� �ֳ���?
--�ε����� �а� ��ȸ�� �ȴ�?
--�ε��������ϴ� ���̺��� �ִ�.
--�ε���Ű + rowid

-- ��Ʈ���� ���ؼ�
-- ��Ʈ���� ��Ÿ�� ������ ���õȴ�. - ���� ���� ��ȹ��� �˻����ش�.
-- RDBMS�� ���� �����ȹ���� �����ڰ� ���� �����ȹ�� �Ǵ� ��� �Ǵܵɶ�
-- ��Ƽ���������� �� ������ ������ �� �ִ� ������ ����̴�.

-- �ε���
-- pk�� �ƴ� �Ϲ��÷��� �ε��� ���� �� �ִ�.
-- �Ϲ� �÷��� �ε����� ������ ���� DDL ������ ����Ѵ�.
-- �ε����� �־ ���ǿ� ������ ������ �����ȹ�� �ݿ����� �ʴ´�.

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
-- �ƴѰ��� ã�� ���� �ε����� ������ �ε����� ��� ���Ѵ�. �ӵ����

SELECT empno, ename
FROM emp
WHERE ename = 'SMITH';

CREATE INDEX i_ename ON emp(ename ASC);

SELECT ename
FROM emp; 

-- �ε����� ������������ ��������� ������ �Ǿ����� �ʴ�. ������?
-- �ε����� ������ �ε����� ��������ʰ� �ִ�.

SELECT ename
FROM emp
WHERE ename = ' '; 
-- �ƴѰ� ã�� ���� ������ ����� �� �ֳ���?

SELECT /*+rule*/ empno, ename
FROM emp
WHERE empno = 7566;

SELECT ename
FROM emp
WHERE ename != 'SMITH';
-- �ƴѰ� ã���� �ε��� �����Ѵٸ�..�̰� �� �ε����� ����ϴ°ž�

SELECT ename, hiredate
FROM emp
WHERE ename != 'SMITH';
-- ��� �� �ε����� ����ϳ� 


����7: ������� �μ��� �޿������ ���Ͻÿ�.

SELECT deptno, avg(sal)
FROM emp
GROUP BY deptno;
