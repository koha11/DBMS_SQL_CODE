--Tạo login
CREATE LOGIN ADMINISTRATOR WITH PASSWORD = '2';

--Tạo user
CREATE USER ADMINISTRATOR FOR LOGIN ADMINISTRATOR;

--Tạo ROLE
CREATE ROLE DatabaseAdmin;

--Cấp quyền cho ROLE trong bảng TEACHER
GRANT SELECT, INSERT, UPDATE, DELETE ON TEACHER TO DatabaseAdmin;

--Cấp quyền cho ROLE trong bảng STUDENT
GRANT SELECT, INSERT, UPDATE, DELETE ON STUDENT TO DatabaseAdmin;

--Cấp quyền cho ROLE trong bảng COURSE
GRANT SELECT, INSERT, UPDATE, DELETE ON COURSE TO DatabaseAdmin;

--Cấp quyền cho ROLE trong bảng BILL
GRANT SELECT, INSERT, UPDATE, DELETE ON BILL TO DatabaseAdmin;

--Cấp quyền cho ROLE trong bảng CLASS
GRANT SELECT, INSERT, UPDATE, DELETE ON CLASS TO DatabaseAdmin;

--Cấp quyền cho ROLE trong bảng TIMETABLE
GRANT SELECT, INSERT, UPDATE, DELETE ON TIMETABLE TO DatabaseAdmin;

--Cấp quyền cho ROLE trong bảng RESULT
GRANT SELECT, INSERT, UPDATE, DELETE ON RESULT TO DatabaseAdmin;

--Cấp quyền cho ROLE trong bảng CLASS_DETAIL
GRANT SELECT, INSERT, UPDATE, DELETE ON CLASS_DETAIL TO DatabaseAdmin;

--Cấp ROLE cho user
ALTER ROLE DatabaseAdmin ADD MEMBER ADMINISTRATOR;