USE master
CREATE LOGIN ST000001 WITH PASSWORD = '1'

USE QLTTTA
CREATE USER ST000001 FOR LOGIN ST000001;
CREATE ROLE student;
GRANT SELECT ON TIMETABLE TO student;
GRANT SELECT ON CLASS_DETAIL TO student;
GRANT SELECT ON CLASS TO student;
GRANT SELECT ON STUDENT TO student;
GRANT SELECT ON COURSE TO student;
GRANT SELECT ON RESULT TO student;
GRANT SELECT ON STUDENT_ACCOUNT TO student;

ALTER ROLE student ADD MEMBER ST000001;

