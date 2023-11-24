CREATE TABLE TEMP (
 EMP_ID      NUMBER NOT NULL PRIMARY KEY,
 EMP_NAME    VARCHAR2(10) NOT NULL,
 BIRTH_DATE  DATE,
 DEPT_CODE   VARCHAR2(06) NOT NULL,
 EMP_TYPE    VARCHAR2(04),
 USE_YN      VARCHAR2(01) NOT NULL,
 TEL         VARCHAR2(15),
 HOBBY       VARCHAR2(30),
 SALARY      NUMBER,
 LEV         VARCHAR2(04)
);

CREATE TABLE TDEPT (
 DEPT_CODE   VARCHAR2(06) NOT NULL PRIMARY KEY,
 DEPT_NAME   VARCHAR2(20) NOT NULL,
 PARENT_DEPT VARCHAR2(06) NOT NULL,
 USE_YN      VARCHAR2(01) NOT NULL,
 AREA        VARCHAR2(10),
 BOSS_ID     NUMBER
);

SELECT*FROM temp;

SELECT*FROM tdept;

SELECT ENAME
FROM emp;

-- 테이블을 드라이브 할 때 (정보를 읽을 때) 인덱스 정보 읽는다
-- 데이블을 엑세스 하지않고도 즉 인덱스 정보만으로도 조회가 된다.
-- 이런 물리적인 위치는
SELECT EMPNO, rowid RID
FROM emp;

SELECT ENAME
FROM emp
WHERE rowid = 'AAARE8AAEAAAACTAAA';




SELECT empno
FROM emp;
-- empno가 pk이여서 인덱스 이기 때문에 자동으로 오름차순이 되어있다.
-- 내림차순 정렬시 order by empno desc를 추가하면 된다.
-- 옵티마이저가 조건을 만족하는 정보를 직접 찾아온다.
-- 병렬처리 지원, 클러스터 지원



-- 부적합한 식별자 - 자바에러가 아님 

-- 카타시안곱 :  집합을 복제해서 총합, 소계, 계를 구할 때 사용함
SELECT dept.dname, emp.deptno, dept.deptno
FROM emp, dept;

-- 쓰레기값이 포함되어 있잖아? 이걸 제거해줘야지
-- natural Join
-- 1:n관계
SELECT dept.dname, emp.deptno, dept.deptno
FROM emp, dept
WHERE emp.deptno=dept.deptno;

DELETE FROM dept WHERE deptno IN(60,80,90);

COMMIT;

SELECT * FROM dept;

ROLLBACK;

SELECT count(empno) FROM emp;

SELECT count(comm) FROM emp;
SELECT max(sal), min(sal) FROM emp;

INSERT INTO TEMP VALUES (19970101,'김길동',TO_DATE('19740125','YYYYMMDD'),'AA0001','정규','Y','','등산',100000000,'부장');
INSERT INTO TEMP VALUES (19960101,'홍길동',TO_DATE('19730322','YYYYMMDD'),'AB0001','정규','Y','','낚시',72000000,'과장');
INSERT INTO TEMP VALUES (19970201,'박문수',TO_DATE('19750415','YYYYMMDD'),'AC0001','정규','Y','','바둑',50000000,'과장');
INSERT INTO TEMP VALUES (19930331,'정도령',TO_DATE('19760525','YYYYMMDD'),'BA0001','정규','Y','','노래',70000000,'차장');
INSERT INTO TEMP VALUES (19950303,'이순신',TO_DATE('19730615','YYYYMMDD'),'BB0001','정규','Y','','',56000000,'대리');
INSERT INTO TEMP VALUES (19966102,'지문덕',TO_DATE('19720705','YYYYMMDD'),'BC0001','정규','Y','','',45000000,'과장');
INSERT INTO TEMP VALUES (19930402,'강감찬',TO_DATE('19720815','YYYYMMDD'),'CA0001','정규','Y','','',64000000,'차장');
INSERT INTO TEMP VALUES (19960303,'설까치',TO_DATE('19710925','YYYYMMDD'),'CB0001','정규','Y','','',35000000,'사원');
INSERT INTO TEMP VALUES (19970112,'연흥부',TO_DATE('19761105','YYYYMMDD'),'CC0001','정규','Y','','',45000000,'대리');
INSERT INTO TEMP VALUES (19960212,'배뱅이',TO_DATE('19721215','YYYYMMDD'),'CD0001','정규','Y','','',39000000,'과장');

INSERT INTO TDEPT VALUES ('AA0001','경영지원','AA0001','Y','서울',19940101);
INSERT INTO TDEPT VALUES ('AB0001','재무','AA0001','Y','서울',19960101);
INSERT INTO TDEPT VALUES ('AC0001','총무','AA0001','Y','서울',19970201);
INSERT INTO TDEPT VALUES ('BA0001','기술지원','BA0001','Y','인천',19930301);
INSERT INTO TDEPT VALUES ('BB0001','H/W지원','BA0001','Y','인천',19950303);
INSERT INTO TDEPT VALUES ('BC0001','S/W지원','BA0001','Y','인천',19966102);
INSERT INTO TDEPT VALUES ('CA0001','영업','CA0001','Y','본사',19930402);
INSERT INTO TDEPT VALUES ('CB0001','영업기획','CA0001','Y','본사',19950103);
INSERT INTO TDEPT VALUES ('CC0001','영업1','CA0001','Y','본사',19970112);
INSERT INTO TDEPT VALUES ('CD0001','영업2','CA0001','Y','본사',19960212);

COMMIT;


-- 1. 월 급여는 연봉을 18로 나누어 홀수 달에는 연봉의 1/18이 지급되고
-- 짝수달에는연봉의 2/18이 지급된다고 가정했을때 홀수 달과 짝수달에 받을 금액을 나타내시오.


SELECT
    TO_CHAR(round(salary/18,-1), '999,999,999')||'원 ' AS 홀수달급여, 
    TO_CHAR(round(salary*2/18,-1), '999,999,999')||'원 ' AS 짝수달급여 
 FROM temp;



-- 2. 위에서 구한 월 급여에 교통비가 10만원씩 지급된다면(짝수달은 20만원)위의 문장이 어떻게 바뀔지 작성해 보시오.
SELECT
    TO_CHAR(round(salary/18+100000,-1), '999,999,999')||'원 ' AS 홀수달, 
    TO_CHAR(round(salary*2/18+100000,-1), '999,999,999')||'원 ' AS 짝수달 
 FROM temp;

-- 3. TEMP 테이블에서 취미가 NULL 이 아닌 사람의 성명을 읽어오시오.
SELECT emp_name 
FROM temp
WHERE hobby IS NOT NULL;

-- 3-1. hobby가  등산이거나 낚시일 경우
SELECT emp_name, hobby
FROM temp
WHERE hobby  IN('등산','낚시');

-- 3-2. 
SELECT emp_name, hobby
FROM temp
WHERE hobby ='등산' 
        OR hobby IS NULL;
-- 3-3. 
SELECT emp_name, hobby
FROM temp
 MINUS
 SELECT emp_name, hobby
 FROM temp
 WHERE hobby IS NULL
 OR hobby = '낚시';
-- 4. TEMP 테이블에서 취미가 NULL인 사람은 모두 HOBBY를 “없음”이라고 값을 치환하여 가져오고 나머지는 그대로 값을 읽어오시오.
SELECT emp_name ,NVL(hobby,'없음')
FROM temp;

-- 5. TEMP의 자료 중 HOBBY의 값이 NULL인 사원을 ‘등산’으로 치환했을 때 HOBBY가 ‘등산인 사람의 성명을 가져오는 문장을 작성하시오.
UPDATE temp 
set hobby = '등산'
WHERE hobby IS NULL;

SELECT emp_name
FROM temp
WHERE hobby = '등산';

SELECT emp_name
FROM(
 SELECT emp_name ,NVL(hobby,'등산') AS 취미
FROM temp)
WHERE 취미 = '등산';

SELECT emp_name, hobby
FROM temp
WHERE NVL(hobby,'등산') = '등산';


-- 6. TEMP의 자료 중 EMP_ID와 EMP_NAME을 각각 ‘사번’,’성명’으로 표시되어 DISPLAY되도록 COLUMN ALLIAS를 부여하여 SELECT 하시오.
SELECT emp_id AS 사번, emp_name AS 성명
FROM temp;

SELECT 사번, 성명
FROM ( SELECT emp_id "사번", emp_name "성명"
FROM temp);

-- 7. TEMP의 자료를 직급 명(LEV)에 ASCENDING하면서 결과내에서 다시 사번 순으로 DESCENDING하게 하는 ORDER BY하는 문장을 만들어 보시오. 
SELECT lev, emp_id
FROM temp
ORDER BY lev, emp_id desc;

ROLLBACK;