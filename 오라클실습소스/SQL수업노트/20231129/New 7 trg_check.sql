CREATE OR REPLACE TRIGGER trg_check
BEFORE UPDATE OR DELETE OR INSERT ON emp
BEGIN
    IF 
        (to_char(sysdate,'DY') IN ('��','��')) 
        THEN
            raise_application_error(-20001,'��,����Ͽ��� ������ �� �����ϴ�.');
    END IF;
END;

DELETE FROM emp;

alter trigger trg_check disable;