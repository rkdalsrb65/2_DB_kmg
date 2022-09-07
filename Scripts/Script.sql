-- 부서명을 입력 받아 같은 부서에 있는 사원의
-- 사원명, 부서명, 급여 조회
SELECT EMP_NAME, NVL(DEPT_TITLE, '부서없음') AS DEPT_TITLE, SALARY
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE NVL(DEPT_TITLE, '부서없음') = '부서없음';
--WHERE DEPT_TITLE IS NULL; -- NULL 찾을 때

-- 직급명, 급여를 입력 받아
-- 해당 직급에서 입력 받은 급여보다 많이 받는 사원의
-- 이름, 직급명, 급여, 연봉을 조회하여 출력
--SELECT EMP_NAME, JOB_NAME, SALARY, SALARY*12 ANNUAL_INCOME
SELECT EMP_NAME, JOB_NAME, SALARY, (SALARY*12)
FROM EMPLOYEE
NATURAL JOIN JOB
--JOIN JOB USING(JOB_CODE)
WHERE JOB_NAME = '대표' AND SALARY > 1500000;

-- 입사일을 입력("2022-09-06") 받아
-- 입력 받은 값 보다 먼저 입사한 사람의
-- 이름, 입사일(1990년 01월 01일), 성별(M/F) 조회
SELECT EMP_NAME 이름, TO_CHAR(HIRE_DATE, 'YYYY"년" MM"월" DD"일"') 입사일, DECODE(SUBSTR(EMP_NO, 8, 1), '1', 'M', '2', 'F') 성별
FROM EMPLOYEE
WHERE HIRE_DATE < TO_DATE('2000-09-06');
--> TO_DATE 생략 가능

SELECT EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, NVL(DEPT_TITLE, '부서없음') DEPT_TITLE, JOB_NAME, SALARY
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING(JOB_CODE);