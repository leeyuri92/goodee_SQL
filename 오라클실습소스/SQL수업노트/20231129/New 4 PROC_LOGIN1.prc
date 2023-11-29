CREATE OR REPLACE PROCEDURE SCOTT.proc_login1(p_id IN varchar2, p_pw IN varchar2, r_msg OUT varchar2)
IS
    status varchar2(100) :=2;
BEGIN
-- 1이면 아이디와 비번이 모두 일치, -1이면 아이디가 존재하지 않음, 0이면 비번이 틀립니다.
-- 아이디가 존재하면 0을 반환, 비번도 일치하면 1을 반환
    SELECT nvl((SELECT m_id FROM MEMBER1 WHERE m_id=p_id),'-1') INTO status
    FROM dual;
    IF status = '-1' THEN
        r_msg := '아이디가 존재하지 않습니다.';
    ELSE 
        SELECT nvl((SELECT m_name FROM member1
                            WHERE m_id=p_id
                                AND m_pw=p_pw), '비번이 틀립니다.') INTO r_msg
        FROM dual;
    END IF;
END;
/