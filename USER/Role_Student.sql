-- Tạo login
create login st0 with password = '1';

-- Tạo user Student
CREATE USER st0 for login st0;

-- Tạo role cho sinh viên
CREATE ROLE student_role;

-- Cấp quyền truy cập vào bảng TIMETABLE
GRANT SELECT ON TIMETABLE TO student_role;

-- Cấp quyền truy cập vào các cột trong bảng CLASS_DETAIL và CLASS
GRANT SELECT ON CLASS_DETAIL TO student_role;
GRANT SELECT ON CLASS TO student_role;

-- Cấp quyền truy cập vào các cột trong bảng STUDENT
GRANT SELECT ON STUDENT TO student_role;

-- Cấp quyền truy cập vào các cột trong bảng COURSE
GRANT SELECT ON COURSE TO student_role;

-- Cấp quyền truy cập vào các cột điểm trong bảng RESULT
GRANT SELECT ON RESULT TO student_role;

-- Gan role
alter role student_role add member st0;

