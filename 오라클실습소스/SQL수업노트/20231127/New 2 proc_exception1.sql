CREATE OR REPLACE PROCEDURE proc_exception1
IS
    n_i number(5);
BEGIN
    n_i := 0;
    n_i := '������';
    EXCEPTION
        WHEN invalid_number THEN
            dbms_output.put_line('�߸��� ���� ���� ���� ����');
        WHEN value_error THEN
            dbms_output.put_line('�߸��� ������ ���� ���� ����');
        WHEN others THEN
            dbms_output.put_line('�߸��� ���ڳ�  ������ ���� ���� ����');
END;
/