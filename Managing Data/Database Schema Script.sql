-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS GBC_Superstore1;

-- Switch to the newly created or existing database
USE GBC_Superstore1;

-- Create the Region table
CREATE TABLE IF NOT EXISTS _Region (
    RegionID INT AUTO_INCREMENT PRIMARY KEY,
    Region VARCHAR(100)
);

-- Create Customers table
CREATE TABLE IF NOT EXISTS _Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Segment VARCHAR(100),
    Country VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20),
    RegionID INT, -- Adding RegionID column
    Phone VARCHAR(20),
    FOREIGN KEY (RegionID) REFERENCES _Region(RegionID) -- Referencing Region table
);

-- Create Products table
CREATE TABLE IF NOT EXISTS _Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(100),
    UnitPrice DECIMAL(10, 2),
    SubCategory VARCHAR(100)
);

-- Create Orders table
CREATE TABLE IF NOT EXISTS _Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    Returned VARCHAR(20),
    ShipMode VARCHAR(25),
    ProductID INT, -- Changed to INT to match ProductID in _Product table
    UnitPrice INT,
    Quantity INT,
    Sales INT,
    Discount DECIMAL(10, 2),
    Profit DECIMAL(10, 2),
    ProfitMargin DECIMAL(10, 2),
    OrderDate DATE,
    ShipDate DATE,
    RegionID INT, -- Adding RegionID column
    FOREIGN KEY (ProductID) REFERENCES _Product(ProductID), -- Referencing _Product table
    FOREIGN KEY (RegionID) REFERENCES _Region(RegionID), -- Referencing _Region table
    FOREIGN KEY (CustomerID) REFERENCES _Customers(CustomerID)
);

-- Create Regional_manager table
CREATE TABLE IF NOT EXISTS _Regional_manager (
    ManagerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    RegionID INT, -- Adding RegionID column
    FOREIGN KEY (RegionID) REFERENCES _Region(RegionID) -- Referencing _Region table
);
