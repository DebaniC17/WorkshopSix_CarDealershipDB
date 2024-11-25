DROP DATABASE IF EXISTS dealership_DB;

CREATE DATABASE IF NOT EXISTS dealerships_DB;

USE dealerships_DB;

DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Sales_Contracts;
DROP TABLE IF EXISTS Lease_Contracts;
DROP TABLE IF EXISTS Vehicles;
DROP TABLE IF EXISTS Dealerships;

CREATE TABLE Dealerships (
Dealership_ID int auto_increment,
Name varchar(100),
Address varchar(100),
Phone varchar(15),
PRIMARY KEY (Dealership_ID) 
);

CREATE TABLE Vehicles (
Make varchar(50),
Model varchar(50),
Type varchar(50),
Color varchar(50),
Odometer varchar(50),
Price varchar(100),
Year varchar(50),
VIN varchar(50),
Sold TINYINT(1) NOT NULL DEFAULT 0,
PRIMARY KEY (VIN)
);

CREATE TABLE Inventory (
Dealership_ID INT,
VIN varchar(50),
primary key (Dealership_ID, VIN),
foreign key (Dealership_ID) references Dealerships(Dealership_ID),
foreign key (VIN) references Vehicles(VIN)
);

CREATE TABLE Sales_Contracts (
Customer_Name varchar(100),
ID INT auto_increment,
VIN varchar(50),
Sale_Date date,
Sale_Price decimal(12,2),
primary key (ID),
foreign key (VIN) references Vehicles(VIN)
);

CREATE TABLE Lease_Contracts (
Customer_Name varchar(100),
ID INT auto_increment,
VIN varchar(50),
Lease_Start_Date DATE,
Lease_End_Date DATE,
Monthly_Payment decimal(12,2),
primary key (ID),
foreign key (VIN) references Vehicles(VIN)
);

# ---------------------------------------------------------------------- #
# Add info into "Dealerships"                                            #
# ---------------------------------------------------------------------- #

-- TRUNCATE TABLE Dealerships;
INSERT INTO Dealerships (Name, Address, Phone)
VALUES 
('Prime Auto', '123 Main St, Springfield, IL', '217-555-1234'),
('Auto World', '456 Elm St, Chicago, IL', '312-555-5678'),
('City Motors', '789 Maple Ave, Naperville, IL', '630-555-9101'),
('Elite Cars', '101 Oak Dr, Peoria, IL', '309-555-1122'),
('Luxury Wheels', '202 Pine Rd, Rockford, IL', '815-555-3344');

# ---------------------------------------------------------------------- #
# Add info into "Vehicles"                                               #
# ---------------------------------------------------------------------- #

-- TRUNCATE TABLE Vehicles;
INSERT INTO Vehicles (Make, Model, Type, Color, Odometer, Price, Year, VIN, Sold)
VALUES 
('Toyota', 'Camry', 'Sedan', 'White', '32000', '25000', '2020', '1HGCM82633A123456', 0),
('Honda', 'CR-V', 'SUV', 'Black', '15000', '28000', '2021', '2HGCM82633B654321', 1),
('Ford', 'F-150', 'Truck', 'Blue', '45000', '30000', '2019', '3FGCM82633C789012', 0),
('Tesla', 'Model 3', 'Sedan', 'Red', '12000', '50000', '2022', '5TESM82633D345678', 1),
('Chevrolet', 'Malibu', 'Sedan', 'Gray', '55000', '20000', '2018', '6CHVM82633E901234', 0);

# ---------------------------------------------------------------------- #
# Add info into "Inventory"                                              #
# ---------------------------------------------------------------------- #

-- TRUNCATE TABLE Inventory;
INSERT INTO Inventory (Dealership_ID, VIN)
VALUES
(1, '1HGCM82633A123456'),
(2, '2HGCM82633B654321'),
(3, '3FGCM82633C789012'),
(4, '5TESM82633D345678'),
(5, '6CHVM82633E901234');

# ---------------------------------------------------------------------- #
# Add info into "Sales_Contracts"                                              #
# ---------------------------------------------------------------------- #

INSERT INTO Sales_Contracts (Customer_Name, VIN, Sale_Date, Sale_Price)
VALUES 
('John Doe', '2HGCM82633B654321', '2024-01-15', 28000.00),
('Jane Smith', '5TESM82633D345678', '2024-02-10', 50000.00),
('Mark Johnson', '3FGCM82633C789012', '2024-03-01', 30000.00),
('Alice Brown', '6CHVM82633E901234', '2024-04-18', 19000.00),
('Tom Wilson', '1HGCM82633A123456', '2024-05-22', 25000.00);

# ---------------------------------------------------------------------- #
# Add info into "Lease_Contracts"                                              #
# ---------------------------------------------------------------------- #

INSERT INTO Lease_Contracts (Customer_Name, VIN, Lease_Start_Date, Lease_End_Date, Monthly_Payment)
VALUES 
('Emily Carter', '2HGCM82633B654321', '2024-01-01', '2026-01-01', 450.00), -- Honda CR-V leased
('Michael Lee', '5TESM82633D345678', '2024-03-01', '2027-03-01', 650.00), -- Tesla Model 3 leased
('Samantha Green', '1HGCM82633A123456', '2024-05-01', '2025-05-01', 350.00), -- Toyota Camry leased
('Daniel Wright', '3FGCM82633C789012', '2024-06-01', '2026-06-01', 500.00), -- Ford F-150 leased
('Laura Martin', '6CHVM82633E901234', '2024-07-01', '2027-07-01', 400.00); -- Chevrolet Malibu leased
