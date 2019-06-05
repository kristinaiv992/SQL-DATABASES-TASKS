WHAT IS A DATABASE?
======================
A large amount of information stored in a computer system in such a way it can be easily looked or changed!
*TYPES OF DATABASES:
-relational (sql);
-non-relational(NoSql)
----------------------
In sql each column, local variable, expression and parameter have a related data type. A DATA TYPE CAN BE: int, nvarchar, varchar, char, binary, time.....
========================
CREATE ALTER AND DELETE DATABASE
1.CREATE DATABASE
--create database Sample1
================================

2.MODIFY THE DATABASE
 --alter database Sample1 modify name = Sample2
 sp_renameDB 'Sample2','Sample3'

===========================================
3.DELETE THE DATABASE
 drop database Sample3

============================================
CREATE AND WORKING WITH TABLES
____________________________________________________________
What is the difference between Clustered and Non-Clustered Indexes in SQL Server?
Differences between clustered and non-clustered indexes.
	1. 
There can be only one clustered index per table. However, you can create multiple non-clustered indexes on a single table.
	2. 
Clustered indexes only sort tables. Therefore, they do not consume extra storage. Non-clustered indexes are stored in a separate place from the actual table claiming more storage space.
	3. 
Clustered indexes are faster than non-clustered indexes since they don’t involve any extra lookup step.

=================================================================
WHAT IS A PRIMARY KEY?
________________________________________________________________
The PRIMARY KEY constraint uniquely identifies each record in a table.

Primary keys must contain UNIQUE values, and cannot contain NULL values.

A table can have only ONE primary key;
*****************************************
WHAT IS A FOREIGN KEY?
________________________________________________________________
A FOREIGN KEY is a key used to link two tables together.
A FOREIGN KEY is a field (or collection of fields) in one table that refers to the PRIMARY KEY in another table.
The table containing the foreign key is called the child table, and the table containing the candidate key is called the referenced or parent table.
What is the difference between Pimary Key and Foreign Key?
In SQL Server, there are two keys - primary key and foreign key which seems identical, but actually both are different in features and behaviors.

*********************************************
============================================
FOREIGN KEY FORMULA:
ALTER TABLE [dbo].[taa tabela kade sto foreign key-to e child - tamu kade sto e foreign key]
 ADD CONSTRAINT [FK_taa tabela kade sto foreign key-to e child - tamu kade sto e foreign key_taa tabela kade sto foreign ket-to si e primary key (parent table)] 
FOREIGN KEY ([SAMO kolonata od childod t.e samiot foreign key]) 
REFERENCES [dbo].[parentot so kolonata t.e tamu kade sto foreign key-to si e primary key (vo ova pole odi imeto na tabelata!!!!!)]([vo ova pole odi kolonata]);
============================================
*********************************************

Primary Key AND Foreign Key
____________________________________________________________
Primary key uniquely identify a record in the table.
Foreign key is a field in the table that is primary key in another table.

Primary Key can't accept null values.
Foreign key can accept multiple null value.

By default, Primary key is clustered index and data in the database table is physically organized in the sequence of clustered index.
Foreign key do not automatically create an index, clustered or non-clustered. You can manually create an index on foreign key.

We can have only one Primary key in a table.
We can have more than one foreign key in a table.
====================================================
JOIN TYPES
-----------
Cross Join -> multiplications between the tables (football team each team has to play with every team - all the possible combinations)(gives us two tables so if there are duplicates they are given to us)
Inner Join -> returns only matching rows that exists in both tables (gives us two tables so if there are duplicates they are given to us)
SELECT table1.column_name(s) as tbl1_name, table2.column_name(s) tbl2_name
FROM table1 AS t1
INNER JOIN table2 AS t2
ON table1.column_name = table2.column_name;
Outer Join -> 
a) left join -> site od levo plus ako im najde spojka od desno gi spojuva i prikazuva i tie od desno a ako ne im najde togash prikazuva NULL od desno!
b)full join -> se prikazuva i od levo i od desno ako ne najde spojki od levo so tie od desno i obratno stava NULL 
WHAT IS THE DIFFERENCE BETWEEN INTERSECT AND INNER JOIN?
____________________________________________________________
The INNER JOIN will return duplicates, if id is duplicated in either table.  
INTERSECT removes duplicates. 
The INNER JOIN will never return NULL, but INTERSECT will return NULL.
![JOINS](https://user-images.githubusercontent.com/45533932/58921269-22013900-8736-11e9-851c-85e50eabdc7c.jpg)
____________________________________________________________
The SQL SELECT DISTINCT Statement. The SELECT DISTINCT statement is used to return only distinct (different) values. 
Inside a table, a column often contains many duplicate values; and sometimes you only want to list the different (distinct) values
