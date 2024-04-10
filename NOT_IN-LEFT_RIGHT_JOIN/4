SELECT 
    * 
FROM 
    STUDENT a 
WHERE 
    a.STUDENT_ID 
          not in (select distinct b.STUDENT_ID from RESULT b where b.OVERALL is not null)
          and a.STUDENT_ID in (select distinct c.STUDENT_ID 
    FROM 
        STUDENT c join RESULT d on c.STUDENT_ID = d.STUDENT_ID
          join CLASS e on d.CLASS_ID = e.CLASS_ID join CLASS_DETAIL f on e.CLASS_ID = f.CLASS_ID
    WHERE f.DATE_END < GETDATE());
