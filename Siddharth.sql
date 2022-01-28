create table programmer(pname varchar2(30),dob date,gender varchar2(10),prof1 varchar2(20),salary varchar2(20));
alter table programmer modify salary number(8,2);
insert into programmer values('anand','21-may-66','m','parcal',3200);
insert into programmer values('ramesh','02-jul-64','m','clipper',2800);
insert into programmer values('kamala','31-jul-68','f','cobol',3000);
insert into programmer values('mary','21-jul-70','f','c++',4500);
insert into programmer values('nelson','11-sep-65','m','cobol',2500);
select * from programmer;
insert all
into programmer values('jayakumar','10-nov-65','m','pascal',2800)
into programmer values('saku','31-aug-65','m','assembly',3000)
select * from dual;
select distinct prof1,pname from programmer;
delete from programmer where pname='jayakumar';
insert into programmer values('jayakumar','10-nov-65','m','pascal',2500.00);
select * from programmer where pname like '%r';
select count(*) from programmer;
alter table programmer modify salary default 4000;

