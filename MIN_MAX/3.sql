SELECT DISTINCT COURSE_NAME, COURSE_FEE AS LOWEST_FEE
FROM COURSE
WHERE COURSE_FEE = (SELECT MIN(COURSE_FEE) FROM COURSE);