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
-- column is a vertical set of data within a table that represents a specific attribute or field of the data, while a row is a horizontal set of data that represents a single record or instance of the data.
-- row is a horizontal set of data within a table that represents a single record or instance of the data, while a column is a vertical set of data that represents a specific attribute or field of the data.
-- primary key is a unique identifier for each record in a table, ensuring that each record can be uniquely identified and accessed.
-- foreign key is a field in one table that refers to the primary key of another table, establishing a relationship between the two tables and allowing for data integrity and consistency.
-- index is a data structure that improves the speed of data retrieval operations on a database table by allowing the database to quickly locate and access the relevant data based on the indexed fields.



-- the name of the name attribute in a forms should be same as the name of the field in the database to ensure that the data is correctly mapped and stored in the database when the form is submitted. This consistency helps to avoid errors and ensures that the data is properly organized and accessible for future use.

-- CRUD operations are the basic operations that can be performed on a database, which include Create (inserting new data), Read (retrieving data), Update (modifying existing data), and Delete (removing data). These operations are fundamental to managing and manipulating data in a database.
