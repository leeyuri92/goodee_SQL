-- �ο췹���� �ִ� ���� �÷������� �Űܼ� ����ϱ�
-- UI�ַ�� + DataSet����

-- �������� - ����, �ʱ�ȭ, ��ġ
-- �����غ���

SELECT *
FROM sw_design;

SELECT 1,2,3 FROM dual;

SELECT 1 FROM dual
UNION ALL
SELECT 2 FROM dual;

UI/VIEW ����
��µǴ� ������ ���� - ���̺��� �״�� ��µǴ� ���� ����

������ �����ϸ鼭 ����ϱ� - �ζ��κ�

SELECT dap FROM sw_design;

SELECT 1,2,3 FROM sw_design;

SELECT ceil(d_no/4) ,2,3 FROM sw_design
GROUP BY ceil(d_no/4);

-- �Ľ̰����� ����ؾ߸� �׽�Ʈ�� �����ϴ�

SELECT ceil(d_no/4) , 
             max(decode(d_no,1,dap)) ,
             max(decode(d_no,2,dap)) ,
             max(decode(d_no,3,dap)) ,
             max(decode(d_no,4,dap)) 
             INTO d1, d2, d3, d4
FROM sw_design
GROUP BY ceil(d_no/4);

LOOP
    FETCH paper_cur INTO vexam_no, u1, u2, u3, u4;
    exit WHEN paper_cur%NOTFOUND;
    IF
    
    END IF;
END LOOP;

r1 := 0;
w1 := 0;

    CURSOR paper_cur IS
    SELECT exam_no, dap1, dap2, dap3, dap4 FROM exam_paper;
    
    FETCH paper_cur INTO vexam_no, 

UPDATE exam_paper
    set right_answer = r1,
          wrong_answer =w1
    WHERE exam_no = p_examno;
   

CREATE OR REPLACE PROCEDURE proc_account2(p_examno IN varchar2)
IS
-- ������� �Է��� 1~4�� ���
    u1 number(1) :=0;
    u2 number(1) :=0;
    u3 number(1) :=0;
    u4 number(1) :=0;
-- ������� �Է��� 1~4�� ���
    d1 number(1) :=0;
    d2 number(1) :=0;
    d3 number(1) :=0;
    d4 number(1) :=0;
-- ������� ���� ���� ���� ����
    r1 number(3) :=0;
--  ������� Ʋ�� ���� ���� ����
    w1 number(3) :=0;
    CURSOR paper_cur IS
    SELECT exam_no, dap1, dap2, dap3, dap4 FROM exam_paper;
BEGIN
    SELECT ceil(d_no/4) , 
             max(decode(d_no,1,dap)) ,
             max(decode(d_no,2,dap)) ,
             max(decode(d_no,3,dap)) ,
             max(decode(d_no,4,dap)) 
             INTO d1, d2, d3, d4
     FROM sw_design
GROUP BY ceil(d_no/4);
END;