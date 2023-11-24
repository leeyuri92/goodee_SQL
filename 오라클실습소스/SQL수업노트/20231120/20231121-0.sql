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
SELECT  mod(seq_vc,2),WORDS_VC
FROM T_LETITBE
WHERE mod(seq_vc,2)=0;

--3)��������� �ѱ� ���� ��� ������ �ϱ�
SELECT to_number(seq_vc) AS ��, WORDS_VC
FROM T_LETITBE
WHERE mod(seq_vc,2)=1
UNION 
SELECT to_number( seq_vc), WORDS_VC
FROM T_LETITBE
WHERE mod(seq_vc,2)=0;

--3�� ������ ��� SELECT * FROM t_letitbe�� ���� �ƴմϴ�.
--����:�������� �̿��ϼž� �մϴ�.
 --     ���� ���ּž� �մϴ�.
   --  ��������� �ѱ۰��� ����� ��µǾ�� �մϴ�.
--�ش� ���̺��� ÷���� �帰 ����Ŭ �ҽ� ������ SQL����
--4�忡 �ִ� t_letitbe�� �����ϼ���

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
INSERT INTO T_GIFTPOINT (GIFTID_VC,NAME_VC,POINT_NU) VALUES ('A0001','��ȭ��ǰ��',5000 );
INSERT INTO T_GIFTPOINT (GIFTID_VC,NAME_VC,POINT_NU) VALUES ('A0002','��ȭƼ��',15000);
INSERT INTO T_GIFTPOINT (GIFTID_VC,NAME_VC,POINT_NU) VALUES ('A0003','���λ�ǰ��',60000);
INSERT INTO T_GIFTPOINT (GIFTID_VC,NAME_VC,POINT_NU) VALUES ('B0001','�Ѱ���Ʈ',50000);
INSERT INTO T_GIFTPOINT (GIFTID_VC,NAME_VC,POINT_NU) VALUES ('B0002','���Ϲٱ���',30000);
INSERT INTO T_GIFTPOINT (GIFTID_VC,NAME_VC,POINT_NU) VALUES ('B0003','��������',20000);
INSERT INTO T_GIFTMEM  (MEMCD_VC,NAME_VC,POINT_NU) VALUES (10,'����ȯ',40208);
INSERT INTO T_GIFTMEM  (MEMCD_VC,NAME_VC,POINT_NU) VALUES (13,'������',100205);
INSERT INTO T_GIFTMEM  (MEMCD_VC,NAME_VC,POINT_NU) VALUES (16,'�輱��',80204);
INSERT INTO T_GIFTMEM  (MEMCD_VC,NAME_VC,POINT_NU) VALUES (19,'������',50012);
INSERT INTO T_GIFTMEM  (MEMCD_VC,NAME_VC,POINT_NU) VALUES (22,'�̼���',8500);
COMMIT;

SELECT * FROM t_giftpoint;

SELECT * FROM t_giftmem;

--��ȭ Ƽ���� ���� �� �ִ� ����� ��ܰ� ���� ������ �ִ� ����Ʈ, ��ȭ Ƽ���� ����Ʈ
--�׸��� �� Ƽ���� ����� �� ���� ���� ����Ʈ�� ����Ͻÿ�.
-- �־��� ���� : ��ȭƼ�� - 15000��
-- ���� ����Ʈ - ȸ����������Ʈ - ��ȭƼ������Ʈ = �ܿ�����Ʈ

SELECT point_nu
FROM t_giftpoint
WHERE name_vc = '��ȭƼ��';

-- ��������Ʈ >= ��ȭƼ������Ʈ

SELECT mem.point_nu - poi.point_nu AS "�ܿ�����Ʈ"
FROM  t_giftmem mem , 
            (   
            SELECT point_nu 
            FROM t_giftpoint
            WHERE name_vc = '��ȭƼ��'
            )poi
WHERE mem.point_nu >= poi.point_nu;

 --�ζ��κ並 ������� �ʴ� �����
 -- Nested loop ���ι������ ���Ѵ�.
 -- 30������ ������ ��� üũ�Ѵ�
 
   SELECT mem.name_vc AS "�̸�"
             ,  mem.point_nu AS "��������Ʈ"
             ,  poi.point_nu AS "��������Ʈ"
             ,  mem.point_nu-poi.point_nu AS "�ܿ�����Ʈ"
  FROM t_giftmem mem, t_giftpoint poi
WHERE  mem.point_nu >= poi.point_nu
     AND poi.name_vc = '��ȭƼ��';
     
SELECT point_nu FROM t_giftmem
WHERE name_vc = '������';



SELECT name_vc
FROM t_giftpoint
WHERE point_nu <= 50012;

SELECT point_nu 
FROM t_giftmem
WHERE name_vc = '������';

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

     
     
     