CREATE TABLE Employee (
Empno int,
Emp_name varchar(255),
Emp_Join_Date Date default SYSDATE ,
Emp_Status varchar(255)
);

CREATE TABLE Project (
Project_Code varchar(255),
Project_Description varchar(255),
Project_Start_Date DATE,
Project_End_Date DATE
);

DROP TABLE Project;

CREATE TABLE Project_Allocation  (
Project_Code varchar(255),
Empno int,
Emp_Proj_Alloc_Date DATE,
Emp_Proj_Release_Date DATE
);


INSERT 
INTO Employee
VALUES('101','Jhonny',TO_DATE('01-Jul-2005','DD-MON-YYYY'),'C');

INSERT 
INTO Employee
VALUES('116','Nayak',TO_DATE('16-Aug-2005','DD-MON-YYYY'),'C');

INSERT 
INTO Employee
VALUES('202','Meera',TO_DATE('30-Jan-2006','DD-MON-YYYY'),'C');

INSERT 
INTO Employee
VALUES('205','Ravi',TO_DATE('11-Feb-2006','DD-MON-YYYY'),'C');


INSERT 
INTO Employee
VALUES('304','Hari',TO_DATE('25-Nov-2006','DD-MON-YYYY'),'P');

INSERT 
INTO Employee
VALUES('307','Nancy',TO_DATE('15-Jan-2007','DD-MON-YYYY'),'P');

INSERT 
INTO Employee
VALUES('403','Nick',TO_DATE('21-Jan-2007','DD-MON-YYYY'),'P');

INSERT 
INTO PROJECT
VALUES ('P001','Environment Pollution',TO_DATE('02-Aug-2005','DD-MON-YYYY'),TO_DATE('11-Dec-2006','DD-MON-YYYY'));

INSERT 
INTO PROJECT
VALUES ('P002','Learning Curve',TO_DATE('01-Feb-2006','DD-MON-YYYY'),null);

INSERT 
INTO PROJECT
VALUES ('P003','Effects of IT',TO_DATE('03-Jan-2007','DD-MON-YYYY'),null);

INSERT 
INTO PROJECT
VALUES ('P003','Effects of IT',TO_DATE('03-Jan-2007','DD-MON-YYYY'),null);

INSERT 
INTO PROJECT_ALLOCATION 
VALUES ('P001','101',TO_DATE('01-Aug-2005','DD-MON-YYYY'),TO_DATE('11-Dec-2006','DD-MON-YYYY'));

INSERT 
INTO PROJECT_ALLOCATION 
VALUES ('P001','116',TO_DATE('16-Aug-2005','DD-MON-YYYY'),TO_DATE('11-Dec-2006','DD-MON-YYYY'));

INSERT 
INTO PROJECT_ALLOCATION 
VALUES ('P002','202',TO_DATE('01-Feb-2006','DD-MON-YYYY'),TO_DATE('14-Jan-2007','DD-MON-YYYY'));

INSERT 
INTO PROJECT_ALLOCATION 
VALUES ('P002','307',TO_DATE('15-Jan-2007','DD-MON-YYYY'),null);


INSERT 
INTO PROJECT_ALLOCATION 
VALUES ('P003','403',TO_DATE('21-Jan-2007','DD-MON-YYYY'),null);

INSERT 
INTO PROJECT_ALLOCATION 
VALUES ('P003','304',TO_DATE('03-Jan-2007','DD-MON-YYYY'),null);

INSERT 
INTO PROJECT_ALLOCATION 
VALUES ('P003','101',TO_DATE('03-Jan-2007','DD-MON-YYYY'),null);

INSERT 
INTO PROJECT_ALLOCATION 
VALUES ('P003','116',TO_DATE('03-Jan-2007','DD-MON-YYYY'),null);

INSERT 
INTO PROJECT_ALLOCATION 
VALUES ('P003','202',TO_DATE('03-Jan-2007','DD-MON-YYYY'),null);


select PROJECT_DESCRIPTION from PROJECT;
select EMP_NAME from Employee;
select EMP_NAME from Employee where EMP_STATUS='C';
select EMP_NAME from Employee where Emp_Join_Date>'01-Nov-2006';
select PROJECT_DESCRIPTION from Project  where Project_Start_Date>'01-Jan-2006';
select Empno from Project_Allocation where Project_Code='P003';
select PROJECT_CODE from Project where Project_End_Date is null;
select Empno from Project_Allocation where Project_Code='P003' AND EMP_PROJ_RELEASE_DATE is null;
select Project_Code, Project_End_Date-Project_Start_Date from Project where Project_Code='P001';  

/* j)	Display for how many days are employees working on the allocated projects */

select Empno, trunc(sysdate)-Emp_Proj_Alloc_Date from Project_Allocation where Emp_Proj_Release_Date is null;


ALTER Table PROJECT
ADD Project_Manager varchar(255);


Update Project
set  Project_Manager='101'
where Project_Code='P001';

Update Project
set  Project_Manager='202'
where Project_Code='P002';

Update Project
set  Project_Manager='116'
where Project_Code='P003';

INSERT 
INTO Project
VALUES ('P004','Election Rage', TO_DATE('01-Mar-2007','DD-MON-YYYY') ,null,null);


DELETE FROM Project
where Project_Description ='Election Rage';
