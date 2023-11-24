SELECT ename, sal
FROM emp;

SELECT emp.empno, emp.ENAME, dept.dname
FROM dept,emp
WHERE dept.deptno = emp.deptno;

SELECT max(sal)
FROM emp;

SELECT max(sal),ename
FROM emp;

SELECT max(sal), max(ename), min(ename)
FROM emp;

SELECT ename
FROM emp
WHERE sal = (SELECT max(sal) FROM emp);

SELECT * FROM emp;



SELECT avg(sal)
FROM emp;

SELECT DISTINCT(deptno) FROM emp;

SELECT deptno, avg(sal)
FROM emp
GROUP BY deptno
HAVING avg(sal) > 2000 ;

CREATE TABLE T_LETITBE
(
SEQ_VC VARCHAR2(2),
WORDS_VC VARCHAR2(100)
)
/
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (1,'Let it be');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (2,'내버려 두어라');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (3,'When I find myself in times of trouble');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (4,'내가 괴로움의 시간에서 방황할 때면 ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (5,'Mother Mary comes to me Speaking words of wisdom,');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (6,'어머니는 내게 다가와 현명한 말씀을 해주신다. ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (7,'Let it be ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (8,'내버려 두어라.');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (9,'And in my hour of darkness ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (10,'그리고 내가 어둠속에 헤매일 때, ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (11,'She is standing right in front of me Speaking words of wisdom,');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (12,'그녀는 내 바로 앞에서, 현명한 말씀을 해주신다. ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (13,'Let it be. ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (14,'내버려 두어라.');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (15,'And when the broken hearted people Living in the world agree, There will be an answer, ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (16,'이 세상의 상처받은 사람들은 이 말씀이 방법이 될 거라 믿는다. ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (17,'Let it be ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (18,'내버려 두어라.');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (19,'For though they may be parted ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (20,'그들이 헤어지더라도 여전히 그들이 만날 기회는 있을것이다. ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (21,'There is still a chance that they will see, There will be an answer,');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (22,'방법은 있을 것이다.');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (23,'let it be ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (24,'내버려 두어라.');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (25,'And the night is cloudy, there is still a light that shines on me.');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (26,'구름이 낀 밤에도, 아직 날 비추어주는 빛이 있어. ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (27,'Shine until tomorrow, let it be.');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (28,'희망은 계속될 것이다.내버려 두어라. ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (29,'I wake up to the sound of music,');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (30,'음악 소리에 난 깨어나고, ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (31,'Mother Mary comes to me,Speaking words of whisdom,');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (32,'어머니 메어리는 내게 다가와,현명한 말씀을 해 주신다. ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (33,'Let it be.');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (34,'내버려 두어라. ');

COMMIT;

SELECT *
FROM T_LETITBE;

--1)영어가사만 나오게 하기-
SELECT  mod(seq_vc,2),WORDS_VC
FROM T_LETITBE
WHERE mod(seq_vc,2)=1;

ROLLBACK;


--2)한글가사만 나오게 하기
SELECT  mod(seq_vc,2),WORDS_VC
FROM T_LETITBE
WHERE mod(seq_vc,2)=0;

--3)영문가사와 한글 가사 모두 나오게 하기
SELECT to_number(seq_vc) AS 행, WORDS_VC
FROM T_LETITBE
WHERE mod(seq_vc,2)=1
UNION 
SELECT to_number( seq_vc), WORDS_VC
FROM T_LETITBE
WHERE mod(seq_vc,2)=0;

--3번 문제의 경우 SELECT * FROM t_letitbe는 답이 아닙니다.
--조건:합집합을 이용하셔야 합니다.
 --     정렬 해주셔야 합니다.
   --  영문가사와 한글가사 교대로 출력되어야 합니다.
--해당 테이블은 첨부해 드린 오라클 소스 폴더에 SQL에서
--4장에 있는 t_letitbe를 참고하세요

CREATE TABLE T_GIFTPOINT
(
GIFTID_VC VARCHAR2(5) NOT NULL,
NAME_VC VARCHAR2(20) NOT NULL,
POINT_NU NUMBER NOT NULL
)
/
CREATE TABLE T_GIFTMEM
(
MEMCD_VC VARCHAR2(9) NOT NULL,
NAME_VC  VARCHAR2(20) NOT NULL,
POINT_NU NUMBER NOT NULL
)
/
INSERT INTO T_GIFTPOINT (GIFTID_VC,NAME_VC,POINT_NU) VALUES ('A0001','문화상품권',5000 );
INSERT INTO T_GIFTPOINT (GIFTID_VC,NAME_VC,POINT_NU) VALUES ('A0002','영화티켓',15000);
INSERT INTO T_GIFTPOINT (GIFTID_VC,NAME_VC,POINT_NU) VALUES ('A0003','구두상품권',60000);
INSERT INTO T_GIFTPOINT (GIFTID_VC,NAME_VC,POINT_NU) VALUES ('B0001','한과세트',50000);
INSERT INTO T_GIFTPOINT (GIFTID_VC,NAME_VC,POINT_NU) VALUES ('B0002','과일바구니',30000);
INSERT INTO T_GIFTPOINT (GIFTID_VC,NAME_VC,POINT_NU) VALUES ('B0003','과자종합',20000);
INSERT INTO T_GIFTMEM  (MEMCD_VC,NAME_VC,POINT_NU) VALUES (10,'노정환',40208);
INSERT INTO T_GIFTMEM  (MEMCD_VC,NAME_VC,POINT_NU) VALUES (13,'김현식',100205);
INSERT INTO T_GIFTMEM  (MEMCD_VC,NAME_VC,POINT_NU) VALUES (16,'김선우',80204);
INSERT INTO T_GIFTMEM  (MEMCD_VC,NAME_VC,POINT_NU) VALUES (19,'김유신',50012);
INSERT INTO T_GIFTMEM  (MEMCD_VC,NAME_VC,POINT_NU) VALUES (22,'이순신',8500);
COMMIT;

SELECT * FROM t_giftpoint;

SELECT * FROM t_giftmem;

--영화 티켓을 받을 수 있는 사람의 명단과 현재 가지고 있는 포인트, 영화 티켓의 포인트
--그리고 그 티켓을 사용한 후 남은 예상 포인트를 출력하시오.
-- 주어진 정보 : 영화티켓 - 15000점
-- 남은 포인트 - 회원보유포인트 - 영화티켓포인트 = 잔여포인트

SELECT point_nu
FROM t_giftpoint
WHERE name_vc = '영화티켓';

-- 보유포인트 >= 영화티켓포인트

SELECT mem.point_nu - poi.point_nu AS "잔여포인트"
FROM  t_giftmem mem , 
            (   
            SELECT point_nu 
            FROM t_giftpoint
            WHERE name_vc = '영화티켓'
            )poi
WHERE mem.point_nu >= poi.point_nu;

 --인라인뷰를 사용하지 않는 답안지
 -- Nested loop 조인방식으로 비교한다.
 -- 30가지의 경우수를 모두 체크한다
 
   SELECT mem.name_vc AS "이름"
             ,  mem.point_nu AS "보유포인트"
             ,  poi.point_nu AS "적용포인트"
             ,  mem.point_nu-poi.point_nu AS "잔여포인트"
  FROM t_giftmem mem, t_giftpoint poi
WHERE  mem.point_nu >= poi.point_nu
     AND poi.name_vc = '영화티켓';
     
SELECT point_nu FROM t_giftmem
WHERE name_vc = '김유신';



SELECT name_vc
FROM t_giftpoint
WHERE point_nu <= 50012;

SELECT point_nu 
FROM t_giftmem
WHERE name_vc = '김유신';

SELECT name_vc
FROM t_giftpoint
WHERE point_nu <= 50012;     
  
SELECT max(point_nu)
FROM t_giftpoint
WHERE point_nu <= 50012; 
  
SELECT name_vc
FROM t_giftpoint
WHERE point_nu = (
                    SELECT max(point_nu)
                    FROM t_giftpoint
                    WHERE point_nu <= 50012  
                   );   

     
     
     