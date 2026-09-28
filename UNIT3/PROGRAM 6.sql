-- =========================================
-- 1. DELETE OLD EMP TABLE
-- =========================================

DROP TABLE EMP PURGE;


-- =========================================
-- 2. CREATE EMP TABLE
-- =========================================

CREATE TABLE EMP (
    EMPNO NUMBER,
    ENAME VARCHAR2(50),
    JOB VARCHAR2(50),
    MGR NUMBER,
    HIREDATE DATE,
    SAL NUMBER,
    COMM NUMBER,
    DEPTNO NUMBER
);


-- =========================================
-- 3. INSERT EMPLOYEE DATA
-- =========================================

INSERT INTO EMP VALUES
(101, 'GAUTAM', 'MANAGER', NULL,
 TO_DATE('10-01-2024','DD-MM-YYYY'), 50000, 5000, 10);

INSERT INTO EMP VALUES
(102, 'RAHUL', 'CLERK', 101,
 TO_DATE('15-02-2024','DD-MM-YYYY'), 30000, 2000, 20);

INSERT INTO EMP VALUES
(103, 'AMIT', 'SALESMAN', 101,
 TO_DATE('20-03-2024','DD-MM-YYYY'), 35000, 3000, 10);

INSERT INTO EMP VALUES
(104, 'ROHIT', 'ANALYST', 101,
 TO_DATE('25-04-2024','DD-MM-YYYY'), 45000, 4000, 30);

COMMIT;


-- =========================================
-- 4. CHECK EMP TABLE
-- =========================================

SELECT * FROM EMP;


-- =========================================
-- 5. PL/SQL PROGRAM
-- =========================================

SET SERVEROUTPUT ON;

DECLARE

    v_ename EMP.ENAME%TYPE;
    v_empno EMP.EMPNO%TYPE := &EMPNO;

BEGIN

    SELECT ENAME
    INTO v_ename
    FROM EMP
    WHERE EMPNO = v_empno;

    DBMS_OUTPUT.PUT_LINE(
        'Employee Name: ' || v_ename
    );

EXCEPTION

    WHEN NO_DATA_FOUND THEN

        DBMS_OUTPUT.PUT_LINE(
            'NO_DATA_FOUND: Employee record not found.'
        );

END;
/
