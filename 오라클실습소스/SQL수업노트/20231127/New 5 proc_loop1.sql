CREATE OR REPLACE PROCEDURE SCOTT.proc_loop1(dan IN number)
IS
    n_i number(2);
BEGIN
-- �Ķ���Ϳ� ����� ������ ������ �Ұ���
    n_i :=1;
    dbms_output.put_line(dan||'���� ����մϴ�.');
    LOOP
        DBMS_OUTPUT.PUT_LINE(dan||'*'||n_i||'='||(dan*n_i));
        n_i := n_i +1;
        IF n_i >9 THEN
            exit;
        END IF;
    END LOOP;
END;