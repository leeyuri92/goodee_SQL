CREATE OR REPLACE PROCEDURE SCOTT.proc_account2
IS
    vexam_no varchar2(10);
--������� �Է��� 1�� ���
    u1 number(1):=0;
--������� �Է��� 2�� ���    
    u2 number(1):=0;
--������� �Է��� 3�� ���    
    u3 number(1):=0;
--������� �Է��� 4�� ���    
    u4 number(1):=0;
    --1�� ����
    d1 number(1):=0;
    --2�� ����
    d2 number(1):=0;
    --3�� ����  
    d3 number(1):=0;
    --4�� ����
    d4 number(1):=0;
--������� ���� ���� ���� ����    
    r1 number(3):=0;
--������� Ʋ�� ���� ����        
    w1 number(3):=0;
    CURSOR paper_cur IS
    SELECT exam_no, dap1, dap2, dap3, dap4 FROM  exam_paper;
BEGIN
    SELECT 
                  min(decode(d_no,1,dap))
               ,  min(decode(d_no,2,dap))
               ,  min(decode(d_no,3,dap))
               ,  min(decode(d_no,4,dap)) 
               INTO d1, d2, d3, d4
       FROM sw_design
    GROUP BY ceil(d_no/4);
    OPEN paper_cur;
    --3�� ����� ä�� ����
    LOOP
        FETCH  paper_cur INTO vexam_no, u1,u2,u3,u4;
        --���ѷ����� ���� ��� �ڵ� �ۼ��ϱ�
        exit WHEN paper_cur%NOTFOUND;--�л�����ŭ �ݺ��ȴ� - 3������ ����
        IF u1 = d1 THEN
            r1:=r1+1;
        ELSE
            w1:=w1+1;
        END IF; 
        IF u2 = d2 THEN
            r1:=r1+1;
        ELSE
            w1:=w1+1;
        END IF;    
        IF u3 = d3 THEN
            r1:=r1+1;
        ELSE
            w1:=w1+1;
        END IF;    
        IF u4 = d4 THEN
            r1:=r1+1;
        ELSE
            w1:=w1+1;
        END IF;   
        UPDATE exam_paper
              set right_answer = r1,
                     wrong_answer = w1
        WHERE exam_no = vexam_no;     
        COMMIT;
        r1:=0;
        w1:=0;                                   
    END LOOP;
    CLOSE paper_cur;
END;
/