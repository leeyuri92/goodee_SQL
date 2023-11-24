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
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (2,'������ �ξ��');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (3,'When I find myself in times of trouble');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (4,'���� ���ο��� �ð����� ��Ȳ�� ���� ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (5,'Mother Mary comes to me Speaking words of wisdom,');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (6,'��Ӵϴ� ���� �ٰ��� ������ ������ ���ֽŴ�. ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (7,'Let it be ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (8,'������ �ξ��.');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (9,'And in my hour of darkness ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (10,'�׸��� ���� ��Ҽӿ� ����� ��, ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (11,'She is standing right in front of me Speaking words of wisdom,');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (12,'�׳�� �� �ٷ� �տ���, ������ ������ ���ֽŴ�. ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (13,'Let it be. ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (14,'������ �ξ��.');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (15,'And when the broken hearted people Living in the world agree, There will be an answer, ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (16,'�� ������ ��ó���� ������� �� ������ ����� �� �Ŷ� �ϴ´�. ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (17,'Let it be ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (18,'������ �ξ��.');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (19,'For though they may be parted ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (20,'�׵��� ��������� ������ �׵��� ���� ��ȸ�� �������̴�. ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (21,'There is still a chance that they will see, There will be an answer,');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (22,'����� ���� ���̴�.');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (23,'let it be ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (24,'������ �ξ��.');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (25,'And the night is cloudy, there is still a light that shines on me.');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (26,'������ �� �㿡��, ���� �� ���߾��ִ� ���� �־�. ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (27,'Shine until tomorrow, let it be.');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (28,'����� ��ӵ� ���̴�.������ �ξ��. ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (29,'I wake up to the sound of music,');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (30,'���� �Ҹ��� �� �����, ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (31,'Mother Mary comes to me,Speaking words of whisdom,');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (32,'��Ӵ� �޾�� ���� �ٰ���,������ ������ �� �ֽŴ�. ');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (33,'Let it be.');
INSERT INTO T_LETITBE (SEQ_VC,WORDS_VC) VALUES (34,'������ �ξ��. ');

COMMIT;

SELECT *
FROM T_LETITBE;

--1)����縸 ������ �ϱ�-
SELECT  mod(seq_vc,2),WORDS_VC
FROM T_LETITBE
WHERE mod(seq_vc,2)=1;

ROLLBACK;


--2)�ѱ۰��縸 ������ �ϱ�
--3)��������� �ѱ� ���� ��� ������ �ϱ�
--3�� ������ ��� SELECT * FROM t_letitbe�� ���� �ƴմϴ�.
--����:�������� �̿��ϼž� �մϴ�.
 --     ���� ���ּž� �մϴ�.
   --  ��������� �ѱ۰��� ����� ��µǾ�� �մϴ�.
--�ش� ���̺��� ÷���� �帰 ����Ŭ �ҽ� ������ SQL����
--4�忡 �ִ� t_letitbe�� �����ϼ���

