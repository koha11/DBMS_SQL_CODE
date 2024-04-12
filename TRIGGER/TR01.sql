GO
IF(EXISTS (SELECT NAME FROM SYSOBJECTS
WHERE NAME = 'TR_TIMETABLE_INSERT' AND TYPE = 'TR'))
	DROP TRIGGER TR_TIMETABLE_INSERT
GO
CREATE TRIGGER TR_TIMETABLE_INSERT
ON TIMETABLE
FOR INSERT,UPDATE
AS BEGIN
	IF (SELECT top 1 A.CLASS_ID
		FROM TIMETABLE A
		JOIN inserted B ON A.CLASS_ID = B.CLASS_ID) IS NULL
		begin
			print('Chua nhap dl cho class detail')
			ROLLBACK TRAN
		end
	ELSE IF ((SELECT MAX(B.WEEKLYDAY)
		FROM inserted A
		join TIMETABLE B ON A.CLASS_ID = B.CLASS_ID) 
		> 
		(select (CASE 
			WHEN FORMAT(DATE_END,'D') like 'Sun%' THEN 0
			WHEN FORMAT(DATE_END,'D') like 'Mon%' THEN 2
			WHEN FORMAT(DATE_END,'D') like 'Tue%' THEN 3 
			WHEN FORMAT(DATE_END,'D') like 'Wed%' THEN 4
			WHEN FORMAT(DATE_END,'D') like 'Thur%' THEN 5
			WHEN FORMAT(DATE_END,'D') like 'Fri%' THEN 6
			WHEN FORMAT(DATE_END,'D') like 'Sar%' THEN 7
			END) NGAY
		from CLASS_DETAIL A
		JOIN inserted B ON A.CLASS_ID = B.CLASS_ID) 
		OR 
		(SELECT MIN(B.WEEKLYDAY)
			FROM inserted A
			join TIMETABLE B ON A.CLASS_ID = B.CLASS_ID) 
		NOT IN 
		(select (CASE 
			WHEN FORMAT(DATE_START,'D') like 'Sun%' THEN 0
			WHEN FORMAT(DATE_START,'D') like 'Mon%' THEN 2
			WHEN FORMAT(DATE_START,'D') like 'Tue%' THEN 3 
			WHEN FORMAT(DATE_START,'D') like 'Wed%' THEN 4
			WHEN FORMAT(DATE_START,'D') like 'Thur%' THEN 5
			WHEN FORMAT(DATE_START,'D') like 'Fri%' THEN 6
			WHEN FORMAT(DATE_START,'D') like 'Sar%' THEN 7
			END) NGAY
		from CLASS_DETAIL A
		JOIN inserted B ON A.CLASS_ID = B.CLASS_ID))
		begin
			print('Thu cua ngay bat dau/ngay ket thuc ko dung trong TKB')
			ROLLBACK TRAN
		end
	ELSE IF(SELECT A.LESSONS/FLOOR(DATEDIFF(DAY,DATE_START,DATE_END)/7+1) RES
		FROM CLASS_DETAIL A
		JOIN inserted B ON A.CLASS_ID = B.CLASS_ID) 
		< 
		(SELECT COUNT(B.DAYPERIOD) SO_TIET
			FROM inserted A
		JOIN TIMETABLE B ON A.CLASS_ID = B.CLASS_ID) 
		begin
			print('Hoc hon so tiet quy dinh')
			ROLLBACK TRAN
		end
	ELSE IF(SELECT DAYPERIOD
			FROM inserted) NOT BETWEEN 1 AND 6
		OR 
		(SELECT WEEKLYDAY
			FROM inserted) NOT BETWEEN 2 AND 7
		begin
			print(' 1 <= SUAT HOC <= 6 && 2 <= THU <= 7')
			ROLLBACK TRAN
		end
	ELSE
		SELECT A.LESSONS/FLOOR(DATEDIFF(DAY,DATE_START,DATE_END)/7+1) RES
		FROM CLASS_DETAIL A
		JOIN inserted B ON A.CLASS_ID = B.CLASS_ID
END
