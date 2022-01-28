CREATE OR REPLACE PACKAGE c_ord AS 
   -- Adds a product 
   PROCEDURE addorder(o_id orders.order_id%type, 
   c_id orders.customer_id%type, 
   o_status   orders.status%type, 
   o_salmen  orders.salesman_id %type,  
   o_date  orders.order_date%type);
end c_ord;

CREATE OR REPLACE PACKAGE body c_ord  AS 
   -- Adds a product 
   PROCEDURE addorder(o_id orders.order_id%type, 
   c_id orders.customer_id%type, 
   o_status   orders.status%type, 
   o_salmen  orders.salesman_id %type,  
   o_date  orders.order_date%type)
    IS iv_err_code varchar2(20); 
    BEGIN 
      INSERT INTO orders(order_id,customer_id,status,salesman_id,order_date) 
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
   
   
   END  c_ord;
   /

execute c_ord.addorder('123','21','finsih','1100','10-05-2021');
desc orders;
select*from orderss;

