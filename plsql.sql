set serveroutput on
DECLARE
V_grade		CHAR(1) := UPPER ('&p_grade');
V_appraisal	VARCHAR2(20);

BEGIN
v_appraisal	:=
   CASE 	    v_grade
	WHEN  'A' THEN	'Excellent'
	WHEN  'B' THEN	'Very Good'
	WHEN  'C' THEN	'Good'
	ELSE   'No such Grade'
     
    end ;
   DBMS_OUTPUT.PUT_LINE (' Grade : ' || v_grade || ' Appraisal ' || V_appraisal);
   
END;
/

--basic syntax

declare 
a varchar2(20) :='hello';
begin 
  dbms_output.put_line(a);
end;
/

declare 
a number :=10;
b number :=20;

begin
  declare
   c number;
   begin
  c:=a+b;
  dbms_output.put_line('the value of c=' || c);
  end;
end;
/

declare 
 p_sno product.ssno%type:=1;
 p_name product.fulname%type;
 p_dec product.description%type;
 p_city product.city%type;
begin
 select fulname,description,city into p_name,p_dec,p_city from product where ssno= p_sno;
 dbms_output.put_line('p_name is' || p_name);
 dbms_output.put_line('p_dec is' || p_dec);
 dbms_output.put_line('p_city is' || p_city);
 end;
 /
  desc order_items;
  ---loop
set serveroutput on
declare
i number;
begin
for i in 1..5 loop
 dbms_output.put_line('i is'|| i);
 end loop;
end;
/

--while
set serveroutput on
declare
a number :=10;
begin 
while (a<20) loop
 dbms_output.put_line(a);
 a :=a+1;
 if (a>15) then   -----or exit a>15;
 
    exit;
    end if ;
  end loop;
end;
/

create or replace package ProductTable as 
procedure add (product_id in number,product_name in varchar2,description in varchar2,standard_cost in number,list_price in number,catagory_id in number);
procedure remove (catagory_id products.catagory_id%type);
end;

create or replace package body ProductTable as
procedure add
(product_id in number,product_name in varchar2,description in varchar2,standard_cost in number,
list_price in number,catagory_id in number) IS
begin
INSERT INTO products values(product_id,product_name,description,standard_cost,list_price,catagory_id);
IF  SQL%FOUND THEN
            dbms_output.put_line('RECORD inserted');
			ELSE
				dbms_output.put_line('RECORD NOT FOUND');
			END IF;
commit;
end add;
procedure remove (catagory_id products.catagory_id%type) IS
begin
delete from product where catagory_id = catagory_id;
commit;
end remove;
end;
/
---------------------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE sales AS
   -- Adds a product
   PROCEDURE addproduct(p_id products.product_id%type,
   p_name products.product_Name%type,
   p_stprice   products.standard_cost%type,
   p_lprice  products.list_price %type,  
   p_catid  products.category_id%type)   ;
   
   -- Removes a product
   PROCEDURE delproduct(p_id  products.product_id%TYPE);
   --Lists all products
   
 
END sales;
/

------package body-----
desc products
CREATE OR REPLACE PACKAGE body sales  AS
   -- Adds a product
   PROCEDURE addproduct(p_id products.product_id%type,
   p_name products.product_Name%type,
   p_stprice   products.standard_cost%type,
   p_lprice  products.list_price %type,  
   p_catid  products.category_id%type)
    IS iv_err_code varchar2(20);
    BEGIN
      INSERT INTO products(product_id,product_Name,standard_cost,list_price,category_id)
         VALUES(p_id, p_name, p_stprice, p_lprice, p_catid);
         if Sql%found then
         dbms_output.put_line('record inserted');
         else
          dbms_output.put_line('record  not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('record  not inserted ||||sqlerrm');
       dbms_output.put_line('record  not inserted');

   
   COMMIT;
   END addproduct;
   
   PROCEDURE delproduct(p_id  products.product_id%type) IS
   BEGIN
      DELETE FROM products WHERE product_id =p_id ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('PRODUCT DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('PRODUCT NOT DELETE');
   END IF;
     
   END delproduct;
   
   END  sales;
   /
EXECUTE  sales.addproduct('12','cycle',325,22,134);
EXECUTE sales.delproduct(11);

--------------------------------------------------------------------------------------------
select * from products;




CREATE OR REPLACE PACKAGE sales AS
   -- Adds a product
   PROCEDURE addorder(o_id orderss.order_id%type,
   c_id orderss.customer_id%type,
   o_status   orderss.status%type,
   o_salmen  orderss.salesman_id %type,  
   o_date  orderss.order_date%type);
end sales;

CREATE OR REPLACE PACKAGE body sales  AS
   -- Adds a product
   PROCEDURE addorder(o_id orderss.order_id%type,
   c_id orderss.customer_id%type,
   o_status   orderss.status%type,
   o_salmen  orderss.salesman_id %type,  
   o_date  orderss.order_date%type)
    IS iv_err_code varchar2(20);
    BEGIN
      INSERT INTO orderss(order_id,customer_id,status,salesman_id,order_date)
         VALUES(o_id, c_id, o_status, o_salmen, o_date);
         if Sql%found then
         dbms_output.put_line('record inserted');
         else
          dbms_output.put_line('record  not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('record  not inserted ||||sqlerrm');
       dbms_output.put_line('record  not inserted');

   
   COMMIT;
   END addorder;
   
   
   END  sales;
   /

execute sales.addorder('211','22','finsihied','1200','11-06-2021');
desc orderss;

select * from orderss;

---------------------------------------------------------------------------------

---product table---
CREATE OR REPLACE PACKAGE sales AS
   -- Adds a product
   PROCEDURE Addproduct(p_id products.product_id%type,
   p_name products.product_Name%type,
   p_des  products.descrption%type,
   p_stdcost   products.standard_cost%type,
   p_lprice  products.list_price %type,  
   p_catid  products.category_id%type)   ;
   
   -- Removes a product
   PROCEDURE Delproduct(p_id  products.product_id%TYPE);

----order table---
----Add order table----
 PROCEDURE Addorder(o_id orderss.order_id%type,
   o_cid orderss.customer_id%type,
   o_status   orderss.status%type,
   o_salmen  orderss.salesman_id %type,  
   o_date  orderss.order_date%type);

---delete order table----
PROCEDURE Delorder(o_id  orderss.order_id%TYPE);

------employee table---
---employee Addtable---
procedure Add_emp(emp_id employees.employee_id%type,
emp_salesman employees.first_name%type ,
emp_lastname employees.last_name%type ,
emp_email employees.email%type,
emp_pho employees.phone%type,
emp_hdate employees.hire_date%type,
emp_mid employees.manager_id%type,
emp_job employees.job_title%type);

---delete employee---
PROCEDURE Delemp(emp_id  employees.employee_id%TYPE);

-----orderitems---
 PROCEDURE Add_orderitem(oi_oi order_items.order_id%type,
   oi_itemid order_items.item_id%type,
   oi_proid  order_items.product_id%type,
   oi_qi  order_items.quanity_id %type,  
   oi_uprice  order_items.unit_price%type);

----delorderitem---
PROCEDURE Delorderitem(oi_oi order_items.order_id%TYPE);

-----customer table----
----Addcustomer---
procedure addCustomer(c_id customer.customer_id%TYPE,
c_name customer.name%type,
c_address customer.address%type,
c_web customer.website%type,
c_climit customer.create_limit%type);

----delcustomer---
PROCEDURE Delcustomer(c_id customer.customer_id%TYPE);
end sales;
/


-----package body-----
CREATE OR REPLACE PACKAGE body sales  AS
   -- Add product
    PROCEDURE Addproduct(p_id products.product_id%type,
   p_name products.product_Name%type,
   p_des  products.descrption%type,
   p_stdcost   products.standard_cost%type,
   p_lprice  products.list_price %type,  
   p_catid  products.category_id%type)  
   IS iv_err_code varchar2(20);
    BEGIN
      INSERT INTO products(product_id,product_Name,descrption,standard_cost,list_price,category_id)
         VALUES(p_id, p_name,p_des, p_stdcost, p_lprice, p_catid);
         if Sql%found then
         dbms_output.put_line('record inserted');
         else
          dbms_output.put_line('record  not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('record  not inserted ||||sqlerrm');
       dbms_output.put_line('record  not inserted');

   
   COMMIT;
   END Addproduct;
   ----delete program---
   PROCEDURE Delproduct(p_id  products.product_id%type) IS
   BEGIN
      DELETE FROM products WHERE product_id =p_id ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('PRODUCT DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('PRODUCT NOT DELETE');
   END IF;
     
   END Delproduct;
   
   
------orders program----
PROCEDURE Addorder(o_id orderss.order_id%type,
   o_cid orderss.customer_id%type,
   o_status   orderss.status%type,
   o_salmen  orderss.salesman_id %type,  
   o_date  orderss.order_date%type)
    IS iv_err_code varchar2(20);
    BEGIN
      INSERT INTO orderss(order_id,customer_id,status,salesman_id,order_date)
         VALUES(o_id, o_cid, o_status, o_salmen, o_date);
         if Sql%rowcount > 0 then
         dbms_output.put_line('record inserted --');
--         else
--          dbms_output.put_line('record  not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
     COMMIT;     
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('record  not inserted ||||sqlerrm');
       dbms_output.put_line('record  not inserted');
 
END addorder;
----delete order program---  
   PROCEDURE Delorder(o_id  orderss.order_id%type) IS
   BEGIN
      DELETE FROM orderss WHERE order_id =o_id ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('order DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('order NOT DELETE');
   END IF;
     
   END delorder;
   
-------employee program----
-----Add employeee----
procedure Add_emp(emp_id employees.employee_id%type,
emp_salesman employees.first_name%type ,
emp_lastname employees.last_name%type ,
emp_email employees.email%type,
emp_pho employees.phone%type,
emp_hdate employees.hire_date%type,
emp_mid employees.manager_id%type,
emp_job employees.job_title%type)
is iv_err_code varchar2(20);
begin
insert into employees(employee_id,first_name,last_name,email,phone,hire_date,manager_id,job_title)
values(emp_id,emp_salesman,emp_lastname,emp_email,emp_pho,emp_hdate,emp_mid,emp_job);

  if Sql%found then
         dbms_output.put_line('employee  inserted');
         else
          dbms_output.put_line('employee not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('employee not inserted ||||sqlerrm');
       dbms_output.put_line('remployee not inserted');

   
   COMMIT;
   END Add_emp;

----delete employees---
PROCEDURE Delemp(emp_id  employees.employee_id%type) IS
   BEGIN
      DELETE FROM employees WHERE employee_id=emp_id ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('employee DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('employee NOT DELETE');
   END IF;
     
   END Delemp;
 
----orderitems program----
 PROCEDURE Add_orderitem(oi_oi order_items.order_id%type,
   oi_itemid order_items.item_id%type,
   oi_proid  order_items.product_id%type,
   oi_qi  order_items.quanity_id %type,  
   oi_uprice  order_items.unit_price%type)
is iv_err_code varchar2(20);
begin
insert into order_items(order_id ,item_id ,product_id ,quanity_id ,unit_price)
values(oi_oi,oi_itemid,oi_proid,oi_qi,oi_uprice);
  if Sql%found then
         dbms_output.put_line('order_items  inserted');
         else
          dbms_output.put_line('order_items not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('order_items not inserted ||||sqlerrm');
       dbms_output.put_line('order_items not inserted');

   
   COMMIT;
   END Add_orderitem;
----delete order_items---
PROCEDURE Delorderitem(oi_oi order_items.order_id%type) IS
   BEGIN
      DELETE FROM order_items WHERE order_id=oi_oi ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('orderitem DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('orderitem NOT DELETE');
   END IF;
     
   END Delorderitem;
 
  ------customer----
   procedure addCustomer(c_id customer.customer_id%TYPE,
c_name customer.name%type,
c_address customer.address%type,
c_web customer.website%type,
c_climit customer.create_limit%type)
is iv_err_code varchar2(20);  
begin    
insert into customer(customer_id,name,address,website,create_limit ) values
( c_id,c_name,c_address,c_web,c_climit );  
if Sql%found then
         dbms_output.put_line('customer inserted');
         else
          dbms_output.put_line('customer not inserted');
          end if;
          iv_err_code:='s';
           dbms_output.put_line('status:'||' '||iv_err_code);
         
EXCEPTION
WHEN others then
       iv_err_code:='e';
       dbms_output.put_line('customers not inserted ||||sqlerrm');
       dbms_output.put_line('customers not inserted');
       
 end addcustomer;

----delete customer---
PROCEDURE Delcustomer(c_id customer.customer_id%type) IS
   BEGIN
      DELETE FROM customer WHERE customer_id=c_id ;
       IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('customer DELETED');
         ELSE
          DBMS_OUTPUT.PUT_LINE('customer NOT DELETE');
   END IF;
     
   END Delcustomer;

   end sales;
   /
---tables----  
 select* from products;
 select* from orderss;
 select* from employees;
 select* from order_items;
 desc order_items;
 select* from customer;
   
   
   
 set serveroutput on;  
 --exectute  product--  
EXECUTE sales.addproduct(120,'vivo','good',15000,16000,1234);
EXECUTE sales.delproduct(999);

---execute order--
execute sales.addorder(212,21,'preocess',1011,'10-10-2020');
execute sales.delorder(209);  

----execute employee---
execute sales.add_emp(1011,'ram','kumar','ramkumar@gmail.com',987654321,'12-12-2021',11,'worker');
execute sales.delemp(1009);

----execute orderitem---
execute sales.add_orderitem(220,310,222,6,1000);
execute sales.delorderitem(209);

----execute customer---
execute sales.addcustomer(21,'ram','ganapathi st','filpkart',8000);
execute sales.delcustomer(21);


select * from products;
set serveroutput on;

----trigger

create table monitor(
  id number generated always as identity start with 1 primary key,
  table_name varchar2(20),
  transcation_name varchar2(20),
  by_user varchar2(20),
  transcation_date Date);
  
  select * from monitor;
  
create or replace trigger audit_details
after 
update or delete
on employees
for each row

declare 
   transcation_type varchar2(20);
   begin
   transcation_type :=case
   when updating then 'update'
   when deleting then 'delete'
   end;
   
   insert into monitor(table_name,transcation_name, by_user,transcation_date)
   values('employees',transcation_type,user,sysdate);
   end;
   /
   
   
---function
CREATE OR REPLACE FUNCTION FUNC(
F_NAME IN employee.first_name%TYPE,
EMAIL IN employee.email%TYPE)
RETURN NUMBER
IS EMP_ID NUMBER:=0;
BEGIN
SELECT ID
INTO EMP_ID FROM EMPLOYEE WHERE first_name=F_NAME AND EMAIL=EMAIL;
RETURN EMP_ID;
END;
/
SELECT FUNC('anu','anu@gmail.com')return_id from employee where rownum<2;

