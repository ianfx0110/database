-- database is a structured collection of data that is organized and stored in a way that allows for efficient retrieval and manipulation.
-- schema is the structure of a database, including the tables, fields, relationships, and constraints that define how data is organized and accessed within the database.
-- DBMS (Database Management System) is software that allows users to create, manage, and interact with databases.


-- in 1nf we reduce partial dependencies by creating new tables and establishing relationships between them. This process involves identifying the functional dependencies in the original table and ensuring that each non-key attribute is fully functionally dependent on the primary key. By doing so, we eliminate redundancy and improve data integrity.
-- in 2nf we further reduce redundancy by eliminating transitive dependencies. This means that we create new tables for attributes that are not directly dependent on the primary key but are dependent on other non-key attributes. By doing this, we ensure that each non-key attribute is only dependent on the primary key, which helps to maintain data integrity and reduce anomalies.
-- in 3nf we eliminate transitive dependencies by ensuring that all non-key attributes are directly dependent on the primary key. This means that we create new tables for attributes that are dependent on other non-key attributes, and we establish relationships between these tables. By doing this, we further reduce redundancy and improve data integrity.


-- evolution of databases 
-- 1.0 - flat file databases >> databases that store data in a single table or file, often with limited querying capabilities and no support for relationships between data. Examples include CSV files and simple spreadsheets.
-- 2.0 - {hierarchical databases
-- 3.0 - network databases}
-- 4.0 - relational databases >> databases that organize data into tables with defined relationships between them, allowing for complex querying and data manipulation. Examples include MySQL, PostgreSQL, and Oracle Database.
-- 5.0 - object-oriented databases >> databases that store data in the form of objects, which can include both data and behavior. These databases are designed to work with object-oriented programming languages and can provide more flexibility in terms of data modeling. Examples include MongoDB and CouchDB.
-- 6.0 - NoSQL databases
-- 7.0 - NewSQL databases
-- 8.0 - Cloud-native databases


-- table is a collection of related data organized in rows and columns, where each row represents a record and each column represents a field or attribute of the data.
-- field is a specific piece of data within a table, representing a particular attribute or characteristic of the data.
-- record is a complete set of related data within a table, representing a single instance or occurrence of the data.
-- column is a vertical set of data within a table that represents a specific attribute or field of the data, while a row is a horizontal set of data that represents a single record or instance of the data.
-- row is a horizontal set of data within a table that represents a single record or instance of the data, while a column is a vertical set of data that represents a specific attribute or field of the data.
-- key is a field or combination of fields that uniquely identifies a record in a table, allowing for efficient retrieval and manipulation of data.
-- primary key is a unique identifier for each record in a table, ensuring that each record can be uniquely identified and accessed.
-- foreign key is a field in one table that refers to the primary key of another table, establishing a relationship between the two tables and allowing for data integrity and consistency.
-- index is a data structure that improves the speed of data retrieval operations on a database table by allowing the database to quickly locate and access the relevant data based on the indexed fields.



-- the name of the name attribute in a forms should be same as the name of the field in the database to ensure that the data is correctly mapped and stored in the database when the form is submitted. This consistency helps to avoid errors and ensures that the data is properly organized and accessible for future use.

-- CRUD operations are the basic operations that can be performed on a database, which include Create (inserting new data), Read (retrieving data), Update (modifying existing data), and Delete (removing data). These operations are fundamental to managing and manipulating data in a database.


-- deadlock is a situation in which two or more transactions are waiting for each other to release locks on resources, resulting in a standstill where none of the transactions can proceed. This can occur when multiple transactions are trying to access the same resources simultaneously, and they end up blocking each other. Deadlocks can lead to performance issues and can be resolved by implementing strategies such as timeout mechanisms or deadlock detection algorithms.

-- CREATE this is used to create a new database, table, element or other database objects using SQL query we chain this with a key word like IF NOT EXISTS to avoid errors if the object already exists. only a single entity can be created at a time using this command.

-- datatypes in sql are used to define the type of data that can be stored in a column of a table. Common datatypes include INT for integers, VARCHAR for variable-length strings, DATE for date values, and BOOLEAN for true/false values. Choosing the appropriate datatype is important for ensuring data integrity and optimizing storage and performance. Example of datatypes include:
-- INT: used for storing whole numbers (e.g., 1, 100, -50)
-- VARCHAR: used for storing variable-length strings (e.g., 'Hello', 'John Doe')
-- DATE: used for storing date values (e.g., '2024-01-01')
-- BOOLEAN: used for storing true/false values (e.g., TRUE, FALSE)
-- TEXT: used for storing large amounts of text (e.g., 'This is a long description.')
-- FLOAT: used for storing floating-point numbers (e.g., 3.14, -0.001)
-- DECIMAL: used for storing precise decimal numbers (e.g., 10.99, -5.75)
-- BLOB: used for storing binary data (e.g., images, files)
-- ENUM: used for storing a predefined set of values (e.g., 'small', 'medium', 'large')
-- TIMESTAMP: used for storing date and time values (e.g., '2024-01-01 12:00:00')
-- CHAR: used for storing fixed-length strings (e.g., 'A', 'ABCD')

CREATE DATABASE database_name;
{
    CREATE DATABASE IF NOT EXISTS Eldohub;
}


-- unique avoid duplicate values in a column, ensuring that each value is distinct and can be used as a unique identifier for records in the table. This constraint helps to maintain data integrity and prevent errors caused by duplicate entries.
-- null avoid null values in a column, ensuring that every record has a value for that field. This constraint helps to maintain data integrity and prevent errors caused by missing or incomplete data.
-- auto_increment is a feature that automatically generates a unique value for a column, typically used for primary keys. When a new record is inserted into the table, the auto_increment column will automatically increment its value by 1, ensuring that each record has a unique identifier without the need for manual input.

CREATE TABLE table_name (id INT, fullname VARCHAR(20) NOT NULL, email VARCHAR(100) UNIQUE NOT NULL, password VARCHAR(20) NOT NULL);