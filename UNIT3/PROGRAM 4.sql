-- 1. Create EMP table

CREATE TABLE EMP (
    EMPNO NUMBER,
    ENAME VARCHAR2(50),
    JOB VARCHAR2(50),
    AGE NUMBER,
    SAL NUMBER,
    DEPTNO NUMBER
);


-- 2. Insert employee records

INSERT INTO EMP VALUES
(101, 'GAUTAM', 'MANAGER', 50, 50000, 10);

INSERT INTO EMP VALUES
(102, 'RAHUL', 'CLERK', 30, 30000, 20);

INSERT INTO EMP VALUES
(103, 'AMIT', 'SALESMAN', 40, 35000, 30);

INSERT INTO EMP VALUES
(104, 'ROHIT', 'ANALYST', 50, 45000, 10);

COMMIT;


-- 3. Display table

SELECT * FROM EMP;


-- 4. PL/SQL Program

SET SERVEROUTPUT ON;

DECLARE
    e_name EMP.ENAME%TYPE;
    salary EMP.SAL%TYPE;

BEGIN

    SELECT ENAME, SAL
    INTO e_name, salary
    FROM EMP
    WHERE AGE = 50;

    DBMS_OUTPUT.PUT_LINE('Employee Name : ' || e_name);
    DBMS_OUTPUT.PUT_LINE('Salary        : ' || salary);

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found whose age is 50.');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('More than one employee has age 50.');

END;
/
