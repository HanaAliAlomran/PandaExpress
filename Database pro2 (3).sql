create database Panda;
use Panda;

create table User_Data(  
 /*  the users who will use the program :
 may be any member from the university.
 student, teacher etc.. */ 
user_Id int(10) primary key,
User_type varchar(20) not null,
user_Fname varchar(20)not null,
user_Lname varchar(20)not null,
user_Phone int(10) 
);
create table Employee_Data(   
 /*  the employees in each resturant*/ 
UserName varchar(10) primary key references User_Data(user_Id),
employee_Fname varchar(10) not null,
employee_Lname varchar(10) not null,
passwordE varchar(10)
);
create table Coupon(  
/*  the employees can add a coupon for the users to use*/ 
copon varchar(10)
);

create table Restaurant(  
/*  we have 3 Restaurant in the program*/ 
RName varchar(20) ,
R_id int(10)primary key
);

create table Menu(   
 /*  the menu for each resturant in the program*/ 
foodname varchar(20),
price double(10,3)
);

create table cart( 
 /*  the cart will be updated whenever the user order from the program*/ 
cart_Id int(10)
);

insert into User_Data values(1,'Student','Mie','Smth',333445555);
insert into User_Data values (2,'Student','Brlin','Wong',123456789);
insert into User_Data values (3,'Student','Tei','Jos',009812678);
insert into User_Data values (4,'Teacher','May','Wallace',120987653);
insert into User_Data values (5,'Teacher','Hand','Narayan',987024701);

insert into Employee_Data values('Sara ','Omar' , 'Sara', '123');
insert into Employee_Data values('Hind' ,'Alwani', 'Hind', '123');
insert into Employee_Data values('Reem', 'Aloud', 'Reem', '123');
insert into Employee_Data values('Ruba' ,'Mohammad', 'Ruba', '123');
insert into Employee_Data values('Haya ','Alhabeeb', 'Haya', '123');


Insert into Coupon value('AN532');
Insert into Coupon value('AB098');
Insert into Coupon value('ASD234');
Insert into Coupon value('JU000');

Insert into Restaurant values('Burger Queen',102);
Insert into Restaurant values('Samurai Sushi',103);
Insert into Restaurant values('COCO Tacos',104);

Insert into Menu values( 'Tuna Burger',20.0);
Insert into Menu values('Beef Burger', 30.0);
Insert into Menu values('Fries', 5.5);
Insert into Menu values('pepsi', 3.0);
Insert into Menu values('chicken Burger', 10.0);

Insert into Menu values( 'Vegetable Sushi',20.0);
Insert into Menu values('Beef Sushi', 40.0);
Insert into Menu values('tuna sushi', 20.0);
Insert into Menu values('pepsi', 3.0);
Insert into Menu values('chicken sushi', 30.0);

Insert into Menu values( 'Tuna tacos',20.0);
Insert into Menu values('Beef tacos', 20.0);
Insert into Menu values('chicken tacos',20.0);
Insert into Menu values('Fries', 5.5);
Insert into Menu values('pepsi', 3.0);

Insert into cart values(1);
Insert into cart values(2);
Insert into cart values(3);
Insert into cart values(4);
Insert into cart values(5);
Insert into cart values(6);
Insert into cart values(7);
Insert into cart values(8);


select *from cart ;
select * from Employee_Data;
select *from Menu;
select * from User_Data;
select *from Restaurant;
select *from Coupon;

use Panda;
CREATE VIEW All_Coupons AS(SELECT *from Coupon);
select *from All_Coupons ;

use Panda;
CREATE VIEW All_Carts AS(SELECT *from cart);
select *from All_Carts ;

use Panda;
CREATE VIEW All_Employees AS(SELECT *from Employee_Data);
select *from All_Employees ;

Delimiter $$                                                  
  /* PROCEDURE for employee_name sara */
CREATE PROCEDURE Enames( In employee_name varchar (20) )
BEGIN

SELECT * from Employee_Data where employee_Fname=employee_name ; 
END;$$
Delimiter ;

delimiter ;
SELECT @name_ :='Sara' as name1;
CALL employee_Fname(@name_);

create trigger updateing
After 
insert on Menu
For each row 
Update foodname
Set foodname=null
Where foodname = 'Fries';
Select*from Menu;



USE Panda;                                                
/*Add new column Address (varchar(30),null )  to Employee_Data table.*/
Alter table Employee_Data add Address varchar(30) null;

USE Panda;                                         
/*update the last name for the Employee names Sara in Employee_Data table.*/
Update Employee_Data 
set employee_Lname ='Ali'
where UserName = 'Sara';

USE Panda;                                             
select foodname ,price from Menu
where price in (select max(price) from Menu );

use Panda;
Delimiter $$ 
Create function NumOfResturants() 
Returns int 
Deterministic 
BEGIN 
DECLARE No_Of_Resturants int ;
Select Count(R_id) Into No_Of_Resturants 
From Restaurant ;
return No_Of_Resturants;
End ; $$ Delimiter ; 

select NumOfResturants() 
as NumberOfResturants;


select * from Menu 
where foodname ='Beef Burger' or price =40.0;

Desc Menu;
Desc User_Data;
Desc Employee_Data;
Desc Coupon;
Desc Restaurant;
Desc cart;