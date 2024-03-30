-- By definition, a primary key is a column or group of columns that uniquely identify every row in a table. A table cannot have more than one primary key. The rules for defining a primary key include:
-- No two rows can have a duplicate primary key value.
-- Every row must have a primary key value.
-- No primary key field can be null.

-- Drop the tables in case they exist

DROP TABLE IF EXISTS BookShop;
DROP TABLE IF EXISTS BookShop_AuthorDetails;

-- Create the table

CREATE TABLE BookShop (
	BOOK_ID VARCHAR(4) NOT NULL, 
	TITLE VARCHAR(100) NOT NULL, 
	AUTHOR_NAME VARCHAR(30) NOT NULL, 
	AUTHOR_BIO VARCHAR(250),
	AUTHOR_ID INTEGER NOT NULL, 
	PUBLICATION_DATE DATE NOT NULL, 
	PRICE_USD DECIMAL(6,2) CHECK(Price_USD>0) NOT NULL
	);

-- Insert sample data into the table

INSERT INTO BookShop VALUES
('B101', 'Introduction to Algorithms', 'Thomas H. Cormen', 'Thomas H. Cormen is the co-author of Introduction to Algorithms, along with Charles Leiserson, Ron Rivest, and Cliff Stein. He is a Full Professor of computer science at Dartmouth College and currently Chair of the Dartmouth College Writing Program.', 123 , '2001-09-01', 125),
('B201', 'Structure and Interpretation of Computer Programs', 'Harold Abelson', 'Harold Abelson, Ph.D., is Class of 1922 Professor of Computer Science and Engineering in the Department of Electrical Engineering and Computer Science at MIT and a fellow of the IEEE.', 456, '1996-07-25', 65.5),
('B301', 'Deep Learning', 'Ian Goodfellow', 'Ian J. Goodfellow is a researcher working in machine learning, currently employed at Apple Inc. as its director of machine learning in the Special Projects Group. He was previously employed as a research scientist at Google Brain.', 369, '2016-11-01', 82.7),
('B401', 'Algorithms Unlocked', 'Thomas H. Cormen', 'Thomas H. Cormen is the co-author of Introduction to Algorithms, along with Charles Leiserson, Ron Rivest, and Cliff Stein. He is a Full Professor of computer science at Dartmouth College and currently Chair of the Dartmouth College Writing Program.', 123, '2013-05-15', 36.5),
('B501', 'Machine Learning: A Probabilistic Perspective', 'Kevin P. Murphy', '', 157, '2012-08-24', 46);

-- Retrieve all records from the table

SELECT * FROM BookShop;

-- To convert BookShopTable to 2NF
CREATE TABLE BookShop_AuthorDetails
(AUTHOR_ID INTEGER NOT NULL,AUTHOR_NAME VARCHAR(30) NOT NULL,
 AUTHOR_BIO VARCHAR(250),PRIMARY KEY (AUTHOR_ID)) ;

-----Insert the records of Bookshop to this table.

insert into BookShop_AuthorDetails select DISTINCT AUTHOR_ID, AUTHOR_NAME, AUTHOR_BIO FROM BookShop;

select * from BookShop_AuthorDetails;

--Drop the table.

DROP TABLE IF EXISTS BookShop;

-----Recreate it with Primary Key -------
-- To set the BOOK_ID column of the BookShop table as a primary key for each of the tables
CREATE TABLE BookShop (
 BOOK_ID VARCHAR(4) NOT NULL, 
 TITLE VARCHAR(100) NOT NULL, 
 AUTHOR_NAME VARCHAR(30) NOT NULL, 
 AUTHOR_BIO VARCHAR(250),
 AUTHOR_ID INTEGER NOT NULL, 
 PUBLICATION_DATE DATE NOT NULL, 
 PRICE_USD DECIMAL(6,2) CHECK(Price_USD>0) NOT NULL,PRIMARY KEY (BOOK_ID));

INSERT INTO BookShop VALUES
('B101', 'Introduction to Algorithms', 'Thomas H. Cormen', 'Thomas H. Cormen is the co-author of Introduction to Algorithms, along with Charles Leiserson, Ron Rivest, and Cliff Stein. He is a Full Professor of computer science at Dartmouth College and currently Chair of the Dartmouth College Writing Program.', 123 , '2001-09-01', 125),
('B201', 'Structure and Interpretation of Computer Programs', 'Harold Abelson', 'Harold Abelson, Ph.D., is Class of 1922 Professor of Computer Science and Engineering in the Department of Electrical Engineering and Computer Science at MIT and a fellow of the IEEE.', 456, '1996-07-25', 65.5),
('B301', 'Deep Learning', 'Ian Goodfellow', 'Ian J. Goodfellow is a researcher working in machine learning, currently employed at Apple Inc. as its director of machine learning in the Special Projects Group. He was previously employed as a research scientist at Google Brain.', 369, '2016-11-01', 82.7),
('B401', 'Algorithms Unlocked', 'Thomas H. Cormen', 'Thomas H. Cormen is the co-author of Introduction to Algorithms, along with Charles Leiserson, Ron Rivest, and Cliff Stein. He is a Full Professor of computer science at Dartmouth College and currently Chair of the Dartmouth College Writing Program.', 123, '2013-05-15', 36.5),
('B501', 'Machine Learning: A Probabilistic Perspective', 'Kevin P. Murphy', '', 157, '2012-08-24', 46);

-- Retrieve all records from the table

SELECT * FROM BookShop;

-- To set the AUTHOR_ID column of the BookShop_AuthorDetails table as a primary key for each of the tables

--Drop the table.

DROP TABLE IF EXISTS BookShop_AuthorDetails;

-----Rereate another table BookShop_AuthorDetails with author id as the primary key

CREATE TABLE BookShop_AuthorDetails(AUTHOR_ID INTEGER NOT NULL,AUTHOR_NAME VARCHAR(30) NOT NULL,AUTHOR_BIO VARCHAR(250),PRIMARY KEY (AUTHOR_ID)) ;

-----Insert the records of Bookshop to this table.

insert into BookShop_AuthorDetails select DISTINCT AUTHOR_ID, AUTHOR_NAME, AUTHOR_BIO FROM BookShop;

select * from BookShop_AuthorDetails;

-- After adding primary key lets try add the same record in BookShop table
INSERT INTO BookShop VALUES
('B101', 'Introduction to Algorithms', 'Thomas H. Cormen', 'Thomas H. Cormen is the co-author of Introduction to Algorithms, along with Charles Leiserson, Ron Rivest, and Cliff Stein. He is a Full Professor of computer science at Dartmouth College and currently Chair of the Dartmouth College Writing Program.', 123 , '2001-09-01', 125)

---You will get unique constraint violation.
-- Now you can use the BOOK_ID column to uniquely identify every row in the BookShop table and the AUTHOR_ID column to uniquely identify every row in the BookShop_AuthorDetails table.
select * from BookShop;

-- By definition, a foreign key is a column that establishes a relationship between two tables. It acts as a cross-reference between two tables because it points to the primary key of another table. A table can have multiple foreign keys referencing primary keys of other tables. Rules for defining a foreign key:
-- A foreign key in the referencing table must match the structure and data type of the existing primary key in the referenced table.
-- A foreign key can only have values present in the referenced primary key
-- Foreign keys do not need to be unique. Most often they are not.
-- Foreign keys can be null.

-----Foreign key addition in bookshop

DROP TABLE IF EXISTS BookShop;


-- To create a foreign key for the BookShop table, set its AUTHOR_ID column as a foreign key, to establish a relationship between the BookShop and BookShop_AuthorDetails tables. 
CREATE TABLE BookShop (
 BOOK_ID VARCHAR(4) NOT NULL, 
 TITLE VARCHAR(100) NOT NULL, 
 AUTHOR_NAME VARCHAR(30) NOT NULL, 
 AUTHOR_BIO VARCHAR(250),
 AUTHOR_ID INTEGER NOT NULL, 
 PUBLICATION_DATE DATE NOT NULL, 
 PRICE_USD DECIMAL(6,2) CHECK(Price_USD>0) NOT NULL,PRIMARY KEY (BOOK_ID),
 FOREIGN KEY (AUTHOR_ID)
 REFERENCES BookShop_AuthorDetails(AUTHOR_ID)
 ON UPDATE NO ACTION
 ON DELETE NO ACTION);

 -- Now that you have created the relationship, each book in the BookShop table is linked to the relevant row in the BookShop_AuthorDetails table through AUTHOR_ID.


 -- 1) ENTITY CONSTRAINT:
	-- Entity integrity ensures that no duplicate records exist within a table and that the column identifing each record within the table is not a duplicate and not null. 
	-- The existence of a primary key in both the BookShop and BookShop_AuthorDetails tables satisfies this integrity constraint because a primary key mandates NOT NULL constraint 
	-- as well as ensuring that every row in the table has a value that uniquely denotes the row.

-- 2) REFERENTIAL INTEGRITY CONSTRAINT:
	-- Referential integrity ensures the existence of a referenced value if a value of one column of a table references a value of another column. 
	-- The existence of the foreign Key (AUTHOR_ID) in the BookShop table satisfies this integrity constraint because a cross-reference relationship between the BookShop and BookShop_AuthorDetails tables exists. 
	-- As a result of this relationship, each book in the BookShop table is linked to the relevant row in the BookShop_AuthorDetails table through the AUTHOR_ID columns.	

-- 3) DOMAIN INTEGRITY CONSTRAINT:
	-- Domain integrity ensures clarity of column purpose and consistency of valid values. 
	-- The BookShop table adheres to this constraint through the specification of data types, length, date format, check constraints, and null constraints in its CREATE statement. 
	-- This comprehensive approach guarantees that the values in each column are not only valid but also conform to the specified domain constraints.

-- 4) SEMANTIC INTEGRITY CONSTRAINT: 
	-- Semantic integrity constraints maintain the correctness of data meaning, and domain constraints enforce valid attribute values.

-- 5) NULL CONSTRAINT: 
	-- Null constraints mandate non-null attribute values, and check constraints restrict accepted attribute values.
-- 6) CHECK CONSTRAINT: