-- 로우레벨에 있는 값을 컬럼레벨로 옮겨서 출력하기
-- UI솔루션 + DataSet매핑

-- 변수선언 - 기준, 초기화, 위치
-- 구현해보기

SELECT *
FROM sw_design;

SELECT 1,2,3 FROM dual;

SELECT 1 FROM dual
UNION ALL
SELECT 2 FROM dual;

UI/VIEW 계층
출력되는 디자인 패턴 - 테이블구조 그대로 출력되는 경우는 없다

구조를 변경하면서 출력하기 - 인라인뷰

SELECT dap FROM sw_design;

SELECT 1,2,3 FROM sw_design;

SELECT ceil(d_no/4) ,2,3 FROM sw_design
GROUP BY ceil(d_no/4);

-- 파싱과정을 통과해야만 테스트가 가능하다

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
-- 수험생이 입력한 1~4번 답안
    u1 number(1) :=0;
    u2 number(1) :=0;
    u3 number(1) :=0;
    u4 number(1) :=0;
-- 수험생이 입력한 1~4번 답안
    d1 number(1) :=0;
    d2 number(1) :=0;
    d3 number(1) :=0;
    d4 number(1) :=0;
-- 수험생이 맞춘 정답 수를 담음
    r1 number(3) :=0;
--  수험생이 틀린 오답 수를 담음
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