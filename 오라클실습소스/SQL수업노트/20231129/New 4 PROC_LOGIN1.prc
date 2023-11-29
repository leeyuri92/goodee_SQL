CREATE OR REPLACE PROCEDURE SCOTT.proc_login1(p_id IN varchar2, p_pw IN varchar2, r_msg OUT varchar2)
IS
    status varchar2(100) :=2;
BEGIN
-- 1�̸� ���̵�� ����� ��� ��ġ, -1�̸� ���̵� �������� ����, 0�̸� ����� Ʋ���ϴ�.
-- ���̵� �����ϸ� 0�� ��ȯ, ����� ��ġ�ϸ� 1�� ��ȯ
    SELECT nvl((SELECT m_id FROM MEMBER1 WHERE m_id=p_id),'-1') INTO status
    FROM dual;
    IF status = '-1' THEN
        r_msg := '���̵� �������� �ʽ��ϴ�.';
    ELSE 
        SELECT nvl((SELECT m_name FROM member1
                            WHERE m_id=p_id
                                AND m_pw=p_pw), '����� Ʋ���ϴ�.') INTO r_msg
        FROM dual;
    END IF;
END;
/