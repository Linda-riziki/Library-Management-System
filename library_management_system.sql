-- Library Management System
-- Project Title: Library Management System
-- Description: This database is designed to manage books, authors, members, and borrow records for a library.
-- It includes tables with proper constraints and relationships.
-- Link to ERD: [Provide the link to your ERD here or attach an image]

-- Create Authors table (1-M relationship with Books)
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,  
    FirstName VARCHAR(100) NOT NULL,  
    LastName VARCHAR(100) NOT NULL,   
    UNIQUE (FirstName, LastName)      -- Ensures no duplicate authors with the same name
);

-- Create Books table (M-1 relationship with Authors, 1-M relationship with BorrowRecords)
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,  
    Title VARCHAR(255) NOT NULL,            
    Genre VARCHAR(100) NOT NULL,            
    AuthorID INT,                           
    YearPublished INT,                      
    ISBN VARCHAR(20) UNIQUE,                -- ISBN number should be unique for each book
    CONSTRAINT fk_Author FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)  -- Foreign Key Constraint
);

-- Create Members table (1-M relationship with BorrowRecords)
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,  
    FirstName VARCHAR(100) NOT NULL,          
    LastName VARCHAR(100) NOT NULL,           
    Email VARCHAR(100) NOT NULL UNIQUE,       
    PhoneNumber VARCHAR(15),                  
    MembershipDate DATE NOT NULL             -- The date the member joined
);

-- Create BorrowRecords table (M-M relationship between Members and Books)
CREATE TABLE BorrowRecords (
    BorrowID INT AUTO_INCREMENT PRIMARY KEY,  
    MemberID INT,                             
    BookID INT,                               
    BorrowDate DATE NOT NULL,                 
    ReturnDate DATE,                          
    DueDate DATE NOT NULL,                    
    CONSTRAINT fk_Member FOREIGN KEY (MemberID) REFERENCES Members(MemberID),  -- Foreign Key Constraint
    CONSTRAINT fk_Book FOREIGN KEY (BookID) REFERENCES Books(BookID)  -- Foreign Key Constraint
);

-- Add some example data for testing:

-- Insert data into Authors table
INSERT INTO Authors (FirstName, LastName) VALUES 
('J.K.', 'Rowling'),
('George', 'Orwell'),
('J.R.R.', 'Tolkien');

-- Insert data into Books table
INSERT INTO Books (Title, Genre, AuthorID, YearPublished, ISBN) VALUES
('Harry Potter and the Sorcerer\'s Stone', 'Fantasy', 1, 1997, '9780747532699'),
('1984', 'Dystopian', 2, 1949, '9780451524935'),
('The Hobbit', 'Fantasy', 3, 1937, '9780618260300');

-- Insert data into Members table
INSERT INTO Members (FirstName, LastName, Email, PhoneNumber, MembershipDate) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '2022-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '2023-04-22');

-- Insert data into BorrowRecords table
INSERT INTO BorrowRecords (MemberID, BookID, BorrowDate, ReturnDate, DueDate) VALUES
(1, 1, '2023-05-01', NULL, '2023-06-01'),
(2, 2, '2023-05-03', NULL, '2023-06-03');

-- Ensure that the database setup is complete
SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM BorrowRecords;
