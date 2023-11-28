CREATE OR REPLACE PROCEDURE proc_deptDelete(p_deptno IN number)
IS
BEGIN
    DELETE FROM dept WHERE deptno = p_deptno;
    COMMIT;
END;

SELECT * FROM dept WHERE deptno = 50;

-- ��ó���� ��ó��

SELECT
            NVL((SELECT deptno FROM dept WHERE deptno = 10), -1)
FROM dual;


SELECT
            NVL((SELECT deptno FROM dept WHERE deptno = 50), -1)
FROM dual;