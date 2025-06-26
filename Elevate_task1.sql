-- Library Management System
-- Creating a database
CREATE DATABASE LibraryDB;
use LibraryDB
-- Identify Entities and Relationships
-- Entities:-Entities:- boos, Authors, Members, Loans, Staff
-- Create Tables with Keys
      -- Table: Authors
CREATE TABLE Authors (
    Author_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL
);
INSERT INTO Authors (Name) VALUES 
('J.K. Rowling'),
('George R.R. Martin'),
('Agatha Christie'),
('J.R.R. Tolkien'),
('Chetan Bhagat');

      -- Table: Books
CREATE TABLE Books (
    Book_ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Genre VARCHAR(50),
    Published_Year INT,
    Stock INT DEFAULT 0
);
INSERT INTO Books (Title, Genre, Published_Year, Stock) VALUES
('Harry Potter and the Philosopher\'s Stone', 'Fantasy', 1997, 10),
('A Game of Thrones', 'Fantasy', 1996, 7),
('Murder on the Orient Express', 'Mystery', 1934, 5),
('The Hobbit', 'Fantasy', 1937, 8),
('Half Girlfriend', 'Romance', 2014, 12);

-- Table: BookAuthors
CREATE TABLE BookAuthors (
    Book_ID INT,
    Author_ID INT,
    PRIMARY KEY (Book_ID, Author_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
    FOREIGN KEY (Author_ID) REFERENCES Authors(Author_ID)
);

INSERT INTO BookAuthors (Book_ID, Author_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Table: Members
CREATE TABLE Members (
    Member_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Join_Date DATE
);
INSERT INTO Members (Name, Email, Join_Date) VALUES
('Rahul Sharma', 'rahul.sharma@example.com', '2023-01-15'),
('Anjali Verma', 'anjali.verma@example.com', '2023-02-10'),
('Amit Patel', 'amit.patel@example.com', '2023-03-05'),
('Sneha Reddy', 'sneha.reddy@example.com', '2023-04-22'),
('Vikram Singh', 'vikram.singh@example.com', '2023-05-30');

-- Table: Staff
CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Role VARCHAR(50)
);
INSERT INTO Staff (Name, Role) VALUES
('Priya Mehta', 'Librarian'),
('Rohan Das', 'Assistant Librarian'),
('Kavita Sharma', 'Clerk'),
('Manoj Yadav', 'Inventory Manager'),
('Anita Kapoor', 'Customer Service');

-- Table: Loans
CREATE TABLE Loans (
    Loan_ID INT PRIMARY KEY AUTO_INCREMENT,
    Book_ID INT,
    Member_ID INT,
    Staff_ID INT,
    Loan_Date DATE,
    Return_Date DATE,
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
    FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);
INSERT INTO Loans (Book_ID, Member_ID, Staff_ID, Loan_Date, Return_Date) VALUES
(1, 1, 1, '2024-06-01', '2024-06-15'),
(2, 2, 2, '2024-06-05', '2024-06-20'),
(3, 3, 3, '2024-06-10', '2024-06-24'),
(4, 4, 4, '2024-06-15', '2024-06-30'),
(5, 5, 5, '2024-06-20', '2024-07-05');


--  ER Diagram (Conceptual Overview)
[Authors]───<writes>───[BookAuthors]───<written_by>───[Books]
                                         │
                                       <borrowed in>
                                         │
                                      [Loans]───<borrowed by>───[Members]
                                              │
                                           <managed by>
                                              │
                                            [Staff]

-- Primary Keys:-Uniquely identify a record in a table (e.g., Book_ID, Member_ID).

-- Foreign Keys:-Maintain referential integrity by linking to primary keys of other tables.

-- Retreive data
select * from loans 



