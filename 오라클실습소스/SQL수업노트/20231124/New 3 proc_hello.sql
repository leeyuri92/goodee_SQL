CREATE OR REPLACE PROCEDURE proc_hello(x IN number,msg OUT varchar2)
IS
A number(5) := 0;
BEGIN
msg :='������'||to_char(sysdate,'YYYY-MM-DD')||'�Դϴ�';
dbms_output.put_line('hello oracle');
dbms_output.put_line('������'||to_char(sysdate,'YYYY-MM-DD')||'�Դϴ�');
END;
/


BEGIN 
    proc_hello(1);
    end;