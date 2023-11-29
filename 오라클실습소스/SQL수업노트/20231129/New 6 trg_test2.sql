CREATE OR REPLACE TRIGGER trg_test2
BEFORE
UPDATE OF ename ON emp
FOR EACH ROW
DECLARE
    s_msg varchar2(500) := '';
BEGIN
    IF :OLD.empno = 7566 THEN
        s_msg :='7566����� ���� ������ ������ �� ����.';
        raise_application_error(-20000, s_msg);
    END IF;
END;


UPDATE emp
        set ename = 'test'
        WHERE empno = 7566;