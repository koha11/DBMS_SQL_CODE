SELECT COUNT(ST.STUDENT_ID) FROM STUDENT ST
JOIN RESULT ON ST.STUDENT_ID = RESULT.STUDENT_ID
JOIN CLASS_DETAIL ON RESULT.CLASS_ID = CLASS_DETAIL.CLASS_ID
JOIN CLASS ON RESULT.CLASS_ID = CLASS.CLASS_ID
JOIN COURSE ON CLASS.COURSE_ID = COURSE.COURSE_ID
WHERE COURSE.COURSE_TYPE  = 'Junior' 
AND DATEPART(QUARTER, CLASS_DETAIL.DATE_START) = 1
AND YEAR(CLASS_DETAIL.DATE_START) = 2024;
