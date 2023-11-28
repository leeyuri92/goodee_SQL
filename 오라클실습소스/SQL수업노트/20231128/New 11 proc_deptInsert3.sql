CREATE OR REPLACE PROCEDURE proc_deptInsert3(p_deptno IN number, p_dname IN varchar2, p_loc IN varchar2)
IS
BEGIN
    INSERT INTO dept(deptno, dname, loc) SELECT p_deptno, p_dname, p_loc FROM dual;
    COMMIT;
END;

exec proc_deptInsert3(53,'품질관리','서울');

SELECT * FROM dept WHERE deptno IN(50,51,53);