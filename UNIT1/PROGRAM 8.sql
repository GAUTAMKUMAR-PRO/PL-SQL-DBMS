-- 8) Write a PL/SQL block which displays the gross 
-- salary of employees as per user input EID. (Consider 
-- an EMP table with EID, EName, Deptno, Deptname 
-- Gender, Age, BasicSal) with appropriate data types.) 
-- Gross_Salary: BASICSAL + (DA + HRA + Medical) – 
-- PF. 
-- Rules: HRA = 15% of basic, DA = 50% of basic, 
--  Medical = Rs. 500, PF = 10% of basic. 



CREATE TABLE EMP(
  EID NUMBER PRIMARY KEY,
  ENAME VARCHAR2(15),
  DEPTNO NUMBER,
  DEPTNAME VARCHAR2(15),
  GENDER VARCHAR2(2),
  AGE NUMBER,
  BASICSAL NUMBER(15)
 );


SET SERVEROUTPUT ON;

 DECLARE 

 V_EID EMP.EID%TYPE := &USER_EID;
 V_ENAME EMP.ENAME%TYPE;
 V_BASICSAL EMP.BASICSAL%TYPE;
 V_GROSS_SALARY NUMBER;
 DA NUMBER;
 HRA NUMBER;
 MEDICAL NUMBER;
 PF NUMBER;

 BEGIN 

  
   SELECT BASICSAL,ENAME INTO V_BASICSAL,V_ENAME FROM EMP WHERE EID = V_EID;
  
  DA := V_BASICSAL * 50/100;
  HRA := V_BASICSAL * 15/100;
  MEDICAL := 500;
  PF := V_BASICSAL * 10/100;

  V_GROSS_SALARY := V_BASICSAL + (DA + HRA + MEDICAL) - PF;

  DBMS_OUTPUT.PUT_LINE('GROSS SALARY OF  ' || V_ENAME || ' IS ' || V_GROSS_SALARY);

  END;
  /
