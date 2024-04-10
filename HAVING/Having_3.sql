SELECT 
    a.STUDENT_ID,
    ST_NAME,
    SUM(PAYMENT) AS TongTien
FROM 
    STUDENT a
JOIN 
    BILL B ON a.STUDENT_ID = B.STUDENT_ID
GROUP BY 
    a.STUDENT_ID, ST_NAME
HAVING 
    SUM(PAYMENT) = (SELECT MAX(TongTien) 
                     FROM (SELECT STUDENT_ID, SUM(PAYMENT) AS TongTien 
                           FROM BILL 
                           GROUP BY STUDENT_ID) AS MaxPayment)
