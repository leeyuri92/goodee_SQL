-서브쿼리

SELECT A
FROM (
                SELECT decode(mod(seq_vc,2),1,words_vc)A
                FROM t_letitbe
            )
WHERE A LIKE 'Let%';

1.temp에서 연봉이 가장 많은 직원의 row를 찾아서 이 금액과 동일한 금액을
받는 직원의 사번과 성명을 출력하시오.

SELECT *
FROM temp;

SELECT max(salary)
FROM temp;

SELECT emp_id, emp_name
FROM temp
WHERE salary = 100000000;

SELECT emp_id, emp_name
FROM temp
WHERE salary = ( SELECT max(salary)
                               FROM temp);

2.temp의 자료를 이용하여 salary의 평균을 구하고 이보다 큰 금액을 salary로 
받는 직원의 사번과 성명, 연봉을 보여주시오.

SELECT avg(salary)
FROM temp;

SELECT emp_id, emp_name, salary
FROM temp
WHERE salary > ( SELECT avg(salary)
                              FROM temp);
                              
3.temp의 직원 중 인천에 근무하는 직원의 사번과 성명을 읽어오는 SQL을 서브쿼리를 이용해 만들어보시오.

SELECT * FROM tdept;

SELECT dept_code FROM tdept WHERE area = '인천';

SELECT emp_id, emp_name, dept_code
FROM temp
WHERE dept_code IN(
                                      SELECT dept_code FROM tdept WHERE area = '인천');
                                      
tcom에 연봉 외에 커미션을 받는 직원의 사번이 보관되어 있다.
이 정보를 서브쿼리로 select하여 부서 명칭별로 커미션을 받는
인원수를 세는 문장을 만들어 보시오.

SELECT emp_id
FROM Tcom;

SELECT b.dept_name, count(A.emp_id)
FROM temp A, tdept b
WHERE A.dept_code = b.dept_code AND
A.emp_id IN( SELECT emp_id FROM tcom)
GROUP BY b.dept_name;


김대표가 오늘 결제해야할 한화 금액을 구하시오. CRATE : 환율, AMT : 금액

SELECT * FROM test02;

SELECT (to_date(cdate)-1)*crate AS 오늘결제할금액
FROM test02;

SELECT (to_date(cdate)-1)
FROM test02;

SELECT cdate, amt, crate, (to_date(cdate)-1)
FROM test02;

SELECT cdate, amt, crate, lag(crate,1) OVER (ORDER BY cdate)
FROM test02;


SELECT cdate, amt, crate, amt*(lag(crate,1) OVER (ORDER BY cdate)) 오늘결제할금액
FROM test02
ORDER BY cdate;
-----------------------------------------------------

SELECT cdate, amt, crate
FROM test02;

SELECT cdate, amt, crate, ROWNUM rno
FROM test02;

SELECT *
FROM (
             SELECT cdate, amt, crate, ROWNUM rno 
             FROM test02
            )A, (
                    SELECT cdate, amt, crate, ROWNUM rno2 
                    FROM test02
            )b;

SELECT *
FROM (
             SELECT cdate, amt, crate, ROWNUM rno 
             FROM test02
            )A, (
                    SELECT cdate, amt, crate, ROWNUM rno2 
                    FROM test02
            )b
WHERE A.rno-1= b.rno2;

SELECT A.cdate 일자 , A.amt 금액, b.crate AS "어제 환율", A.amt*B.CRATE AS "오늘 결제할 금액"
FROM (
             SELECT cdate, amt, crate, ROWNUM rno 
             FROM test02
            )A, (
                    SELECT cdate, amt, crate, ROWNUM rno2 
                    FROM test02
            )b
WHERE A.rno-1= b.rno2;

SELECT A.cdate 일자 , A.amt 금액, b.crate AS "어제 환율", to_char((A.amt*B.CRATE),'9,999,999,999')||'원' AS "오늘 결제할 금액"
FROM (
             SELECT cdate, amt, crate, ROWNUM rno 
             FROM test02
            )A, (
                    SELECT cdate, amt, crate, ROWNUM rno2 
                    FROM test02
            )b
WHERE A.rno-1= b.rno2;


