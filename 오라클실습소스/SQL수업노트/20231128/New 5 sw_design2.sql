edit exam_paper;
COMMIT;

SELECT * FROM exam_paper;

SELECT * FROM sw_design;

SELECT decode(d_no,1,dap), 
             decode(d_no,2,dap),
             decode(d_no,3,dap),
             decode(d_no,4,dap)
FROM sw_design;

SELECT 
             sum(decode(d_no,1,dap)), 
             sum(decode(d_no,2,dap)),
             sum(decode(d_no,3,dap)),
             sum(decode(d_no,4,dap))
FROM sw_design
GROUP BY ceil(d_no/4) ;

SELECT
            d1,d2,d3,d4 INTO d1,d2,d3,d4
FROM(
            SELECT 
                        sum(decode(d_no,1,dap)) d1, 
                        sum(decode(d_no,2,dap)) d2,
                        sum(decode(d_no,3,dap)) d3,
                        sum(decode(d_no,4,dap)) d4
            FROM sw_design
            GROUP BY ceil(d_no/4) 
          );