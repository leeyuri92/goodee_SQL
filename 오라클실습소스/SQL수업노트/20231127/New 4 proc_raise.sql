CREATE OR REPLACE PROCEDURE proc_raise
IS
-- �����
    user_excep EXCEPTION; -- ��������� ���ܰ�ü
BEGIN
    RAISE user_excep;
    EXCEPTION
        WHEN user_excep THEN
            DBMS_OUTPUT.PUT_LINE('Raise�� �̿��� ����� ����ó�����');
         WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('�� �� ����ó��');        
END;
/


-- DDL - ���������ϴ� ���, create, alter, drop - �޸� ���׸�Ʈ�� ������� ���� - �ӵ� ����
-- DML - select,