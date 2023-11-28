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



-- 트리거
-- 호출할 필요없이 자동으로 실행됨 - 자동으로 동기화 필요할 때 사용가능
-- 트리거는 비활성화 또는 활성화 할 수 있다. - 왜냐면 자동으로 실행되니까

ALTER TRIGGER 트리거명  DISABLE | ENABLE

-- 트리거를 재컴파일 할 수 있다.
ALTER TRIGGER 트리거명 COMPILE

-- 트리거 삭제
DROP TRIGGER 트리거명;

