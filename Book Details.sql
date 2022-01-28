procedure Addbooks(
   b_category in book_details.category%type,
   b_publisher_id details.publisher_id%type,
   b_book_title in details.book_title%type,
   b_book_code in details.book_code%type,
   b_price in details.price%type,
   b_publisher_date in details.publisher_date%type,
   b_book_condition in details.book_condition%type, 
   IS iv_err_code varchar2(20));
   begin 
    insert into book_details(category,publisher_id,book_title,book_code,price,publisher_date,book_condition)
    values (b_category,b_publisher_id,b_book_title,b_book_code,b_price, b_publisher_date,b_book_condition);
     if Sql%rowcount>0 then
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
   END Addbooks;
    

   