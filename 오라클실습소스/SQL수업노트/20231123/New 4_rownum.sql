
decode(���Ұ�,1,indate_vc, 2,'�Ұ�', 3,'�Ѱ�')

SELECT ROWNUM rno 
FROM dept
WHERE ROWNUM <4;

SELECT *
FROM t_orderbasket;

SELECT indate_vc, gubun_vc, qty_nu, qty_nu*price_nu
FROM t_orderbasket ;

SELECT indate_vc, gubun_vc, qty_nu, qty_nu*price_nu,rno
FROM t_orderbasket,(SELECT ROWNUM rno 
                                    FROM dept
                                    WHERE ROWNUM <4
);

SELECT indate_vc, gubun_vc, sum(qty_nu),sum(qty_nu*price_nu)
FROM t_orderbasket, (SELECT ROWNUM rno 
FROM dept
WHERE ROWNUM <4)
GROUP BY indate_vc, gubun_vc
ORDER BY indate_vc,gubun_vc ;

SELECT decode(rno,1,indate_vc, 2,'�Ұ�', 3,'�Ѱ�'),sum(qty_nu),sum(qty_nu*price_nu)
FROM t_orderbasket,(SELECT ROWNUM rno 
FROM dept
WHERE ROWNUM <4)
GROUP BY decode(rno,1,indate_vc, 2,'�Ұ�', 3,'�Ѱ�') ;

SELECT decode(rno,1,indate_vc, 2,'�Ұ�', 3,'�Ѱ�') ��¥, gubun_vc, sum(qty_nu), sum(qty_nu*price_nu)
FROM t_orderbasket, (SELECT ROWNUM rno 
                                     FROM dept
                                     WHERE ROWNUM <4)
GROUP BY decode(rno,1,indate_vc, 2,'�Ұ�', 3,'�Ѱ�'), gubun_vc
ORDER BY decode(rno,1,indate_vc, 2,'�Ұ�', 3,'�Ѱ�') ;

SELECT decode(rno,1,indate_vc, 2,'�Ұ�', 3,'�Ѱ�') �Ǹų�¥, 
             decode(rno,1,gubun_vc, 2,gubun_vc||'��', 3,NULL) ��ǰ����,
             sum(qty_nu)||' ��' �ǸŰ���,
             sum(qty_nu*price_nu)||' ��' �ǸŰ���
FROM t_orderbasket, (SELECT ROWNUM rno 
                                     FROM dept
                                     WHERE ROWNUM <4)
GROUP BY decode(rno,1,indate_vc, 2,'�Ұ�', 3,'�Ѱ�'), decode(rno,1,gubun_vc, 2,gubun_vc||'��', 3,NULL)
ORDER BY decode(rno,1,indate_vc, 2,'�Ұ�', 3,'�Ѱ�') ;

SELECT decode(rno,1,indate_vc, 2,'�Ұ�', 3,'�Ѱ�') �Ǹų�¥, 
             decode(rno,1,gubun_vc, 2,gubun_vc||'��') ��ǰ����,
             sum(qty_nu)||' ��' �ǸŰ���,
             sum(qty_nu*price_nu)||' ��' �ǸŰ���
FROM t_orderbasket, (SELECT ROWNUM rno 
                                     FROM dept
                                     WHERE ROWNUM <4)
GROUP BY decode(rno,1,indate_vc, 2,'�Ұ�', 3,'�Ѱ�'), decode(rno,1,gubun_vc, 2,gubun_vc||'��' )
ORDER BY decode(rno,1,indate_vc, 2,'�Ұ�', 3,'�Ѱ�') ;



SELECT * 
FROM emp, dept;