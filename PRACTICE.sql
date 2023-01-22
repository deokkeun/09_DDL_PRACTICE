-- 1번
SELECT EMP_ID, EMP_NAME, PHONE, HIRE_DATE, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON(DEPT_ID = DEPT_CODE)
WHERE DEPT_CODE = (SELECT DEPT_CODE
FROM EMPLOYEE 
WHERE EMP_NAME = '전지연')
AND EMP_NAME <> '전지연';


-- 2번
SELECT EMP_ID, EMP_NAME, PHONE, SALARY, JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE EMP_NAME <> '노옹철'
AND SALARY = (SELECT MAX(SALARY) 
FROM EMPLOYEE WHERE EXTRACT(YEAR FROM HIRE_DATE) >= 2000);


-- 3번
SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
JOIN DEPARTMENT ON(DEPT_ID = DEPT_CODE)
WHERE (DEPT_CODE, JOB_CODE) = (SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE WHERE EMP_NAME = '노옹철')
AND EMP_NAME <> '노옹철';


-- 4번
SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, HIRE_DATE
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
JOIN DEPARTMENT ON(DEPT_ID = DEPT_CODE)
WHERE(DEPT_CODE, JOB_CODE) = (
SELECT DEPT_CODE, JOB_CODE
FROM EMPLOYEE
WHERE EXTRACT(YEAR FROM HIRE_DATE) = 2000
);


-- 5번
SELECT EMP_ID, EMP_NAME, DEPT_CODE, MANAGER_ID, EMP_NO, HIRE_DATE
FROM EMPLOYEE
WHERE (DEPT_CODE, MANAGER_ID) IN (
SELECT DEPT_CODE, MANAGER_ID
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 1, 2) = '77'
AND SUBSTR(EMP_NO, 8, 1) = '2'
);


-- 6번
SELECT EMP_ID, EMP_NAME, NVL(DEPT_TITLE, '소속없음'), HIRE_DATE
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_ID = DEPT_CODE)
WHERE ENT_YN = 'N'
AND (DEPT_CODE, HIRE_DATE) IN (SELECT DEPT_CODE, MIN(HIRE_DATE) FROM EMPLOYEE GROUP BY DEPT_CODE)
ORDER BY HIRE_DATE;


-- 7번


SELECT EMP_ID, EMP_NAME, JOB_NAME,
EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO, 1, 2), 'RR')),
TO_CHAR((NVL2(BONUS, SALARY * (12 + BONUS), SALARY * 12)), 'L999,999,999')
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE JOB_CODE IN (SELECT JOB_CODE FROM EMPLOYEE GROUP BY JOB_CODE)
ORDER BY EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO, 1, 2), 'RR')) DESC;


SELECT ABS(MONTHS_BETWEEN(TO_DATE(SUBSTR(EMP_NO, 1, 6), 'RRMMDD'), SYSDATE) / 12)
FROM EMPLOYEE

