create table AdminUser
(
    emp_id varchar(4),
    user_id varchar(4),
    password varchar(14),
    CONSTRAINT chk_1000 CHECK (LENGTH(password) >=8)
);
INSERT INTO AdminUser values('E005','U001','ShaheerE005');
INSERT INTO AdminUser values('E002','U002','ChrisE002');
INSERT INTO AdminUser values('E010','U003','ZyanE010');

SELECT *FROM AdminUser;
--DROP TABLE ADMINUSER;
create table EMPLOYEE
(
    emp_id varchar(4) not null,
    first_name varchar(10),
    last_name varchar(10),
    city varchar(15),
    e_state varchar(15),
    hired_date date,
    primary key (emp_id),
    CHECK (first_name NOT LIKE '%[^A-Za-z]%'),
    CHECK (last_name NOT LIKE '%[^A-Za-z]%'),
    check (SUBSTR(emp_id, 1, 1) ='E')
);
--drop table EMPLOYEE;

INSERT INTO EMPLOYEE values('E001','Ema','Watson','Coimbatore','Tamilnadu',TO_DATE('2004-12-09','YYYY-MM-DD'));
INSERT INTO EMPLOYEE values('E002','Chris','Brown','Banglore','Karnataka',TO_DATE('2009-03-21','YYYY-MM-DD'));
INSERT INTO EMPLOYEE values('E003','Kristian','Stewart','Pune','Maharashtra',TO_DATE('2012-02-08','YYYY-MM-DD'));
INSERT INTO EMPLOYEE values('E004','Robert','Pattinson','Mumbai','Maharashtra',TO_DATE('2003-02-11','YYYY-MM-DD'));
INSERT INTO EMPLOYEE values('E005','Shaheer','Sheikh','Banglore','Karnataka',TO_DATE('2007-11-19','YYYY-MM-DD'));
INSERT INTO EMPLOYEE values('E006','Tony','Stark','Hyderabad','Telangana',TO_DATE('2013-05-02','YYYY-MM-DD'));
INSERT INTO EMPLOYEE values('E007','Kendell','Jenner','Kanyakumari','Tamilnadu',TO_DATE('2008-07-12','YYYY-MM-DD'));
INSERT INTO EMPLOYEE values('E008','Selena','Gomez','Trivandrum','Kerala',TO_DATE('2019-10-06','YYYY-MM-DD'));
INSERT INTO EMPLOYEE values('E009','Taylor','Swift','Kozhikode','Kerala',TO_DATE('2015-12-05','YYYY-MM-DD'));
INSERT INTO EMPLOYEE values('E010','Zyan','Malik','Panaji','Goa',TO_DATE('2003-06-01','YYYY-MM-DD'));

SELECT *FROM EMPLOYEE;

create table PHONE
(
    emp_id varchar(4) not null,
    phone1 varchar(10),
    phone2 varchar(10),
    primary key(emp_id),
    CHECK (LENGTH(phone1)=10),
    CHECK (LENGTH(phone2)=10)
);

INSERT INTO PHONE values('E001','9876543210','9736005860');
INSERT INTO PHONE values('E002','8765432190','9879876599');
INSERT INTO PHONE values('E003','7654321890','9432675012');
INSERT INTO PHONE values('E004','6543210987','9100875865');
INSERT INTO PHONE values('E005','9753108642','9944082359');
INSERT INTO PHONE values('E006','9865327410','9875321001');
INSERT INTO PHONE values('E007','9988776645','8765901237');
INSERT INTO PHONE values('E008','8790654367','9786574328');
INSERT INTO PHONE values('E009','9631246809','7782974315');
INSERT INTO PHONE values('E010','9654783251','9645321987');

SELECT *FROM PHONE;
--drop table PHONE;

create table ACCOUNT
(
    emp_id varchar(4) not null,
    acc_id int,
    bank_name varchar(25),
    acc_no varchar(20) not null,
    primary key(acc_no,emp_id),
    foreign key (emp_id) references employee(emp_id),
    CHECK (LENGTH(acc_no) BETWEEN 9 AND 18)
);

INSERT INTO ACCOUNT VALUES ('E001',1001,'Central Bank','12345678901');
INSERT INTO ACCOUNT VALUES ('E002',1002,'State Bank of India','26374859101');
INSERT INTO ACCOUNT VALUES ('E003',1003,'HDFC','45678901231');
INSERT INTO ACCOUNT VALUES ('E004',1004,'Central Bank','42537489163');
INSERT INTO ACCOUNT VALUES ('E005',1005,'HDFC','78901234874');
INSERT INTO ACCOUNT VALUES ('E006',1006,'State Bank of India','98765432101');
INSERT INTO ACCOUNT VALUES ('E007',1007,'HDFC','24680976531');
INSERT INTO ACCOUNT VALUES ('E008',1007,'Central Bank','16789024463');
INSERT INTO ACCOUNT VALUES ('E009',1009,'State Bank of India','5678901234');
INSERT INTO ACCOUNT VALUES ('E010',1010,'State Bank of India','23456789012');

--drop table ACCOUNT;
SELECT *FROM ACCOUNT;

create table DEPARTMENT
(
    emp_id varchar(4) not null,
    dept_id varchar(4),
    dept_desg varchar(25),
    dept_name varchar(20),
    primary key(dept_id,emp_id),
    foreign key (emp_id) references employee(emp_id),
    check (SUBSTR(dept_id, 1, 1) ='D'),
    CHECK (dept_name IN ('Production','Marketing','Research','Sales','Accounting'))
);

INSERT INTO DEPARTMENT values('E001','D101','Production Manager','Production');
INSERT INTO DEPARTMENT values('E002','D102','Marketing Officer','Marketing');
INSERT INTO DEPARTMENT values('E003','D104','Scientist','Research');
INSERT INTO DEPARTMENT values('E004','D105','Sales Manager','Sales');
INSERT INTO DEPARTMENT values('E005','D103','Bussiness Analyst','Accounting');
INSERT INTO DEPARTMENT values('E006','D101','Co-ordinator','Production');
INSERT INTO DEPARTMENT values('E007','D102','Manager','Marketing');
INSERT INTO DEPARTMENT values('E008','D103','Team member','Accounting');
INSERT INTO DEPARTMENT values('E009','D104','Analyst','Research');
INSERT INTO DEPARTMENT values('E010','D105','Acccount executive','Sales');

SELECT *FROM DEPARTMENT;
--drop table DEPARTMENT;

create table PROJECT
(
    project_id varchar(4) not null,
    emp_id  varchar(4) not null,
    dept_id varchar(4) not null, 
    project_head varchar(4) not null,
    project_name varchar(50),
    project_des char(150),
    primary key(project_id,emp_id),
    foreign key (dept_id,emp_id) references DEPARTMENT(dept_id,emp_id),
    check (SUBSTR(project_id, 1, 1) ='P')
);

INSERT INTO PROJECT VALUES('P301','E002','D102','E001','E-commerce Platform',
    'A developed platform should have a purchase, sell, distribution of items, product or service through the internet. ');
INSERT INTO PROJECT VALUES('P303','E004','D105','E005','Inventory Management',
    'An inventory management system will allow its client to ind the stock levels in their inventory .');
INSERT INTO PROJECT VALUES('P305','E001','D101','E002','Railway System',
    'Store information on the sequence of the stations a train passes through.'); 
INSERT INTO PROJECT VALUES ('P302','E006','D101','E009','College Data Management',
    'Store all this information about the college and its departments.');
INSERT INTO PROJECT VALUES ('P304','E007','D102','E004','Library Data Management',
    'Library management have to keep a record of all the books they have and the books they have lent.');
INSERT INTO PROJECT VALUES ('P306','E008','D103','E005','Solution for Saving Student Records',
    'Separate files for each student where the data will store information about the student.');
INSERT INTO PROJECT VALUES ('P301','E003','D104','E001','E-commerce Platform',
    'A developed platform should have a registration window where the user will provide their name, bank name, and bank account number.');
INSERT INTO PROJECT VALUES ('P302','E009','D104','E009','College Data Management',
    'Store all this information about the college and its departments.');
INSERT INTO PROJECT VALUES ('P303','E010','D105','E005','Inventory Management',
    'An inventory management system will allow its client to ind the stock levels in their inventory .');
INSERT INTO PROJECT VALUES ('P305','E005','D103','E002','Railway System',
    'Store information on the sequence of the stations a train passes through.');

SELECT *FROM PROJECT;
--drop table PROJECT;

create table EDUCATION 
(
     year_of_grad int ,
     experience int,
     emp_id varchar(4) not null,
     degree varchar(20),
     primary key(year_of_grad, emp_id),
     foreign key (emp_id) references employee(emp_id)
);
INSERT INTO EDUCATION VALUES (2003,9,'E001','BBA');
INSERT INTO EDUCATION VALUES (1989,11,'E002','Bachelor of Tech');
INSERT INTO EDUCATION VALUES (1999,7,'E003','IIM 5-year Integ');
INSERT INTO EDUCATION VALUES (1992,15,'E004','MTECH');
INSERT INTO EDUCATION VALUES (2000,12,'E005','Bachelor of Tech');
INSERT INTO EDUCATION VALUES (1995,15,'E006','BBS');
INSERT INTO EDUCATION VALUES (2004,10,'E007','Bachelor of Tech');
INSERT INTO EDUCATION VALUES (2001,13,'E008','Bachelor of Tech');
INSERT INTO EDUCATION VALUES (2002,7,'E009','MTECH');
INSERT INTO EDUCATION VALUES (1997,14,'E010','BBA');

SELECT * FROM EDUCATION;
--drop table education;

create table SALARY
(
    sal_id int not null ,
    income float,
    tax float DEFAULT 1.2,
    acc_no varchar(20) not null,
    emp_id varchar(4) not null,
    primary key(sal_id,acc_no),
    foreign key (acc_no,emp_id) references account(acc_no,emp_id) 
    
);

INSERT INTO SALARY VALUES (101,50000.5,1.2,'12345678901','E001');
INSERT INTO SALARY VALUES (102,10000.2,1.2,'26374859101','E002');
INSERT INTO SALARY VALUES (103,25000,1.2,'45678901231','E003');
INSERT INTO SALARY VALUES (104,20000.75,1.2,'42537489163','E004');
INSERT INTO SALARY VALUES (105,17800.5,1.2,'78901234874','E005');
INSERT INTO SALARY VALUES (106,23400.5,1.2,'98765432101','E006');
INSERT INTO SALARY VALUES (107,19000.5,1.2,'24680976531','E007');
INSERT INTO SALARY VALUES (108,59000.76,1.2,'16789024463','E008');
INSERT INTO SALARY VALUES (109,15500.5,1.2,'5678901234','E009');
INSERT INTO SALARY VALUES (110,30000.5,1.2,'23456789012','E010');

SELECT * FROM SALARY;
--drop table salary;

create table ATTENDANCE
(
   worked_hours int,
   emp_id varchar(4) not null,
   primary key(emp_id,worked_hours),
   foreign key (emp_id) references employee(emp_id)
);
 
INSERT INTO ATTENDANCE VALUES (200,'E001');
INSERT INTO ATTENDANCE VALUES (212,'E002');
INSERT INTO ATTENDANCE VALUES (180,'E003');
INSERT INTO ATTENDANCE VALUES (203,'E004');
INSERT INTO ATTENDANCE VALUES (197,'E005');
INSERT INTO ATTENDANCE VALUES (186,'E006');
INSERT INTO ATTENDANCE VALUES (184,'E007');
INSERT INTO ATTENDANCE VALUES (209,'E008');
INSERT INTO ATTENDANCE VALUES (219,'E009');
INSERT INTO ATTENDANCE VALUES (230,'E010');

SELECT * FROM ATTENDANCE;
--drop table attendance;

create table LEAVE
(
    no_of_days int,
    emp_id varchar(4) not null,
    primary key(emp_id,no_of_days),
    foreign key (emp_id) references employee(emp_id)
);

INSERT INTO LEAVE VALUES (15,'E001');
INSERT INTO LEAVE VALUES (1,'E002');
INSERT INTO LEAVE VALUES (13,'E003');
INSERT INTO LEAVE VALUES (2,'E004');
INSERT INTO LEAVE VALUES (0,'E005');
INSERT INTO LEAVE VALUES (0,'E006');
INSERT INTO LEAVE VALUES (1,'E007');
INSERT INTO LEAVE VALUES (0,'E008');
INSERT INTO LEAVE VALUES (0,'E009');
INSERT INTO LEAVE VALUES (0,'E010');

SELECT * FROM LEAVE;
--drop table leave;

--QUERY 1   
SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER TRIG BEFORE UPDATE ON SALARY
FOR EACH ROW
BEGIN
    
    if(:new.INCOME+1000>100000)THEN
        RAISE_APPLICATION_ERROR(-101,'OOPS! THE SALARY LIMIT IS EXCEEDING');
    END IF;
END;

UPDATE SALARY SET INCOME=INCOME+1000;
SELECT *FROM SALARY;

--QUERY 2
--LEAVE UPDATE
SET SERVEROUTPUT ON;
DECLARE
   temp int;
   Eid varchar(4);
BEGIN
    dbms_output.put_line('Take leave');
    Eid:=&Eid; 
    
    UPDATE LEAVE SET no_of_days = no_of_days+1 where emp_id=Eid;
    
END;
select * from leave;

--QUERY 3
SET SERVEROUTPUT ON;
DECLARE
    Eid varchar(4);
    tempdate VARCHAR(10);
BEGIN
    Eid := &Eid;
    select TO_CHAR(HIRED_DATE, 'DAY') INTO TEMPDATE from employee where emp_id=Eid;
    dbms_output.put_line(tempdate);
    
END;

--QUERY 4
SET SERVEROUT ON;
DECLARE

    avgPay float;
    d_name varchar(150);
    d_id varchar(4);
    cursor c is 
    (SELECT avg(s.income),d.dept_name,d.dept_id from salary s,department d,employee e WHERE e.emp_id = s.emp_id and e.emp_id = d.emp_id 
        group by d.dept_name,d.dept_id);
        
BEGIN
    dbms_output.put_line('avgpay'||'   '||'d_name'||'   '||'d_id');
    open c;
    loop
    fetch c into avgPay,d_name,d_id;
    exit when c%notfound;
    dbms_output.put_line(avgpay||'   '||d_name||'   '||d_id);
    end loop;
    close c; 
END;

--QUERY5
---output employees who involved in it
SET SERVEROUTPUT ON;
DECLARE
    projectName varchar(50);
    projectDes varchar(150);
    eid varchar(4);
    cursor c is select p.emp_id from project p join employee e on p.emp_id=e.emp_id where p.project_name = &projectName;
BEGIN
    
    dbms_output.put_line('Employees who contributed to the project : ');
    open c;
    loop
    fetch c into eid;
    exit when c%notfound;
    dbms_output.put_line(eid);
    end loop;
    close c;  
END;

--QUERY 6
---output project description
SET SERVEROUTPUT ON;
DECLARE
    projectName varchar(50);
    projectDes varchar(150);
    eid varchar(4);
    cursor c is select p.project_des from project p join employee e on p.emp_id=e.emp_id where p.project_name = &projectName;
BEGIN
    
    dbms_output.put_line('Project Description: ');
    open c;
    loop
    fetch c into projectDes;
    exit when c%notfound;
    dbms_output.put_line(projectDes);
    end loop;
    close c;  
END;

--QUERY 7
--DETAILS OF EMPLOYEE
DECLARE
    EID VARCHAR(4);
    f_name varchar(10);
    l_name varchar(10);
    tcity varchar(15);
    emp_state varchar(15);
    projectName varchar(50);
    thired_date date;
    cursor c is SELECT first_name,
    last_name,
    city,
    e_state,
    hired_date,
    p.project_name FROM (employee e join education edu on e.emp_id = edu.emp_id) join project p on e.emp_id = p.emp_id where e.emp_id =&eid;
        

BEGIN
    
    open c;
    dbms_output.put_line('FIRST NAME'||'   '||'LAST NAME'||'   '||'CITY'||'   '||'STATE'||'   '||'HIRED DATE'||'   '||'PROJECT NAME');
    loop
        fetch c into f_name,l_name,tcity,emp_state,thired_date,projectName;
        exit when c%notfound;
        dbms_output.put_line(f_name||'   '||l_name||'   '||tcity||'   '||emp_state||'   '||thired_date||'   '||projectName);
    end loop;
    close c;
   
END;

--QUERY 8
--delete a record
DECLARE
    EID VARCHAR(4);
    
BEGIN
    eid := &eid;
    DELETE FROM ATTENDANCE WHERE emp_id=eid;
    DELETE FROM LEAVE WHERE emp_id=eid;
    DELETE FROM SALARY WHERE emp_id=eid;
    DELETE FROM ACCOUNT WHERE emp_id=eid;
    DELETE FROM PROJECT WHERE emp_id=eid;
    DELETE FROM DEPARTMENT WHERE emp_id=eid;
    DELETE FROM EDUCATION WHERE emp_id=eid;
    DELETE FROM EMPLOYEE WHERE emp_id=eid;

END;
/
    
SELECT * FROM EMPLOYEE;

--QUERY 9
--EXPERIENCE
DECLARE
    Eid varchar(4);
    fName varchar(10);
    lName varchar(10);
    hiredDate date;
    yr int;
    cursor X is SELECT first_name,last_name,hired_date FROM EMPLOYEE where emp_id = &Eid;
BEGIN
    OPEN X;
    dbms_output.put_line('FIRST NAME'||'  '||'LAST NAME'||'  '||'YEARS OF EXPERIENCE');
    
    loop
        fetch X into fName,lName,hiredDate;
        yr:=EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM hiredDate);
        exit when X%notfound;
        dbms_output.put_line(fName||'      '||lName||'     '|| yr);
    END loop;
    CLOSE X;
END;

---QUERY 10*
--YEARS TOOK FOR A PERSON TO GET HIRED
DECLARE 
    Eid varchar(4);
    fName varchar(10);
    lName varchar(10);
    grad int;
    hiredDate date;
    yr int;
    cursor X is (SELECT e.first_name ,e.last_name,e.hired_date,edu.year_of_grad FROM EMPLOYEE e ,EDUCATION edu WHERE e.emp_id = edu.emp_id AND e.emp_id = &Eid);
BEGIN
    OPEN X;
    dbms_output.put_line('FIRST NAME'||'  '||'LAST NAME'||'  '||'YEARS TOOK FOR A PERSON TO GET HIRED');
    loop
        fetch X into fName,lName,hiredDate,grad;
        yr :=  EXTRACT(YEAR FROM hiredDate) - grad;
        exit when X%notfound;
        dbms_output.put_line(fName||'      '||lName||'     '|| yr);
    END loop;
    CLOSE X;
END;


--QUERY 11
--select the employee ... list the details of projects he has worked on
SET SERVEROUTPUT ON;

DECLARE
    eid varchar(4);
    projectId varchar(4);
    projectName varchar(50);
    projectDes varchar(150);
    projectHead varchar(4);
    cursor c is (SELECT p.emp_id,p.project_id,p.project_name,p.project_des,P.project_head from PROJECT P JOIN EMPLOYEE E ON E.emp_id=P.emp_id where e.emp_id=&eid);
    
BEGIN
    dbms_output.put_line('EID'||'   '||'PROJECT ID'||'   '||'PROJECT NAME'||'   '||'PROJECT DESCRIPTION'||'                        '||'PROJECT HEAD');
    OPEN c;
    loop
    fetch c into eid,projectId,projectName,projectDes,projectHead;
    exit when c%notfound;
        dbms_output.put_line(eid||'   '||projectId||'   '||projectName||'   '||projectDes||' '||projectHead);
    end loop;
    close c;
   
END;

--QUERY 12
--DISPLAY DEPT HIGHEST SALARY WITH EMP DETAILS
SET SERVEROUTPUT ON;
DECLARE
    eid varchar(4);
    f_name varchar(10);
    l_name varchar(10);
    deptName varchar(20);
    exp int;
    deg varchar(20);
    pay float;
    
    CURSOR C IS 
        (Select e.emp_id,e.first_name,e.last_name,d.dept_name,edu.experience,edu.degree,s.income from 
            ((employee e join department d on e.emp_id=d.emp_id)join education edu on e.emp_id=edu.emp_id)join salary s on s.emp_id=e.emp_id
        where s.income in
        (select max(s1.income) from salary s1 join department d1 on s1.emp_id=d1.emp_id group by d1.dept_id));
BEGIN
    
    dbms_output.put_line('eid'||'   '||'f_name'||'   '||'l_name'||'   '||'deptName'||'   '||'exp'||'   '||'deg'||'   '||'pay');
    dbms_output.put_line('------------------------------------------------------');
    OPEN C;
    LOOP
    FETCH C INTO eid,f_name,l_name,deptName,exp,deg,pay;
    exit when c%notfound;
        dbms_output.put_line(eid||'   '||f_name||'   '||l_name||'   '||deptName||'   '||exp||'   '||deg||'   '||pay);
    END loop;
    CLOSE c;
END;

--QUERY  13
--INSERTION
SET SERVEROUTPUT ON;
DECLARE
    emp_id varchar(4);
    dept_id varchar(4);
    acc_no varchar(20);
    
BEGIN
    emp_id := &emp_id;
    INSERT INTO EMPLOYEE values(emp_id,&first_name,&last_name,&city,&e_state,TO_DATE(&hired_date,'YYYY-MM-DD'));
    INSERT INTO PHONE values(emp_id,&phone1,&phone2);
    acc_no :=&acc_no;
    INSERT INTO ACCOUNT values(emp_id,&acc_id,&bank_name,acc_no);
    dept_id := &dept_id;
    INSERT INTO DEPARTMENT values(emp_id,dept_id,&dept_name,&dept_desg);
    INSERT INTO PROJECT VALUES(&project_id,emp_id,dept_id,&head_,&project_name,&project_des);
    INSERT INTO EDUCATION VALUES (&year_of_grad,&experience,emp_id,&degree);
    INSERT INTO SALARY VALUES (&sal_id,&income,&tax,acc_no,emp_id);
    INSERT INTO ATTENDANCE VALUES (&worked_hours,emp_id);
    INSERT INTO LEAVE VALUES (&no_of_days,emp_id);
    
END;


--QUERY 14
--MOST EXPERIENCED EMPLOYEE'S EXPERIENCED NO. OF YEARS IN A PARTICULAR DEPT
SET SERVEROUTPUT ON;
DECLARE
    eid varchar(4);
    empName varchar(10);
    deptId varchar(4);
    exp int;
    cursor c is (select DISTINCT d.dept_id,max(edu.experience) from 
        (education edu join employee e on edu.emp_id=e.emp_id)join department d on d.emp_id=e.emp_id 
    group by d.dept_id 
    );
BEGIN
    
    OPEN C;
    LOOP
    fetch c into deptId,exp;
     exit when c%notfound;
        dbms_output.put_line(deptId||'   '||exp);
    END loop;
    CLOSE c;
END;

--QUERY 15
----no of employees in a particular department 
SET SERVEROUTPUT ON;
DECLARE
    
    deptId varchar(4);
    ct int;
    cursor c is (SELECT distinct dept_id ,count(emp_id) FROM DEPARTMENT group by dept_id);       
    
BEGIN
    
    OPEN C;
    LOOP
    fetch c into deptId,ct;
     exit when c%notfound;
        dbms_output.put_line(deptId||'   '||ct);
    END loop;
    CLOSE c;
END;

--QUERY 16*

SET SERVEROUTPUT ON;
create or replace PROCEDURE AdminLogin4 (U_name in VARCHAR2,U_pass in varchar2)
 IS

    CURSOR entry IS SELECT user_id ,password FROM AdminUser;

    x varchar(10);
    y varchar(14);
    n int := 1;
BEGIN
  
    OPEN entry ;
    LOOP
    FETCH entry INTO x,y;
    
    EXIT WHEN entry% NOTFOUND;
    if(x=U_name AND y=U_pass)then
        n:=n+1;
        dbms_output.put_line('WELCOME DEAR    '||x);
        
    elsif(x <> U_name AND y<>U_pass)then
        dbms_output.put_line('USER NOT FOUND');
    END IF;
    EXIT WHEN n>1;
    END LOOP;
    CLOSE entry;
    END;

DECLARE
    U_name varchar(10);
    U_pass varchar(14);
    
BEGIN
    
    U_name :=&U_name;
    U_pass :=&U_pass;
    ADMINLOGIN4(U_name,U_pass);
    
END;


--QUERY 17
--INSERT PROJECT
SET SERVEROUTPUT ON;
BEGIN
    INSERT INTO PROJECT VALUES(&project_id,&emp_id,&dept_id,&project_head,&project_name,&project_des);
END;

--QUERY 18
--MORE LEAVES ... DELETE
SET SERVEROUTPUT ON;
DECLARE
    Eid varchar(4);
    leave_took int;
    leave_allow int;
    cursor X is SELECT no_of_days,emp_id FROM LEAVE ;
BEGIN
    leave_allow := &leave_allow;
    OPEN X;
    loop
        fetch X into leave_took,Eid;
        EXIT WHEN X%NOTFOUND;
        IF leave_allow < leave_took THEN 
            dbms_output.put_line('DELETEING RECORD OF '||eid);
            DELETE FROM ATTENDANCE WHERE emp_id=eid;
            DELETE FROM LEAVE WHERE emp_id=eid;
            DELETE FROM SALARY WHERE emp_id=eid;
            DELETE FROM ACCOUNT WHERE emp_id=eid;
            DELETE FROM PROJECT WHERE emp_id=eid;
            DELETE FROM DEPARTMENT WHERE emp_id=eid;
            DELETE FROM EDUCATION WHERE emp_id=eid;
            DELETE FROM EMPLOYEE WHERE emp_id=eid;
        ELSE
            dbms_output.put_line(eid||' RECORD NOT DELETED');
        END IF;
    END loop;
    CLOSE X;
END;

SELECT * FROM LEAVE;

--QUERY 19
--some eligible candidates r allowed for a big project
--print the details of the employees who r eligible for it

SET SERVEROUTPUT ON;
DECLARE
    eid varchar(4);
    fname varchar(10);
    lname varchar(10);
    exp int;
    dept varchar(20);
    min_exp int;
    CURSOR C IS (select e.emp_id,e.first_name,e.last_name,edu.experience,d.dept_name from
        (employee e join education edu on e.emp_id=edu.emp_id)join department d on d.emp_id=e.emp_id
        where edu.experience>&min_exp);
    
BEGIN
    dbms_output.put_line('Eid'||'   '||'First name'||'   '||'Last name'||'   '||'Experience'||'   '||'Dept');
    OPEN C;
    LOOP
    FETCH C INTO eid,fname,lname,exp,dept;
    exit when c%notfound;
        dbms_output.put_line(eid||'   '||fname||'        '||lname||'       '||exp||'     '||dept);
    END loop;
    CLOSE c;
END;


--QUERY 20*
--IF the employee exceeds the limited amt of leave their sal will get deduced
SET SERVEROUTPUT ON;
DECLARE
    new_sal float;
    leaves_exceed int;
    Eid varchar(4);
    fName varchar(10);
    lName varchar(10);
    pay float;
    leaves_took int;
    CURSOR X is (SELECT e.emp_id,e.first_name , e.last_name, s.income,l.no_of_days from EMPLOYEE e , LEAVE l , SALARY s where e.emp_id = s.emp_id AND e.emp_id = l.emp_id);

BEGIN
    dbms_output.put_line('EMPID'||'  '||'FIRST_NAME'||'   '||'LAST_NAME'||'    '||'OLD_SALARY'||'   '||'NEW_SALARY'||'    '||'NO OF LEAVES EXCEEDED');
    OPEN X;
    LOOP
    FETCH X INTO Eid, fName, lName, pay, leaves_took;
    EXIT WHEN X%notfound;
    if(leaves_took > 12)THEN
        leaves_exceed := leaves_took - 12;
        new_sal := pay - (pay/30)*leaves_exceed;
        dbms_output.put_line(Eid||'    '||fName||'       '||lName||'      '||pay||'     '||new_sal||'      '||leaves_exceed);
    /*ELSE
        dbms_output.put_line(Eid||' DID NOT EXCEEDED THE MINIMUM NO OF LEAVES');*/
    END IF;
    END LOOP;
    CLOSE X;
END;

--query 21
--avg working hours of department
SET SERVEROUTPUT ON;
DECLARE
    did varchar(4);
    avg_whrs float;
    cursor c is (select d.dept_id,avg(a.worked_hours) from department d join attendance a on d.emp_id=a.emp_id
    group by d.dept_id);
    
BEGIN
    dbms_output.put_line('Did'||'   '||'Avg working hours');
    OPEN C;
    LOOP
    FETCH C INTO did,avg_whrs;
    exit when c%notfound;
        dbms_output.put_line(did||'   '||avg_whrs);
    END loop;
    CLOSE c;
END;

--QUERY 22
--INPUT MIN WORKING HOURS
--IF EMPLOYEE WORKS MORE ... PAY 100 PER EXTRA HOUR
--PRINT SALARY BY REMOVING TAX AND INCLUDING EXTRA HOUR MONEY
SET SERVEROUTPUT ON;
DECLARE
    eid varchar(4);
    sal float;
    s_tax float;
    working_hrs int;
    final_salary float;
    min_hrs int;
    CURSOR C IS (select s.emp_id,s.income,s.tax,a.worked_hours from 
        (salary s join attendance a on s.emp_id=a.emp_id));
BEGIN
    min_hrs := &min_hrs;
    OPEN C;
    LOOP
    FETCH C INTO eid,sal,s_tax,working_hrs;
    exit when c%notfound;
        final_salary := (sal-(sal*s_tax)/100)+((working_hrs-min_hrs)*100);
        dbms_output.put_line(eid||'   '||final_salary||'   '||working_hrs);
    END loop;
    CLOSE c;
END;
/