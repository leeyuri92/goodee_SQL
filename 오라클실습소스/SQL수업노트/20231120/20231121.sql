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
--3)영문가사와 한글 가사 모두 나오게 하기
--3번 문제의 경우 SELECT * FROM t_letitbe는 답이 아닙니다.
--조건:합집합을 이용하셔야 합니다.
 --     정렬 해주셔야 합니다.
   --  영문가사와 한글가사 교대로 출력되어야 합니다.
--해당 테이블은 첨부해 드린 오라클 소스 폴더에 SQL에서
--4장에 있는 t_letitbe를 참고하세요

