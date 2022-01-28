create table customer(customer_id number(10)primary key,name VARCHAR(20),address VARCHAR(50),website VARCHAR(20),create_limit NUMBER(10));
DESCRIBE customer;
-----order table-----
create table orderss(order_id number(10)primary key,customer_id number(10),status VARCHAR(50),salesman_id NUMBER(10),
order_date date,foreign key(customer_id ) REFERENCES customer(customer_id),FOREIGN key(salesman_id) REFERENCES employees (employee_id));
DESCRIBE orders;
------order_item table---
CREATE TABLE order_items(order_id NUMBER(10)primary KEY,item_id NUMBER(10),product_id NUMBER(10),quanity_id NUMBER(10),
unit_price number(10),FOREIGN key(order_id) REFERENCES orderss(order_id),FOREIGN key(product_id) REFERENCES products(product_id) ) ;
DESCRIBE order_item;
----prodect table----
create table products(product_id NUMBER primary key,product_name VARCHAR(20),descrption VARCHAR2(20),standard_cost NUMBER,
list_price NUMBER,category_id NUMBER);
DESCRIBE products;

-------employee table-----
create table employees(employee_id NUMBER primary key,first_name VARCHAR(20),last_name VARCHAR(20),email VARCHAR(20),
phone NUMBER,hire_date date,manager_id NUMBER,job_title VARCHAR(20));
DESCRIBE employees;
-----product details-----
INSERT INTO products values(101,'cake','very taste',500,700,1000);
INSERT INTO products values(102,'shirt','good qulaity',599,800,1001);
INSERT INTO products values(103,'pant','good qulaity',799,999,1002);
INSERT INTO products values(104,'shoe','good',299,499,1003);
INSERT INTO products values(105,'t shirt','good qulaity',250,399,1004);
INSERT INTO products values(106,'phone','good',5000,7000,1005);
INSERT INTO products values(107,'powerbank','good',199,500,1006);
INSERT INTO products values(108,'tab','good',6000,8000,1007);
INSERT INTO products values(109,'laptop','very good',15000,20000,1008);
INSERT INTO products values(110,'bag','good',1500,1999,1009);
SELECT * from products;
-------employee details-----
INSERT INTO employees values(1001,'raj','pothi','rajpothi@gmail.com',9787282970,'10-10-2020',1,'CEO');
INSERT INTO employees values(1002,'mari','raja','mriraja@gmail.com',6381830625,'01-10-2020',2,'Manager');
INSERT INTO employees values(1003,'vel','vinayak','velvinayak@gmail.com',7339123155,'20-10-2020',3,'HR');
INSERT INTO employees values(1004,'jay','ganash','jayganesh@gmail.com',633485801020,'10-11-2020',4,'TL');
INSERT INTO employees values(1005,'karthick','maries','karthik@gmail.com',8870623149,'15-11-2020',5,'Trainer');
INSERT INTO employees values(1007,'sachin','raj','sachinraj@gmail.com',6381333299,'18-10-2020',6,'Traingmanager');
INSERT INTO employees values(1006,'aijth','kumar','aijthkumar@gmail.com',9789614042,'19-11-2020',7,'finaces');
INSERT INTO employees values(1008,'selva','ganasen','selva@gmail.com',9095949291,'10-09-2020',8,'developer');
INSERT INTO employees values(1009,'gopal','ganasen','gopal@gmail.com',909598765,'11-10-2020',9,'team memer');
INSERT INTO employees values(1010,'jay','gopal','gopaljay@gmail.com',9095937991,'11-11-2020',10,'team memer');

update employees set job_title='senior' where email='rajpothi@gmail.com';
delete from employees where email='karthik@gmail.com';
commit;

SELECT*from employees;
------customer------
insert into customer values(10,'siva','muniyandi kovil street','amazon',80000);
insert into customer values(11,'kumar','anna  street','amazon',80000);
insert into customer values(12,'pothi','pothi  street','amazon',80000);
insert into customer values(13,'jeyganesh',' ganesh street','amazon',80000);
insert into customer values(14,'vel','vel  street','amazon',80000);
insert into customer values(15,'murugaan','murugan kovil street','amazon',80000);
insert into customer values(16,'sachin','sachin tendulkar street','amazon',80000);
insert into customer values(17,'karthi','karumariamman kovil street','amazon',80000);
insert into customer values(18,'ajith','actor ajithkumar street','amazon',80000);
insert into customer values(19,'mari','muniyandi kovil street','amazon',80000);
select* from customer;
------order table details-------
INSERT into orderss values(200,11,'receving',1001,'24-3-2020');
INSERT into orderss values(201,12,'pending',1002,'26-3-2020');
INSERT into orderss values(202,13,'processing',1003,'30-3-2020');
INSERT into orderss values(203,14,'in progress',1004,'20-3-2020');
INSERT into orderss values(204,15,'finished',1005,'15-3-2020');
INSERT into orderss values(205,16,'receving',1006,'11-5-2020');
INSERT into orderss values(206,17,'process going',1007,'18-4-2020');
INSERT into orderss values(207,18,'delivery',1008,'10-3-2020');
INSERT into orderss values(208,19,'pending',1009,'10-9-2020');
INSERT into orderss values(209,10,'finished',1010,'10-8-2020');

SELECT* from orderss;
-------order item details------
insert INTO order_items values(200,300,101,5,100);
insert INTO order_items values(201,301,102,3,199);
insert INTO order_items values(202,302,103,6,399);
insert INTO order_items values(203,303,104,5,499);
insert INTO order_items values(204,304,105,8,299);
insert INTO order_items values(205,305,106,9,5000);
insert INTO order_items values(206,306,107,4,1000);
insert INTO order_items values(207,307,108,7,1299);
insert INTO order_items values(208,308,109,2,999);
insert INTO order_items values(209,308,110,5,1499);
update order_items set item_id=309 where order_id=209;
select* from order_items;



select p.product_name,(oi.quanity_id*oi.unit_price) as quantity,o.order_date,e.first_name,e.phone,c.name,c.address
from order_items oi join orderss o on oi.order_id=o.order_id 
join employees e on o.salesman_id =e.employee_id join customer c on o.customer_id=c.customer_id 
join products p on oi.product_id=p.product_id where quanity_id=(select MAX(quanity_id) from order_items);

set serveroutput on
declare 
f_name employees.first_name%type;
l_name employees.last_name%type;
cursor c_d is select employees.first_name,employees.last_name from employees;
begin
open c_d;
loop
fetch c_d into f_name,l_name;

exit when c_d%rowcount>3;
dbms_output.put_line(c_d%rowcount);
dbms_output.put_line(f_name||' '||l_name);
end loop;
close c_d;
end;
/
set serveroutput on
declare 
id employees.employee_id%type;
j_b employees.job_title%type;
f_name employees.first_name%type;
cursor v_d is select employees.first_name,employees.job_title into f_name,j_b from employees
where employees.employee_id=id;
begin
id :=&id;
open v_d;
loop
fetch v_d into f_name,j_b ;
exit when v_d%notfound;
dbms_output.put_line(f_name||' '||j_b);
end loop;
close v_d;
end;
/
select * from employees;
select * from products;
select * from orderss;
select * from order_items;
select * from customer;


---procedure 

SELECT CUST.CUSTOMER_NAME,EMP.* , PRO.,ORD. FROM CUSTOMER CUST , orders ORD, order_items ORI, products PRO , employees EMP WHERE 1=1 AND CUST.CUSTOMER_ID = ORD.CUSTOMER_ID AND ORI.ORDER_ID = ORD.ORDER_ID AND ori.product_id = PRO.product_id AND EMP.EMPLOYEE_ID = ord.salesman_id AND PRO.STANDARD_COST >=500 AND TRUNC(ord.order_date) BETWEEN :P_FROM_DATE AND :P_TO_DATE;

