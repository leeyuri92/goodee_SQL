CREATE OR REPLACE PROCEDURE proc_raise
IS
-- 선언부
    user_excep EXCEPTION; -- 사용자정의 예외객체
BEGIN
    RAISE user_excep;
    EXCEPTION
        WHEN user_excep THEN
            DBMS_OUTPUT.PUT_LINE('Raise를 이용한 사용자 예외처리방법');
         WHEN others THEN
            DBMS_OUTPUT.PUT_LINE('그 외 예외처리');        
END;
/


-- DDL - 구조정의하는 언어, create, alter, drop - 메모리 세그먼트를 사용하지 않음 - 속도 빠름
-- DML - select,