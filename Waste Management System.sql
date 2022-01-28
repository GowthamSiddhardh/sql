------WMS_admin-----
create table WMS_admin(
admin_email varchar2(20) unique,
admin_pwd varchar2(20) not null);
select * from WMS_admin;



---------WMS_user-------
create table WMS_user(user_id number GENERATED ALWAYS AS IDENTITY START WITH  201  primary key,
user_email  varchar2(20)unique,
user_name varchar2(20) not null,
user_pwd varchar2(15) not null,
Address varchar2(50) not null, 
mobile_no number not null,
wallet number default 0);
alter table WMS_user add wallet number default 0;





  -----WMS_employee--------
create table WMS_employee(emp_id  number GENERATED ALWAYS AS IDENTITY START WITH  301  primary key,
emp_email varchar2(20) unique,
emp_name varchar2(20) not null,
emp_pwd varchar2(15) not null,
location varchar2(20) unique,
status varchar2(20) default 'active');
alter table WMS_employee add location varchar2(20);
alter table WMS_employee modify location varchar2(20) unique;
alter table WMS_employee add status varchar2(20) default 'active';

select emp_id from WMS_employee where location='Theni';







----WMS_calculation--------
create table  Category_details(
weight_kg number,
categories varchar2(20) unique,
amount number);

desc Category_details;

 
 
  -----WMS_request--------
create table WMS_request(request_id number GENERATED ALWAYS AS IDENTITY START WITH  401  primary key,
user_id number,
emp_id number,
category varchar2(20),
location varchar2(20),
requeststatus varchar2(20) default 'pending',
employeestatus varchar2(20) default 'pending',
foreign key (user_id) references WMS_user(user_id),
foreign key (emp_id) references WMS_employee(emp_id),
foreign key (category) references Category_details(categories));
alter table WMS_request modify request_date Date default sysdate;


select * from WMS_admin;

select user_id,user_email,user_name,user_pwd,Address,mobile_no,wallet from WMS_user;
select * from WMS_user;
select * from Category_details;
select * from WMS_request;
desc WMS_request;
insert into WMS_request(user_id,emp_id,category,location,requeststatus,employeestatus,request_date) values(322,406,'primary','erode','completed','done','26-01-22');
delete from WMS_request;
commit;
select * from WMS_employee;

select u.user_name,r.location,r.category,c.weight_kg,r.request_date,c.amount from WMS_user u 
				join WMS_request r on u.user_id=r.user_id  
				join Category_details c on r.category=c.categories 
				where u.user_email='naveen@gmail.com' order by r.request_id desc fetch first 1 row only;

select r.request_id,u.user_name,r.category,c.weight_kg,c.amount,e.emp_name,r.request_date,r.location from WMS_request r 
				join Category_details c on r.category=c.categories 
                join  WMS_user u on u.user_id=r.user_id 
                join  WMS_employee e on e.emp_id=r.emp_id
                where r.user_id=322 and r.employeestatus in ('pending' , 'inprogress');


 select * from WMS_request where category like 'c%' or location like 'c%' or employeestatus  like 'c%' or requeststatus like 'c%'; 

update WMS_user set wallet=wallet + 1 where user_id=381;

select r.request_id,r.user_id,r.category,r.location,r.emp_id,c.weight_kg,c.amount from WMS_request r 
join WMS_calculation c on r.category=c.categories ; 

select r.request_id,r.user_id,r.category,r.location,c.weight_kg,c.amount,r.emp_id from WMS_request r 
join Category_details c on r.category=c.categories where r.emp_id=361;

select r.request_id,r.user_id,r.category,c.weight_kg,c.amount,r.emp_id,r.request_date,r.location from WMS_request r 
join Category_details c on r.category=c.categories where user_id=301;
                
select sum(c.weight_kg) from Category_details c join WMS_request r on c.categories=r.category  
where r.location='chennai' and r.requeststatus='completed' and r.request_date between '17-01-22' and '19-01-22' group by r.location ;            

select r.request_id,r.user_id,r.category,r.location,c.weight_kg,c.amount,r.request_date,r.employeestatus from WMS_request r 
	    		join Category_details c on r.category=c.categories 
				where r.emp_id=406;             
select u.user_name,r.location,r.category,c.weight_kg,r.request_date,c.amount from WMS_user u join wms_request r on u.user_id=r.user_id join Category_details c on r.category=c.categories where u.user_id=322 order by r.request_id desc;  