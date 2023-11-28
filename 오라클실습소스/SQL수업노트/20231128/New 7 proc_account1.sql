CREATE OR REPLACE PROCEDURE proc_account1(p_examno IN varchar2, msg OUT varchar2)
IS
-- ������� �Է��� 1~4�� ���
    u1 number(1) :=0;
    u2 number(1) :=0;
    u3 number(1) :=0;
    u4 number(1) :=0;
-- ������� ���� ���� ���� ����
    r1 number(3) :=0;
--  ������� Ʋ�� ���� ���� ����
    w1 number(3) :=0;
-- Ŀ������ ���� ��
    jdap number(2) :=0;
-- ���� ��ȣ�� ���� ����
    d_no number(3) := 1;
    CURSOR dap_cur IS
    SELECT dap FROM sw_design;
BEGIN
    OPEN dap_cur;
    SELECT dap1,dap2,dap3,dap4 INTO u1,u2,u3,u4
    FROM exam_paper
    WHERE exam_no = p_examno;
    LOOP
        FETCH dap_cur INTO jdap;
        exit WHEN dap_cur%NOTFOUND;
        IF d_no =1 THEN
            IF jdap = u1 THEN
                r1 := r1 +1;
            ELSE
                w1 := w1 +1;
            END IF;
        ELSIF d_no =2 THEN
             IF jdap = u2 THEN
                r1 := r1 +1;
            ELSE
                w1 := w1 +1;
            END IF;
        ELSIF d_no =3 THEN
             IF jdap = u3 THEN
                r1 := r1 +1;
            ELSE
                w1 := w1 +1;
            END IF;
        ELSIF d_no =4 THEN
             IF jdap = u4 THEN
                r1 := r1 +1;
            ELSE
                w1 := w1 +1;
            END IF;
        END IF;
        d_no := d_no +1;
    END LOOP;
    CLOSE dap_cur;
    msg := '���� : '||r1||', ���� : '||w1;
    UPDATE exam_paper
    set right_answer = r1,
          wrong_answer =w1
    WHERE exam_no = p_examno;
    COMMIT;
END;