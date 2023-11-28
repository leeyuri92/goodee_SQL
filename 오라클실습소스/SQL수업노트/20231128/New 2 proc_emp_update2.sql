CREATE OR REPLACE PROCEDURE proc_emp_update2(p_deptno IN number)
IS
-- 평균급여담기
    avg_sal number(7,2) :=0;
    v_empno number := 0;
    v_sal number := 0;
    v_ename varchar2(20) := '';
    rate number(3,1) :=0;
CURSOR emp_cur IS
SELECT empno, ename, sal
FROM emp
WHERE deptno = p_deptno;
BEGIN
    SELECT avg(sal) INTO avg_sal
    FROM emp
    WHERE deptno = p_deptno;
    OPEN emp_cur;
    LOOP
        FETCH emp_cur INTO v_empno, v_ename, v_sal;
        EXIT WHEN emp_cur%NOTFOUND;
        IF v_sal > avg_sal THEN
            rate := 1.1;
        ELSIF v_sal <= avg_sal THEN
            rate :=1.2;
        END IF;
        UPDATE emp
            SET sal = sal * rate
        WHERE empno = v_empno;
    END LOOP;
    COMMIT;
    CLOSE emp_cur;
    EXCEPTION
        WHEN no_data_found THEN
            NULL;
END;