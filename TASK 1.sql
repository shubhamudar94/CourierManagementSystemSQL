-- TASK 1   Database Design --

create database couriermanagementsystem;
use couriermanagementsystem;

-- 1) User Table 

create table User(UserID int primary key, 
  Name varchar(255), 
  Email varchar(255) unique, 
  Password varchar(255),
  ContactNumber varchar(20),
  Address TEXT
  );

-- Insert sample data into User table

insert into User values(4892, 
  'Arthur A. Jessie', 
  'ArthurAJessie@armyspy.com',
  'Shei0ahch',
  '225-935-2339',
  '1204 Coventry Court, Baton Rouge, LA 70806'
  );
  
  insert into User values(9116, 
  'Michelle T. Hanna', 
  'MichelleTHanna@dayrep.com',
  'AiC8oovofi',
  '843-706-7558',
  '965 Broadway Street, Bluffton, SC 29910'
  );

  insert into User values(2164, 
  'Lillian B. Ahlers', 
  'LillianBAhlers@dayrep.com',
  'ahthooN7',
  '979-779-4346',
  '507 Colonial Drive, Bryan, TX 77803'
  );

  insert into User values(3168, 
  'Jackie D. Ewing', 
  'JackieDEwing@rhyta.com',
  'Aigai9vais',
  '336-879-6948',
  '3806 Fire Access Road, Coleridge, NC 27234'
  );

  insert into User values(6137, 
  'Sharon John Schneider', 
  'SharonJSchneider@teleworm.us',
  'phied9Poh',
  '209-288-3670',
  '367 Freedom Lane, Stockton, CA 95204'
  );


   insert into User Values(2918,
   'Kathy V. Crofoot',
   'KathyVCrofoot@rhyta.com',
   'Moo6Phai8ai',
   '818-661-5069',
   '510 Glendale Avenue, Los Angeles, CA 90017'
   );
   
select * from User;

-- 2) Courier Table

create table Courier(CourierID int primary key, 
  UserID int, FOREIGN KEY (UserID) REFERENCES User(UserID),
  ServiceID int, FOREIGN KEY (ServiceID) REFERENCES courierservices(ServiceID),
  SenderName varchar(255), 
  SenderAddress text, 
  ReceiverName varchar(255),
  ReceiverAddress text,
  Weight decimal(5, 2),
  Status varchar(50),
  TrackingNumber varchar(20) unique,
  DeliveryDate date,
  EmployeeID int,
  LocationID int
  );
drop table Courier;
-- Insert sample data into Courier table

insert into Courier values(101, 4892, 4, 'Arthur A. Jessie', '1204 Coventry Court, Baton Rouge, LA 70806', 'Michael Chang', '789 Cedar St, CityH', 4.80, 'Out for Delivery', 'GHI789', '2024-01-16', 3, 3),
(102, 9116, 1, 'Michelle T. Hanna', '965 Broadway Street, Bluffton, SC 29910', 'Daniel Miller', '123 Elm St, CityJ', 1.90, 'Delivered', 'JKL012', '2024-01-13', 1, 1),
(103, 2164, 2, 'Lillian B. Ahlers', '507 Colonial Drive, Bryan, TX 77803', 'Ryan Adams', '543 Maple St, CityL', 6.25, 'In Transit', 'MNO345', '2024-01-17', 4, 2),
(104, 3168, 4, 'Jackie D. Ewing', '3806 Fire Access Road, Coleridge, NC 27234',  'William Brown', '210 Pine St, CityP', 3.30, 'Delivered', 'STU901', '2024-01-12', 3, 1),
(105, 6137, 5, 'Sharon John Schneider', '367 Freedom Lane, Stockton, CA 95204', 'Linda R. Watkins', '1155 O Street Gulfport, MS 39501', 4.20, 'Undelivered', 'TIN3169', '2024-01-16', 2, 2);

insert into Courier values
(106, 2918, 3, 'Kathy V. Crofoot', 'KathyVCrofoot@rhyta.com', 'Maxine T. Baumgardner', '3581 County Line Road, New Port Richey, FL 34652', 9.4, 'Deliered', 'ADXZ5667', '2024-01-16', 4, 2);

insert into Courier values
(107, 9116, 3, 'Michelle T. Hanna', '965 Broadway Street, Bluffton, SC 29910', 'Alex Greens', '356 J Woods, City Q', 4.0, 'Delivered', 'ZKEF5783', '2024-01-15', 2, 1);

UPDATE courier
SET senderaddress = '510 Glendale Avenue, Los Angeles, CA 90017'
WHERE courierid=106;

UPDATE courier
SET status = 'Delivered'
WHERE courierid=106;

select * from Courier;

-- 3) Courier Services Table

create table CourierServices(ServiceID int primary key,
  ServiceName varchar(100),
  Cost decimal(8,2)
  );

-- Insert sample data into Courier Services table
drop table courierservices;
insert into CourierServices values(1, 'Standard Delivery', 500),
(2, 'Overnight Delivery', 800),
(3, 'Express Delivery', 1400),
(4, 'Same-Day Delivery', 1200),
(5, 'International Shipping', 1500);

select * from CourierServices;

UPDATE courierservices
SET cost = 1700
WHERE serviceid = 5;

-- 4) Employee Table

create table EmployeeTable(EmployeeID int primary key,
  Name varchar(255),
  Email varchar(255) unique,
  ContactNumber varchar(20),
  Role varchar(50),
  Salary decimal(10, 2)
  );

-- Insert sample data into Employee table

insert into EmployeeTable values(1, 'Nelson H. Kersey', 'NelsonHKersey@armyspy.com', '662-989-2834', 'Manager', 82000.00),
(2, 'Shannon E. Carlson', 'ShannonECarlson@teleworm.us', '513-387-3984', 'HR', 55000.00),
(3, 'John K. Johnson', 'JohnKJohnson@dayrep.com', '505-738-4896', 'Sales Representative', 45000.00),
(4, 'Linda D. Christianson', 'LindaDChristianson@armyspy.com', '818-323-0392', 'IT Specialist', 60000.00),
(5, 'Allen L. West', 'AllenLWest@armyspy.com', '313-630-7095', 'Customer Support Specialist', 40000.00);
insert into EmployeeTable values(6, 'Sam Johnson', 'SJhonson@gmail.com', '746-298-4655', 'Sales Representative', 45000.00);
select * from EmployeeTable;

-- 5) Location Table

create table LocationTable(LocationID int primary key,
  LocationName varchar(100),
  Address text
  );
  
  -- Insert sample data into Location table
  
insert into LocationTable values(1, 'Office A', '123 Main Street, Cityville'),
    (2, 'Warehouse B', '456 Oak Avenue, Townsville'),
    (3, 'Store C', '789 Pine Road, Villagetown');


select * from LocationTable;
  
CREATE TABLE OrderTable (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    CustomerAddress TEXT,
    ItemDescription TEXT,
    CourierID INT,
    OrderDate DATE,
    CONSTRAINT fk_Courier_Order FOREIGN KEY (CourierID) REFERENCES Courier(CourierID)
);
drop table ordertable;
 insert into OrderTable (OrderID, CustomerName, CustomerAddress, ItemDescription, CourierID, OrderDate)
 values
 (1, 'Arthur A. Jessie', '1204 Coventry Court, Baton Rouge, LA 70806', 'Electronics', 101, '2024-01-16'),
 (2, 'Michelle T. Hanna', '965 Broadway Street, Bluffton, SC 29910', 'Toys', 102, '2024-01-10'),
 (3, 'Lillian B. Ahlers', '507 Colonial Drive, Bryan, TX 77803', 'Books', 103, '2024-01-16'),
 (4, 'Jackie D. Ewing', '3806 Fire Access Road, Coleridge, NC 27234', 'Electronics', 104, '2024-01-12'),
 (5, 'Sharon John Schneider', '367 Freedom Lane, Stockton, CA 95204', 'Clothes', 105, '2024-01-10');
 
 insert into OrderTable (OrderID, CustomerName, CustomerAddress, ItemDescription, CourierID, OrderDate)
 values
 (6, 'Kathy V. Crofoot', '510 Glendale Avenue, Los Angeles, CA 90017', 'Fragile and Costly', 106, '2024-01-01');
 
 select * from ordertable;

-- 6) Payment Table
  
create table PaymentTable(PaymentID int primary key,
  CourierID int,
  LocationID int,
  Amount decimal(10, 2),
  PaymentDate date,
  foreign key (CourierID) references Courier(CourierID),
  foreign key (LocationID) references LocationTable(LocationID)
  );
drop table paymenttable;
-- Insert sample data into Payment table

INSERT INTO PaymentTable (PaymentID, CourierID, LocationID, Amount, PaymentDate)
VALUES
(1, 101, 3, 1200, '2024-01-16'),
(2, 102, 1, 500, '2024-01-07'),
(3, 103, 2, 800, '2024-01-14'),
(4, 104, 1, 1200, '2024-01-12'),
(5, 105, 2, 1400, '2024-01-10');

INSERT INTO PaymentTable (PaymentID, CourierID, LocationID, Amount, PaymentDate)
VALUES
(6, 106, 2, 1700, '2024-01-16');

select * from paymenttable;

