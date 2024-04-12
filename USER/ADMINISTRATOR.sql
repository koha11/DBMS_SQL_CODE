USE master
GRANT ALTER ANY LOGIN TO admin1234 -- Gán quyền tạo login
CREATE LOGIN admin123 WITH PASSWORD = 'Admin12345@';

USE QLTTTA
CREATE USER admin1234 FOR LOGIN admin123;
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER, EXECUTE, VIEW DEFINITION ON SCHEMA::dbo TO admin123 -- Gán toàn bộ quyền trong dbo
GRANT ALTER ANY USER TO admin123 -- Gán quyền tạo/sửa user
GRANT ALTER ANY ROLE TO admin123 -- Gán quyền tạo/sửa role


