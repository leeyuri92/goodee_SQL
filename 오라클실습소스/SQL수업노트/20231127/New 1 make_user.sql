-- ����� ���� �����ϱ�

CREATE user tomato IDENTIFIED BY tomato;

-- ����� �������� Ŀ�ؼ� ����ϱ�

GRANT connect, RESOURCE TO tomato;

GRANT CREATE SEQUENCE TO tomato;

GRANT CREATE TABLE TO tomato WITH ADMIN OPTION;

GRANT CREATE VIEW TO tomato;

