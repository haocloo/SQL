--a)
CREATE TABLE STUDENT(
    STUDENT_ID NUMBER(5,0),
    STUDENT_NAME VARCHAR2(30),
    STUDENT_BIRTHDATE DATE,
    STUDENT_COUNTRY VARCHAR2(15),
    STUDENT_EMAIL VARCHAR2(20),
    STUDENT_PHONE VARCHAR2(12),
    STUDENT_YEAR_ENROLLED DATE
)

--b)
CREATE TABLE STUDENT_COURSE(
    STUDENT_ID NUMBER(5,0),
    COURSE_CODE CHAR(6),
    YEAR_TAKEN DATE,
    SEMESTER_TAKEN CHAR(1),
    GRADE_AWARDED CHAR(2)
)

----d)
ALTER TABLE STUDENT_COURSE
    ADD GRADE_PERCENT NUMBER(3);

----e)    
ALTER TABLE STUDENT_COURSE
    MODIFY GRADE_PERCENT VARCHAR2(4);

----f)
ALTER TABLE STUDENT_COURSE
    DROP COLUMN GRADE_PERCENT;
