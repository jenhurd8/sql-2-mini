
-- Foreign Keys - New Table
-- ### Instructions 
-- * Create a new table called `Movie` with an `ID`, `Title`, and `MediaTypeId`.
--   * Make `MediaTypeId` a foreign key to the `MediaTypeId` column on the `MediaType` table.
-- * Add a new entry into the `Movie` table with a `Title` and `MediaTypeId`.
-- * Query the `Movie` table to get your entry.

CREATE TABLE Movie
(
    ID INTEGER PRIMARY KEY,
    Title TEXT,
    MediaTypeId INTEGER,
    FOREIGN KEY(MediaTypeId) REFERENCES MediaType(MediaTypeId)
);

INSERT INTO Movie
    ( Title, MediaTypeId )
VALUES
    ( "Aladdin", 3 );

SELECT *
FROM Movie;

-- Foreign Keys - Existing Table
-- Summary
-- We can also add a foreign key to an existing table. 
-- Let's add one to our Movie table that references GenreId on the Genre table.
-- Instructions
-- Add a new column called GenreId that references GenreId on the Genre table.
-- Query the Movie table to see your entry.

ALTER TABLE Movie ADD COLUMN GenreId 
INTEGER REFERENCES Genre
(GenreId);

SELECT *
FROM Movie;

-- Updating Rows
-- Summary
-- We don't want to leave the GenreId equal to null so let's add a value using the update command. 
-- With an update command you always want to use a WHERE clause. If you don't you will overwrite data on all records.
-- Instructions
-- Update the first entry in the Movie table to a GenreId of 22.
-- Query the Movie table to see your entry.

UPDATE Movie
SET GenreId=22
WHERE id=1;

SELECT *
FROM Movie;

-- Using Joins
-- Summary
-- Now that we know how to make foreign keys and change data, let's do some practice queries. 
-- The simplest way to use a foreign key is via a join statement.
-- Instructions
-- Join the Artist and Album tables to list out the Artist name and Album name.

SELECT a.title, ar.Name
FROM Album a
    JOIN Artist ar ON a.ArtistId = ar.ArtistId

-- Using nested queries/sub-selects
-- Summary
-- The next way to use a primary key is with a nested query/sub-select statement. By using parenthesis we can
--  do a select inside of a select. This is really effective when you have a foreign key link between two tables 
--  because now we can filter our main query by criteria on a referenced table.
-- Instructions
-- Use a sub-select statement to get all tracks from the Track table where the GenreId is either Jazz or Blues.

SELECT *
FROM Track
WHERE GenreId IN (SELECT GenreId
FROM Genre
WHERE 
    Name = 'Jazz' OR
    Name = 'Blues');

-- Setting values to null
-- Instructions
-- Update Phone on the Employee table to null where the EmployeeId is 1.
-- Query the Employee table to get the employee you just updated.

UPDATE Employee SET Phone = null
WHERE EmployeeId = 1;

SELECT *
FROM Employee
WHERE EmployeeId = 1;

-- Querying a null value
-- Summary
-- Sometimes you want to know when there is no value. For example, let's use the Customer table 
-- to figure out which customers do not have a company.
-- Instructions
-- Get all customers from the Customer table who do not have a company.

SELECT *
FROM Customer
WHERE Company IS NULL;

-- Group by
-- Summary
-- How many albums does each artist have? We could count manually, but no! Group by allows us to do aggregate counts.
-- Instructions
-- Select all artist ids, artist names, and count how many albums they have.

SELECT ar.artistId, ar.name, count(*)
FROM Artist ar
    JOIN Album a ON ar.ArtistId = a.ArtistId
GROUP BY ar.artistId;

-- Distinct
-- Summary
-- Distinct is great if you want to get a dataset with no duplicates.
-- Instructions
-- Get all countries from the Customer table with no duplicates.

SELECT DISTINCT Country
FROM Customer;

-- Delete Rows
-- Summary
-- Deleting rows can be dangerous if you are not cautious. Always do a select of what you plan
--  to delete to make sure that you are going to delete the correct records.
-- Instructions
-- Select all records from the Customer table where fax is null;
-- Delete all records from the Customer table where fax is null;

SELECT *
FROM CUSTOMER
WHERE fax IS NULL;

DELETE FROM Customers WHERE Fax IS null;