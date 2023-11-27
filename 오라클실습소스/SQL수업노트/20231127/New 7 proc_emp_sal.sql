--사원번호를 입력받아서 그 사원이 속한 부서의 평균급여보다 많이 받고 있으면 10% 인상을, 
--적거나 같게 받고 있으면 20% 인상하여 테이블을 업데이트 하는 프로시저를 작성하시오.

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
    msg:= pname||' 사원의 '||psal||' 급여가 '||rate||'인상분으로 '||psal*rate||' 으로 인상되었습니다.';
END;
/

