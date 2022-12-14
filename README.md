
# Description

A commercial firm that has some special requirements to implement a system on the ground that manages the company, employees and workers within the company and works on organizing the workflow and the method of buying and selling private properties, organizing the work of commercial sales offices, and organizing the coordination process between the owner and sales offices


## Logical ERD

Using DBSchema I created a logical erd from the actual schema of this project that represent the relations between entities and consider the cardinality and participation of entities 

![](Firm-ERD.jpg)



## Database Implementation
- The implementation of the database is the important step in designing systems, so you start to ask what the RDBMS that I will use?? and Which one is better?.
- You have to choose the right RDBMS that will serve the business and your customers.
- I used SQLServer RDBMS and created the database using wizard in SSMS and creating tables using SQL queries.
- I created constraint and relations on database using SQL.
- Last thing is running the database diagram from SSMS

```SQL
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
```

![](Firm-Database_Diagram.JPG)


## Used Technologies
- SQL Server Management Studio (SSMS)
- DBSchema 
