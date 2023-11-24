char타입 - 고정형타입
varchar2 타입 hello나머지 5칸은 반납 - 가변형타입
WHERE char = varchar2  ==> FALSE 논리적에러 - 흐름이 바뀐다.



SELECT 컬럼명1, 컬럼명2, ... 함수명(컬럼명3) 
FROM  집합1, 집합2, (select문 - 인라인뷰)
WHERE 컬럼명 1 = 값(상수만 아니다. select문 - 서브쿼리)
    AND 컬럼명 2 = 값(select문)
    OR    컬럼명 3 = 값( IN - 합집합의 경우 경우의 수가 늘어나서 좋지 않다.
GROUP BY
HAVING
ORDER BY



SELECT ROWNUM rno FROM temp;

SELECT ROWNUM rno, emp_name FROM temp;
-- 1,2,3이 모두 1이 출력되도록 한다.


SELECT rno, ceil(rno/5) cno, mod(rno,5) mno, floor(rno/5) fno, emp_name
FROM (
            SELECT ROWNUM rno, emp_name FROM temp);
            
SELECT ceil(rno/5) cno
FROM (
            SELECT ROWNUM rno FROM temp
            )
GROUP BY ceil(rno/5)
ORDER BY cno;

SELECT '김길동','홍길동', '박문수' FROM dual
UNION ALL
SELECT '정도령','이순신','지문덕' FROM dual
UNION ALL
SELECT '강감찬','설까치','연흥부'FROM dual;


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
             max(decode(mod(rno,5),1,emp_name)) AS "1열",
             max(decode(mod(rno,5),2,emp_name))AS "2열",
             max(decode(mod(rno,5),3,emp_name))AS "3열",
             max(decode(mod(rno,5),4,emp_name))AS "4열",
             max(decode(mod(rno,5),0,emp_name))AS "5열"
FROM (
            SELECT ROWNUM rno,emp_name FROM temp
            )
GROUP BY ceil(rno/5)
ORDER BY cno;

SELECT ceil(rno/5) cno,
             max(decode(mod(rno,5),1,emp_id))||'-'||max(decode(mod(rno,5),1,emp_name)) AS "1열",
             max(decode(mod(rno,5),2,emp_id))||'-'||max(decode(mod(rno,5),2,emp_name))AS "2열",
             max(decode(mod(rno,5),3,emp_id))||'-'||max(decode(mod(rno,5),3,emp_name))AS "3열",
             max(decode(mod(rno,5),4,emp_id))||'-'||max(decode(mod(rno,5),4,emp_name))AS "4열",
             max(decode(mod(rno,5),0,emp_id))||'-'||max(decode(mod(rno,5),0,emp_name))AS "5열"
FROM (
            SELECT ROWNUM rno,emp_name,emp_id FROM temp
            )
GROUP BY ceil(rno/5)
ORDER BY cno;