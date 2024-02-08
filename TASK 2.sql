-- Task 2 : Select, Where --

-- 1)  List all customers --

select * from User;

-- 2) List all orders for a specific customer --

select * from OrderTable where CustomerName = 'Jackie D. Ewing';

-- 3) List all couriers --

select * from Courier;

-- 4) List all packages for a specific order --

select * from OrderTable where CourierID = 103;

-- 5)  List all deliveries for a specific courier --

select * from Courier where CourierID = 102;

-- 6) List all undelivered packages  -- 

select * from Courier where Status = 'Undelivered';

-- 7) List all packages that are scheduled for delivery today --

select * from Courier where Status = 'Out for Delivery';

select * from Courier where DeliveryDate = curdate();

-- 8) List all packages with a specific status --

select * from Courier where Status = 'Delivered';

-- 9)  Calculate the total number of packages for each courier --

select CourierID, COUNT(*) as TotalPackages from Courier group by CourierID;

-- 10) Find the average delivery time for each courier --

select c.CourierID, AVG(datediff(c.DeliveryDate, o.OrderDate)) as AvgDeliveryTime
from Courier as c
join OrderTable as o
where c.CourierID = o.CourierID
group by c.CourierID;


-- 11) List all packages with a specific weight range --

select * from Courier where Weight between 1.00 AND 4.00;

-- 12) Retrieve employees whose names contain 'John' --

select * from EmployeeTable where Name LIKE '%John%';

-- 13) Retrieve all courier records with payments greater than $50 --

select * from PaymentTable where Amount > 50.00;

