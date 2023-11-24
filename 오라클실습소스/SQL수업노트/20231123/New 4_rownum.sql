
decode(비교할값,1,indate_vc, 2,'소계', 3,'총계')

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

SELECT decode(rno,1,indate_vc, 2,'소계', 3,'총계'),sum(qty_nu),sum(qty_nu*price_nu)
FROM t_orderbasket,(SELECT ROWNUM rno 
FROM dept
WHERE ROWNUM <4)
GROUP BY decode(rno,1,indate_vc, 2,'소계', 3,'총계') ;

SELECT decode(rno,1,indate_vc, 2,'소계', 3,'총계') 날짜, gubun_vc, sum(qty_nu), sum(qty_nu*price_nu)
FROM t_orderbasket, (SELECT ROWNUM rno 
                                     FROM dept
                                     WHERE ROWNUM <4)
GROUP BY decode(rno,1,indate_vc, 2,'소계', 3,'총계'), gubun_vc
ORDER BY decode(rno,1,indate_vc, 2,'소계', 3,'총계') ;

SELECT decode(rno,1,indate_vc, 2,'소계', 3,'총계') 판매날짜, 
             decode(rno,1,gubun_vc, 2,gubun_vc||'계', 3,NULL) 물품구분,
             sum(qty_nu)||' 개' 판매개수,
             sum(qty_nu*price_nu)||' 원' 판매가격
FROM t_orderbasket, (SELECT ROWNUM rno 
                                     FROM dept
                                     WHERE ROWNUM <4)
GROUP BY decode(rno,1,indate_vc, 2,'소계', 3,'총계'), decode(rno,1,gubun_vc, 2,gubun_vc||'계', 3,NULL)
ORDER BY decode(rno,1,indate_vc, 2,'소계', 3,'총계') ;

SELECT decode(rno,1,indate_vc, 2,'소계', 3,'총계') 판매날짜, 
             decode(rno,1,gubun_vc, 2,gubun_vc||'계') 물품구분,
             sum(qty_nu)||' 개' 판매개수,
             sum(qty_nu*price_nu)||' 원' 판매가격
FROM t_orderbasket, (SELECT ROWNUM rno 
                                     FROM dept
                                     WHERE ROWNUM <4)
GROUP BY decode(rno,1,indate_vc, 2,'소계', 3,'총계'), decode(rno,1,gubun_vc, 2,gubun_vc||'계' )
ORDER BY decode(rno,1,indate_vc, 2,'소계', 3,'총계') ;



SELECT * 
FROM emp, dept;