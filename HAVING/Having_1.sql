SELECT
    b.STUDENT_ID
    COUNT(a.CLASS_ID) AS SO_LOP_DA_HOC
FROM 
    RESULT a join STUDENT b on a.STUDENT_ID = b.STUDENT_ID
GROUP BY 
    a.STUDENT_ID
HAVING 
    COUNT(a.CLASS_ID) >= 2;
