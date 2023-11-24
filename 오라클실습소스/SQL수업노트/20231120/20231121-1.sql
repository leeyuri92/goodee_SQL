CREATE TABLE LECTURE (LEC_ID VARCHAR2(05),LEC_TIME NUMBER,LEC_POINT NUMBER);
INSERT INTO LECTURE VALUES('L0001',3,3);
INSERT INTO LECTURE VALUES('L0002',3,2);
INSERT INTO LECTURE VALUES('L0003',2,3);
INSERT INTO LECTURE VALUES('L0004',2,2);
INSERT INTO LECTURE VALUES('L0005',3,1);
COMMIT;

IF A = B THEN
RETURN 'T';
END IF;

SELECT DECODE (1,1,'T')
            ,DECODE (1,1,'T','F')
            FROM dual;
            
-- 문제1 - 주당 강의시간과 학점이 같으면 '일반과목'을 돌려 받는 쿼리문을 작성하시오.            
SELECT decode(lec_time, lec_point,'일치') 
FROM lecture;
-- 조건절을 만족하지 않는 경우에는 null을 반환한다는 것을 알 수 있다.
SELECT decode(lec_time, lec_point,'일반과목',NULL) 
FROM lecture;
 

-- 문제 2. 주당강의시간과 학점이 같은 강의의  총 행수를  출력하는 쿼리문을 작성하시오
SELECT count( decode(lec_time, lec_point,'일치'))
FROM lecture;

-- 문제3. 강의시간과 학점이 같거나 강의시간이 학점보다 작으면 '일반과목'을 돌려받고 
-- 강의시간이 학점보다 큰 경우만 '실험과목'이라고 돌려받고 싶다면 어떻게 처리할 수 있을 까요?

SELECT decode(sign(lec_time-lec_point),1,'실험과목','일반과목')
FROM lecture;
-- 문제 3-1. lec_time이 크면 '실험과목', lec_point가 크면 '기타과목', 둘이 같으면 ' 일반과목'으로 값을 돌려받는 쿼리문을 작성하시오.
SELECT decode(sign(lec_time-lec_point),1,'실험과목',-1,'기타과목',0,'일반과목')
FROM lecture;

SELECT sign(1+100),sign(-5000),sign(100-100)
FROM dual;

SELECT decode(sign(100-200), 1, '양수', -1, '음수', 0, '0')
FROM dual;
-- null은 결정되지않았다, 모른다라는 개념이므로 정렬을 할 수 없다.
-- 
SELECT comm 
FROM emp
ORDER BY comm ASC;

문제. 강의시간과 학점이 같으면 '일반과목'을 리턴 받은 후 정렬도 하고싶다면?
SELECT decode(lec_time, lec_point, '일반과목') AS 과목
FROM lecture
ORDER BY 과목;



 문제: 월요일엔 해당일자에 01을 붙여서 4자리 암호를 만들고, 
 화요일엔 11, 수요일엔 21, 목요일엔, 31, 금요일엔 41, 토요일엔 51,일요일엔 61을 붙여서 4자리 암호를 만든다고 할 때 
 암호를 SELECT하는 SQL을 만들어 보시오.

-- 형전환함수
-- to_char, to_number, to_date

SELECT to_char(sysdate,'YYYY-MM-DD')
FROM dual;

SELECT to_char(sysdate,'day')
FROM dual;

SELECT to_char(sysdate,'DD') || decode(to_char(sysdate,'day'), '화요일', '11')
FROM dual;

SELECT 
            to_char(sysdate,'DD') || 
            decode(to_char(sysdate,'day'), '월요일', '01',
                                                               '화요일', '11',
                                                               '수요일', '21',
                                                               '목요일', '31',
                                                               '금요일', '41',
                                                               '토요일', '51',
                                                               '일요일', '61') AS 암호
FROM dual;

--실전문제
--문제 : 사원테이블에서 job이 clerk인 사람의 급여 합,  salesman인 사람의
--급여의 합을 구하고 나머지 job에 대해서는 기타 합으로 구하시오.

SELECT *
FROM emp;

SELECT  sum(decode(JOB,'CLERK',sal,NULL)) ,
              sum(decode(JOB,'SALESMAN',sal,NULL)),
              sum(decode(JOB,'CLERK',NULL,'SALESMAN',NULL, sal)) etc_sal,
              sum(sal)
FROM emp;

SELECT  sum(decode(JOB,'CLERK',sal,NULL)) AS CLERK  ,
              sum(decode(JOB,'MANAGER',sal) )AS MANAGER ,
              sum(decode(JOB,'CLERK',NULL,'MANAGER',NULL,sal))AS ETC
FROM dept, emp
WHERE dept.deptno=emp.deptno;

SELECT dname, sum(decode(JOB,'CLERK',sal,NULL)) AS CLERK  ,
                          sum(decode(JOB,'MANAGER',sal) )AS MANAGER ,
                          sum(decode(JOB,'CLERK',NULL,'MANAGER',NULL,sal))AS ETC                          
FROM dept, emp
WHERE dept.deptno=emp.deptno
GROUP BY dname;

SELECT dname,
             decode(emp.JOB,'CLERK',sal,NULL) AS CLERK  ,
             decode(emp.JOB,'MANAGER',sal,NULL) AS MANAGER ,
             decode(emp.JOB,'CLERK',NULL,'MANAGER',NULL,sal) AS ETC          
FROM dept, emp
WHERE dept.deptno=emp.deptno
ORDER BY dname;

SELECT dname,
             sum(decode(emp.JOB,'CLERK',sal,NULL)) AS CLERK  ,
             sum(decode(emp.JOB,'MANAGER',sal,NULL)) AS MANAGER ,
             sum(decode(emp.JOB,'CLERK',NULL,'MANAGER',NULL,sal)) AS ETC          
FROM dept, emp
WHERE dept.deptno=emp.deptno
GROUP BY grouping SETS(dname,emp.JOB,emp.mgr);

SELECT dname , CLERK , MANAGER , ETC
FROM (SELECT dname,
             decode(emp.JOB,'CLERK',sal,NULL) AS CLERK  ,
             decode(emp.JOB,'MANAGER',sal,NULL) AS MANAGER ,
             decode(emp.JOB,'CLERK',NULL,'MANAGER',NULL,sal) AS ETC          
FROM dept, emp
WHERE dept.deptno=emp.deptno
ORDER BY dname);


실전문제 
- 로우에 있는 이름을 컬럼레벨에 나는 출력할 수 있다.
emp 테이블의 사원이름을 한 행에 사번, 성명을 3명씩 보여주는 쿼리문을 작성하시오

SELECT * FROM emp;

SELECT empno, listagg(ENAME,',') WITHIN GROUP BY

CREATE TABLE TEST11 (
    COLL   VARCHAR2(20),         
    DEPT   VARCHAR2(20),                  
    FRE    NUMBER,   
    SUP    NUMBER,   
    JUN    NUMBER,   
    SEN    NUMBER,
    CONSTRAINT TEST11_PK PRIMARY KEY (COLL,DEPT)
                    );  
INSERT INTO TEST11 VALUES('공과대학','항공우주공학과',120, 140, 140, 120);
INSERT INTO TEST11 VALUES('공과대학','기계공학과',    240, 260, 240, 240);
INSERT INTO TEST11 VALUES('공과대학','조선공학과',    118, 138, 136, 126);
INSERT INTO TEST11 VALUES('공과대학','산업공학과',    123, 141, 140, 120);
INSERT INTO TEST11 VALUES('공과대학','전자공학과',    126, 141, 140, 128);
INSERT INTO TEST11 VALUES('공과대학','재료공학과',    128, 132, 142, 126);
INSERT INTO TEST11 VALUES('공과대학','화학공학과',    122, 141, 141, 122);
INSERT INTO TEST11 VALUES('공과대학','전기공학과',    120, 140, 140, 120);
INSERT INTO TEST11 VALUES('공과대학','컴퓨터공학과',  124, 145, 142, 121);
INSERT INTO TEST11 VALUES('공과대학','섬유공학과',    126, 144, 140, 120);
INSERT INTO TEST11 VALUES('공과대학','자동화공학과',  122, 142, 144, 125);
INSERT INTO TEST11 VALUES('공과대학','고분자공학과',  121, 142, 143, 124);
COMMIT;

SELECT * FROM test11;

SELECT columntorow (

-- 컬럼레벨에 있는 학과별 정원수를 로우레벨로 내려서 출려하시오