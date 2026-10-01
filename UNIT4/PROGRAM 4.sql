SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION square_number (
    p_num IN NUMBER
)
RETURN NUMBER
IS
BEGIN
    RETURN p_num * p_num;
END;
/



DECLARE
    v_result NUMBER;
BEGIN
    v_result := square_number(5);

    DBMS_OUTPUT.PUT_LINE('Square = ' || v_result);
END;
/
