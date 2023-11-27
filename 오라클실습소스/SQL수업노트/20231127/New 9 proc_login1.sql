CREATE OR REPLACE PROCEDURE proc_login1(p_id IN varchar2, p_pw IN varchar2, r_name OUT varchar2, r_status OUT number)
IS
BEGIN
    SELECT nvl((SELECT m_id FROM member1 WHERE m_id=p_id),-1)
    INTO r_status
    FROM dual;
END;
/

SELECT m_id FROM member1 WHERE m_id =: p_id;