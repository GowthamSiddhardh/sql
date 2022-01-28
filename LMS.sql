Create table LMS_MEMBERS
(

MEMBER_ID Varchar(10) primary key,
MEMBER_NAME Varchar(30) NOT NULL,
CITY Varchar(20),
DATE_REGISTER Date NOT NULL,
DATE_EXPIRE Date ,
MEMBERSHIP_STATUS Varchar(15)NOT NULL
);
Create table LMS_SUPPLIERS_DETAILS
(
SUPPLIER_ID Varchar(3) primary key,
SUPPLIER_NAME Varchar(30) NOT NULL,
ADDRESS Varchar(50),
CONTACT int NOT NULL,
EMAIL Varchar(15) NOT NULL
);
Create table LMS_FINE_DETAILS
(
FINE_RANGE Varchar(3) primary key,
FINE_AMOUNT decimal(10,2) NOT NULL
);

Create table LMS_BOOK_DETAILS
(
BOOK_CODE Varchar(10) primary key,
BOOK_TITLE Varchar(50) NOT NULL,
CATEGORY Varchar(15) NOT NULL,
AUTHOR Varchar(30) NOT NULL,
PUBLICATION Varchar(30),
PUBLISH_DATE Date,
BOOK_EDITION int,
PRICE decimal(8,2) NOT NULL,
RACK_NUM Varchar(3),
DATE_ARRIVAL Date NOT NULL,
SUPPLIER_ID Varchar(3) NOT NULL,
FOREIGN KEY (SUPPLIER_ID) References
LMS_SUPPLIERS_DETAILS(SUPPLIER_ID)
);


Create table LMS_BOOK_ISSUE
(

BOOK_ISSUE_NO int primary key,
MEMBER_ID Varchar(10) NOT NULL,
BOOK_CODE Varchar(10) NOT NULL,
DATE_ISSUE Date NOT NULL,
DATE_RETURN Date NOT NULL,
DATE_RETURNED Date NULL,
FINE_RANGE Varchar(3),
FOREIGN KEY(MEMBER_ID) References
LMS_MEMBERS(MEMBER_ID),
FOREIGN KEY(BOOK_CODE) References
LMS_BOOK_DETAILS(BOOK_CODE),
FOREIGN KEY(FINE_RANGE) References
LMS_FINE_DETAILS(FINE_RANGE)
);


Insert into LMS_MEMBERS
Values('LM001', 'AMIT', 'CHENNAI', '12-02-2012', '11-02-
2013','Temporary');
Insert into LMS_MEMBERS
Values('LM002', 'ABDHUL', 'DELHI', '10-04-2010', '09-04-
2013','Temporary');
Insert into LMS_MEMBERS
Values('LM003', 'GAYAN', 'CHENNAI', '13-05-2012','12-05-2013',
'Permanent');
Insert into LMS_MEMBERS
Values('LM004', 'RADHA', 'CHENNAI', '22-04-2012', '21-04-2013',
'Temporary');
Insert into LMS_MEMBERS
Values('LM005', 'GURU', 'BANGALORE', '30-03-2012', '16-05-
2013','Temporary');
Insert into LMS_MEMBERS
Values('LM006', 'MOHAN', 'CHENNAI', '12-04-2012', '16-05-
2013','Temporary');
select * from lms_members;

Insert into LMS_SUPPLIERS_DETAILS
Values ('S01','SINGAPORE SHOPPEE', 'CHENNAI',
9894123555,'sing@gmail.com');
Insert into LMS_SUPPLIERS_DETAILS
Values ('S02','JK Stores', 'MUMBAI', 9940123450 ,'jks@yahoo.com');
Insert into LMS_SUPPLIERS_DETAILS
Values ('S03','ROSE BOOK STORE', 'TRIVANDRUM',
9444411222,'rose@gmail.com');
Insert into LMS_SUPPLIERS_DETAILS
Values ('S04','KAVARI STORE', 'DELHI', 8630001452,'kavi@redif.com');
Insert into LMS_SUPPLIERS_DETAILS
Values ('S05','EINSTEN BOOK GALLARY', 'US',
9542000001,'eingal@aol.com');
Insert into LMS_SUPPLIERS_DETAILS
Values ('S06','AKBAR STORE', 'MUMBAI',7855623100 ,'akbakst@aol.com');

select * from lms_suppliers_details;

Insert into LMS_FINE_DETAILS Values('R0', 0);
Insert into LMS_FINE_DETAILS Values('R1', 20);
insert into LMS_FINE_DETAILS Values('R2', 50);
Insert into LMS_FINE_DETAILS Values('R3', 75);
Insert into LMS_FINE_DETAILS Values('R4', 100);
Insert into LMS_FINE_DETAILS Values('R5', 150);
Insert into LMS_FINE_DETAILS Values('R6', 200);

select * from lms_fine_details;

Insert into LMS_BOOK_DETAILS
Values('BL000001', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel',
'Prentice Hall', '10-12-1999', 6, 600.00, 'A1', '10-05-2011', 'S01');
Insert into LMS_BOOK_DETAILS
Values('BL000002', 'Java: The Complete Reference ', 'JAVA', 'Herbert
Schildt', 'Tata Mcgraw Hill ', '10-10-2011', 5, 750.00, 'A1', '10-
05-2011', 'S03');
Insert into LMS_BOOK_DETAILS
Values('BL000003', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel',
'Prentice Hall', '10-05-1999', 6, 600.00, 'A1', '10-05-2012', 'S01');

Insert into LMS_BOOK_DETAILS
Values('BL000004', 'Java: The Complete Reference ', 'JAVA', 'Herbert
Schildt', 'Tata Mcgraw Hill ', '10-10-2011', 5, 750.00, 'A1', '11-
05-2012', 'S01');
Insert into LMS_BOOK_DETAILS
Values('BL000005', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel',
'Prentice Hall', '10-12-1999', 6, 600.00, 'A1', '11-05-2012', 'S01');
Insert into LMS_BOOK_DETAILS
Values('BL000006', 'Java: The Complete Reference ', 'JAVA', 'Herbert
Schildt', 'Tata Mcgraw Hill ', '10-10-2011', 5, 750.00, 'A1', '12-
05-2012', 'S03');
Insert into LMS_BOOK_DETAILS
Values('BL000007', 'Let Us C', 'C', 'Yashavant Kanetkar ', 'BPB
Publications', '11-12-2010', 9, 500.00 , 'A3', '03-11-2010', 'S03');
Insert into LMS_BOOK_DETAILS
Values('BL000008', 'Let Us C', 'C', 'Yashavant Kanetkar ','BPB
Publications', '12-05-2010', 9, 500.00 , 'A3', '09-08-2011', 'S04');

select * from lms_book_details;

Insert into LMS_BOOK_ISSUE
Values (001, 'LM001', 'BL000001', '01-05-2012', '16-05-2012', '16-
05-2012', 'R0');
Insert into LMS_BOOK_ISSUE
Values (002, 'LM002', 'BL000002', '01-05-2012', '06-05-2012','16-05-
2012', 'R2');
Insert into LMS_BOOK_ISSUE
Values (003, 'LM003', 'BL000007', '01-04-2012', '16-04-2012', '20-
04-2012','R1');
Insert into LMS_BOOK_ISSUE
Values (004, 'LM004', 'BL000005', '01-04-2012', '16-04-2012','20-04-
2012', 'R1');
Insert into LMS_BOOK_ISSUE
Values (005, 'LM005', 'BL000008', '30-03-2012', '15-04-2012','20-04-
2012' , 'R1');
Insert into LMS_BOOK_ISSUE
Values (006, 'LM005', 'BL000008', '2012-04-20', '2012-05-05','2012-05-
05' , 'R0');
Insert into LMS_BOOK_ISSUE
Values (007, 'LM003', 'BL000007', '22-04-2012', '07-05-2012','25-05-
2012' , 'R4');

select * from lms_book_issue;


