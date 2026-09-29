SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE show_message IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO GAUTAM KUMAR! This is a user-defined message information.');
END;
/

BEGIN
    show_message;
END;
/

