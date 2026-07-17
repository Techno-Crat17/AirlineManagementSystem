-- Airline Management System Database Setup
-- Create the database
CREATE DATABASE IF NOT EXISTS airlinemanagementsystem;
USE airlinemanagementsystem;

-- 1. Create login table
CREATE TABLE IF NOT EXISTS login (
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

-- Insert default admin user
INSERT INTO login (username, password) VALUES ('admin', 'admin') 
ON DUPLICATE KEY UPDATE password='admin';

-- 2. Create passenger table
CREATE TABLE IF NOT EXISTS passenger (
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(250) NOT NULL,
    aadhar VARCHAR(30) NOT NULL PRIMARY KEY,
    gender VARCHAR(20) NOT NULL
);

-- 3. Create flight table
CREATE TABLE IF NOT EXISTS flight (
    f_code VARCHAR(20) NOT NULL PRIMARY KEY,
    f_name VARCHAR(50) NOT NULL,
    source VARCHAR(50) NOT NULL,
    destination VARCHAR(50) NOT NULL
);

-- Insert initial flight data
INSERT INTO flight (f_code, f_name, source, destination) VALUES
('AI-101', 'Air India', 'Delhi', 'Mumbai'),
('AI-102', 'Air India', 'Mumbai', 'Delhi'),
('AI-103', 'Air India', 'Delhi', 'Bangalore'),
('AI-104', 'Air India', 'Bangalore', 'Delhi'),
('AI-105', 'Air India', 'Kolkata', 'Delhi'),
('AI-106', 'Air India', 'Delhi', 'Kolkata'),
('6E-201', 'IndiGo', 'Mumbai', 'Bangalore'),
('6E-202', 'IndiGo', 'Bangalore', 'Mumbai'),
('6E-203', 'IndiGo', 'Chennai', 'Mumbai'),
('6E-204', 'IndiGo', 'Mumbai', 'Chennai'),
('SG-301', 'SpiceJet', 'Delhi', 'Goa'),
('SG-302', 'SpiceJet', 'Goa', 'Delhi');

-- 4. Create reservation table
CREATE TABLE IF NOT EXISTS reservation (
    PNR VARCHAR(20) NOT NULL PRIMARY KEY,
    ticket VARCHAR(20) NOT NULL,
    aadhar VARCHAR(30) NOT NULL,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    flightname VARCHAR(50) NOT NULL,
    flightcode VARCHAR(20) NOT NULL,
    src VARCHAR(50) NOT NULL,
    des VARCHAR(50) NOT NULL,
    ddate VARCHAR(30) NOT NULL
);

-- 5. Create cancel table
CREATE TABLE IF NOT EXISTS cancel (
    pnr VARCHAR(20) NOT NULL,
    name VARCHAR(100) NOT NULL,
    cancelno VARCHAR(20) NOT NULL,
    fcode VARCHAR(20) NOT NULL,
    date VARCHAR(30) NOT NULL
);
USE airlinemanagementsystem;
-- Disable checks temporarily to load data quickly
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE flight;
TRUNCATE TABLE passenger;
TRUNCATE TABLE reservation;
TRUNCATE TABLE cancel;

-- 1. Insert flights (Fully Connected Network of 11 Cities = 110 Flights)
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-100', 'Air India', 'Mumbai', 'Delhi');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-101', 'IndiGo', 'Mumbai', 'Pune');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-102', 'SpiceJet', 'Mumbai', 'Chennai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-103', 'Akasa Air', 'Mumbai', 'Ahmedabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-104', 'Vistara', 'Mumbai', 'Goa');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-105', 'Air India', 'Mumbai', 'Patna');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-106', 'IndiGo', 'Mumbai', 'Kolkata');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-107', 'SpiceJet', 'Mumbai', 'Hyderabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-108', 'Akasa Air', 'Mumbai', 'Bangalore');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-109', 'Vistara', 'Mumbai', 'Jaipur');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-110', 'Air India', 'Delhi', 'Mumbai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-111', 'IndiGo', 'Delhi', 'Pune');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-112', 'SpiceJet', 'Delhi', 'Chennai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-113', 'Akasa Air', 'Delhi', 'Ahmedabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-114', 'Vistara', 'Delhi', 'Goa');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-115', 'Air India', 'Delhi', 'Patna');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-116', 'IndiGo', 'Delhi', 'Kolkata');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-117', 'SpiceJet', 'Delhi', 'Hyderabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-118', 'Akasa Air', 'Delhi', 'Bangalore');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-119', 'Vistara', 'Delhi', 'Jaipur');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-120', 'Air India', 'Pune', 'Mumbai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-121', 'IndiGo', 'Pune', 'Delhi');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-122', 'SpiceJet', 'Pune', 'Chennai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-123', 'Akasa Air', 'Pune', 'Ahmedabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-124', 'Vistara', 'Pune', 'Goa');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-125', 'Air India', 'Pune', 'Patna');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-126', 'IndiGo', 'Pune', 'Kolkata');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-127', 'SpiceJet', 'Pune', 'Hyderabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-128', 'Akasa Air', 'Pune', 'Bangalore');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-129', 'Vistara', 'Pune', 'Jaipur');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-130', 'Air India', 'Chennai', 'Mumbai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-131', 'IndiGo', 'Chennai', 'Delhi');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-132', 'SpiceJet', 'Chennai', 'Pune');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-133', 'Akasa Air', 'Chennai', 'Ahmedabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-134', 'Vistara', 'Chennai', 'Goa');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-135', 'Air India', 'Chennai', 'Patna');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-136', 'IndiGo', 'Chennai', 'Kolkata');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-137', 'SpiceJet', 'Chennai', 'Hyderabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-138', 'Akasa Air', 'Chennai', 'Bangalore');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-139', 'Vistara', 'Chennai', 'Jaipur');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-140', 'Air India', 'Ahmedabad', 'Mumbai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-141', 'IndiGo', 'Ahmedabad', 'Delhi');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-142', 'SpiceJet', 'Ahmedabad', 'Pune');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-143', 'Akasa Air', 'Ahmedabad', 'Chennai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-144', 'Vistara', 'Ahmedabad', 'Goa');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-145', 'Air India', 'Ahmedabad', 'Patna');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-146', 'IndiGo', 'Ahmedabad', 'Kolkata');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-147', 'SpiceJet', 'Ahmedabad', 'Hyderabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-148', 'Akasa Air', 'Ahmedabad', 'Bangalore');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-149', 'Vistara', 'Ahmedabad', 'Jaipur');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-150', 'Air India', 'Goa', 'Mumbai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-151', 'IndiGo', 'Goa', 'Delhi');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-152', 'SpiceJet', 'Goa', 'Pune');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-153', 'Akasa Air', 'Goa', 'Chennai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-154', 'Vistara', 'Goa', 'Ahmedabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-155', 'Air India', 'Goa', 'Patna');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-156', 'IndiGo', 'Goa', 'Kolkata');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-157', 'SpiceJet', 'Goa', 'Hyderabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-158', 'Akasa Air', 'Goa', 'Bangalore');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-159', 'Vistara', 'Goa', 'Jaipur');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-160', 'Air India', 'Patna', 'Mumbai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-161', 'IndiGo', 'Patna', 'Delhi');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-162', 'SpiceJet', 'Patna', 'Pune');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-163', 'Akasa Air', 'Patna', 'Chennai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-164', 'Vistara', 'Patna', 'Ahmedabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-165', 'Air India', 'Patna', 'Goa');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-166', 'IndiGo', 'Patna', 'Kolkata');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-167', 'SpiceJet', 'Patna', 'Hyderabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-168', 'Akasa Air', 'Patna', 'Bangalore');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-169', 'Vistara', 'Patna', 'Jaipur');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-170', 'Air India', 'Kolkata', 'Mumbai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-171', 'IndiGo', 'Kolkata', 'Delhi');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-172', 'SpiceJet', 'Kolkata', 'Pune');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-173', 'Akasa Air', 'Kolkata', 'Chennai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-174', 'Vistara', 'Kolkata', 'Ahmedabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-175', 'Air India', 'Kolkata', 'Goa');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-176', 'IndiGo', 'Kolkata', 'Patna');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-177', 'SpiceJet', 'Kolkata', 'Hyderabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-178', 'Akasa Air', 'Kolkata', 'Bangalore');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-179', 'Vistara', 'Kolkata', 'Jaipur');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-180', 'Air India', 'Hyderabad', 'Mumbai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-181', 'IndiGo', 'Hyderabad', 'Delhi');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-182', 'SpiceJet', 'Hyderabad', 'Pune');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-183', 'Akasa Air', 'Hyderabad', 'Chennai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-184', 'Vistara', 'Hyderabad', 'Ahmedabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-185', 'Air India', 'Hyderabad', 'Goa');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-186', 'IndiGo', 'Hyderabad', 'Patna');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-187', 'SpiceJet', 'Hyderabad', 'Kolkata');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-188', 'Akasa Air', 'Hyderabad', 'Bangalore');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-189', 'Vistara', 'Hyderabad', 'Jaipur');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-190', 'Air India', 'Bangalore', 'Mumbai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-191', 'IndiGo', 'Bangalore', 'Delhi');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-192', 'SpiceJet', 'Bangalore', 'Pune');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-193', 'Akasa Air', 'Bangalore', 'Chennai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-194', 'Vistara', 'Bangalore', 'Ahmedabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-195', 'Air India', 'Bangalore', 'Goa');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-196', 'IndiGo', 'Bangalore', 'Patna');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-197', 'SpiceJet', 'Bangalore', 'Kolkata');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-198', 'Akasa Air', 'Bangalore', 'Hyderabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-199', 'Vistara', 'Bangalore', 'Jaipur');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-200', 'Air India', 'Jaipur', 'Mumbai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-201', 'IndiGo', 'Jaipur', 'Delhi');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-202', 'SpiceJet', 'Jaipur', 'Pune');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-203', 'Akasa Air', 'Jaipur', 'Chennai');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-204', 'Vistara', 'Jaipur', 'Ahmedabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('AI-205', 'Air India', 'Jaipur', 'Goa');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('6E-206', 'IndiGo', 'Jaipur', 'Patna');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('SG-207', 'SpiceJet', 'Jaipur', 'Kolkata');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('QP-208', 'Akasa Air', 'Jaipur', 'Hyderabad');
INSERT INTO flight (f_code, f_name, source, destination) VALUES ('UK-209', 'Vistara', 'Jaipur', 'Bangalore');


-- 2. Insert passengers
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Emily Rao', 'British', '1354278498', '9, Lane 18, Kolkata', '124118244935', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Emily Malhotra', 'Canadian', '4016400524', '166, Lane 15, Ahmedabad', '680112805982', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Sunita Singh', 'British', '5053315869', '768, Lane 5, Chennai', '226025634216', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Ravi Jones', 'American', '7543303654', '886, Lane 3, Kolkata', '586850142940', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Divya Deshmukh', 'British', '5698169340', '726, Lane 14, Delhi', '883561595148', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Pooja Choudhury', 'Canadian', '4823662994', '416, Lane 18, Delhi', '443699577738', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('John Mehta', 'British', '8951343320', '48, Lane 8, Pune', '917693676320', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Siddharth Jones', 'American', '8708317278', '573, Lane 20, Goa', '798687277434', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Michael Garcia', 'Canadian', '1434558122', '237, Lane 13, Bangalore', '316658760366', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Madhav Patel', 'Indian', '6272046537', '335, Lane 11, Hyderabad', '464170805310', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Michael Williams', 'Indian', '9232719374', '786, Lane 12, Bangalore', '991241904966', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Anjali Bansal', 'American', '1491905865', '71, Lane 17, Patna', '506716572628', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Harish Bahl', 'Canadian', '7694531473', '769, Lane 15, Jaipur', '965075273545', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Kunal Deshmukh', 'Australian', '5574443135', '123, Lane 18, Bangalore', '337498941343', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Mary Wilson', 'Indian', '8240084271', '894, Lane 1, Jaipur', '477752047116', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Anjali Anand', 'Indian', '2294131869', '611, Lane 20, Chennai', '867749649909', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('James Brown', 'British', '1232812067', '706, Lane 20, Pune', '403447134936', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Geeta Jones', 'American', '4210249947', '128, Lane 15, Kolkata', '648877190659', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Rajesh Mehta', 'American', '9904902787', '939, Lane 9, Bangalore', '967175655125', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Sanjay Rodriguez', 'Canadian', '8071545168', '845, Lane 1, Patna', '876038597703', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Kiran Rao', 'British', '7710932480', '566, Lane 14, Mumbai', '317127484677', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Kabir Grover', 'American', '6398214658', '274, Lane 1, Kolkata', '499727875588', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('William Patel', 'Indian', '5045562386', '580, Lane 6, Bangalore', '219693792374', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Emily Sharma', 'Canadian', '4821759464', '468, Lane 10, Chennai', '671369594406', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Amit Anand', 'Indian', '9743953394', '695, Lane 5, Patna', '104709521456', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('David Rao', 'Australian', '5884247451', '480, Lane 3, Bangalore', '368516048175', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Manish Reddy', 'British', '1370985931', '651, Lane 15, Kolkata', '612004711382', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Kabir Das', 'Australian', '6926179640', '707, Lane 12, Chennai', '773515850643', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Kabir Mehta', 'American', '9005329318', '213, Lane 19, Chennai', '352904228421', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Sunita Sharma', 'British', '3950240268', '117, Lane 3, Pune', '758917839084', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Rajesh Kumar', 'Canadian', '6617711592', '68, Lane 5, Kolkata', '998569847896', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Neha Grover', 'American', '6736576615', '438, Lane 11, Patna', '452711116152', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Manish Grover', 'Australian', '5165604945', '107, Lane 19, Ahmedabad', '327315851493', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Kiran Mittal', 'Australian', '8094024455', '7, Lane 6, Bangalore', '961201836675', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Sneha Wilson', 'British', '9910229014', '454, Lane 14, Pune', '976438156149', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Rohan Singh', 'Canadian', '7715969664', '415, Lane 1, Goa', '297516136968', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Rohan Wilson', 'British', '3521818835', '360, Lane 5, Chennai', '124329212779', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Madhav Mittal', 'British', '5271774490', '361, Lane 17, Mumbai', '477005411998', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Kabir Bansal', 'Australian', '8793597820', '106, Lane 11, Mumbai', '820377889255', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Aditya Kulkarni', 'British', '9051518644', '742, Lane 20, Bangalore', '519254629148', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Karan Rao', 'Australian', '1685054235', '971, Lane 16, Chennai', '322141888059', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Divya Reddy', 'American', '2292706537', '626, Lane 10, Pune', '383473597746', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('John Williams', 'Australian', '2407581814', '86, Lane 6, Kolkata', '782613750606', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Michael Reddy', 'Indian', '5305152204', '940, Lane 16, Bangalore', '779010432898', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Neha Rodriguez', 'American', '4103697117', '612, Lane 18, Delhi', '893246095396', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Suresh Sethi', 'British', '1888880670', '651, Lane 13, Goa', '405153195205', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Mary Menon', 'Canadian', '2217043030', '324, Lane 10, Ahmedabad', '687403450541', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Siddharth Rao', 'Canadian', '6527758416', '81, Lane 14, Jaipur', '284511544796', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Aisha Sen', 'Canadian', '9596401658', '696, Lane 6, Delhi', '297021355690', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Aisha Das', 'British', '7192856543', '984, Lane 4, Delhi', '278681447394', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('David Verma', 'American', '1727155188', '298, Lane 10, Bangalore', '258313237058', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Kabir Grover', 'American', '9114678669', '76, Lane 5, Goa', '177852892268', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Neha Sethi', 'American', '4225358414', '202, Lane 18, Kolkata', '249818299229', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Madhav Singh', 'Indian', '1094396907', '911, Lane 18, Kolkata', '473647102767', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('James Bose', 'Australian', '2555625881', '327, Lane 8, Pune', '147321046963', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Arjun Anand', 'British', '3278774701', '968, Lane 13, Ahmedabad', '733950047974', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Vikram Deshmukh', 'American', '4565060983', '372, Lane 18, Kolkata', '168784991216', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Karan Grover', 'British', '2398680002', '731, Lane 11, Pune', '872982595269', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Harish Reddy', 'American', '7569245937', '423, Lane 7, Hyderabad', '897028385786', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Mary Menon', 'Australian', '5854973348', '306, Lane 8, Kolkata', '437575844198', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Rohan Sen', 'American', '4041574733', '848, Lane 18, Kolkata', '842199330833', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Vikram Kulkarni', 'British', '7120826773', '775, Lane 10, Goa', '401938026206', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Mary Rodriguez', 'Indian', '8499154788', '911, Lane 5, Ahmedabad', '743152742054', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Mary Mittal', 'Canadian', '6851612275', '959, Lane 8, Delhi', '463745499045', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Rahul Verma', 'Canadian', '4268414593', '225, Lane 5, Pune', '279568783391', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Anita Das', 'Indian', '9108839822', '336, Lane 17, Pune', '139718707286', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Madhav Kumar', 'Australian', '7406403910', '434, Lane 12, Mumbai', '801704622656', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Aditya Reddy', 'Indian', '8251286823', '855, Lane 1, Delhi', '478686337524', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Arjun Anand', 'Australian', '5342836440', '571, Lane 19, Bangalore', '687056856624', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Mary Bahl', 'Canadian', '3342708668', '543, Lane 5, Hyderabad', '343517518304', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Divya Goel', 'Indian', '1398373540', '217, Lane 7, Mumbai', '739363854678', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('William Davis', 'British', '8771753556', '47, Lane 19, Chennai', '204899642353', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Madhav Miller', 'Canadian', '8547772522', '738, Lane 18, Pune', '280801006231', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Deepak Miller', 'American', '9845461567', '579, Lane 8, Chennai', '410166687002', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Sanjay Deshmukh', 'British', '9180339740', '947, Lane 3, Patna', '489025039261', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('John Anand', 'American', '9685621850', '101, Lane 14, Chennai', '159996504773', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Kiran Reddy', 'Canadian', '2961943114', '158, Lane 13, Patna', '265511047541', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Suresh Johnson', 'Canadian', '7888610158', '96, Lane 20, Jaipur', '560466183982', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('John Rao', 'British', '4472126464', '496, Lane 3, Goa', '437993712406', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Harish Reddy', 'British', '7569245937', '322, Lane 6, Hyderabad', '547935646519', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Manish Bahl', 'American', '8073741672', '649, Lane 10, Chennai', '426617979688', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Geeta Singh', 'British', '8911352909', '661, Lane 13, Goa', '610143888993', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Sneha Rao', 'Canadian', '9825071461', '119, Lane 5, Goa', '457387571775', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('William Singh', 'Indian', '9512382825', '437, Lane 15, Chennai', '622660937966', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('James Brown', 'British', '1232812067', '269, Lane 16, Ahmedabad', '596969155792', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Harish Bansal', 'Indian', '2513412528', '398, Lane 14, Jaipur', '296627828274', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Mary Choudhury', 'Canadian', '9050723688', '669, Lane 16, Hyderabad', '767721903404', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Suresh Pillai', 'Indian', '3395962923', '834, Lane 7, Delhi', '958498254494', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Sunita Kulkarni', 'Indian', '4223253672', '592, Lane 9, Patna', '667116845775', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Suresh Menon', 'British', '1863637454', '346, Lane 18, Jaipur', '297500170127', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Amit Deshmukh', 'American', '2424154152', '54, Lane 13, Patna', '436110371293', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Amit Sharma', 'British', '1627136111', '321, Lane 12, Kolkata', '262218909275', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Deepak Kulkarni', 'Australian', '7311219656', '323, Lane 5, Chennai', '413899940438', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Rohan Rodriguez', 'Indian', '3761379180', '370, Lane 11, Bangalore', '696582710910', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('James Singh', 'Indian', '6848666188', '631, Lane 5, Kolkata', '141832856914', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Michael Kumar', 'American', '1617990421', '13, Lane 5, Delhi', '275884252410', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Siddharth Garcia', 'Australian', '1491778507', '880, Lane 19, Bangalore', '524191380003', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Ravi Das', 'Canadian', '2208635365', '278, Lane 3, Jaipur', '518023806174', 'Female');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Arjun Mehta', 'Australian', '7053494937', '378, Lane 19, Pune', '383206038505', 'Male');
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('Aditya Wilson', 'Indian', '3836702410', '944, Lane 8, Ahmedabad', '657191826199', 'Male');

-- 3. Insert reservations
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100000', 'TIC-1000', '124118244935', 'Emily Rao', 'British', 'SpiceJet', 'SG-345', 'Delhi', 'Chennai', '2026-06-14');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100001', 'TIC-1001', '680112805982', 'Emily Malhotra', 'Canadian', 'Akasa Air', 'QP-750', 'Bangalore', 'Ahmedabad', '2026-06-19');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100002', 'TIC-1002', '226025634216', 'Sunita Singh', 'British', 'SpiceJet', 'SG-963', 'Delhi', 'Chennai', '2026-06-20');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100003', 'TIC-1003', '586850142940', 'Ravi Jones', 'American', 'IndiGo', '6E-619', 'Mumbai', 'Kolkata', '2026-06-20');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100004', 'TIC-1004', '883561595148', 'Divya Deshmukh', 'British', 'Akasa Air', 'QP-508', 'Goa', 'Chennai', '2026-06-24');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100005', 'TIC-1005', '443699577738', 'Pooja Choudhury', 'Canadian', 'Air India', 'AI-924', 'Goa', 'Hyderabad', '2026-06-17');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100006', 'TIC-1006', '917693676320', 'John Mehta', 'British', 'Akasa Air', 'QP-127', 'Goa', 'Delhi', '2026-06-16');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100007', 'TIC-1007', '798687277434', 'Siddharth Jones', 'American', 'SpiceJet', 'SG-259', 'Jaipur', 'Delhi', '2026-06-28');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100008', 'TIC-1008', '316658760366', 'Michael Garcia', 'Canadian', 'Akasa Air', 'QP-384', 'Pune', 'Delhi', '2026-06-14');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100009', 'TIC-1009', '464170805310', 'Madhav Patel', 'Indian', 'Akasa Air', 'QP-384', 'Pune', 'Delhi', '2026-06-15');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100010', 'TIC-1010', '991241904966', 'Michael Williams', 'Indian', 'Air India', 'AI-878', 'Ahmedabad', 'Bangalore', '2026-06-24');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100011', 'TIC-1011', '506716572628', 'Anjali Bansal', 'American', 'Akasa Air', 'QP-508', 'Goa', 'Chennai', '2026-06-23');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100012', 'TIC-1012', '965075273545', 'Harish Bahl', 'Canadian', 'IndiGo', '6E-814', 'Ahmedabad', 'Delhi', '2026-06-27');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100013', 'TIC-1013', '337498941343', 'Kunal Deshmukh', 'Australian', 'Akasa Air', 'QP-579', 'Ahmedabad', 'Kolkata', '2026-06-16');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100014', 'TIC-1014', '477752047116', 'Mary Wilson', 'Indian', 'Air India', 'AI-878', 'Ahmedabad', 'Bangalore', '2026-06-19');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100015', 'TIC-1015', '867749649909', 'Anjali Anand', 'Indian', 'IndiGo', '6E-371', 'Ahmedabad', 'Jaipur', '2026-06-18');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100016', 'TIC-1016', '403447134936', 'James Brown', 'British', 'IndiGo', '6E-814', 'Ahmedabad', 'Delhi', '2026-06-12');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100017', 'TIC-1017', '648877190659', 'Geeta Jones', 'American', 'Air India', 'AI-489', 'Mumbai', 'Goa', '2026-06-19');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100018', 'TIC-1018', '967175655125', 'Rajesh Mehta', 'American', 'Air India', 'AI-709', 'Mumbai', 'Chennai', '2026-06-29');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100019', 'TIC-1019', '876038597703', 'Sanjay Rodriguez', 'Canadian', 'Akasa Air', 'QP-532', 'Chennai', 'Delhi', '2026-06-16');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100020', 'TIC-1020', '317127484677', 'Kiran Rao', 'British', 'IndiGo', '6E-621', 'Pune', 'Mumbai', '2026-06-14');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100021', 'TIC-1021', '499727875588', 'Kabir Grover', 'American', 'Akasa Air', 'QP-529', 'Hyderabad', 'Delhi', '2026-06-17');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100022', 'TIC-1022', '219693792374', 'William Patel', 'Indian', 'Akasa Air', 'QP-579', 'Ahmedabad', 'Kolkata', '2026-06-22');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100023', 'TIC-1023', '671369594406', 'Emily Sharma', 'Canadian', 'Akasa Air', 'QP-325', 'Delhi', 'Mumbai', '2026-06-11');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100024', 'TIC-1024', '104709521456', 'Amit Anand', 'Indian', 'Akasa Air', 'QP-853', 'Ahmedabad', 'Delhi', '2026-06-19');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100025', 'TIC-1025', '368516048175', 'David Rao', 'Australian', 'SpiceJet', 'SG-963', 'Delhi', 'Chennai', '2026-06-15');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100026', 'TIC-1026', '612004711382', 'Manish Reddy', 'British', 'Air India', 'AI-792', 'Bangalore', 'Delhi', '2026-06-22');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100027', 'TIC-1027', '773515850643', 'Kabir Das', 'Australian', 'Air India', 'AI-878', 'Ahmedabad', 'Bangalore', '2026-06-27');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100028', 'TIC-1028', '352904228421', 'Kabir Mehta', 'American', 'IndiGo', '6E-785', 'Goa', 'Chennai', '2026-06-27');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100029', 'TIC-1029', '758917839084', 'Sunita Sharma', 'British', 'IndiGo', '6E-267', 'Pune', 'Hyderabad', '2026-06-13');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100030', 'TIC-1030', '998569847896', 'Rajesh Kumar', 'Canadian', 'IndiGo', '6E-371', 'Ahmedabad', 'Jaipur', '2026-06-13');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100031', 'TIC-1031', '452711116152', 'Neha Grover', 'American', 'SpiceJet', 'SG-259', 'Jaipur', 'Delhi', '2026-06-13');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100032', 'TIC-1032', '327315851493', 'Manish Grover', 'Australian', 'SpiceJet', 'SG-350', 'Mumbai', 'Delhi', '2026-06-11');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100033', 'TIC-1033', '961201836675', 'Kiran Mittal', 'Australian', 'Air India', 'AI-650', 'Chennai', 'Ahmedabad', '2026-06-17');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100034', 'TIC-1034', '976438156149', 'Sneha Wilson', 'British', 'Vistara', 'UK-448', 'Delhi', 'Jaipur', '2026-06-16');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100035', 'TIC-1035', '297516136968', 'Rohan Singh', 'Canadian', 'Akasa Air', 'QP-723', 'Chennai', 'Bangalore', '2026-06-21');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100036', 'TIC-1036', '124329212779', 'Rohan Wilson', 'British', 'SpiceJet', 'SG-158', 'Delhi', 'Jaipur', '2026-06-30');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100037', 'TIC-1037', '477005411998', 'Madhav Mittal', 'British', 'Vistara', 'UK-160', 'Bangalore', 'Hyderabad', '2026-06-12');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100038', 'TIC-1038', '820377889255', 'Kabir Bansal', 'Australian', 'Air India', 'AI-512', 'Goa', 'Mumbai', '2026-06-28');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100039', 'TIC-1039', '519254629148', 'Aditya Kulkarni', 'British', 'SpiceJet', 'SG-963', 'Delhi', 'Chennai', '2026-06-12');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100040', 'TIC-1040', '322141888059', 'Karan Rao', 'Australian', 'IndiGo', '6E-242', 'Delhi', 'Bangalore', '2026-06-12');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100041', 'TIC-1041', '383473597746', 'Divya Reddy', 'American', 'Air India', 'AI-777', 'Chennai', 'Kolkata', '2026-06-30');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100042', 'TIC-1042', '782613750606', 'John Williams', 'Australian', 'Akasa Air', 'QP-180', 'Mumbai', 'Pune', '2026-06-14');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100043', 'TIC-1043', '779010432898', 'Michael Reddy', 'Indian', 'Akasa Air', 'QP-529', 'Hyderabad', 'Delhi', '2026-06-20');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100044', 'TIC-1044', '893246095396', 'Neha Rodriguez', 'American', 'IndiGo', '6E-814', 'Ahmedabad', 'Delhi', '2026-06-11');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100045', 'TIC-1045', '405153195205', 'Suresh Sethi', 'British', 'IndiGo', '6E-371', 'Ahmedabad', 'Jaipur', '2026-06-11');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100046', 'TIC-1046', '687403450541', 'Mary Menon', 'Canadian', 'SpiceJet', 'SG-718', 'Kolkata', 'Delhi', '2026-06-28');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100047', 'TIC-1047', '284511544796', 'Siddharth Rao', 'Canadian', 'SpiceJet', 'SG-345', 'Delhi', 'Chennai', '2026-06-22');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100048', 'TIC-1048', '297021355690', 'Aisha Sen', 'Canadian', 'IndiGo', '6E-330', 'Mumbai', 'Goa', '2026-06-10');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100049', 'TIC-1049', '278681447394', 'Aisha Das', 'British', 'Air India', 'AI-400', 'Hyderabad', 'Bangalore', '2026-06-23');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100050', 'TIC-1050', '258313237058', 'David Verma', 'American', 'Vistara', 'UK-649', 'Mumbai', 'Hyderabad', '2026-06-21');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100051', 'TIC-1051', '177852892268', 'Kabir Grover', 'American', 'Vistara', 'UK-384', 'Pune', 'Goa', '2026-06-15');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100052', 'TIC-1052', '249818299229', 'Neha Sethi', 'American', 'SpiceJet', 'SG-167', 'Chennai', 'Jaipur', '2026-06-18');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100053', 'TIC-1053', '473647102767', 'Madhav Singh', 'Indian', 'Air India', 'AI-878', 'Ahmedabad', 'Bangalore', '2026-06-14');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100054', 'TIC-1054', '147321046963', 'James Bose', 'Australian', 'Akasa Air', 'QP-189', 'Delhi', 'Chennai', '2026-06-29');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100055', 'TIC-1055', '733950047974', 'Arjun Anand', 'British', 'Air India', 'AI-767', 'Ahmedabad', 'Delhi', '2026-06-29');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100056', 'TIC-1056', '168784991216', 'Vikram Deshmukh', 'American', 'IndiGo', '6E-267', 'Pune', 'Hyderabad', '2026-06-30');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100057', 'TIC-1057', '872982595269', 'Karan Grover', 'British', 'Vistara', 'UK-758', 'Pune', 'Bangalore', '2026-06-25');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100058', 'TIC-1058', '897028385786', 'Harish Reddy', 'American', 'SpiceJet', 'SG-880', 'Bangalore', 'Ahmedabad', '2026-06-27');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100059', 'TIC-1059', '437575844198', 'Mary Menon', 'Australian', 'SpiceJet', 'SG-508', 'Patna', 'Goa', '2026-06-11');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100060', 'TIC-1060', '842199330833', 'Rohan Sen', 'American', 'Akasa Air', 'QP-529', 'Hyderabad', 'Delhi', '2026-06-18');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100061', 'TIC-1061', '401938026206', 'Vikram Kulkarni', 'British', 'Vistara', 'UK-103', 'Kolkata', 'Ahmedabad', '2026-06-14');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100062', 'TIC-1062', '743152742054', 'Mary Rodriguez', 'Indian', 'Akasa Air', 'QP-100', 'Jaipur', 'Goa', '2026-06-16');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100063', 'TIC-1063', '463745499045', 'Mary Mittal', 'Canadian', 'Vistara', 'UK-160', 'Bangalore', 'Hyderabad', '2026-06-26');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100064', 'TIC-1064', '279568783391', 'Rahul Verma', 'Canadian', 'IndiGo', '6E-267', 'Pune', 'Hyderabad', '2026-06-30');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100065', 'TIC-1065', '139718707286', 'Anita Das', 'Indian', 'Akasa Air', 'QP-235', 'Jaipur', 'Patna', '2026-06-10');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100066', 'TIC-1066', '801704622656', 'Madhav Kumar', 'Australian', 'Air India', 'AI-400', 'Hyderabad', 'Bangalore', '2026-06-21');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100067', 'TIC-1067', '478686337524', 'Aditya Reddy', 'Indian', 'SpiceJet', 'SG-508', 'Patna', 'Goa', '2026-06-27');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100068', 'TIC-1068', '687056856624', 'Arjun Anand', 'Australian', 'Vistara', 'UK-629', 'Pune', 'Mumbai', '2026-06-21');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100069', 'TIC-1069', '343517518304', 'Mary Bahl', 'Canadian', 'SpiceJet', 'SG-533', 'Hyderabad', 'Pune', '2026-06-26');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100070', 'TIC-1070', '739363854678', 'Divya Goel', 'Indian', 'IndiGo', '6E-621', 'Pune', 'Mumbai', '2026-06-22');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100071', 'TIC-1071', '204899642353', 'William Davis', 'British', 'Air India', 'AI-924', 'Goa', 'Hyderabad', '2026-06-15');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100072', 'TIC-1072', '280801006231', 'Madhav Miller', 'Canadian', 'Air India', 'AI-792', 'Bangalore', 'Delhi', '2026-06-20');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100073', 'TIC-1073', '410166687002', 'Deepak Miller', 'American', 'Vistara', 'UK-243', 'Hyderabad', 'Bangalore', '2026-06-17');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100074', 'TIC-1074', '489025039261', 'Sanjay Deshmukh', 'British', 'Air India', 'AI-792', 'Bangalore', 'Delhi', '2026-06-18');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100075', 'TIC-1075', '159996504773', 'John Anand', 'American', 'Air India', 'AI-323', 'Kolkata', 'Delhi', '2026-06-25');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100076', 'TIC-1076', '265511047541', 'Kiran Reddy', 'Canadian', 'SpiceJet', 'SG-172', 'Ahmedabad', 'Chennai', '2026-06-21');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100077', 'TIC-1077', '560466183982', 'Suresh Johnson', 'Canadian', 'Vistara', 'UK-736', 'Jaipur', 'Mumbai', '2026-06-28');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100078', 'TIC-1078', '437993712406', 'John Rao', 'British', 'SpiceJet', 'SG-818', 'Patna', 'Mumbai', '2026-06-15');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100079', 'TIC-1079', '547935646519', 'Harish Reddy', 'British', 'IndiGo', '6E-559', 'Delhi', 'Pune', '2026-06-17');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100080', 'TIC-1080', '426617979688', 'Manish Bahl', 'American', 'Akasa Air', 'QP-777', 'Pune', 'Bangalore', '2026-06-17');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100081', 'TIC-1081', '610143888993', 'Geeta Singh', 'British', 'Air India', 'AI-924', 'Goa', 'Hyderabad', '2026-06-27');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100082', 'TIC-1082', '457387571775', 'Sneha Rao', 'Canadian', 'Akasa Air', 'QP-635', 'Goa', 'Kolkata', '2026-06-11');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100083', 'TIC-1083', '622660937966', 'William Singh', 'Indian', 'Vistara', 'UK-423', 'Mumbai', 'Delhi', '2026-06-17');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100084', 'TIC-1084', '596969155792', 'James Brown', 'British', 'Air India', 'AI-789', 'Patna', 'Mumbai', '2026-06-22');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100085', 'TIC-1085', '296627828274', 'Harish Bansal', 'Indian', 'Akasa Air', 'QP-579', 'Ahmedabad', 'Kolkata', '2026-06-15');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100086', 'TIC-1086', '767721903404', 'Mary Choudhury', 'Canadian', 'Vistara', 'UK-649', 'Mumbai', 'Hyderabad', '2026-06-17');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100087', 'TIC-1087', '958498254494', 'Suresh Pillai', 'Indian', 'IndiGo', '6E-296', 'Chennai', 'Ahmedabad', '2026-06-20');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100088', 'TIC-1088', '667116845775', 'Sunita Kulkarni', 'Indian', 'Akasa Air', 'QP-635', 'Goa', 'Kolkata', '2026-06-21');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100089', 'TIC-1089', '297500170127', 'Suresh Menon', 'British', 'IndiGo', '6E-296', 'Chennai', 'Ahmedabad', '2026-06-10');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100090', 'TIC-1090', '436110371293', 'Amit Deshmukh', 'American', 'Air India', 'AI-709', 'Mumbai', 'Chennai', '2026-06-21');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100091', 'TIC-1091', '262218909275', 'Amit Sharma', 'British', 'SpiceJet', 'SG-533', 'Hyderabad', 'Pune', '2026-06-28');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100092', 'TIC-1092', '413899940438', 'Deepak Kulkarni', 'Australian', 'IndiGo', '6E-881', 'Delhi', 'Patna', '2026-06-28');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100093', 'TIC-1093', '696582710910', 'Rohan Rodriguez', 'Indian', 'SpiceJet', 'SG-691', 'Chennai', 'Mumbai', '2026-06-25');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100094', 'TIC-1094', '141832856914', 'James Singh', 'Indian', 'Akasa Air', 'QP-235', 'Jaipur', 'Patna', '2026-06-19');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100095', 'TIC-1095', '275884252410', 'Michael Kumar', 'American', 'Vistara', 'UK-649', 'Mumbai', 'Hyderabad', '2026-06-25');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100096', 'TIC-1096', '524191380003', 'Siddharth Garcia', 'Australian', 'Akasa Air', 'QP-189', 'Delhi', 'Chennai', '2026-06-12');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100097', 'TIC-1097', '518023806174', 'Ravi Das', 'Canadian', 'Air India', 'AI-323', 'Kolkata', 'Delhi', '2026-06-17');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100098', 'TIC-1098', '383206038505', 'Arjun Mehta', 'Australian', 'SpiceJet', 'SG-573', 'Chennai', 'Mumbai', '2026-06-17');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100099', 'TIC-1099', '657191826199', 'Aditya Wilson', 'Indian', 'IndiGo', '6E-242', 'Delhi', 'Bangalore', '2026-06-26');

-- 4. Insert cancellations
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100061', 'Vikram Kulkarni', 'CAN-2000', 'UK-103', '2026-06-14');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100000', 'Emily Rao', 'CAN-2001', 'SG-345', '2026-06-14');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100042', 'John Williams', 'CAN-2002', 'QP-180', '2026-06-14');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100078', 'John Rao', 'CAN-2003', 'SG-818', '2026-06-15');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100025', 'David Rao', 'CAN-2004', 'SG-963', '2026-06-15');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100016', 'James Brown', 'CAN-2005', '6E-814', '2026-06-12');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100043', 'Michael Reddy', 'CAN-2006', 'QP-529', '2026-06-20');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100091', 'Amit Sharma', 'CAN-2007', 'SG-533', '2026-06-28');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100022', 'William Patel', 'CAN-2008', 'QP-579', '2026-06-22');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100041', 'Divya Reddy', 'CAN-2009', 'AI-777', '2026-06-30');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100007', 'Siddharth Jones', 'CAN-2010', 'SG-259', '2026-06-28');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100002', 'Sunita Singh', 'CAN-2011', 'SG-963', '2026-06-20');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100018', 'Rajesh Mehta', 'CAN-2012', 'AI-709', '2026-06-29');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100075', 'John Anand', 'CAN-2013', 'AI-323', '2026-06-25');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100087', 'Suresh Pillai', 'CAN-2014', '6E-296', '2026-06-20');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100014', 'Mary Wilson', 'CAN-2015', 'AI-878', '2026-06-19');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100067', 'Aditya Reddy', 'CAN-2016', 'SG-508', '2026-06-27');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100046', 'Mary Menon', 'CAN-2017', 'SG-718', '2026-06-28');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100009', 'Madhav Patel', 'CAN-2018', 'QP-384', '2026-06-15');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100047', 'Siddharth Rao', 'CAN-2019', 'SG-345', '2026-06-22');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100050', 'David Verma', 'CAN-2020', 'UK-649', '2026-06-21');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100086', 'Mary Choudhury', 'CAN-2021', 'UK-649', '2026-06-17');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100012', 'Harish Bahl', 'CAN-2022', '6E-814', '2026-06-27');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100093', 'Rohan Rodriguez', 'CAN-2023', 'SG-691', '2026-06-25');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100038', 'Kabir Bansal', 'CAN-2024', 'AI-512', '2026-06-28');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100090', 'Amit Deshmukh', 'CAN-2025', 'AI-709', '2026-06-21');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100017', 'Geeta Jones', 'CAN-2026', 'AI-489', '2026-06-19');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100020', 'Kiran Rao', 'CAN-2027', '6E-621', '2026-06-14');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100055', 'Arjun Anand', 'CAN-2028', 'AI-767', '2026-06-29');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100062', 'Mary Rodriguez', 'CAN-2029', 'QP-100', '2026-06-16');

-- Extra mock data to support all complex queries showing outputs
-- Query 2: Multi-airline bookings for Emily Rao and Emily Malhotra
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100100', 'TIC-1100', '124118244935', 'Emily Rao', 'British', 'IndiGo', '6E-242', 'Delhi', 'Bangalore', '2026-06-25');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100101', 'TIC-1101', '680112805982', 'Emily Malhotra', 'Canadian', 'Air India', 'AI-125', 'Delhi', 'Mumbai', '2026-06-26');

-- Query 11: Passenger diversity for flight 6E-267 (adding Indian and Australian passengers)
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100102', 'TIC-1102', '104709521456', 'Amit Anand', 'Indian', 'IndiGo', '6E-267', 'Pune', 'Hyderabad', '2026-06-13');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100103', 'TIC-1103', '337498941343', 'Kunal Deshmukh', 'Australian', 'IndiGo', '6E-267', 'Pune', 'Hyderabad', '2026-06-13');

-- Query 13: Passenger profile and booking history for John Doe
INSERT INTO passenger (name, nationality, phone, address, aadhar, gender) VALUES ('John Doe', 'American', '5551234567', '123, Main St, New York', '111122223333', 'Male');
INSERT INTO reservation (PNR, ticket, aadhar, name, nationality, flightname, flightcode, src, des, ddate) VALUES ('PNR-100104', 'TIC-1104', '111122223333', 'John Doe', 'American', 'Air India', 'AI-125', 'Delhi', 'Mumbai', '2026-06-20');
INSERT INTO cancel (pnr, name, cancelno, fcode, date) VALUES ('PNR-100105', 'John Doe', 'CAN-2100', 'QP-189', '2026-06-15');

SET FOREIGN_KEY_CHECKS = 1;
