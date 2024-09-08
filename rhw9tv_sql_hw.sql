SELECT Name FROM country WHERE continent="South America";

SELECT population FROM country WHERE name="Germany";

SELECT Name FROM city WHERE countrycode = "JPN";

SELECT Name, Population FROM country WHERE Continent = 'Africa' ORDER BY Population DESC LIMIT 3;

SELECT Name, LifeExpectancy FROM country WHERE Population BETWEEN 1000000 AND 5000000;

SELECT country.Name FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';

SELECT Album.title FROM Album JOIN Artist ON Album.ArtistId = Artist.ArtistId WHERE Artist.Name = 'AC/DC'; 

SELECT FirstName, LastName, Email FROM Customer WHERE Country = "Brazil";

SELECT Name FROM Playlist;

SELECT COUNT(*) FROM Track JOIN Genre ON Track.GenreID = Genre.GenreID WHERE Genre.Name = "Rock";

SELECT FirstName, LastName FROM Employee WHERE ReportsTo = 2;

SELECT FirstName, LastName, SUM(Invoice.Total) as TotalSales FROM Customer JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId GROUP BY Customer.FirstName, Customer.LastName;



CREATE TABLE Books (
BookID INT AUTO_INCREMENT PRIMARY KEY, 
Title VARCHAR(255) NOT NULL,
AuthorFirstName VARCHAR(100) NOT NULL, 
AuthorLastName VARCHAR(100) NOT NULL, 
Price DECIMAL(10, 2) NOT NULL, Quantity INT NOT NULL 
);

CREATE TABLE Customers ( 
CustomerID INT AUTO_INCREMENT PRIMARY KEY, 
FirstName VARCHAR(100) NOT NULL, 
LastName VARCHAR(100) NOT NULL, 
Email VARCHAR(255) NOT NULL, 
PhoneNumbers VARCHAR(15)
);

CREATE TABLE Orders ( 
OrderID INT AUTO_INCREMENT PRIMARY KEY, 
CustomerID INT, 
BookID INT, QuantityOrdered INT NOT NULL, 
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID), 
FOREIGN KEY (BookID) REFERENCES Books(BookID)
);


INSERT INTO Books (Title, AuthorFirstName, AuthorLastName, Price, Quantity) 
VALUES 
('It Ends With Us', 'Colleen', 'Hoover', 15, 11), ('Yours Truly', 'Abby', 'Jimenez', 18, 3), ('Love and Other Words', 'Christina', 'Lauren', 14, 12), ('In Five Years', 'Rebecca', 'Serle', 12, 21), ('The Seven Year Slip', 'Ashley', 'Poston', 14, 24);

INSERT INTO Customers (FirstName, LastName, Email, PhoneNumbers) 
VALUES 
('John', 'Doe', 'john.doe@example.com', '1234567890'), ('Jane', 'Smith', 'jane.smith@example.com', '9876543210'), ('Alice', 'Johnson', 'alice.johnson@example.com', '5555555555'), ('Bob', 'Williams', 'bob.williams@example.com', '4444444444'), ('Charlie', 'Brown', 'charlie.brown@example.com', '3333333333');

INSERT INTO Orders (CustomerID, BookID, QuantityOrdered) 
VALUES 
(1, 2, 2), (2, 3, 1), (3, 5, 3), (4, 1, 1), (5, 4, 2);

SELECT Title FROM Books WHERE Price < 15;

SELECT FirstName,LastName, Books.Title 
From Orders 
JOIN Customers ON Orders.CustomerID = Customers.CustomerID 
JOIN Books ON Orders.BookID = Books.BookID 
WHERE Books.Title = "Yours Truly";

SELECT SUM(Books.Price * Orders.Quantity) AS TotalSales
FROM Orders
JOIN Books ON Orders.BookID = Books.BookID;

