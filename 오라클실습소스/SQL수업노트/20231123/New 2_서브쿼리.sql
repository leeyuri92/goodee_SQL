-��������

SELECT A
FROM (
                SELECT decode(mod(seq_vc,2),1,words_vc)A
                FROM t_letitbe
            )
WHERE A LIKE 'Let%';

1.temp���� ������ ���� ���� ������ row�� ã�Ƽ� �� �ݾװ� ������ �ݾ���
�޴� ������ ����� ������ ����Ͻÿ�.

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

2.temp�� �ڷḦ �̿��Ͽ� salary�� ����� ���ϰ� �̺��� ū �ݾ��� salary�� 
�޴� ������ ����� ����, ������ �����ֽÿ�.

SELECT avg(salary)
FROM temp;

SELECT emp_id, emp_name, salary
FROM temp
WHERE salary > ( SELECT avg(salary)
                              FROM temp);
                              
3.temp�� ���� �� ��õ�� �ٹ��ϴ� ������ ����� ������ �о���� SQL�� ���������� �̿��� �����ÿ�.

SELECT * FROM tdept;

SELECT dept_code FROM tdept WHERE area = '��õ';

SELECT emp_id, emp_name, dept_code
FROM temp
WHERE dept_code IN(
                                      SELECT dept_code FROM tdept WHERE area = '��õ');
                                      
tcom�� ���� �ܿ� Ŀ�̼��� �޴� ������ ����� �����Ǿ� �ִ�.
�� ������ ���������� select�Ͽ� �μ� ��Ī���� Ŀ�̼��� �޴�
�ο����� ���� ������ ����� ���ÿ�.

SELECT emp_id
FROM Tcom;

SELECT b.dept_name, count(A.emp_id)
FROM temp A, tdept b
WHERE A.dept_code = b.dept_code AND
A.emp_id IN( SELECT emp_id FROM tcom)
GROUP BY b.dept_name;


���ǥ�� ���� �����ؾ��� ��ȭ �ݾ��� ���Ͻÿ�. CRATE : ȯ��, AMT : �ݾ�

SELECT * FROM test02;

SELECT (to_date(cdate)-1)*crate AS ���ð����ұݾ�
FROM test02;

SELECT (to_date(cdate)-1)
FROM test02;

SELECT cdate, amt, crate, (to_date(cdate)-1)
FROM test02;

SELECT cdate, amt, crate, lag(crate,1) OVER (ORDER BY cdate)
FROM test02;


SELECT cdate, amt, crate, amt*(lag(crate,1) OVER (ORDER BY cdate)) ���ð����ұݾ�
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

SELECT A.cdate ���� , A.amt �ݾ�, b.crate AS "���� ȯ��", A.amt*B.CRATE AS "���� ������ �ݾ�"
FROM (
             SELECT cdate, amt, crate, ROWNUM rno 
             FROM test02
            )A, (
                    SELECT cdate, amt, crate, ROWNUM rno2 
                    FROM test02
            )b
WHERE A.rno-1= b.rno2;

SELECT A.cdate ���� , A.amt �ݾ�, b.crate AS "���� ȯ��", to_char((A.amt*B.CRATE),'9,999,999,999')||'��' AS "���� ������ �ݾ�"
FROM (
             SELECT cdate, amt, crate, ROWNUM rno 
             FROM test02
            )A, (
                    SELECT cdate, amt, crate, ROWNUM rno2 
                    FROM test02
            )b
WHERE A.rno-1= b.rno2;


