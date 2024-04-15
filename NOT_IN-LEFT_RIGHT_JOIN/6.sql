SELECT 
    *
FROM 
    TEACHER 
WHERE 
    TEACHER_ID not in (select distinct b.TEACHER_ID
    FROM 
        TEACHER a 
        JOIN CLASS b ON a.TEACHER_ID = b.TEACHER_ID
        JOIN CLASS_DETAIL c ON b.CLASS_ID = c.CLASS_ID 
        WHERE
            YEAR(c.DATE_START) = 2024 
            AND MONTH(DATE_START) BETWEEN 1 and 3);
