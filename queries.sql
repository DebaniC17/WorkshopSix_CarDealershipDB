-- Q:1
SELECT * FROM Dealerships;

-- Q:2
Select * FROM Vehicles 
Join Inventory on Vehicle(VIN) = Inventory(VIN)
WHERE Dealership+_ID = 1;

-- Q:3
SELECT * FROM Vehicles
WHERE VIN = '3FGCM82633C789012';

-- Q:4
SELECT * FROM Dealerships
JOIN Inventory ON Dealerships(Dealership_ID) = Inventory (Dealership_ID)
WHERE VIN = '3FGCM82633C789012';

-- Q:5
SELECT DISTINCT *
FROM Dealerships
JOIN Inventory ON Dealerships(Dealership_ID) = Inventory (Dealership_ID)
JOIN Vehicles ON Vehicles(VIN) = Inventory(VIN)
WHERE Vehicles.Type = 'Sedan';
