-- 사용자 계정 생성하기

CREATE user tomato IDENTIFIED BY tomato;

-- 사용자 계정으로 커넥션 허용하기

GRANT connect, RESOURCE TO tomato;

GRANT CREATE SEQUENCE TO tomato;

GRANT CREATE TABLE TO tomato WITH ADMIN OPTION;

GRANT CREATE VIEW TO tomato;

