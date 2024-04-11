UPDATE TIMETABLE
SET WEEKLYDAY = 4
WHERE TIMETABLE.CLASS_ID IN (
    SELECT CLASS.CLASS_ID 
    FROM CLASS 
    JOIN COURSE ON CLASS.COURSE_ID = COURSE.COURSE_ID 
    WHERE COURSE.COURSE_TYPE = 'Master'
);
