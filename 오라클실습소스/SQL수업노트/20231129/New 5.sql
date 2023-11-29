    SELECT nvl((SELECT m_id FROM MEMBER1 WHERE m_id=:x),'-1') 
    FROM dual;
    
    
SELECT nvl((SELECT m_id FROM MEMBER1 WHERE m_id=:x),'-1') INTO status
FROM dual;


-- status 에는 아이디가 존재하면 아이디가 담김
-- 그러나 아이디가 존재하지 않으면 -1이 담김
-- into는 