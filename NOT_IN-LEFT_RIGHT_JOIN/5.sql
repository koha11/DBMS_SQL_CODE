SELECT 
    * 
FROM 
    CLASS
WHERE 
    CLASS_ID 
          not in (select CLASS_ID from CLASS_DETAIL 
WHERE 
    MONTH(DATE_START) = 6)
