CREATE PROC PR_CREATE_LOGIN 
@UID VARCHAR(10), @PWD VARCHAR(20)
AS BEGIN
	DECLARE @SQL NVARCHAR(MAX)
	SET @PWD = REPLACE(@PWD,'''', '''''')	
	SET @SQL = 'use master; CREATE LOGIN ' + @UID +' WITH PASSWORD = '''  + @PWD + ''';' + 
				'use QLTTTA; CREATE USER ' + @UID + ' FOR LOGIN ' + @UID; 
	IF (@UID LIKE 'ST%')
		SET @SQL = @SQL + ' ALTER ROLE student ADD MEMBER ' + @UID
	ELSE 
		SET @SQL = @SQL + ' ALTER ROLE teacher ADD MEMBER ' + @UID
	exec(@SQL)
END

-- khoa's note: chưa add vào azure
