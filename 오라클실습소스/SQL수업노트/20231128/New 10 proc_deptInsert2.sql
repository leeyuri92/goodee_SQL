CREATE OR REPLACE PROCEDURE proc_deptInsert2(p_deptno IN number, p_dname IN varchar2, p_loc IN varchar2)
IS
BEGIN
    INSERT INTO dept(deptno, dname, loc) SELECT 51,'운영부','강원' FROM dual;
    COMMIT;
END;