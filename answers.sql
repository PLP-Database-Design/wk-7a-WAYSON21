--Qustion 1-------
SELECT 
  OrderID,
  CustomerName,
  TRIM(value) AS Product
FROM 
  ProductDetail,
  UNNEST(STRING_TO_ARRAY(Products, ',')) AS value;

--Question 2-------
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(100)
);

INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

--Question 3-------
CREATE TABLE OrderItems (
  OrderID INT,
  Product VARCHAR(100),
  Quantity INT,
  PRIMARY KEY (OrderID, Product)
);

INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
