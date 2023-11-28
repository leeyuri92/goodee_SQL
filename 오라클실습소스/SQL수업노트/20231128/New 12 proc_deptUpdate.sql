CREATE OR REPLACE PROCEDURE proc_deptUpdate(p_deptno IN number, p_dname IN varchar2, p_loc IN varchar2)
IS
BEGIN
    UPDATE dept 
    set dname = p_dname,
          loc = p_loc
    WHERE deptno = p_deptno;
END;


exec proc_deptUpdate(53, 'DBA', '¿Œ√µ');

SELECT * FROM dept;

