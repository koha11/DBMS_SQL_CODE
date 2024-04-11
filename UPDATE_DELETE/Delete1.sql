DELETE FROM STUDENT
WHERE STUDENT_ID IN 
(
	SELECT ST.STUDENT_ID
	FROM STUDENT ST
	LEFT JOIN BILL ON ST.STUDENT_ID = BILL.STUDENT_ID
	JOIN RESULT ON ST.STUDENT_ID = RESULT.STUDENT_ID
	JOIN CLASS ON RESULT.CLASS_ID = CLASS.CLASS_ID
	JOIN CLASS_DETAIL ON CLASS.CLASS_ID = CLASS_DETAIL.CLASS_ID
	WHERE DATEDIFF(DAY, CLASS_DETAIL.DATE_START, BILL.DATE_P) > 7
);