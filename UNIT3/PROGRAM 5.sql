-- =========================================
-- 1. DELETE OLD TABLES
-- =========================================

DROP TABLE EMP_BACKUP PURGE;
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

INSERT INTO EMP VALUES
(105, 'VIVEK', 'CLERK', 101,
 TO_DATE('10-05-2024','DD-MM-YYYY'), 28000, 1500, 10);

COMMIT;


-- =========================================
-- 4. CREATE EMP_BACKUP TABLE
-- =========================================

CREATE TABLE EMP_BACKUP (
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
-- 5. CHECK EMP TABLE
-- =========================================

SELECT * FROM EMP;


-- =========================================
-- 6. PL/SQL PROGRAM
-- =========================================

SET SERVEROUTPUT ON;

DECLARE

    CURSOR c_emp IS
        SELECT *
        FROM EMP
        WHERE DEPTNO = &DEPT_NO;

    v_emp EMP%ROWTYPE;

    NO_DEPT_FOUND EXCEPTION;

    v_count NUMBER := 0;

BEGIN

    OPEN c_emp;

    LOOP

        FETCH c_emp INTO v_emp;

        EXIT WHEN c_emp%NOTFOUND;

        INSERT INTO EMP_BACKUP
        VALUES
        (
            v_emp.EMPNO,
            v_emp.ENAME,
            v_emp.JOB,
            v_emp.MGR,
            v_emp.HIREDATE,
            v_emp.SAL,
            v_emp.COMM,
            v_emp.DEPTNO
        );

        v_count := v_count + 1;

    END LOOP;

    CLOSE c_emp;

    IF v_count = 0 THEN
        RAISE NO_DEPT_FOUND;
    END IF;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        v_count || ' employee records inserted successfully.'
    );

EXCEPTION

    WHEN NO_DEPT_FOUND THEN

        DBMS_OUTPUT.PUT_LINE(
            'NO_DEPT_FOUND: No employee found for this department.'
        );

END;
/
