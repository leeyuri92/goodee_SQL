charŸ�� - ������Ÿ��
varchar2 Ÿ�� hello������ 5ĭ�� �ݳ� - ������Ÿ��
WHERE char = varchar2  ==> FALSE �������� - �帧�� �ٲ��.



SELECT �÷���1, �÷���2, ... �Լ���(�÷���3) 
FROM  ����1, ����2, (select�� - �ζ��κ�)
WHERE �÷��� 1 = ��(����� �ƴϴ�. select�� - ��������)
    AND �÷��� 2 = ��(select��)
    OR    �÷��� 3 = ��( IN - �������� ��� ����� ���� �þ�� ���� �ʴ�.
GROUP BY
HAVING
ORDER BY



SELECT ROWNUM rno FROM temp;

SELECT ROWNUM rno, emp_name FROM temp;
-- 1,2,3�� ��� 1�� ��µǵ��� �Ѵ�.


SELECT rno, ceil(rno/5) cno, mod(rno,5) mno, floor(rno/5) fno, emp_name
FROM (
            SELECT ROWNUM rno, emp_name FROM temp);
            
SELECT ceil(rno/5) cno
FROM (
            SELECT ROWNUM rno FROM temp
            )
GROUP BY ceil(rno/5)
ORDER BY cno;

SELECT '��浿','ȫ�浿', '�ڹ���' FROM dual
UNION ALL
SELECT '������','�̼���','������' FROM dual
UNION ALL
SELECT '������','����ġ','�����'FROM dual;


SELECT ceil(rno/5) cno,
             decode(mod(rno,5),1,emp_name),
             decode(mod(rno,5),2,emp_name),
             decode(mod(rno,5),3,emp_name),
             decode(mod(rno,5),4,emp_name),
             decode(mod(rno,5),0,emp_name)
FROM (
            SELECT ROWNUM rno, emp_name FROM temp
            );


SELECT ceil(rno/5) cno,
             max(decode(mod(rno,5),1,emp_name)) AS "1��",
             max(decode(mod(rno,5),2,emp_name))AS "2��",
             max(decode(mod(rno,5),3,emp_name))AS "3��",
             max(decode(mod(rno,5),4,emp_name))AS "4��",
             max(decode(mod(rno,5),0,emp_name))AS "5��"
FROM (
            SELECT ROWNUM rno,emp_name FROM temp
            )
GROUP BY ceil(rno/5)
ORDER BY cno;

SELECT ceil(rno/5) cno,
             max(decode(mod(rno,5),1,emp_id))||'-'||max(decode(mod(rno,5),1,emp_name)) AS "1��",
             max(decode(mod(rno,5),2,emp_id))||'-'||max(decode(mod(rno,5),2,emp_name))AS "2��",
             max(decode(mod(rno,5),3,emp_id))||'-'||max(decode(mod(rno,5),3,emp_name))AS "3��",
             max(decode(mod(rno,5),4,emp_id))||'-'||max(decode(mod(rno,5),4,emp_name))AS "4��",
             max(decode(mod(rno,5),0,emp_id))||'-'||max(decode(mod(rno,5),0,emp_name))AS "5��"
FROM (
            SELECT ROWNUM rno,emp_name,emp_id FROM temp
            )
GROUP BY ceil(rno/5)
ORDER BY cno;