�䱸�������Ǽ�
ȭ�����Ǽ� - � �÷��� �ʿ�����, � ���� ����ϸ� �Ǵ���

�������� 2
������ �� �б�
������ ���� ��� - SELECT ...INTO -> �ѹ��� �ѰǸ� ���� - XXXVO
���� �������� ó���Ҷ� FETCH..INTO -> ���྿ �����ϱ� - �ݺ��� �����Ͽ� ���  List<VO>, List<Map>
CURSOR����

--Ŀ�� �����ϱ�
CURSOR emp_cur IS
SELECT empno, ename, sal
  FROM emp
 WHERE deptno = p_deptno; 
 --�޿������ ���Ѵ� 
 SELECT avg(sal) INTO avg_sal 
   FROM emp
  WHERE deptno = p_deptno; 
 LOOP
    FETCH emp_cur INTO v_empno, v_ename, v_sal
    EXIT WHEN emp_cur%NOTFOUND;
    IF v_sal > avg_sal THEN
        rate :=1.1;
    ELSIF v_sal <= avg_sal THEN
        rate:=1.2;
    END IF;
    UPDATE emp
           SET sal = sal * rate
       WHERE empno = v_empno;
 END LOOP;
 
OPEN emp_cur;
CLOSE  emp_cur;
���� rate number(3,1) -  99.9
avg_sal number(7,2) - 99999.99
�μ���ȣ�� �Է¹޾Ƽ�(�Ķ���ͷ� �޾Ƽ�-p_deptno number) �μ� ��� �޿�(��������)���� 
���� ������ 10% ���ų� ������ 20% �λ��� �����Ͽ� 
�޿� ���̺��� ����(UPDATE -  COMMIT)�ϴ� ���ν����� �ۼ��Ͻÿ�.

SELECT  deptno, count(empno)
  FROM emp
 GROUP BY deptno;

CURSOR emp_cur 
IS
    SELECT empno, ename, sal
    FROM emp
    WHERE deptno = p_deptno;
    
    LOOP
        FETCH emp_cur INTO v_empno, v_ename, v_sal
        exit WHEN emp_cur%NOTFOUND;
        IF v_sal > avg_sal THEN
            rate := 1.1;
        ELSIF v_sal <= avg_sal THEN
            rate :=1.2;
        END IF;
        UPDATE emp
            set sal = sal*rate
        WHERE empno = v_empno;
    END LOOP;

OPEN emp_cur;
CLOSE emp_cur;


-- �޿���ձ��ϱ�

SELECT avg(sal) INTO avg_sal
FROM emp
WHERE deptno = p_deptno;





DECLARE
-- �̸��� ����, ȣ���� �ȵ�, ������ �ȵ�, �̸��� �ʿ���
-- PL/SQL�� - ����ü - ���ν���(����, ���ν���ȣ��,Ŀ��, �ѹ�����), �Լ�(��ȯ���� �ִ�)
-- Ʈ���� - ȣ������ �ʰ� �ڵ����� ����� - ������� ���� �� ��Ȱ��ȭ ���ѵ�
CREATE OR REPLACE [PROCEDURE, FUNCTION, TRIGGER] �̸�()
IS
-- �����
BEGIN
-- ���α׷���� - DML, commit, rollback, �ݺ���
-- ���� ���� �� ���� ó�� �ϱ�
EXCEPTION
-- ����ó�� ����
-- ������ �ܿ� �ʿ� ����.
END;