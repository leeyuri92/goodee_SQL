--�����ȣ�� �Է¹޾Ƽ� �� ����� ���� �μ��� ��ձ޿����� ���� �ް� ������ 10% �λ���, 
--���ų� ���� �ް� ������ 20% �λ��Ͽ� ���̺��� ������Ʈ �ϴ� ���ν����� �ۼ��Ͻÿ�.

CREATE OR REPLACE PROCEDURE proc_emp_sal(p_empno IN number, msg OUT varchar2)
IS
    pname varchar2(30):='';
    psal number(7):=0;
    avg_sal number(10,2):=0;
    rate number(5,2):=0;
BEGIN
    SELECT ename, sal INTO pname, psal
      FROM emp
     WHERE empno = p_empno;
    SELECT avg(sal) INTO avg_sal 
       FROM emp
      WHERE deptno = (SELECT deptno FROM emp WHERE empno = p_empno);
    IF psal > avg_sal THEN
        rate:=1.1;
    ELSE
        rate:=1.2;
    END IF;
    UPDATE emp
          set sal  = sal * rate
      WHERE empno = p_empno;
    COMMIT;   
    msg:= pname||' ����� '||psal||' �޿��� '||rate||'�λ������ '||psal*rate||' ���� �λ�Ǿ����ϴ�.';
END;
/

