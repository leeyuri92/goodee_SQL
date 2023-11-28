-- 데이터 동기화 목적으로 트리거 생성

CREATE OR REPLACE TRIGGER trg_deptcopy
AFTER 
INSERT OR UPDATE OR DELETE ON dept
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO dept_copy(deptno, dname, loc)
        VALUES(:NEW.deptno, :NEW.dname, :NEW.loc);
    ELSIF UPDATING THEN
        UPDATE dept_copy
        set dname = :NEW.dname, loc = :NEW.loc
        WHERE deptno = :OLD.deptno;
    ELSIF deleting THEN
        DELETE FROM dept_copy
        WHERE deptno = :OLD.deptno;    
    END IF;
END;


-- 데이터 복제 트리거 적용 여부 확인하기

INSERT INTO dept(deptno, dname, loc) VALUES(70,'전산과','서울');

SELECT * FROM dept_copy;


UPDATE dept set loc = '포항' WHERE deptno = 70;

DELETE FROM dept_copy WHERE deptno = 70;