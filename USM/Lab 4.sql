----DROP TABLE STUDENT;
----CREATE TABLE STUDENT(
---- STUDENT_ID NUMBER(5,0) NOT NULL,
---- STUDENT_NAME VARCHAR(30) NOT NULL,
---- STUDENT_BIRTHDATE DATE,
---- STUDENT_COUNTRY VARCHAR(15) NOT NULL,
---- STUDENT_EMAIL VARCHAR(20),
---- STUDENT_PHONE VARCHAR(12),
---- STUDENT_YEAR_ENROLLED NUMBER(4,0) NOT NULL,
---- PRIMARY KEY(STUDENT_ID)
----);
--
----INSERT INTO STUDENT VALUES
----(11125, 'RISHA NATHAN', '15-OCT-00', 'INDIA', 'RISHANAT@ABC.COM', '345-213-5564', 2020);
----INSERT INTO STUDENT VALUES
----(11126, 'ZHANG ZIYI', '05-JUN-99', 'CHINA', 'ZIYIZHANG@ABC.COM', '345-213-7888', 2019);
----INSERT INTO STUDENT VALUES
----(11127, 'ISMAIL WAHAB', '25-DEC-99', 'MALAYSIA', 'ISMAILW@ABC.COM', '345-111-6009', 2019);
----INSERT INTO STUDENT VALUES
----(11128, 'VEERA SINGHAM', '22-APR-98', 'MALAYSIA', 'VEERASING@ABC.COM', '245-255-2622', 2018);
----INSERT INTO STUDENT VALUES
----(11129, 'JASON TAN', '14-JUL-98', 'MALAYSIA', 'JASONTAN@ABC.COM', '245-255-6048', 2018);
----INSERT INTO STUDENT VALUES
----(11130, 'MARCELA FUENTES', '21-MAY-00', 'SPAIN', 'MARCELAFUEN@ABC.COM', '345-412-5277', 2020);
----COMMIT;
--
--
----Q1: Write an SQL statement to create the COURSE table with the constraints stated in Part III. 
----If COURSE table already exists in your Oracle database, drop the existing COURSE table first 
----before you create a new one with constraints.
--
--DROP TABLE COURSE;
--CREATE TABLE COURSE(
--    COURSE_CODE CHAR(6) NOT NULL,
--    COURSE_TITLE VARCHAR(30) NOT NULL,
--    COURSE_CATEGORY VARCHAR(10) NOT NULL,
--   PRIMARY KEY(COURSE_CODE)
--);
--
----INSERT INTO COURSE VALUES
----('CPT111', 'INTRODUCTION TO PROGRAMMING', 'CORE');
----INSERT INTO COURSE VALUES
----('CMT221', 'DATABASE DESIGN', 'CORE');
----INSERT INTO COURSE VALUES
----('CDS403', 'MACHINE LEARNING', 'NON-CORE');
----COMMIT;
--
----DROP TABLE STUDENT_COURSE;
----CREATE TABLE STUDENT_COURSE(
---- STUDENT_ID NUMBER(5,0),
---- COURSE_CODE CHAR(6),
---- YEAR_TAKEN NUMBER(4,0),
---- SEMESTER_TAKEN CHAR(1),
---- GRADE_AWARDED CHAR(2),
---- SCORE NUMBER(4,1)
----);
----INSERT INTO STUDENT_COURSE VALUES
----(11125, 'CPT111', 2020, '1', 'A-', 72.0);
----INSERT INTO STUDENT_COURSE VALUES
----(11126, 'CPT111', 2019, '1', 'B', 60.0);
----INSERT INTO STUDENT_COURSE VALUES
----(11127, 'CPT111', 2019, '1', 'A', 85.0);
----INSERT INTO STUDENT_COURSE VALUES
----(11128, 'CPT111', 2018, '1', 'B-', 55.0);
----INSERT INTO STUDENT_COURSE VALUES
----(11126, 'CMT221', 2020, '2', 'A', 82.5);
----INSERT INTO STUDENT_COURSE VALUES
----(11127, 'CMT221', 2020, '1', 'B+', 68.0);
----INSERT INTO STUDENT_COURSE VALUES
----(11128, 'CMT221', 2019, '1', 'B+', 65.5);
----INSERT INTO STUDENT_COURSE VALUES
----(11128, 'CDS403', 2020, '1', 'B', 59.0);
----COMMIT;
--
----Q2: How many records/rows are found in the STUDENT, COURSE and STUDENT_COURSE tables?
----What is the function of the COMMIT command?
--
--STUDENT: 6 records
--COURSE: 3 records
--STUDENT_COURSE: 8 records
--
--COMMIT : Saves changes to the database and ends the transaction
--
----ALTER TABLE STUDENT_COURSE
---- ADD CONSTRAINT STU_COURSE_PK PRIMARY KEY (STUDENT_ID, COURSE_CODE);
----
----ALTER TABLE STUDENT_COURSE
---- DROP CONSTRAINT STU_COURSE_PK;
--
--
----Q3: Write an SQL statement to drop the current primary key of the STUDENT table. Then, add back 
----STUDENT_ID as the primary key of the STUDENT table with the constraint name STUDENT_PK.
--ALTER TABLE STUDENT
--    DROP PRIMARY KEY;
--    
--ALTER TABLE STUDENT
--    ADD CONSTRAINT STUDENT_PK PRIMARY KEY (STUDENT_ID);
--
--
----ALTER TABLE STUDENT_COURSE
---- ADD CONSTRAINT SC_STUDENT_ID_FK FOREIGN KEY (STUDENT_ID)
---- REFERENCES STUDENT (STUDENT_ID);
--
----Q4: Write an SQL statement to enforce the foreign key constraint on COURSE_CODE in the 
----STUDENT_COURSE table to COURSE_CODE in the parent table, COURSE. Name the foreign key 
----constraint SC_COURSE_CODE_FK. 
--
--ALTER TABLE STUDENT_COURSE
--    ADD CONSTRAINT SC_COURSE_CODE_FK FOREIGN KEY (COURSE_CODE)
--    REFERENCES  COURSE (COURSE_CODE);
--
--
----ALTER TABLE STUDENT
---- ADD CONSTRAINT STUDENT_NAME_BD_UQ
---- UNIQUE (STUDENT_NAME, STUDENT_BIRTHDATE);
---- 
----INSERT INTO STUDENT
----VALUES (11131, 'RISHA NATHAN', '15-OCT-00', 'INDIA', 'RISHNAT@ABC.COM', '345-213-5564', 
----2020);
--
----Q5: You are required to state the reason of this violation in your lab report (i.e. why the record cannot 
----be inserted into the STUDENT table).
-- there?s already a student with the same name and/or birthdate in the table.
-- 
--
----ALTER TABLE STUDENT
---- ADD CONSTRAINT STUDENT_YEAR_ENROLLED_CK
---- CHECK (STUDENT_YEAR_ENROLLED >= 2000);
---- 
----INSERT INTO STUDENT
---- VALUES(11131, 'ANNA MOORE', '20-JAN-00', 'USA', 'ANNAMOORE@ABC.COM', '345-455-2211', 
----1999);
--
----Q6: You are required to state the reason of this violation in your lab report (why the record cannot be 
----inserted into the STUDENT table).
--because the student year enrolled is not >= 2000
--
----Q7: You are required to implement another CHECK constraint to the STUDENT table. The CHECK 
----constraint will make sure that no student from the country of FRANCE can be added to the STUDENT
----table. The SQL statement for this task must be included in your lab report.
--ALTER TABLE STUDENT
--    ADD CONSTRAINT STUDENT_COUNTRY_CK
--    CHECK (STUDENT_COUNTRY <> 'FRANCE');
--
----Verification
----INSERT INTO STUDENT 
----VALUES(11131, 'MANDY MOORE', '20-AUG-99', 'FRANCE', 'MANDYMOORE@ABC.COM', 
----'245-114-6687', 1999);
--
----
----ALTER TABLE STUDENT_COURSE
---- MODIFY (YEAR_TAKEN NOT NULL, SEMESTER_TAKEN NOT NULL);
---- 
----ALTER TABLE COURSE
---- MODIFY (COURSE_CATEGORY DEFAULT 'CORE');
----
----INSERT INTO COURSE (COURSE_CODE, COURSE_TITLE)
----VALUES ('CPT245', 'SOFTWARE ENGINEERING');
--
--
----Exercise
--CREATE TABLE STORE(
--    STO_ID NUMBER(6) PRIMARY KEY,
--    STO_NAME VARCHAR2(30) UNIQUE NOT NULL
--);
--
--CREATE TABLE SALES_PERSON(
--    ID NUMBER(5) PRIMARY KEY,
--    STO_ID NUMBER(5) REFERENCES STORE(STO_ID),
--    NAME VARCHAR2(30) UNIQUE NOT NULL,
--    COMM CHAR(1) DEFAULT 'Y' CHECK (COMM IN ('Y', 'N')),
--    SALARY NUMBER(7,2) CHECK (SALARY > 0)
--);
--    
--    

--Q1: What is the relationship between STUDENT, COURSE and STUDENT_COURSE tables? Explain.
Many-to-many relationship

--Q2: Do the following two CREATE TABLE statements in A and B produce the same output in terms of 
--primary key creation? Yes or no?
Yes

--Q3: What is a .csv file? Explain it by giving an example.
file containing values separated by commas.

--Q4: Are you able to execute the above statement successfully? Highlight the error if you encounter 
--any. Provide reason why the error occurs and fix the error. Please include your discussion in the lab 
--report.
--INSERT INTO STUDENT_COURSE VALUES (11128, 'CMM222', 2020, '2', 'A');

Error at Command Line : 190 Column : 13
Error report -
SQL Error: ORA-00947: not enough values
00947. 00000 -  "not enough values"
*Cause:    
*Action:

Missing score value

--Q5: Are you able to execute the above statement successfully? Highlight the error if you encounter 
--any. Provide reason why the error occurs and fix the error. Please include your discussion in the lab 
--report
--INSERT INTO STUDENT
--VALUES (11128, 'DONALD TRUMP', '13-MAR-98', 'USA', 'DONTRUMP@ABC.COM', '544-788-
--999', 2020);

Error report -
ORA-00001: unique constraint (SYSTEM.STUDENT_PK) violated

The student ID already exists

--Q6: Provide a SQL command which allows us to locate a student with STUDENT_ID = 11126. What is 
--the student�s name? The SQL command must be included in the lab report.
SELECT STUDENT_NAME FROM STUDENT WHERE STUDENT_ID = 11126

--The STUDENT_NAME is ZHANG ZIYI

--Q7: Examine the output of the following SQL statement:
--SELECT * 
--FROM STUDENT
--WHERE STUDENT_PHONE LIKE '%5_1%';
--
--Explain what the SQL statement does based on the output in your lab report.

It will show the student that whose phone number contains this part where �5� is followed by any single character and followed by �1�.

--Q8: Write a SELECT statement using aggregate function to return the number of students in the 
--STUDENT table
SELECT COUNT(STUDENT_ID) FROM STUDENT