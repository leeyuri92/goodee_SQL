�̵� �������� �۾��ð��� ª�� �ɸ��� �ð� ������� 1���� 15������ ������ 
�Űܼ� ����Ͻÿ�.

SELECT * FROM t_worktime;

SELECT ROWNUM rno ,workcd_vc, time_nu 
FROM t_worktime
WHERE ROWNUM <4;

SELECT*
FROM (
            SELECT ROWNUM rno ,workcd_vc, time_nu 
            FROM t_worktime
            WHERE ROWNUM <4
            )A ,(
            SELECT ROWNUM rno ,workcd_vc, time_nu 
            FROM t_worktime
            WHERE ROWNUM <4
            )b
;

SELECT*
FROM (
            SELECT ROWNUM rno ,workcd_vc, time_nu 
            FROM t_worktime
            WHERE ROWNUM <4
            )A ,(
            SELECT ROWNUM rno ,workcd_vc, time_nu 
            FROM t_worktime
            WHERE ROWNUM <4
            )b
WHERE A.time_nu >=b.time_nu;



SELECT A.workcd_vc, A.time_nu, count(b.workcd_vc)
FROM (
            SELECT ROWNUM rno ,workcd_vc, time_nu 
            FROM t_worktime
            WHERE ROWNUM <4
            )A ,(
            SELECT ROWNUM rno ,workcd_vc, time_nu 
            FROM t_worktime
            WHERE ROWNUM <4
            )b
WHERE A.time_nu >=b.time_nu
GROUP BY A.workcd_vc, A.time_nu ;






-----------------------------
SELECT ROWNUM rno ,workcd_vc, time_nu 
FROM t_worktime
WHERE ROWNUM <16;

SELECT*
FROM (
            SELECT ROWNUM rno ,workcd_vc, time_nu 
            FROM t_worktime
            WHERE ROWNUM <16
            )A ,(
            SELECT ROWNUM rno ,workcd_vc, time_nu 
            FROM t_worktime
            WHERE ROWNUM <16
            )b
WHERE A.time_nu >=b.time_nu;

SELECT A.workcd_vc, A.time_nu, count(b.workcd_vc) ����
FROM (
            SELECT ROWNUM rno ,workcd_vc, time_nu 
            FROM t_worktime
            WHERE ROWNUM <16
            )A ,(
            SELECT ROWNUM rno ,workcd_vc, time_nu 
            FROM t_worktime
            WHERE ROWNUM <16
            )b
WHERE A.time_nu >=b.time_nu
GROUP BY A.workcd_vc, A.time_nu
ORDER BY ���� ;