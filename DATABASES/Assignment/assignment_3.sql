DROP DATABASE IF EXISTS SAMPLE;

CREATE DATABASE SAMPLE;

USE SAMPLE;

CREATE TABLE DEPARTMENT  (
		  DEPTNO CHAR(3) NOT NULL , 
		  DEPTNAME VARCHAR(36) NOT NULL , 
		  MGRNO CHAR(6) , 
		  ADMRDEPT CHAR(3) NOT NULL , 
		  LOCATION CHAR(16) );
          
DESCRIBE DEPARTMENT;



ALTER TABLE DEPARTMENT 
	ADD CONSTRAINT PK_DEPARTMENT PRIMARY KEY
		(DEPTNO);


CREATE INDEX XDEPT2 ON DEPARTMENT 
		(MGRNO ASC);

CREATE INDEX XDEPT3 ON DEPARTMENT 
		(ADMRDEPT ASC);
 
CREATE TABLE EMPLOYEE  (
		  EMPNO CHAR(6) NOT NULL , 
		  FIRSTNME VARCHAR(12) NOT NULL , 
		  MIDINIT CHAR(1) , 
		  LASTNAME VARCHAR(15) NOT NULL , 
		  WORKDEPT CHAR(3) , 
		  PHONENO CHAR(4) , 
		  HIREDATE DATE , 
		  JOB CHAR(8) , 
		  EDLEVEL SMALLINT NOT NULL , 
		  GENDER CHAR(1) , 
		  BIRTHDATE DATE , 
		  SALARY DECIMAL(9,2) , 
		  BONUS DECIMAL(9,2) , 
		  COMM DECIMAL(9,2) ); 


ALTER TABLE EMPLOYEE 
	ADD CONSTRAINT PK_EMPLOYEE PRIMARY KEY
		(EMPNO);

CREATE INDEX XEMP2 ON EMPLOYEE 
		(WORKDEPT ASC);
        
DESCRIBE EMPLOYEE;

CREATE TABLE EMP_PHOTO  (
		  EMPNO CHAR(6) NOT NULL , 
		  PHOTO_FORMAT VARCHAR(10) NOT NULL , 
		  PICTURE BLOB(102400) ); 


ALTER TABLE EMP_PHOTO 
	ADD CONSTRAINT PK_EMP_PHOTO PRIMARY KEY
		(EMPNO,
		 PHOTO_FORMAT);


CREATE TABLE PROJECT  (
		  PROJNO CHAR(6) NOT NULL , 
		  PROJNAME VARCHAR(24) NOT NULL DEFAULT '' , 
		  DEPTNO CHAR(3) NOT NULL , 
		  RESPEMP CHAR(6) NOT NULL , 
		  PRSTAFF DECIMAL(5,2) , 
		  PRSTDATE DATE , 
		  PRENDATE DATE , 
		  MAJPROJ CHAR(6) ); 


ALTER TABLE PROJECT 
	ADD CONSTRAINT PK_PROJECT PRIMARY KEY
		(PROJNO);



CREATE INDEX XPROJ2 ON PROJECT 
		(RESPEMP ASC);
		


CREATE TABLE PROJACT  (
		  PROJNO CHAR(6) NOT NULL , 
		  ACTNO SMALLINT NOT NULL , 
		  ACSTAFF DECIMAL(5,2) , 
		  ACSTDATE DATE NOT NULL , 
		  ACENDATE DATE ); 


ALTER TABLE PROJACT 
	ADD CONSTRAINT PK_PROJACT PRIMARY KEY
		(PROJNO,
		 ACTNO,
		 ACSTDATE);


CREATE TABLE EMPPROJACT  (
		  EMPNO CHAR(6) NOT NULL , 
		  PROJNO CHAR(6) NOT NULL , 
		  ACTNO SMALLINT NOT NULL , 
		  EMPTIME DECIMAL(5,2) , 
		  EMSTDATE DATE , 
		  EMENDATE DATE ); 

CREATE TABLE ACT  (
		  ACTNO SMALLINT NOT NULL , 
		  ACTKWD CHAR(6) NOT NULL , 
		  ACTDESC VARCHAR(20) NOT NULL ) ; 


ALTER TABLE ACT 
	ADD CONSTRAINT PK_ACT PRIMARY KEY
		(ACTNO);

CREATE UNIQUE INDEX XACT2 ON ACT 
		(ACTNO ASC,
		 ACTKWD ASC);


CREATE TABLE ORG  (
		  DEPTNUMB SMALLINT NOT NULL , 
		  DEPTNAME VARCHAR(14) , 
		  MANAGER SMALLINT , 
		  DIVISION VARCHAR(10) , 
		  LOCATION VARCHAR(13) ); 

CREATE TABLE STAFF  (
		  ID SMALLINT NOT NULL , 
		  NAME VARCHAR(9) , 
		  DEPT SMALLINT , 
		  JOB CHAR(5) , 
		  YEARS SMALLINT , 
		  SALARY DECIMAL(7,2) , 
		  COMM DECIMAL(7,2) ); 



CREATE TABLE SALES  (
		  SALES_DATE DATE , 
		  SALES_PERSON VARCHAR(15) , 
		  REGION VARCHAR(15) , 
		  SALES INTEGER )  ; 


CREATE TABLE STAFFG  (
		  ID SMALLINT NOT NULL , 
		  NAME VARCHAR(9) , 
		  DEPT SMALLINT , 
		  JOB VARCHAR(5) , 
		  YEARS SMALLINT , 
		  SALARY DECIMAL(9,0) , 
		  COMM DECIMAL(9,0) ); 


CREATE TABLE EMPMDC  (
		  EMPNO INTEGER , 
		  DEPT INTEGER , 
		  DIVR INTEGER ); 


CREATE TABLE PRODUCT  (
		  PID VARCHAR(10) NOT NULL , 
		  NAME VARCHAR(128) , 
		  PRICE DECIMAL(30,2) , 
		  PROMOPRICE DECIMAL(30,2) , 
		  PROMOSTART DATE , 
		  PROMOEND DATE , 
		  DESCRIPTION VARCHAR(100) ) ; 


ALTER TABLE PRODUCT 
	ADD CONSTRAINT PK_PRODUCT PRIMARY KEY
		(PID);



CREATE TABLE INVENTORY  (
		  PID VARCHAR(10) NOT NULL , 
		  QUANTITY INTEGER , 
		  LOCATION VARCHAR(128) ) ; 


ALTER TABLE INVENTORY 
	ADD CONSTRAINT PK_INVENTORY PRIMARY KEY
		(PID);


CREATE TABLE PRODUCTSUPPLIER  (
		  PID VARCHAR(10) NOT NULL , 
		  SID VARCHAR(10) NOT NULL ) ; 

ALTER TABLE PRODUCTSUPPLIER 
	ADD CONSTRAINT PK_PRODUCTSUPPLIER PRIMARY KEY
		(PID,
		 SID);

       
INSERT INTO ACT VALUES (10, 'MANAGE','MANAGE/ADVISE');
INSERT INTO ACT VALUES (20, 'ECOST ','ESTIMATE COST');
INSERT INTO ACT VALUES (30, 'DEFINE','DEFINE SPECS');
INSERT INTO ACT VALUES (40, 'LEADPR','LEAD PROGRAM/DESIGN');
INSERT INTO ACT VALUES (50, 'SPECS ','WRITE SPECS');
INSERT INTO ACT VALUES (60, 'LOGIC ','DESCRIBE LOGIC');
INSERT INTO ACT VALUES (70, 'CODE  ','CODE PROGRAMS');
INSERT INTO ACT VALUES (80, 'TEST  ','TEST PROGRAMS');
INSERT INTO ACT VALUES (90, 'ADMQS ','ADM QUERY SYSTEM');
INSERT INTO ACT VALUES (100, 'TEACH ','TEACH CLASSES');
INSERT INTO ACT VALUES (110, 'COURSE','DEVELOP COURSES');
INSERT INTO ACT VALUES (120, 'STAFF ','PERS AND STAFFING');
INSERT INTO ACT VALUES (130, 'OPERAT','OPER COMPUTER SYS');
INSERT INTO ACT VALUES (140, 'MAINT ','MAINT SOFTWARE SYS');
INSERT INTO ACT VALUES (150, 'ADMSYS','ADM OPERATING SYS');
INSERT INTO ACT VALUES (160, 'ADMDB ','ADM DATA BASES');
INSERT INTO ACT VALUES (170, 'ADMDC ','ADM DATA COMM');
INSERT INTO ACT VALUES (180, 'DOC   ','DOCUMENT');


INSERT INTO DEPARTMENT VALUES ('A00', 'SPIFFY COMPUTER SERVICE DIV.','000010','A00','');
INSERT INTO DEPARTMENT VALUES ('B01', 'PLANNING','000020','A00','');
INSERT INTO DEPARTMENT VALUES ('C01', 'INFORMATION CENTER','000030','A00','');
INSERT INTO DEPARTMENT VALUES ('D01', 'DEVELOPMENT CENTER','','A00','');
INSERT INTO DEPARTMENT VALUES ('D11', 'MANUFACTURING SYSTEMS','000060','D01','');
INSERT INTO DEPARTMENT VALUES ('D21', 'ADMINISTRATION SYSTEMS','000070','D01','');
INSERT INTO DEPARTMENT VALUES ('E01', 'SUPPORT SERVICES','000050','A00','');
INSERT INTO DEPARTMENT VALUES ('E11', 'OPERATIONS','000090','E01','');
INSERT INTO DEPARTMENT VALUES ('E21', 'SOFTWARE SUPPORT','000100','E01','');
INSERT INTO DEPARTMENT VALUES ('F22', 'BRANCH OFFICE F2','','E01','');
INSERT INTO DEPARTMENT VALUES ('G22', 'BRANCH OFFICE G2','','E01','');
INSERT INTO DEPARTMENT VALUES ('H22', 'BRANCH OFFICE H2','','E01','');
INSERT INTO DEPARTMENT VALUES ('I22', 'BRANCH OFFICE I2','','E01','');
INSERT INTO DEPARTMENT VALUES ('J22', 'BRANCH OFFICE J2','','E01','');

INSERT INTO EMPLOYEE VALUES ('000010', 'CHRISTINE','I','HAAS','A00','3978','1995-01-01','PRES    ',18,'F','1963-08-24',152750.00,1000.00,4220.00);
INSERT INTO EMPLOYEE VALUES ('000020', 'MICHAEL','L','THOMPSON','B01','3476','2003-10-10','MANAGER ',18,'M','1978-02-02',94250.00,800.00,3300.00);
INSERT INTO EMPLOYEE VALUES ('000030', 'SALLY','A','KWAN','C01','4738','2005-04-05','MANAGER ',20,'F','1971-05-11',98250.00,800.00,3060.00);
INSERT INTO EMPLOYEE VALUES ('000050', 'JOHN','B','GEYER','E01','6789','1979-08-17','MANAGER ',16,'M','1955-09-15',80175.00,800.00,3214.00);
INSERT INTO EMPLOYEE VALUES ('000060', 'IRVING','F','STERN','D11','6423','2003-09-14','MANAGER ',16,'M','1975-07-07',72250.00,500.00,2580.00);
INSERT INTO EMPLOYEE VALUES ('000070', 'EVA','D','PULASKI','D21','7831','2005-09-30','MANAGER ',16,'F','2003-05-26',96170.00,700.00,2893.00);
INSERT INTO EMPLOYEE VALUES ('000090', 'EILEEN','W','HENDERSON','E11','5498','2000-08-15','MANAGER ',16,'F','1971-05-15',89750.00,600.00,2380.00);
INSERT INTO EMPLOYEE VALUES ('000100', 'THEODORE','Q','SPENSER','E21','0972','2000-06-19','MANAGER ',14,'M','1980-12-18',86150.00,500.00,2092.00);
INSERT INTO EMPLOYEE VALUES ('000110', 'VINCENZO','G','LUCCHESSI','A00','3490','1988-05-16','SALESREP',19,'M','1959-11-05',66500.00,900.00,3720.00);
INSERT INTO EMPLOYEE VALUES ('000120', 'SEAN',' ','O CONNELL','A00','2167','1993-12-05','CLERK   ',14,'M','1972-10-18',49250.00,600.00,2340.00);
INSERT INTO EMPLOYEE VALUES ('000130', 'DELORES','M','QUINTANA','C01','4578','2001-07-28','ANALYST ',16,'F','1955-09-15',73800.00,500.00,1904.00);
INSERT INTO EMPLOYEE VALUES ('000140', 'HEATHER','A','NICHOLLS','C01','1793','2006-12-15','ANALYST ',18,'F','1976-01-19',68420.00,600.00,2274.00);
INSERT INTO EMPLOYEE VALUES ('000150', 'BRUCE',' ','ADAMSON','D11','4510','2002-02-12','DESIGNER',16,'M','1977-05-17',55280.00,500.00,2022.00);
INSERT INTO EMPLOYEE VALUES ('000160', 'ELIZABETH','R','PIANKA','D11','3782','2006-10-11','DESIGNER',17,'F','1980-04-12',62250.00,400.00,1780.00);
INSERT INTO EMPLOYEE VALUES ('000170', 'MASATOSHI','J','YOSHIMURA','D11','2890','1999-09-15','DESIGNER',16,'M','1981-01-05',44680.00,500.00,1974.00);
INSERT INTO EMPLOYEE VALUES ('000180', 'MARILYN','S','SCOUTTEN','D11','1682','2003-07-07','DESIGNER',17,'F','1979-02-21',51340.00,500.00,1707.00);
INSERT INTO EMPLOYEE VALUES ('000190', 'JAMES','H','WALKER','D11','2986','2004-07-26','DESIGNER',16,'M','1982-06-25',50450.00,400.00,1636.00);
INSERT INTO EMPLOYEE VALUES ('000200', 'DAVID',' ','BROWN','D11','4501','2002-03-03','DESIGNER',16,'M','1971-05-29',57740.00,600.00,2217.00);
INSERT INTO EMPLOYEE VALUES ('000210', 'WILLIAM','T','JONES','D11','0942','1998-04-11','DESIGNER',17,'M','2003-02-23',68270.00,400.00,1462.00);
INSERT INTO EMPLOYEE VALUES ('000220', 'JENNIFER','K','LUTZ','D11','0672','1998-08-29','DESIGNER',18,'F','1978-03-19',49840.00,600.00,2387.00);
INSERT INTO EMPLOYEE VALUES ('000230', 'JAMES','J','JEFFERSON','D21','2094','1996-11-21','CLERK   ',14,'M','1980-05-30',42180.00,400.00,1774.00);
INSERT INTO EMPLOYEE VALUES ('000240', 'SALVATORE','M','MARINO','D21','3780','2004-12-05','CLERK   ',17,'M','2002-03-31',48760.00,600.00,2301.00);
INSERT INTO EMPLOYEE VALUES ('000250', 'DANIEL','S','SMITH','D21','0961','1999-10-30','CLERK   ',15,'M','1969-11-12',49180.00,400.00,1534.00);
INSERT INTO EMPLOYEE VALUES ('000260', 'SYBIL','P','JOHNSON','D21','8953','2005-09-11','CLERK   ',16,'F','1976-10-05',47250.00,300.00,1380.00);
INSERT INTO EMPLOYEE VALUES ('000270', 'MARIA','L','PEREZ','D21','9001','2006-09-30','CLERK   ',15,'F','2003-05-26',37380.00,500.00,2190.00);
INSERT INTO EMPLOYEE VALUES ('000280', 'ETHEL','R','SCHNEIDER','E11','8997','1997-03-24','OPERATOR',17,'F','1976-03-28',36250.00,500.00,2100.00);
INSERT INTO EMPLOYEE VALUES ('000290', 'JOHN','R','PARKER','E11','4502','2006-05-30','OPERATOR',12,'M','1985-07-09',35340.00,300.00,1227.00);
INSERT INTO EMPLOYEE VALUES ('000300', 'PHILIP','X','SMITH','E11','2095','2002-06-19','OPERATOR',14,'M','1976-10-27',37750.00,400.00,1420.00);
INSERT INTO EMPLOYEE VALUES ('000310', 'MAUDE','F','SETRIGHT','E11','3332','1994-09-12','OPERATOR',12,'F','1961-04-21',35900.00,300.00,1272.00);
INSERT INTO EMPLOYEE VALUES ('000320', 'RAMLAL','V','MEHTA','E21','9990','1995-07-07','FIELDREP',16,'M','1962-08-11',39950.00,400.00,1596.00);
INSERT INTO EMPLOYEE VALUES ('000330', 'WING',' ','LEE','E21','2103','2006-02-23','FIELDREP',14,'M','1971-07-18',45370.00,500.00,2030.00);
INSERT INTO EMPLOYEE VALUES ('000340', 'JASON','R','GOUNOT','E21','5698','1977-05-05','FIELDREP',16,'M','1956-05-17',43840.00,500.00,1907.00);
INSERT INTO EMPLOYEE VALUES ('200010', 'DIAN','J','HEMMINGER','A00','3978','1995-01-01','SALESREP',18,'F','1973-08-14',46500.00,1000.00,4220.00);
INSERT INTO EMPLOYEE VALUES ('200120', 'GREG',' ','ORLANDO','A00','2167','2002-05-05','CLERK   ',14,'M','1972-10-18',39250.00,600.00,2340.00);
INSERT INTO EMPLOYEE VALUES ('200140', 'KIM','N','NATZ','C01','1793','2006-12-15','ANALYST ',18,'F','1976-01-19',68420.00,600.00,2274.00);
INSERT INTO EMPLOYEE VALUES ('200170', 'KIYOSHI',' ','YAMAMOTO','D11','2890','2005-09-15','DESIGNER',16,'M','1981-01-05',64680.00,500.00,1974.00);
INSERT INTO EMPLOYEE VALUES ('200220', 'REBA','K','JOHN','D11','0672','2005-08-29','DESIGNER',18,'F','1978-03-19',69840.00,600.00,2387.00);
INSERT INTO EMPLOYEE VALUES ('200240', 'ROBERT','M','MONTEVERDE','D21','3780','2004-12-05','CLERK   ',17,'M','1984-03-31',37760.00,600.00,2301.00);
INSERT INTO EMPLOYEE VALUES ('200280', 'EILEEN','R','SCHWARTZ','E11','8997','1997-03-24','OPERATOR',17,'F','1966-03-28',46250.00,500.00,2100.00);
INSERT INTO EMPLOYEE VALUES ('200310', 'MICHELLE','F','SPRINGER','E11','3332','1994-09-12','OPERATOR',12,'F','1961-04-21',35900.00,300.00,1272.00);
INSERT INTO EMPLOYEE VALUES ('200330', 'HELENA',' ','WONG','E21','2103','2006-02-23','FIELDREP',14,'F','1971-07-18',35370.00,500.00,2030.00);
INSERT INTO EMPLOYEE VALUES ('200340', 'ROY','R','ALONZO','E21','5698','1997-07-05','FIELDREP',16,'M','1956-05-17',31840.00,500.00,1907.00);


INSERT INTO EMPPROJACT VALUES ('000010', 'AD3100',10,.50,'2002-01-01','2002-07-01');
INSERT INTO EMPPROJACT VALUES ('000070', 'AD3110',10,1.00,'2002-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000230', 'AD3111',60,1.00,'2002-01-01','2002-03-15');
INSERT INTO EMPPROJACT VALUES ('000230', 'AD3111',60,.50,'2002-03-15','2002-04-15');
INSERT INTO EMPPROJACT VALUES ('000230', 'AD3111',70,.50,'2002-03-15','2002-10-15');
INSERT INTO EMPPROJACT VALUES ('000230', 'AD3111',80,.50,'2002-04-15','2002-10-15');
INSERT INTO EMPPROJACT VALUES ('000230', 'AD3111',180,.50,'2002-10-15','2003-01-01');
INSERT INTO EMPPROJACT VALUES ('000240', 'AD3111',70,1.00,'2002-02-15','2002-09-15');
INSERT INTO EMPPROJACT VALUES ('000240', 'AD3111',80,1.00,'2002-09-15','2003-01-01');
INSERT INTO EMPPROJACT VALUES ('000250', 'AD3112',60,1.00,'2002-01-01','2002-02-01');
INSERT INTO EMPPROJACT VALUES ('000250', 'AD3112',60,.50,'2002-02-01','2002-03-15');
INSERT INTO EMPPROJACT VALUES ('000250', 'AD3112',60,1.00,'2003-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000250', 'AD3112',70,.50,'2002-02-01','2002-03-15');
INSERT INTO EMPPROJACT VALUES ('000250', 'AD3112',70,1.00,'2002-03-15','2002-08-15');
INSERT INTO EMPPROJACT VALUES ('000250', 'AD3112',70,.25,'2002-08-15','2002-10-15');
INSERT INTO EMPPROJACT VALUES ('000250', 'AD3112',80,.25,'2002-08-15','2002-10-15');
INSERT INTO EMPPROJACT VALUES ('000250', 'AD3112',80,.50,'2002-10-15','2002-12-01');
INSERT INTO EMPPROJACT VALUES ('000250', 'AD3112',180,.50,'2002-08-15','2003-01-01');
INSERT INTO EMPPROJACT VALUES ('000260', 'AD3113',70,.50,'2002-06-15','2002-07-01');
INSERT INTO EMPPROJACT VALUES ('000260', 'AD3113',70,1.00,'2002-07-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000260', 'AD3113',80,1.00,'2002-01-01','2002-03-01');
INSERT INTO EMPPROJACT VALUES ('000260', 'AD3113',80,.50,'2002-03-01','2002-04-15');
INSERT INTO EMPPROJACT VALUES ('000260', 'AD3113',180,.50,'2002-03-01','2002-04-15');
INSERT INTO EMPPROJACT VALUES ('000260', 'AD3113',180,1.00,'2002-04-15','2002-06-01');
INSERT INTO EMPPROJACT VALUES ('000260', 'AD3113',180,1.00,'2002-06-01','2002-07-01');
INSERT INTO EMPPROJACT VALUES ('000270', 'AD3113',60,.50,'2002-03-01','2002-04-01');
INSERT INTO EMPPROJACT VALUES ('000270', 'AD3113',60,1.00,'2002-04-01','2002-09-01');
INSERT INTO EMPPROJACT VALUES ('000270', 'AD3113',60,.25,'2002-09-01','2002-10-15');
INSERT INTO EMPPROJACT VALUES ('000270', 'AD3113',70,.75,'2002-09-01','2002-10-15');
INSERT INTO EMPPROJACT VALUES ('000270', 'AD3113',70,1.00,'2002-10-15','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000270', 'AD3113',80,1.00,'2002-01-01','2002-03-01');
INSERT INTO EMPPROJACT VALUES ('000270', 'AD3113',80,.50,'2002-03-01','2002-04-01');
INSERT INTO EMPPROJACT VALUES ('000030', 'IF1000',10,.50,'2002-06-01','2003-01-01');
INSERT INTO EMPPROJACT VALUES ('000130', 'IF1000',90,1.00,'2002-10-01','2003-01-01');
INSERT INTO EMPPROJACT VALUES ('000130', 'IF1000',100,.50,'2002-10-01','2003-01-01');
INSERT INTO EMPPROJACT VALUES ('000140', 'IF1000',90,.50,'2002-10-01','2003-01-01');
INSERT INTO EMPPROJACT VALUES ('000030', 'IF2000',10,.50,'2002-01-01','2003-01-01');
INSERT INTO EMPPROJACT VALUES ('000140', 'IF2000',100,1.00,'2002-01-01','2002-03-01');
INSERT INTO EMPPROJACT VALUES ('000140', 'IF2000',100,.50,'2002-03-01','2002-07-01');
INSERT INTO EMPPROJACT VALUES ('000140', 'IF2000',110,.50,'2002-03-01','2002-07-01');
INSERT INTO EMPPROJACT VALUES ('000140', 'IF2000',110,.50,'2002-10-01','2003-01-01');
INSERT INTO EMPPROJACT VALUES ('000010', 'MA2100',10,.50,'2002-01-01','2002-11-01');
INSERT INTO EMPPROJACT VALUES ('000110', 'MA2100',20,1.00,'2002-01-01','2003-03-01');
INSERT INTO EMPPROJACT VALUES ('000010', 'MA2110',10,1.00,'2002-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000200', 'MA2111',50,1.00,'2002-01-01','2002-06-15');
INSERT INTO EMPPROJACT VALUES ('000200', 'MA2111',60,1.00,'2002-06-15','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000220', 'MA2111',40,1.00,'2002-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000150', 'MA2112',60,1.00,'2002-01-01','2002-07-15');
INSERT INTO EMPPROJACT VALUES ('000150', 'MA2112',180,1.00,'2002-07-15','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000170', 'MA2112',60,1.00,'2002-01-01','2003-06-01');
INSERT INTO EMPPROJACT VALUES ('000170', 'MA2112',70,1.00,'2002-06-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000190', 'MA2112',70,1.00,'2002-01-01','2002-10-01');
INSERT INTO EMPPROJACT VALUES ('000190', 'MA2112',80,1.00,'2002-10-01','2003-10-01');
INSERT INTO EMPPROJACT VALUES ('000160', 'MA2113',60,1.00,'2002-07-15','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000170', 'MA2113',80,1.00,'2002-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000180', 'MA2113',70,1.00,'2002-04-01','2002-06-15');
INSERT INTO EMPPROJACT VALUES ('000210', 'MA2113',80,.50,'2002-10-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000210', 'MA2113',180,.50,'2002-10-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000050', 'OP1000',10,.25,'2002-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000090', 'OP1010',10,1.00,'2002-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000280', 'OP1010',130,1.00,'2002-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000290', 'OP1010',130,1.00,'2002-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000300', 'OP1010',130,1.00,'2002-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000310', 'OP1010',130,1.00,'2002-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000050', 'OP2010',10,.75,'2002-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000100', 'OP2010',10,1.00,'2002-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000320', 'OP2011',140,.75,'2002-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000320', 'OP2011',150,.25,'2002-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000330', 'OP2012',140,.25,'2002-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000330', 'OP2012',160,.75,'2002-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000340', 'OP2013',140,.50,'2002-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000340', 'OP2013',170,.50,'2002-01-01','2003-02-01');
INSERT INTO EMPPROJACT VALUES ('000020', 'PL2100',30,1.00,'2002-01-01','2002-09-15');

INSERT INTO INVENTORY VALUES ('100-101-01', 25,'Store');
INSERT INTO INVENTORY VALUES ('100-103-01', 55,'Store');
INSERT INTO INVENTORY VALUES ('100-201-01', 99,'Warehouse');

INSERT INTO ORG VALUES (10, 'Head Office',160,'Corporate','New York');
INSERT INTO ORG VALUES (15, 'New England',50,'Eastern','Boston');
INSERT INTO ORG VALUES (20, 'Mid Atlantic',10,'Eastern','Los Angeles');
INSERT INTO ORG VALUES (38, 'South Atlantic',30,'Eastern','Atlanta');
INSERT INTO ORG VALUES (42, 'Great Lakes',100,'Midwest','Chicago');
INSERT INTO ORG VALUES (51, 'Plains',140,'Midwest','Dallas');
INSERT INTO ORG VALUES (66, 'Pacific',270,'Western','Midhurst');
INSERT INTO ORG VALUES (84, 'Mountain',290,'Western','Denver');


INSERT INTO PRODUCT VALUES ('100-100-01', 'Snow Shovel, Basic 22 inch',9.99,7.25,'2004-11-19','2004-12-19','');
INSERT INTO PRODUCT VALUES ('100-101-01', 'Snow Shovel, Deluxe 24 inch',19.99,15.99,'2005-12-18','2006-02-28','');
INSERT INTO PRODUCT VALUES ('100-103-01', 'Snow Shovel, Super Deluxe 26 inch',49.99,39.99,'2005-12-22','2006-02-22','');

INSERT INTO PROJACT VALUES ('AD3100', 10,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3110', 10,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3111', 60,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3111', 60,.00, '2002-03-15', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3111', 70,.00, '2002-03-15', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3111', 80,.00, '2002-04-15', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3111', 180,.00, '2002-10-15', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3111', 70,.00, '2002-02-15', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3111', 80,.00, '2002-09-15', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3112', 60,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3112', 60,.00, '2002-02-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3112', 60,.00, '2003-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3112', 70,.00, '2002-02-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3112', 70,.00, '2002-03-15', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3112', 70,.00, '2002-08-15', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3112', 80,.00, '2002-08-15', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3112', 80,.00, '2002-10-15', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3112', 180,.00, '2002-08-15', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3113', 70,.00, '2002-06-15', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3113', 70,.00, '2002-07-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3113', 80,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3113', 80,.00, '2002-03-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3113', 180,.00, '2002-03-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3113', 180,.00, '2002-04-15', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3113', 180,.00, '2002-06-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3113', 60,.00, '2002-03-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3113', 60,.00, '2002-04-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3113', 60,.00, '2002-09-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3113', 70,.00, '2002-09-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('AD3113', 70,.00, '2002-10-15', '2900-01-01');
INSERT INTO PROJACT VALUES ('IF1000', 10,.00, '2002-06-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('IF1000', 90,.00, '2002-10-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('IF1000', 100,.00, '2002-10-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('IF2000', 10,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('IF2000', 100,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('IF2000', 100,.00, '2002-03-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('IF2000', 110,.00, '2002-03-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('IF2000', 110,.00, '2002-10-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('MA2100', 10,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('MA2100', 20,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('MA2110', 10,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('MA2111', 50,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('MA2111', 60,.00, '2002-06-15', '2900-01-01');
INSERT INTO PROJACT VALUES ('MA2111', 40,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('MA2112', 60,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('MA2112', 180,.00, '2002-07-15', '2900-01-01');
INSERT INTO PROJACT VALUES ('MA2112', 70,.00, '2002-06-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('MA2112', 70,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('MA2112', 80,.00, '2002-10-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('MA2113', 60,.00, '2002-07-15', '2900-01-01');
INSERT INTO PROJACT VALUES ('MA2113', 80,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('MA2113', 70,.00, '2002-04-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('MA2113', 80,.00, '2002-10-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('MA2113', 180,.00, '2002-10-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('OP1000', 10,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('OP1010', 10,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('OP1010', 130,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('OP2010', 10,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('OP2011', 140,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('OP2011', 150,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('OP2012', 140,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('OP2012', 160,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('OP2013', 140,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('OP2013', 170,.00, '2002-01-01', '2900-01-01');
INSERT INTO PROJACT VALUES ('PL2100', 30,.00, '2002-01-01', '2900-01-01');


INSERT INTO PROJECT VALUES ('AD3100', 'ADMIN SERVICES','D01','000010',6.50,'2002-01-01','2003-02-01','');
INSERT INTO PROJECT VALUES ('AD3110', 'GENERAL ADMIN SYSTEMS','D21','000070',6.00,'2002-01-01','2003-02-01','AD3100');
INSERT INTO PROJECT VALUES ('AD3111', 'PAYROLL PROGRAMMING','D21','000230',2.00,'2002-01-01','2003-02-01','AD3110');
INSERT INTO PROJECT VALUES ('AD3112', 'PERSONNEL PROGRAMMING','D21','000250',1.00,'2002-01-01','2003-02-01','AD3110');
INSERT INTO PROJECT VALUES ('AD3113', 'ACCOUNT PROGRAMMING','D21','000270',2.00,'2002-01-01','2003-02-01','AD3110');
INSERT INTO PROJECT VALUES ('IF1000', 'QUERY SERVICES','C01','000030',2.00,'2002-01-01','2003-02-01','');
INSERT INTO PROJECT VALUES ('IF2000', 'USER EDUCATION','C01','000030',1.00,'2002-01-01','2003-02-01','');
INSERT INTO PROJECT VALUES ('MA2100', 'WELD LINE AUTOMATION','D01','000010',12.00,'2002-01-01','2003-02-01','');
INSERT INTO PROJECT VALUES ('MA2110', 'W L PROGRAMMING','D11','000060',9.00,'2002-01-01','2003-02-01','MA2100');
INSERT INTO PROJECT VALUES ('MA2111', 'W L PROGRAM DESIGN','D11','000220',2.00,'2002-01-01','1982-12-01','MA2110');
INSERT INTO PROJECT VALUES ('MA2112', 'W L ROBOT DESIGN','D11','000150',3.00,'2002-01-01','1982-12-01','MA2110');
INSERT INTO PROJECT VALUES ('MA2113', 'W L PROD CONT PROGS','D11','000160',3.00,'2002-02-15','1982-12-01','MA2110');
INSERT INTO PROJECT VALUES ('OP1000', 'OPERATION SUPPORT','E01','000050',6.00,'2002-01-01','2003-02-01','');
INSERT INTO PROJECT VALUES ('OP1010', 'OPERATION','E11','000090',5.00,'2002-01-01','2003-02-01','OP1000');
INSERT INTO PROJECT VALUES ('OP2000', 'GEN SYSTEMS SERVICES','E01','000050',5.00,'2002-01-01','2003-02-01','');
INSERT INTO PROJECT VALUES ('OP2010', 'SYSTEMS SUPPORT','E21','000100',4.00,'2002-01-01','2003-02-01','OP2000');
INSERT INTO PROJECT VALUES ('OP2011', 'SCP SYSTEMS SUPPORT','E21','000320',1.00,'2002-01-01','2003-02-01','OP2010');
INSERT INTO PROJECT VALUES ('OP2012', 'APPLICATIONS SUPPORT','E21','000330',1.00,'2002-01-01','2003-02-01','OP2010');
INSERT INTO PROJECT VALUES ('OP2013', 'DB/DC SUPPORT','E21','000340',1.00,'2002-01-01','2003-02-01','OP2010');
INSERT INTO PROJECT VALUES ('PL2100', 'WELD LINE PLANNING','B01','000020',1.00,'2002-01-01','2002-09-15','MA2100');

INSERT INTO SALES VALUES ('2005-12-31', 'LUCCHESSI','Ontario-South',1);
INSERT INTO SALES VALUES ('2005-12-31', 'LEE','Ontario-South',3);
INSERT INTO SALES VALUES ('2005-12-31', 'LEE','Quebec',1);
INSERT INTO SALES VALUES ('2005-12-31', 'LEE','Manitoba',2);
INSERT INTO SALES VALUES ('2005-12-31', 'GOUNOT','Quebec',1);
INSERT INTO SALES VALUES ('2006-03-29', 'LUCCHESSI','Ontario-South',3);
INSERT INTO SALES VALUES ('2006-03-29', 'LUCCHESSI','Quebec',1);
INSERT INTO SALES VALUES ('2006-03-29', 'LEE','Ontario-South',2);
INSERT INTO SALES VALUES ('1996-03-29', 'LEE','Ontario-North',2);
INSERT INTO SALES VALUES ('2006-03-29', 'LEE','Quebec',3);
INSERT INTO SALES VALUES ('2006-03-29', 'LEE','Manitoba',5);
INSERT INTO SALES VALUES ('2006-03-29', 'GOUNOT','Ontario-South',3);
INSERT INTO SALES VALUES ('2006-03-29', 'GOUNOT','Quebec',1);
INSERT INTO SALES VALUES ('2006-03-29', 'GOUNOT','Manitoba',7);
INSERT INTO SALES VALUES ('2006-03-30', 'LUCCHESSI','Ontario-South',1);
INSERT INTO SALES VALUES ('2006-03-30', 'LUCCHESSI','Quebec',2);
INSERT INTO SALES VALUES ('2006-03-30', 'LUCCHESSI','Manitoba',1);
INSERT INTO SALES VALUES ('2006-03-30', 'LEE','Ontario-South',7);
INSERT INTO SALES VALUES ('2006-03-30', 'LEE','Ontario-North',3);
INSERT INTO SALES VALUES ('2006-03-30', 'LEE','Quebec',7);
INSERT INTO SALES VALUES ('2006-03-30', 'LEE','Manitoba',4);
INSERT INTO SALES VALUES ('2006-03-30', 'GOUNOT','Ontario-South',2);
INSERT INTO SALES VALUES ('2006-03-30', 'GOUNOT','Quebec',18);
INSERT INTO SALES VALUES ('2006-03-31', 'GOUNOT','Manitoba',1);
INSERT INTO SALES VALUES ('2006-03-31', 'LUCCHESSI','Manitoba',1);
INSERT INTO SALES VALUES ('2006-03-31', 'LEE','Ontario-South',14);
INSERT INTO SALES VALUES ('2006-03-31', 'LEE','Ontario-North',3);
INSERT INTO SALES VALUES ('2006-03-31', 'LEE','Quebec',7);
INSERT INTO SALES VALUES ('2006-03-31', 'LEE','Manitoba',3);
INSERT INTO SALES VALUES ('2006-03-31', 'GOUNOT','Ontario-South',2);
INSERT INTO SALES VALUES ('2006-03-31', 'GOUNOT','Quebec',1);
INSERT INTO SALES VALUES ('2006-04-01', 'LUCCHESSI','Ontario-South',3);
INSERT INTO SALES VALUES ('2006-04-01', 'LUCCHESSI','Manitoba',1);
INSERT INTO SALES VALUES ('2006-04-01', 'LEE','Ontario-South',8);
INSERT INTO SALES VALUES ('2006-04-01', 'LEE','Quebec',8);
INSERT INTO SALES VALUES ('2006-04-01', 'LEE','Manitoba',9);
INSERT INTO SALES VALUES ('2006-04-01', 'GOUNOT','Ontario-South',3);
INSERT INTO SALES VALUES ('2006-04-01', 'GOUNOT','Ontario-North',1);
INSERT INTO SALES VALUES ('2006-04-01', 'GOUNOT','Quebec',3);
INSERT INTO SALES VALUES ('2006-04-01', 'GOUNOT','Manitoba',7);

INSERT INTO STAFF VALUES (10, 'Sanders',20,'Mgr  ',7,98357.50,0.00);
INSERT INTO STAFF VALUES (20, 'Pernal',20,'Sales',8,78171.25,612.45);
INSERT INTO STAFF VALUES (30, 'Marenghi',38,'Mgr  ',5,77506.75,0.00);
INSERT INTO STAFF VALUES (40, 'OBrien',38,'Sales',6,78006.00,846.55);
INSERT INTO STAFF VALUES (50, 'Hanes',15,'Mgr  ',10,80659.80,.00);
INSERT INTO STAFF VALUES (60, 'Quigley',38,'Sales',0,66808.30,650.25);
INSERT INTO STAFF VALUES (70, 'Rothman',15,'Sales',7,76502.83,1152.00);
INSERT INTO STAFF VALUES (80, 'James',20,'Clerk',0,43504.60,128.20);
INSERT INTO STAFF VALUES (90, 'Koonitz',42,'Sales',6,38001.75,1386.70);
INSERT INTO STAFF VALUES (100, 'Plotz',42,'Mgr  ',7,78352.80,0.00);
INSERT INTO STAFF VALUES (110, 'Ngan',15,'Clerk',5,42508.20,206.60);
INSERT INTO STAFF VALUES (120, 'Naughton',38,'Clerk',0,42954.75,180.00);
INSERT INTO STAFF VALUES (130, 'Yamaguchi',42,'Clerk',6,40505.90,75.60);
INSERT INTO STAFF VALUES (140, 'Fraye',51,'Mgr  ',6,91150.00,0.00);
INSERT INTO STAFF VALUES (150, 'Williams',51,'Sales',6,79456.50,637.65);
INSERT INTO STAFF VALUES (160, 'Molinare',10,'Mgr  ',7,82959.20,0.00);
INSERT INTO STAFF VALUES (170, 'Kermisch',15,'Clerk',4,42258.50,110.10);
INSERT INTO STAFF VALUES (180, 'Abrahams',38,'Clerk',3,37009.75,236.50);
INSERT INTO STAFF VALUES (190, 'Sneider',20,'Clerk',8,34252.75,126.50);
INSERT INTO STAFF VALUES (200, 'Scoutten',42,'Clerk',0,41508.60,84.20);
INSERT INTO STAFF VALUES (210, 'Lu',10,'Mgr  ',10,90010.00,0.00);
INSERT INTO STAFF VALUES (220, 'Smith',51,'Sales',7,87654.50,992.80);
INSERT INTO STAFF VALUES (230, 'Lundquist',51,'Clerk',3,83369.80,189.65);
INSERT INTO STAFF VALUES (240, 'Daniels',10,'Mgr  ',5,79260.25,.00);
INSERT INTO STAFF VALUES (250, 'Wheeler',51,'Clerk',6,74460.00,513.30);
INSERT INTO STAFF VALUES (260, 'Jones',10,'Mgr  ',12,81234.00,0.00);
INSERT INTO STAFF VALUES (270, 'Lea',66,'Mgr  ',9,88555.50,0.00);
INSERT INTO STAFF VALUES (280, 'Wilson',66,'Sales',9,78674.50,811.50);
INSERT INTO STAFF VALUES (290, 'Quill',84,'Mgr  ',10,89818.00,0.00);
INSERT INTO STAFF VALUES (300, 'Davis',84,'Sales',5,65454.50,806.10);
INSERT INTO STAFF VALUES (310, 'Graham',66,'Sales',13,71000.00,200.30);
INSERT INTO STAFF VALUES (320, 'Gonzales',66,'Sales',4,76858.20,844.00);
INSERT INTO STAFF VALUES (330, 'Burke',66,'Clerk',1,49988.00,55.50);
INSERT INTO STAFF VALUES (340, 'Edwards',84,'Sales',7,67844.00,1285.00);
INSERT INTO STAFF VALUES (350, 'Gafney',84,'Clerk',5,43030.50,188.00);

SET FOREIGN_KEY_CHECKS = 0;

ALTER TABLE DEPARTMENT 
	ADD CONSTRAINT RDE FOREIGN KEY
		(MGRNO)
	REFERENCES EMPLOYEE
		(EMPNO);

ALTER TABLE DEPARTMENT 
	ADD CONSTRAINT ROD FOREIGN KEY
		(ADMRDEPT)
	REFERENCES DEPARTMENT
		(DEPTNO);

ALTER TABLE EMPLOYEE 
	ADD CONSTRAINT RED FOREIGN KEY
		(WORKDEPT)
	REFERENCES DEPARTMENT
		(DEPTNO);


ALTER TABLE PROJECT 
	ADD CONSTRAINT FK_PROJECT_1 FOREIGN KEY
		(DEPTNO)
	REFERENCES DEPARTMENT
		(DEPTNO);

ALTER TABLE PROJECT 
	ADD CONSTRAINT FK_PROJECT_2 FOREIGN KEY
		(RESPEMP)
	REFERENCES EMPLOYEE
		(EMPNO);

ALTER TABLE PROJECT 
	ADD CONSTRAINT RPP FOREIGN KEY
		(MAJPROJ)
	REFERENCES PROJECT
		(PROJNO);

ALTER TABLE PROJACT 
	ADD CONSTRAINT RPAP FOREIGN KEY
		(PROJNO)
	REFERENCES PROJECT
		(PROJNO);

ALTER TABLE EMPPROJACT 
	ADD CONSTRAINT REPAPA FOREIGN KEY
		(PROJNO,
		 ACTNO,
		 EMSTDATE)
	REFERENCES PROJACT
		(PROJNO,
		 ACTNO,
		 ACSTDATE);

ALTER TABLE ACT 
	ADD CONSTRAINT RPAA FOREIGN KEY
		(ACTNO)
	REFERENCES ACT
		(ACTNO);