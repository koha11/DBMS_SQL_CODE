UPDATE TIMETABLE
SET WEEKLYDAY = 4
WHERE CLASS_ID IN (
    SELECT CLASS_ID
    FROM CLASS
    WHERE STUDENT_ID = 'Student10224'
);
