-- 1. Create RESULT table

CREATE TABLE RESULT (
    ROLL_NO NUMBER,
    NAME VARCHAR2(50),
    SUB1 NUMBER,
    SUB2 NUMBER,
    SUB3 NUMBER,
    SUB4 NUMBER,
    SUB5 NUMBER,
    TOTAL NUMBER,
    PER NUMBER(5,2),
    GRADE VARCHAR2(5)
);


-- 2. Insert students

INSERT INTO RESULT VALUES
(101, 'Gautam', 80, 75, 85, 78, 90, 408, 81.60, 'A');

INSERT INTO RESULT VALUES
(102, 'Rahul', 70, 65, 72, 68, 75, 350, 70.00, 'B');

INSERT INTO RESULT VALUES
(103, 'Amit', 60, 62, 58, 65, 70, 315, 63.00, 'B');

COMMIT;


-- 3. Check table

SELECT * FROM RESULT;


-- 4. PL/SQL Program

SET SERVEROUTPUT ON;

DECLARE
    s_name RESULT.NAME%TYPE := '&s_name';
    r RESULT%ROWTYPE;

BEGIN

    SELECT *
    INTO r
    FROM RESULT
    WHERE UPPER(NAME) = UPPER(s_name);

    DBMS_OUTPUT.PUT_LINE('Student Name : ' || r.NAME);
    DBMS_OUTPUT.PUT_LINE('Roll No      : ' || r.ROLL_NO);
    DBMS_OUTPUT.PUT_LINE('Subject 1    : ' || r.SUB1);
    DBMS_OUTPUT.PUT_LINE('Subject 2    : ' || r.SUB2);
    DBMS_OUTPUT.PUT_LINE('Subject 3    : ' || r.SUB3);
    DBMS_OUTPUT.PUT_LINE('Subject 4    : ' || r.SUB4);
    DBMS_OUTPUT.PUT_LINE('Subject 5    : ' || r.SUB5);
    DBMS_OUTPUT.PUT_LINE('Total        : ' || r.TOTAL);
    DBMS_OUTPUT.PUT_LINE('Percentage   : ' || r.PER);
    DBMS_OUTPUT.PUT_LINE('Grade        : ' || r.GRADE);

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Student not found.');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Multiple students found with this name.');

END;
/
