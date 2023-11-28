CREATE OR REPLACE PROCEDURE proc_deptInsert(p_deptno IN number, p_dname IN varchar2, p_loc IN varchar2)
IS
BEGIN
    INSERT INTO dept(deptno, dname, loc) VALUES (p_deptno, p_dname, p_loc);
    COMMIT;
END;