--10) Write a PL/SQL block to delete the record of an 
--employee for a given EID.

SET SERVEROUTPUT ON;

DECLARE 

 V_EID EMP.EID%TYPE:= &USER_EID;

 BEGIN

   DELETE FROM EMP 
   WHERE EID = V_EID;

   DBMS_OUTPUT.PUT_LINE('EMPLOYEE RECORD DELETED SUCCESSFULLY');


   COMMIT;

 END;
 /  
