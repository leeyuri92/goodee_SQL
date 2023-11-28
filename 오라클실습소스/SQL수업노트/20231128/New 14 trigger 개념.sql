[Syntax]
CREATE TRIGGER 트리거명
  BEFORE (OR AFTER)
  UPDATE OR DELETE OR INSERT ON 테이블명
  [FOR EACH ROW]
DECLARE
  변수선언부
BEGIN
  프로그램 코딩부
END;



위에서 Create문 다음 줄의 BEFORE는 UPDATE, DELETE, Insert로 인한 - 커밋과 롤백 대상 - 실제 테이블 반영
데이터변경이 생기기 전(전처리- 이전버전과 이후버전이 존재한다는 것을 의미)을 의미하고, AFTER(후처리)는 반대를 의미한다. - 타임라인
주로 BEFORE를 사용하는데, Trigger를 사용하는 주목적이 잘못된 데이터를
막고자 함인데, 미리 Checking 하기 위해서는 BEFORE가 적당하다.

또 옵션으로 FOR EACH ROW가 있는데, 이것은 데이터 처리시에 건건이 모두 
Trigger가 실행된다는 의미이다.
따라서 건건이 작업할 내용이 아니라면 사용하지 않는 것이 좋다.
왜냐하면 FOR EACH ROW가 선언됨에 따라 필요가 있든  없든 건건이 작업시에
계속해서 Trigger가 발생되기 때문에 필요없이 데이터베이스가 일을 하기 
때문이다.

FOR EACH ROW를 선언했을 경우에는 Trigger에서 유용한 데이터 속성을 제공
한다. UPDATE, DELETE, Insert는 사실 데이터를 변경하는 SQL문이기 때문에
항상 반영전 데이터와 반영 후 데이터를 분류할 수 있다.

예를 들어 Insert문 같은 경우에는 새로 생기는 것이기 때문에 반영 전
데이터는 아무 것도 없는 것이고, 반영 후 데이터는 해당 데이터가 되겠죠
DELETE는 반대 개념이고, Update는 수정이기 때문에 당연히 수정전과 수정후
를 분류할 수 있다.

바로 이 반영전과 반영 후의 컬럼 데이터 값을 FOR EACH ROW 선언 후에 
가져올 수 있다.

:OLD.컬럼명 => SQL반영 전 해당 컬럼 데이터
:NEW.컬럼명 => SQL변영 후 해당 컬럼 데이터


CREATE TABLE dept_copy AS
SELECT * FROM dept;

