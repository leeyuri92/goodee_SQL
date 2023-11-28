요구사항정의서
화면정의서 - 어떤 컬럼이 필요한지, 어떤 정보 출력하면 되는지

연습문제 2
문제를 잘 읽기
변수에 값을 담기 - SELECT ...INTO -> 한번에 한건만 가능 - XXXVO
만일 여러건을 처리할땐 FETCH..INTO -> 한행씩 접근하기 - 반복문 결합하여 사용  List<VO>, List<Map>
CURSOR정의

--커서 선언하기
CURSOR emp_cur IS
SELECT empno, ename, sal
  FROM emp
 WHERE deptno = p_deptno; 
 --급여평균을 구한다 
 SELECT avg(sal) INTO avg_sal 
   FROM emp
  WHERE deptno = p_deptno; 
 LOOP
    FETCH emp_cur INTO v_empno, v_ename, v_sal
    EXIT WHEN emp_cur%NOTFOUND;
    IF v_sal > avg_sal THEN
        rate :=1.1;
    ELSIF v_sal <= avg_sal THEN
        rate:=1.2;
    END IF;
    UPDATE emp
           SET sal = sal * rate
       WHERE empno = v_empno;
 END LOOP;
 
OPEN emp_cur;
CLOSE  emp_cur;
변수 rate number(3,1) -  99.9
avg_sal number(7,2) - 99999.99
부서번호를 입력받아서(파라미터로 받아서-p_deptno number) 부서 평균 급여(변수선언)보다 
많이 받으면 10% 적거나 같으면 20% 인상을 적용하여 
급여 테이블을 수정(UPDATE -  COMMIT)하는 프로시저를 작성하시오.

SELECT  deptno, count(empno)
  FROM emp
 GROUP BY deptno;

CURSOR emp_cur 
IS
    SELECT empno, ename, sal
    FROM emp
    WHERE deptno = p_deptno;
    
    LOOP
        FETCH emp_cur INTO v_empno, v_ename, v_sal
        exit WHEN emp_cur%NOTFOUND;
        IF v_sal > avg_sal THEN
            rate := 1.1;
        ELSIF v_sal <= avg_sal THEN
            rate :=1.2;
        END IF;
        UPDATE emp
            set sal = sal*rate
        WHERE empno = v_empno;
    END LOOP;

OPEN emp_cur;
CLOSE emp_cur;


-- 급여평균구하기

SELECT avg(sal) INTO avg_sal
FROM emp
WHERE deptno = p_deptno;





DECLARE
-- 이름이 없다, 호출이 안됨, 재사용이 안됨, 이름이 필요함
-- PL/SQL문 - 구조체 - 프로시저(재사용, 프로시저호출,커밋, 롤백적용), 함수(반환값이 있다)
-- 트리거 - 호출하지 않고 자동으로 적용됨 - 사용하지 않을 땐 비활성화 시켜둠
CREATE OR REPLACE [PROCEDURE, FUNCTION, TRIGGER] 이름()
IS
-- 선언부
BEGIN
-- 프로그램사용 - DML, commit, rollback, 반복문
-- 여러 건을 한 번에 처리 하기
EXCEPTION
-- 예외처리 가능
-- 에러는 외울 필요 없다.
END;