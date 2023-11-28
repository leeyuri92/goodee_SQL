CREATE OR REPLACE TRIGGER trg_dept 
BEFORE
UPDATE OR DELETE OR INSERT ON dept
DECLARE
    msg varchar2(200) := '';
BEGIN
    IF UPDATING THEN
        dbms_output.put_line('===> Update');
    END IF;
    IF deleting THEN
        dbms_output.put_line('===> Delete');
    END IF;
    IF INSERTING THEN
        dbms_output.put_line('===> Insert');
    END IF;
END;


DELETE FROM dept WHERE deptno = 51;

ROLLBACK;

DELETE FROM dept WHERE deptno = 53;

ALTER TRIGGER trg_dept DISABLE;

ROLLBACK;



-- Ʈ����
-- ȣ���� �ʿ���� �ڵ����� ����� - �ڵ����� ����ȭ �ʿ��� �� ��밡��
-- Ʈ���Ŵ� ��Ȱ��ȭ �Ǵ� Ȱ��ȭ �� �� �ִ�. - �ֳĸ� �ڵ����� ����Ǵϱ�

ALTER TRIGGER Ʈ���Ÿ�  DISABLE | ENABLE

-- Ʈ���Ÿ� �������� �� �� �ִ�.
ALTER TRIGGER Ʈ���Ÿ� COMPILE

-- Ʈ���� ����
DROP TRIGGER Ʈ���Ÿ�;

