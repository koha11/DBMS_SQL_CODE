IF(EXISTS (SELECT NAME FROM SYSOBJECTS
WHERE NAME = 'TR_RESULT_INSERT' AND TYPE = 'TR'))
	DROP TRIGGER TR_RESULT_INSERT
GO
CREATE TRIGGER TR_RESULT_INSERT
ON RESULT
FOR INSERT,UPDATE
AS BEGIN
	IF(SELECT STUDENT_ID FROM deleted) IS NULL
	BEGIN
		IF(SELECT COUNT(A.CLASS_ID)
			FROM RESULT A
			JOIN inserted B ON A.CLASS_ID = B.CLASS_ID) > 30
		BEGIN
			PRINT('LOP DA QUA 30 HOC SINH')
			ROLLBACK TRAN
		END
		ELSE IF (SELECT READING FROM inserted) IS NOT NULL
			OR (SELECT WRITING FROM inserted) IS NOT NULL
			OR (SELECT LISTENING FROM inserted) IS NOT NULL
			OR (SELECT SPEAKING FROM inserted) IS NOT NULL
		BEGIN
			PRINT('HOC SINH CHUA TON TAI TRONG LOP') 
			ROLLBACK TRAN
		END
	END
	IF UPDATE(LISTENING) OR UPDATE(READING) OR UPDATE(WRITING) OR UPDATE(SPEAKING)
	BEGIN
		IF (SELECT LISTENING FROM inserted) > 9
			OR (SELECT LISTENING FROM inserted) < 0
			OR (SELECT READING FROM inserted) > 9
			OR (SELECT READING FROM inserted) < 0
			OR (SELECT WRITING FROM inserted) > 9
			OR (SELECT WRITING FROM inserted) < 0
			OR (SELECT SPEAKING FROM inserted) > 9
			OR (SELECT SPEAKING FROM inserted) < 0
			OR (SELECT OVERALL FROM inserted) > 9
			OR (SELECT SPEAKING FROM inserted) < 0
		BEGIN
			PRINT('DIEM KO HOP LE')
			ROLLBACK TRAN
		END
		ELSE IF(SELECT DATEDIFF(DAY,DATE_END,GETDATE()) DAY --Nếu lớp đó chưa kết thúc thì ko đc nhập điểm
			FROM inserted A
			JOIN CLASS_DETAIL B ON A.CLASS_ID = B.CLASS_ID) > 0
		BEGIN
			PRINT('LOP HOC CHUA KET THUC')
			ROLLBACK TRAN
		END
		ELSE
		BEGIN
			UPDATE RESULT
			SET OVERALL = CEILING((A.READING+A.SPEAKING+A.WRITING+A.LISTENING)/4)
			FROM inserted A		
			where RESULT.STUDENT_ID = A.STUDENT_ID AND RESULT.CLASS_ID = A.CLASS_ID
		END
	END
END
