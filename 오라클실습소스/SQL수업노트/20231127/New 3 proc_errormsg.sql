CREATE OR REPLACE PROCEDURE proc_errormsg
IS
-- ���� �����
    err_num number;
    err_msg varchar2(300);
    n_i number(5) :=0;
BEGIN
-- ���α׷� �ڵ���
    n_i := 120/0;
    EXCEPTION
        WHEN others THEN
            err_num := SQLCODE;
            err_msg := substr(SQLERRM,1,100);
            DBMS_OUTPUT.PUT_LINE('�����ڵ�: ' ||err_num);
            DBMS_OUTPUT.PUT_LINE('��������: ' ||err_msg);
END;
