-- TASK 4 - Inner Join,Full Outer Join, Cross Join, Left Outer Join,Right Outer Join

-- 23) Retrieve Payments with Courier Information

SELECT 
	p.PaymentID,
    c.CourierID,
    c.SenderName,
    c.SenderAddress,
    c.ReceiverName,
    c.ReceiverAddress,
    c.Weight,
    c.Status,
    c.TrackingNumber,
    c.DeliveryDate,
    p.Amount,
    p.PaymentDate
FROM paymenttable as p
JOIN Courier AS c
ON p.CourierID = c.CourierID;

-- 24) Retrieve Payments with Location Information

SELECT * FROM PAYMENTTABLE;

SELECT 
	l.locationID,
    p.courierid,
    l.locationName,
    l.address,
    p.amount,
    p.paymentdate
FROM locationtable as l
JOIN paymenttable as p
ON  l.LocationID = p.LocationID;
    

-- 25) Retrieve Payments with Courier and Location Information

SELECT 
	p.paymentid,
    p.courierid,
    l.locationid,
    l.locationname,
    c.sendername,
    c.senderaddress,
    c.receivername,
	c.receiveraddress,
    c.weight,
    c.status,
    c.trackingnumber,
    c.deliverydate,
    l.address,
    p.amount,
    p.paymentdate
FROM paymenttable as p
JOIN courier as c
ON p.courierid = c.courierid
JOIN locationtable as l
ON c.locationid = l.locationid;

-- 26) List all payments with courier details

SELECT
	c.courierid,
    p.paymentid,
    c.sendername,
    c.senderaddress,
    c.receivername,
    c.receiveraddress,
    c.weight,
    c.status,
    c.trackingnumber,
    c.deliverydate,
    c.locationid,
    p.amount,
    p.paymentdate
FROM paymenttable as p
JOIN courier as c
ON p.courierid = c.courierid;
    

-- 27) Total payments received for each courier

SELECT 
	c.courierid,
    p.paymentid,
	c.sendername,
    c.senderaddress,
    c.receivername,
    c.receiveraddress,
    c.status,
    SUM(p.amount) as TotalPaymentsReceived
FROM paymenttable as p
JOIN courier as c
ON p.courierid = c.courierid
GROUP BY c.courierid, p.paymentid, c.sendername, c.senderaddress, c.receivername, c.receiveraddress,
    c.status;

-- 28) List payments made on a specific date

SELECT *
FROM paymenttable
WHERE paymentdate = '2024-01-16';

SELECT
    p.paymentid,
    p.courierid,
    p.locationid,
    c.sendername,
    c.senderaddress,
    c.receivername,
    c.receiveraddress,
    c.weight,
    c.status,
    c.trackingnumber,
    c.deliverydate,
    p.amount,
    p.paymentdate
FROM paymenttable as p
JOIN courier as c 
ON p.courierid = c.courierid
WHERE p.paymentdate = '2024-01-16';

-- 29) Get Courier Information for Each Payment

SELECT
    p.paymentid,
    p.courierid,
    p.locationid,
    c.sendername,
    c.senderaddress,
    c.receivername,
    c.receiveraddress,
    c.weight,
    c.status,
    c.trackingnumber,
    c.deliverydate,
    p.amount,
    p.paymentdate
FROM paymenttable as p
JOIN courier as c 
ON p.courierid = c.courierid;

-- 30) Get Payment Details with Location

SELECT 
	p.paymentid,
    p.courierid,
    l.locationid,
    l.locationname,
    l.address,
    c.sendername,
    c.senderaddress,
    c.receivername,
    c.receiveraddress,
    p.amount,
    p.paymentdate
FROM paymenttable as p
JOIN courier as c 
ON p.courierid = c.courierid
JOIN locationtable as l
ON c.locationid = l.locationid
ORDER BY p.paymentid asc;
	

-- 31) Calculating Total Payments for Each Courier

SELECT
    c.courierid,
    c.sendername,
    c.senderaddress,
    c.receivername,
    c.receiveraddress,
    SUM(p.Amount) as TotalPayments
FROM courier as c
JOIN paymenttable p ON c.courierid = p.courierid
GROUP BY
    c.courierid,
    c.sendername,
    c.senderaddress,
    c.receivername,
    c.receiveraddress;
	
    
-- 32) List Payments Within a Date Range

SELECT 
	p.paymentid,
    p.courierid,
    c.sendername,
    c.receivername,
    p.amount,
    p.paymentdate
FROM paymenttable as p
JOIN courier as c
ON p.courierid = c.courierid
WHERE p.paymentdate BETWEEN '2024-01-11' AND '2024-01-16';
    

-- 33) Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side

SELECT 
	u.userid,
    u.name,
    u.email,
    c.courierid,
    c.sendername,
    u.address,
    c.receivername,
    c.receiveraddress,
    c.status,
    u.password,
    u.contactnumber
FROM user as u
LEFT JOIN courier as c
ON u.userid = c.userid;
-


-- 34) Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side

SELECT 
	c.courierid,
    c.userid,
    s.serviceid,
    c.sendername,
    c.deliverydate,
    s.servicename,
    s.cost,
    c.status
FROM courier as c
LEFT JOIN courierservices as s
ON c.serviceid = s.serviceid;


-- 35) Retrieve a list of all couriers and their corresponding payments, including cases where there are no matches on either side

SELECT 
	c.courierid,
    c.userid,
    c.serviceid,
    p.paymentid,
    c.sendername,
    p.amount,
    p.locationid,
    c.status
FROM courier as c
LEFT JOIN paymenttable as p
ON c.courierid = p.courierid;


-- 36) List all users and all courier services, showing all possible combinations.

SELECT 
	u.userid,
    u.name,
    u.email,
    c.serviceid,
    c.servicename,
    c.cost
FROM user as u
CROSS JOIN courierservices as c;

-- 37) List all employees and all locations, showing all possible combinations:
-- (Solve as Non - Equi - Join/Cross Join)

SELECT
	e.employeeid,
    e.name,
    e.email,
    e.role,
    l.locationid,
    l.locationname,
    l.address
FROM employeetable as e
CROSS JOIN locationtable as l;

-- 38) Retrieve a list of couriers and their corresponding sender information (if available)

SELECT 
	c.courierid,
    c.userid,
    c.sendername,
    c.senderaddress,
    u.email as senderemail,
    u.password as senderpassword,
    u.contactnumber as sendercontactnumber,
    c.status
FROM courier as c
LEFT JOIN user as u
ON c.userid = u.userid;
    
-- 39) Retrieve a list of couriers and their corresponding receiver information (if available):

SELECT
	c.courierid,
    c.userid as receiverid,
    c.receivername,
    c.receiveraddress,
    u.email as receiveremail,
    u.contactnumber as receivercontactnumber
FROM courier as c
LEFT JOIN user as u
ON c.receivername = u.name;

-- 40) Retrieve a list of couriers along with the courier service details (if available):

SELECT 
	c.courierid,
    c.userid,
    s.serviceid,
    c.sendername,
    c.deliverydate,
    s.servicename,
    s.cost,
    c.status
FROM courier as c
LEFT JOIN courierservices as s
ON c.serviceid = s.serviceid;	


-- 41) Retrieve a list of employees and the number of couriers assigned to each employee:

SELECT
	e.employeeid,
    e.name,
    e.email,
    e.contactnumber,
    COUNT(c.courierid) as NoOfCouriersAssigned,
    e.role,
    e.salary
FROM employeetable as e
LEFT JOIN courier as c
ON e.employeeid = c.employeeid
GROUP BY e.employeeid;

-- 42) Retrieve a list of locations and the total payment amount received at each location:

SELECT
	l.locationid,
    l.locationname,
    l.address,
    SUM(p.amount) as TotalAmountReceived
FROM locationtable as l
LEFT JOIN paymenttable as p
ON l.locationid = p.locationid
GROUP BY l.locationid;

-- 43) Retrieve all couriers sent by the same sender (based on SenderName).

SELECT
	c.courierid,
    c.sendername,
    u.email as senderemail,
    u.contactnumber as sendercontactnumber,
    u.address as senderaddress,
    c.status,
    c.trackingnumber,
    c.deliverydate
FROM courier as c
LEFT JOIN user as u
ON c.userid = u.userid
WHERE c.sendername = "Jackie D. Ewing";

-- 44) List all employees who share the same role.

SELECT * FROM employeetable WHERE Role = "Sales Representative";

-- 45) Retrieve all payments made for couriers sent from the same location.

SELECT
	p.paymentid,
    p.courierid,
    l.locationid,
    l.locationname,
    p.amount,
    p.paymentdate,
    c.sendername,
    c.senderaddress,
    c.status,
    c.trackingnumber
FROM paymenttable as p
JOIN courier as c
ON p.courierid = c.courierid
JOIN locationtable as l
ON p.locationid = l.locationid;

-- 46) Retrieve all couriers sent from the same location (based on SenderAddress).

SELECT *
FROM c
WHERE senderaddress IN (
    SELECT senderaddress
    FROM courier
    GROUP BY senderaddress
    HAVING COUNT(*) > 1
);
-- #NOTE:
-- The inner query selects unique SenderAddress values from the Courier table.
-- The HAVING COUNT(*) > 1 ensures that only those sender addresses with more than one courier are considered.
-- The outer query then selects all rows from the Courier table where the SenderAddress is in the list obtained from the inner query.

-- 47) List employees and the number of couriers they have delivered:

SELECT
	e.employeeid,
    e.name,
    e.email,
    e.contactnumber,
    COUNT(c.courierid) as NumberOfCouriersDelivered,
    e.role
FROM employeetable as e
LEFT JOIN courier as c
ON e.employeeid = c.employeeid
GROUP BY e.employeeid;

-- 48) Find couriers that were paid an amount greater than the cost of their respective courier services

SELECT
    c.courierid,
    c.userid,
    c.serviceid,
    c.sendername,
    c.senderaddress,
	p.amount as paidamount,
    s.cost as couriercost,
    c.weight,
    c.status,
    c.trackingnumber,
    c.deliverydate
FROM courier c
JOIN paymenttable p on c.courierid = p.courierid
JOIN courierservices s on c.serviceid = s.serviceid
WHERE p.amount > s.cost;


-- Scope: Inner Queries, Non Equi Joins, Equi joins,Exist,Any,All

-- 49. Find couriers that have a weight greater than the average weight of all couriers

SELECT * FROM courier as c WHERE c.weight > (SELECT avg(c.weight) FROM courier as c);

-- 50. Find the names of all employees who have a salary greater than the average salary:

SELECT * FROM employeetable WHERE salary > (SELECT AVG(salary) FROM employeetable);

-- 51. Find the total cost of all courier services where the cost is less than the maximum cost

SELECT SUM(cost) as TotalCost FROM courierservices WHERE cost < (SELECT MAX(cost) FROM courierservices);

-- 52. Find all couriers that have been paid for

SELECT 
	c.courierid,
    p.paymentid,
    c.sendername,
    c.senderaddress,
    p.amount,
    p.paymentdate,
    c.status,
    c.trackingnumber,
    c.deliverydate
FROM courier as c 
JOIN paymenttable as p 
ON c.courierid = p.courierid;

-- 53. Find the locations where the maximum payment amount was made

SELECT locationid, locationname, address FROM locationtable WHERE locationid 
IN (SELECT locationid FROM paymenttable WHERE amount = (SELECT MAX(amount) FROM paymenttable));

-- 54. Find all couriers whose weight is greater than the weight of all couriers 
-- sent by a specific sender (e.g., 'SenderName'):

SELECT * FROM courier WHERE weight > ALL (SELECT weight FROM courier 
WHERE senderName = 'Arthur A. Jessie');
