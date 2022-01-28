create table student(sno int, name varchar(32));
DESCRIBE student;
alter table student add address varchar(32);
insert into student(sno,name,address) values(1,'gowtham','6th street');
select * from student;
insert into student(sno,name,address) values(2,'siddharth','4th street');
truncate table student;
alter table student drop column sno;
insert into student values('vaikunth','3th street');
insert into student values('gowtham','7th street');
insert into student values('kaviya','8th street');
delete from student where name='gowtham';
update student set address='4th street' where name='kaviya';


create table product(id int,fulname varchar(32),description varchar(255));
desc product;
alter table product add city varchar(32);
insert into product values(01,'soap','good','theni');
insert into product values(02,'boost','better','madurai');
insert into product values(03,'coffee','normal','chennai');
insert into product values(04,'tea','medium','cbe');
select * from product;
alter table product modify id primary key;
alter table product modify city default 'trichy';
insert into product(ID,fulname,description,city)values(3,'wert','tyui');
alter table product rename column id to ssno;
truncate table product;
alter table product modify(ssno varchar(32),description varchar(32));
alter table product modify ssno int;
alter table product modify description varchar(225);
alter table product modify fulname;
insert into product(ssno,fulname,description) values(01,'soap','good');
insert into product(ssno,fulname,description,city) values(03,'coffee','normal','madurai');
update product set city='theni' where ssno=2;
insert into product(ssno,description)values(05,'very good');
alter table product drop column fulname;
alter table product add  fulname varchar(32);
update product set price=99 where ssno=5;
select * from product order by  fulname asc;
select fulname from product order by city asc;
alter table product add price int;
select min(price) from product;
select fulname from product;
select * from product where fulname like 'k%';
select * from product where fulname like '%m';
select * from product where fulname like '_a%';
select * from product where fulname like '%ow%';
create table staff as select ssno,fulname from product;
select * from staff;
select * from product;
desc product;









