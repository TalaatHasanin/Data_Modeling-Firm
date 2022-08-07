Create table Employee
(
Emp_ID int primary key,
Emp_Name varchar(20),
num int,
)

create table Sales_office
(
num int primary key,
Location varchar(50) default 'cairo',
Emp_ID int 
constraint c1 foreign key(Emp_ID) references Employee(Emp_ID)
		  on delete set NULL on update cascade,
)

create table Property
(
Prop_ID int primary key,
Address varchar(20),
City varchar(20),
State varchar(20),
Zip int,
num int,
constraint c2 foreign key(num) references Sales_office(num)
		  on delete set NULL on update cascade,
constraint c15 check (City in ('Cairo','Mansoura','Alex','Giza')),
)

create table Owner
(
Owner_ID int primary key,
Name varchar(20) not NULL,
)

create table Owner_Prop
(
Prop_ID int,
Owner_ID int,
Percent_Owned float,
constraint c3 primary key(Prop_ID,Owner_ID),
constraint c4 foreign key(Prop_ID) references Property(Prop_ID)
		 on update cascade,
constraint c5 foreign key(Owner_ID) references Owner(Owner_ID)
		 on update cascade,
)

alter table Employee add 
constraint c17 foreign key(num) references Sales_office(num)
