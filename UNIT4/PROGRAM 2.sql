SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE increase_salary (
    p_deptno IN NUMBER,
    p_percent IN NUMBER
)
IS
BEGIN
    UPDATE employees
    SET basic_salary = basic_salary + (basic_salary * p_percent / 100)
    WHERE department_no = p_deptno;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Basic salary increased by ' || p_percent ||
        '% for department ' || p_deptno
    );
END;
/

BEGIN
    increase_salary(&department_no, &percentage);
END;
/
