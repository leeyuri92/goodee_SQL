CREATE OR REPLACE PROCEDURE proc_hap(num IN number, msg OUT varchar2)
IS
n_i number(5) :=0;
n_hap number(5):=0;
BEGIN
    FOR n_i IN 1..10 LOOP
        n_hap := n_hap + n_i;
    END LOOP;
    msg :='1���� 10������ ����'||n_hap||'�Դϴ�.';
END;