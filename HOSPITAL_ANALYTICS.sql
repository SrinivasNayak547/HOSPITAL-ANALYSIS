CREATE DATABASE HOSPITAL_ANALYTICS
USE HOSPITAL_ANALYTICS


-- 1. Departments
--------------------------------------------------
CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    FloorNo INT,
    HeadDoctor VARCHAR(100)
);

--------------------------------------------------
-- 2. Doctors
--------------------------------------------------
CREATE TABLE Doctors
(
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    DepartmentID INT,
    ExperienceYears INT,
    Salary DECIMAL(10,2),
    Phone VARCHAR(15),

    FOREIGN KEY (DepartmentID)
    REFERENCES Departments(DepartmentID)
);

--------------------------------------------------
-- 3. Patients
--------------------------------------------------
CREATE TABLE Patients
(
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    Age INT,
    BloodGroup VARCHAR(5),
    City VARCHAR(100),
    Phone VARCHAR(15)
);

--------------------------------------------------
-- 4. Appointments
--------------------------------------------------
CREATE TABLE Appointments
(
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Status VARCHAR(20),

    FOREIGN KEY (PatientID)
    REFERENCES Patients(PatientID),

    FOREIGN KEY (DoctorID)
    REFERENCES Doctors(DoctorID)
);

--------------------------------------------------
-- 5. Admissions
--------------------------------------------------
CREATE TABLE Admissions
(
    AdmissionID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AdmitDate DATE,
    DischargeDate DATE,
    RoomNo VARCHAR(10),

    FOREIGN KEY (PatientID)
    REFERENCES Patients(PatientID),

    FOREIGN KEY (DoctorID)
    REFERENCES Doctors(DoctorID)
);

--------------------------------------------------
-- 6. Treatments
--------------------------------------------------
CREATE TABLE Treatments
(
    TreatmentID INT PRIMARY KEY,
    AdmissionID INT,
    TreatmentName VARCHAR(100),
    Cost DECIMAL(10,2),

    FOREIGN KEY (AdmissionID)
    REFERENCES Admissions(AdmissionID)
);

--------------------------------------------------
-- 7. Billing
--------------------------------------------------
CREATE TABLE Billing
(
    BillID INT PRIMARY KEY,
    AdmissionID INT,
    TotalAmount DECIMAL(10,2),
    Insurance VARCHAR(10),
    PaidAmount DECIMAL(10,2),
    PaymentStatus VARCHAR(20),

    FOREIGN KEY (AdmissionID)
    REFERENCES Admissions(AdmissionID)
);


INSERT INTO Departments (DepartmentID, DepartmentName, FloorNo, HeadDoctor)
VALUES
(1,'Cardiology',1,'Dr. Rajesh'),
(2,'Neurology',2,'Dr. Priya'),
(3,'Orthopedics',3,'Dr. Kumar'),
(4,'Pediatrics',4,'Dr. Anjali'),
(5,'General Medicine',5,'Dr. Ramesh'),
(6,'Dermatology',2,'Dr. Sneha'),
(7,'ENT',3,'Dr. Arjun'),
(8,'Oncology',4,'Dr. Meera'),
(9,'Nephrology',5,'Dr. Vivek'),
(10,'Pulmonology',1,'Dr. Ravi'),
(11,'Urology',2,'Dr. Suresh'),
(12,'Gastroenterology',3,'Dr. Nisha'),
(13,'Psychiatry',4,'Dr. Deepak'),
(14,'Radiology',5,'Dr. Kavitha'),
(15,'Ophthalmology',1,'Dr. Mahesh'),
(16,'Gynecology',2,'Dr. Lakshmi'),
(17,'Emergency',1,'Dr. Sanjay'),
(18,'ICU',2,'Dr. Swathi'),
(19,'Anesthesiology',3,'Dr. Kiran'),
(20,'Pathology',4,'Dr. Shalini'),
(21,'Physiotherapy',5,'Dr. Rohit'),
(22,'Dental',2,'Dr. Vinod'),
(23,'Plastic Surgery',3,'Dr. Hari'),
(24,'Endocrinology',4,'Dr. Divya'),
(25,'Hematology',5,'Dr. Prakash'),
(26,'Rheumatology',1,'Dr. Sunil'),
(27,'Infectious Diseases',2,'Dr. Rekha'),
(28,'Nutrition',3,'Dr. Pooja'),
(29,'Pain Management',4,'Dr. Ajay'),
(30,'Cardiac Surgery',5,'Dr. Naveen'),
(31,'Neurosurgery',1,'Dr. Siva'),
(32,'Trauma',2,'Dr. Ashok'),
(33,'Burn Unit',3,'Dr. Bhavana'),
(34,'Rehabilitation',4,'Dr. Tejas'),
(35,'Sleep Medicine',5,'Dr. Keerthi'),
(36,'Allergy',1,'Dr. Gopal'),
(37,'Sports Medicine',2,'Dr. Akhil'),
(38,'Transplant',3,'Dr. Chandu'),
(39,'Palliative Care',4,'Dr. Joseph'),
(40,'Clinical Research',5,'Dr. Monica'),
(41,'Forensic Medicine',1,'Dr. Srikanth'),
(42,'Family Medicine',2,'Dr. Bharath'),
(43,'Occupational Health',3,'Dr. Farooq'),
(44,'Community Medicine',4,'Dr. Geetha'),
(45,'Diabetology',5,'Dr. Sandeep'),
(46,'Cosmetology',1,'Dr. Neha'),
(47,'Microbiology',2,'Dr. Usha'),
(48,'Biochemistry',3,'Dr. Vinay'),
(49,'Blood Bank',4,'Dr. Harsha'),
(50,'Medical Records',5,'Dr. Lalitha');



INSERT INTO Doctors
(DoctorID, DoctorName, Gender, DepartmentID, ExperienceYears, Salary, Phone)
VALUES
(101,'Dr. Rajesh Kumar','Male',1,15,180000,'9876500001'),
(102,'Dr. Priya Sharma','Female',2,12,170000,'9876500002'),
(103,'Dr. Amit Verma','Male',3,10,160000,'9876500003'),
(104,'Dr. Sneha Reddy','Female',4,8,150000,'9876500004'),
(105,'Dr. Ramesh Naidu','Male',5,18,200000,'9876500005'),
(106,'Dr. Kavitha Rao','Female',6,9,145000,'9876500006'),
(107,'Dr. Arjun Singh','Male',7,11,155000,'9876500007'),
(108,'Dr. Meera Nair','Female',8,16,210000,'9876500008'),
(109,'Dr. Vivek Patel','Male',9,13,175000,'9876500009'),
(110,'Dr. Ravi Teja','Male',10,14,180000,'9876500010'),
(111,'Dr. Suresh Babu','Male',11,9,150000,'9876500011'),
(112,'Dr. Nisha Gupta','Female',12,10,160000,'9876500012'),
(113,'Dr. Deepak Jain','Male',13,12,170000,'9876500013'),
(114,'Dr. Mahesh Rao','Male',14,15,185000,'9876500014'),
(115,'Dr. Lakshmi Devi','Female',15,8,145000,'9876500015'),
(116,'Dr. Sanjay Kumar','Male',16,17,205000,'9876500016'),
(117,'Dr. Swathi Reddy','Female',17,11,165000,'9876500017'),
(118,'Dr. Kiran Rao','Male',18,14,190000,'9876500018'),
(119,'Dr. Shalini Das','Female',19,9,155000,'9876500019'),
(120,'Dr. Rohit Sharma','Male',20,10,160000,'9876500020'),
(121,'Dr. Vinod Kumar','Male',21,8,145000,'9876500021'),
(122,'Dr. Hari Prasad','Male',22,13,175000,'9876500022'),
(123,'Dr. Divya Rao','Female',23,12,170000,'9876500023'),
(124,'Dr. Prakash Reddy','Male',24,15,185000,'9876500024'),
(125,'Dr. Sunil Kumar','Male',25,11,165000,'9876500025'),
(126,'Dr. Rekha Sharma','Female',26,10,160000,'9876500026'),
(127,'Dr. Pooja Singh','Female',27,9,150000,'9876500027'),
(128,'Dr. Ajay Verma','Male',28,14,180000,'9876500028'),
(129,'Dr. Naveen Rao','Male',29,16,200000,'9876500029'),
(130,'Dr. Siva Kumar','Male',30,18,220000,'9876500030'),
(131,'Dr. Ashok Patel','Male',31,12,170000,'9876500031'),
(132,'Dr. Bhavana Reddy','Female',32,10,160000,'9876500032'),
(133,'Dr. Tejas Rao','Male',33,9,150000,'9876500033'),
(134,'Dr. Keerthi Nair','Female',34,11,165000,'9876500034'),
(135,'Dr. Gopal Krishna','Male',35,13,175000,'9876500035'),
(136,'Dr. Akhil Sharma','Male',36,8,145000,'9876500036'),
(137,'Dr. Chandu Reddy','Male',37,15,185000,'9876500037'),
(138,'Dr. Joseph Mathew','Male',38,17,210000,'9876500038'),
(139,'Dr. Monica Paul','Female',39,12,170000,'9876500039'),
(140,'Dr. Srikanth Rao','Male',40,14,180000,'9876500040'),
(141,'Dr. Bharath Kumar','Male',41,11,165000,'9876500041'),
(142,'Dr. Farooq Ali','Male',42,9,150000,'9876500042'),
(143,'Dr. Geetha Devi','Female',43,10,160000,'9876500043'),
(144,'Dr. Sandeep Reddy','Male',44,13,175000,'9876500044'),
(145,'Dr. Neha Sharma','Female',45,8,145000,'9876500045'),
(146,'Dr. Usha Rao','Female',46,12,170000,'9876500046'),
(147,'Dr. Vinay Kumar','Male',47,10,160000,'9876500047'),
(148,'Dr. Harsha Patel','Male',48,15,185000,'9876500048'),
(149,'Dr. Lalitha Devi','Female',49,11,165000,'9876500049'),
(150,'Dr. Anand Reddy','Male',50,16,200000,'9876500050');


INSERT INTO Patients
(PatientID, PatientName, Gender, Age, BloodGroup, City, Phone)
VALUES
(1001,'Rahul Sharma','Male',35,'O+','Hyderabad','9000000001'),
(1002,'Priya Reddy','Female',28,'A+','Bengaluru','9000000002'),
(1003,'Amit Kumar','Male',42,'B+','Chennai','9000000003'),
(1004,'Sneha Rao','Female',31,'AB+','Hyderabad','9000000004'),
(1005,'Arjun Patel','Male',50,'O-','Mumbai','9000000005'),
(1006,'Pooja Singh','Female',27,'A-','Delhi','9000000006'),
(1007,'Kiran Kumar','Male',39,'B-','Pune','9000000007'),
(1008,'Anjali Devi','Female',24,'O+','Kolkata','9000000008'),
(1009,'Ravi Teja','Male',46,'A+','Hyderabad','9000000009'),
(1010,'Divya Nair','Female',33,'AB-','Kochi','9000000010'),
(1011,'Suresh Babu','Male',41,'B+','Vijayawada','9000000011'),
(1012,'Lakshmi Devi','Female',37,'O+','Warangal','9000000012'),
(1013,'Vivek Sharma','Male',29,'A+','Hyderabad','9000000013'),
(1014,'Meera Joshi','Female',45,'B+','Nagpur','9000000014'),
(1015,'Naveen Kumar','Male',32,'O-','Mysuru','9000000015'),
(1016,'Bhavana Reddy','Female',26,'A+','Hyderabad','9000000016'),
(1017,'Deepak Jain','Male',53,'AB+','Delhi','9000000017'),
(1018,'Kavitha Rao','Female',38,'O+','Visakhapatnam','9000000018'),
(1019,'Harish Patel','Male',48,'B-','Ahmedabad','9000000019'),
(1020,'Swathi Reddy','Female',30,'A-','Hyderabad','9000000020'),
(1021,'Ajay Kumar','Male',34,'O+','Chennai','9000000021'),
(1022,'Neha Sharma','Female',25,'B+','Pune','9000000022'),
(1023,'Vinod Rao','Male',40,'AB+','Hyderabad','9000000023'),
(1024,'Shalini Gupta','Female',36,'O-','Jaipur','9000000024'),
(1025,'Ramesh Naidu','Male',44,'A+','Hyderabad','9000000025'),
(1026,'Geetha Devi','Female',29,'B+','Bengaluru','9000000026'),
(1027,'Sunil Kumar','Male',52,'O+','Mumbai','9000000027'),
(1028,'Rekha Singh','Female',31,'A-','Lucknow','9000000028'),
(1029,'Anand Rao','Male',47,'AB-','Hyderabad','9000000029'),
(1030,'Monica Paul','Female',27,'O+','Kochi','9000000030'),
(1031,'Ashok Patel','Male',39,'B+','Surat','9000000031'),
(1032,'Keerthi Nair','Female',35,'A+','Hyderabad','9000000032'),
(1033,'Joseph Mathew','Male',49,'O-','Kochi','9000000033'),
(1034,'Lalitha Devi','Female',42,'AB+','Hyderabad','9000000034'),
(1035,'Hari Prasad','Male',37,'B-','Vijayawada','9000000035'),
(1036,'Nisha Gupta','Female',28,'A+','Delhi','9000000036'),
(1037,'Prakash Reddy','Male',45,'O+','Hyderabad','9000000037'),
(1038,'Usha Rao','Female',33,'B+','Warangal','9000000038'),
(1039,'Gopal Krishna','Male',51,'AB-','Hyderabad','9000000039'),
(1040,'Pallavi Sharma','Female',24,'O+','Pune','9000000040'),
(1041,'Sandeep Kumar','Male',38,'A+','Bengaluru','9000000041'),
(1042,'Harsha Patel','Male',41,'B+','Ahmedabad','9000000042'),
(1043,'Farooq Ali','Male',36,'O-','Hyderabad','9000000043'),
(1044,'Tejas Rao','Male',29,'A+','Mysuru','9000000044'),
(1045,'Vinay Kumar','Male',43,'AB+','Hyderabad','9000000045'),
(1046,'Chandu Reddy','Male',34,'B-','Visakhapatnam','9000000046'),
(1047,'Pooja Verma','Female',32,'O+','Nagpur','9000000047'),
(1048,'Anita Sharma','Female',40,'A-','Delhi','9000000048'),
(1049,'Srikanth Rao','Male',46,'B+','Hyderabad','9000000049'),
(1050,'Rohit Singh','Male',27,'O+','Chennai','9000000050');





INSERT INTO Appointments
(AppointmentID, PatientID, DoctorID, AppointmentDate, Status)
VALUES
(2001,1001,101,'2026-01-02','Completed'),
(2002,1002,102,'2026-01-03','Completed'),
(2003,1003,103,'2026-01-03','Cancelled'),
(2004,1004,104,'2026-01-04','Completed'),
(2005,1005,105,'2026-01-05','Pending'),
(2006,1006,106,'2026-01-06','Completed'),
(2007,1007,107,'2026-01-06','Completed'),
(2008,1008,108,'2026-01-07','Completed'),
(2009,1009,109,'2026-01-08','Pending'),
(2010,1010,110,'2026-01-09','Completed'),
(2011,1011,111,'2026-01-10','Completed'),
(2012,1012,112,'2026-01-10','Cancelled'),
(2013,1013,113,'2026-01-11','Completed'),
(2014,1014,114,'2026-01-12','Completed'),
(2015,1015,115,'2026-01-13','Pending'),
(2016,1016,116,'2026-01-14','Completed'),
(2017,1017,117,'2026-01-15','Completed'),
(2018,1018,118,'2026-01-16','Completed'),
(2019,1019,119,'2026-01-17','Cancelled'),
(2020,1020,120,'2026-01-18','Completed'),
(2021,1021,121,'2026-01-19','Completed'),
(2022,1022,122,'2026-01-20','Pending'),
(2023,1023,123,'2026-01-21','Completed'),
(2024,1024,124,'2026-01-22','Completed'),
(2025,1025,125,'2026-01-23','Completed'),
(2026,1026,126,'2026-01-24','Pending'),
(2027,1027,127,'2026-01-25','Completed'),
(2028,1028,128,'2026-01-26','Completed'),
(2029,1029,129,'2026-01-27','Cancelled'),
(2030,1030,130,'2026-01-28','Completed'),
(2031,1031,131,'2026-01-29','Completed'),
(2032,1032,132,'2026-01-30','Pending'),
(2033,1033,133,'2026-01-31','Completed'),
(2034,1034,134,'2026-02-01','Completed'),
(2035,1035,135,'2026-02-02','Completed'),
(2036,1036,136,'2026-02-03','Cancelled'),
(2037,1037,137,'2026-02-04','Completed'),
(2038,1038,138,'2026-02-05','Completed'),
(2039,1039,139,'2026-02-06','Pending'),
(2040,1040,140,'2026-02-07','Completed'),
(2041,1041,141,'2026-02-08','Completed'),
(2042,1042,142,'2026-02-09','Completed'),
(2043,1043,143,'2026-02-10','Cancelled'),
(2044,1044,144,'2026-02-11','Completed'),
(2045,1045,145,'2026-02-12','Pending'),
(2046,1046,146,'2026-02-13','Completed'),
(2047,1047,147,'2026-02-14','Completed'),
(2048,1048,148,'2026-02-15','Completed'),
(2049,1049,149,'2026-02-16','Pending'),
(2050,1050,150,'2026-02-17','Completed');




INSERT INTO Admissions
(AdmissionID, PatientID, DoctorID, AdmitDate, DischargeDate, RoomNo)
VALUES
(3001,1001,101,'2026-01-02','2026-01-06','A101'),
(3002,1002,102,'2026-01-03','2026-01-05','A102'),
(3003,1003,103,'2026-01-04','2026-01-08','A103'),
(3004,1004,104,'2026-01-05','2026-01-07','A104'),
(3005,1005,105,'2026-01-06','2026-01-10','A105'),
(3006,1006,106,'2026-01-07','2026-01-09','A106'),
(3007,1007,107,'2026-01-08','2026-01-12','A107'),
(3008,1008,108,'2026-01-09','2026-01-11','A108'),
(3009,1009,109,'2026-01-10','2026-01-14','A109'),
(3010,1010,110,'2026-01-11','2026-01-13','A110'),
(3011,1011,111,'2026-01-12','2026-01-16','A111'),
(3012,1012,112,'2026-01-13','2026-01-15','A112'),
(3013,1013,113,'2026-01-14','2026-01-18','A113'),
(3014,1014,114,'2026-01-15','2026-01-17','A114'),
(3015,1015,115,'2026-01-16','2026-01-20','A115'),
(3016,1016,116,'2026-01-17','2026-01-19','A116'),
(3017,1017,117,'2026-01-18','2026-01-22','A117'),
(3018,1018,118,'2026-01-19','2026-01-21','A118'),
(3019,1019,119,'2026-01-20','2026-01-24','A119'),
(3020,1020,120,'2026-01-21','2026-01-23','A120'),
(3021,1021,121,'2026-01-22','2026-01-26','A121'),
(3022,1022,122,'2026-01-23','2026-01-25','A122'),
(3023,1023,123,'2026-01-24','2026-01-28','A123'),
(3024,1024,124,'2026-01-25','2026-01-27','A124'),
(3025,1025,125,'2026-01-26','2026-01-30','A125'),
(3026,1026,126,'2026-01-27','2026-01-29','A126'),
(3027,1027,127,'2026-01-28','2026-02-01','A127'),
(3028,1028,128,'2026-01-29','2026-01-31','A128'),
(3029,1029,129,'2026-01-30','2026-02-03','A129'),
(3030,1030,130,'2026-01-31','2026-02-02','A130'),
(3031,1031,131,'2026-02-01','2026-02-05','A131'),
(3032,1032,132,'2026-02-02','2026-02-04','A132'),
(3033,1033,133,'2026-02-03','2026-02-07','A133'),
(3034,1034,134,'2026-02-04','2026-02-06','A134'),
(3035,1035,135,'2026-02-05','2026-02-09','A135'),
(3036,1036,136,'2026-02-06','2026-02-08','A136'),
(3037,1037,137,'2026-02-07','2026-02-11','A137'),
(3038,1038,138,'2026-02-08','2026-02-10','A138'),
(3039,1039,139,'2026-02-09','2026-02-13','A139'),
(3040,1040,140,'2026-02-10','2026-02-12','A140'),
(3041,1041,141,'2026-02-11','2026-02-15','A141'),
(3042,1042,142,'2026-02-12','2026-02-14','A142'),
(3043,1043,143,'2026-02-13','2026-02-17','A143'),
(3044,1044,144,'2026-02-14','2026-02-16','A144'),
(3045,1045,145,'2026-02-15','2026-02-19','A145'),
(3046,1046,146,'2026-02-16','2026-02-18','A146'),
(3047,1047,147,'2026-02-17','2026-02-21','A147'),
(3048,1048,148,'2026-02-18','2026-02-20','A148'),
(3049,1049,149,'2026-02-19','2026-02-23','A149'),
(3050,1050,150,'2026-02-20','2026-02-24','A150');




INSERT INTO Treatments
(TreatmentID, AdmissionID, TreatmentName, Cost)
VALUES
(4001,3001,'Angioplasty',85000),
(4002,3002,'Brain MRI',12000),
(4003,3003,'Knee Replacement',95000),
(4004,3004,'Child Vaccination',3000),
(4005,3005,'General Checkup',2500),
(4006,3006,'Skin Allergy Treatment',4500),
(4007,3007,'Ear Surgery',28000),
(4008,3008,'Chemotherapy',120000),
(4009,3009,'Dialysis',18000),
(4010,3010,'Lung Function Test',6500),
(4011,3011,'Kidney Stone Removal',45000),
(4012,3012,'Endoscopy',9000),
(4013,3013,'Counseling Session',2000),
(4014,3014,'CT Scan',7000),
(4015,3015,'Eye Cataract Surgery',40000),
(4016,3016,'Normal Delivery',55000),
(4017,3017,'Emergency Trauma Care',70000),
(4018,3018,'ICU Care',95000),
(4019,3019,'Anesthesia Procedure',15000),
(4020,3020,'Blood Test',1200),
(4021,3021,'Physiotherapy',3500),
(4022,3022,'Dental Filling',2500),
(4023,3023,'Plastic Surgery',140000),
(4024,3024,'Diabetes Treatment',6500),
(4025,3025,'Blood Transfusion',10000),
(4026,3026,'Arthritis Treatment',8000),
(4027,3027,'Dengue Treatment',15000),
(4028,3028,'Diet Consultation',1500),
(4029,3029,'Pain Management',5000),
(4030,3030,'Heart Bypass Surgery',250000),
(4031,3031,'Brain Surgery',300000),
(4032,3032,'Fracture Treatment',25000),
(4033,3033,'Burn Treatment',50000),
(4034,3034,'Rehabilitation Therapy',10000),
(4035,3035,'Sleep Study',8000),
(4036,3036,'Allergy Test',3500),
(4037,3037,'Sports Injury Treatment',18000),
(4038,3038,'Liver Transplant',600000),
(4039,3039,'Palliative Care',12000),
(4040,3040,'Clinical Trial',10000),
(4041,3041,'Postmortem Examination',15000),
(4042,3042,'Family Health Checkup',5000),
(4043,3043,'Occupational Health Exam',3000),
(4044,3044,'Community Vaccination',2000),
(4045,3045,'Diabetic Foot Care',9000),
(4046,3046,'Cosmetic Procedure',35000),
(4047,3047,'Microbiology Test',1800),
(4048,3048,'Biochemistry Test',2200),
(4049,3049,'Blood Bank Service',4500),
(4050,3050,'Medical Record Review',1000);



INSERT INTO Billing
(BillID, AdmissionID, TotalAmount, Insurance, PaidAmount, PaymentStatus)
VALUES
(5001,3001,85000,'Yes',85000,'Paid'),
(5002,3002,12000,'No',12000,'Paid'),
(5003,3003,95000,'Yes',70000,'Partial'),
(5004,3004,3000,'No',3000,'Paid'),
(5005,3005,2500,'No',2500,'Paid'),
(5006,3006,4500,'Yes',4500,'Paid'),
(5007,3007,28000,'No',28000,'Paid'),
(5008,3008,120000,'Yes',120000,'Paid'),
(5009,3009,18000,'Yes',10000,'Partial'),
(5010,3010,6500,'No',6500,'Paid'),
(5011,3011,45000,'Yes',45000,'Paid'),
(5012,3012,9000,'No',9000,'Paid'),
(5013,3013,2000,'No',0,'Pending'),
(5014,3014,7000,'Yes',7000,'Paid'),
(5015,3015,40000,'Yes',40000,'Paid'),
(5016,3016,55000,'No',30000,'Partial'),
(5017,3017,70000,'Yes',70000,'Paid'),
(5018,3018,95000,'Yes',95000,'Paid'),
(5019,3019,15000,'No',15000,'Paid'),
(5020,3020,1200,'No',1200,'Paid'),
(5021,3021,3500,'Yes',3500,'Paid'),
(5022,3022,2500,'No',2500,'Paid'),
(5023,3023,140000,'Yes',100000,'Partial'),
(5024,3024,6500,'No',6500,'Paid'),
(5025,3025,10000,'Yes',10000,'Paid'),
(5026,3026,8000,'No',8000,'Paid'),
(5027,3027,15000,'Yes',15000,'Paid'),
(5028,3028,1500,'No',1500,'Paid'),
(5029,3029,5000,'No',0,'Pending'),
(5030,3030,250000,'Yes',250000,'Paid'),
(5031,3031,300000,'Yes',200000,'Partial'),
(5032,3032,25000,'No',25000,'Paid'),
(5033,3033,50000,'Yes',50000,'Paid'),
(5034,3034,10000,'No',10000,'Paid'),
(5035,3035,8000,'No',8000,'Paid'),
(5036,3036,3500,'Yes',3500,'Paid'),
(5037,3037,18000,'No',18000,'Paid'),
(5038,3038,600000,'Yes',600000,'Paid'),
(5039,3039,12000,'No',6000,'Partial'),
(5040,3040,10000,'No',10000,'Paid'),
(5041,3041,15000,'Yes',15000,'Paid'),
(5042,3042,5000,'No',5000,'Paid'),
(5043,3043,3000,'No',3000,'Paid'),
(5044,3044,2000,'Yes',2000,'Paid'),
(5045,3045,9000,'Yes',9000,'Paid'),
(5046,3046,35000,'No',35000,'Paid'),
(5047,3047,1800,'No',1800,'Paid'),
(5048,3048,2200,'Yes',2200,'Paid'),
(5049,3049,4500,'No',4500,'Paid'),
(5050,3050,1000,'No',1000,'Paid');


--------1.FIND TOP 5 DOCTORS WHO TREATED THE MOST PATIENTS---------
SELECT TOP 5
D.DOCTORNAME,
COUNT(P.PATIENTID)AS TOTALPATIENTS
FROM DOCTORS D
INNER JOIN  PATIENTS P
ON D.Gender = P.Gender
GROUP BY D.DOCTORNAME
ORDER BY TOTALPATIENTS DESC

-------------2.FIND THE DEPARTMENT WITH HIGHEST NUMBER 0F DOCTORS-----------

SELECT 
D.DOCTORID,
D.DOCTORNAME,
DD.DEPARTMENTNAME,
COUNT(D.DOCTORID)AS TOTALDOCTORS
FROM DOCTORS D
INNER JOIN Departments DD
ON D.DepartmentID = DD.DepartmentID
GROUP BY D.DOCTORNAME,D.DoctorID,DD.DepartmentName
ORDER BY TOTALDOCTORS DESC



----------3.DISPLAY PATIENTS WHO HAVE BEEN ADMITTED MORE THAN ONCE------------
SELECT 
P.PATIENTID,
P.PATIENTNAME,
COUNT(A.ADMITDATE)AS TOTAL
FROM PATIENTS P
INNER JOIN Admissions A
ON P.PatientID = A.PatientID
GROUP BY P.PATIENTID,P.PATIENTNAME,A.ADMITDATE
HAVING COUNT(A.ADMITDATE) > 1


---------4.FIND PATIENTS WHOSE BILL AMOUTNT IS GREATER THAN THE AVERAGE BILL AMOUNT------------

SELECT 
P.PATIENTID,
P.PATIENTNAME,
B.BILLID,
B.TotalAmount
FROM PATIENTS P
INNER JOIN Admissions A
ON P.PATIENTID =  A.PatientID
INNER JOIN BILLING B
ON A.AdmissionID = B.AdmissionID
WHERE B.TOTALAMOUNT > 
(
SELECT AVG(TOTALAMOUNT)
FROM BILLING 
)



--------------5.FIND THE DOCTOR WHO GENERATE THE HIGHEST REVENUE-----------
SELECT TOP 1
D.DOCTORID,
D.DOCTORNAME,
SUM(B.TOTALAMOUNT)AS TOTALAMOUNT
FROM DOCTORS D
INNER JOIN Admissions A
ON D.DoctorID = A.DoctorID
INNER JOIN BILLING B
ON A.AdmissionID = B.AdmissionID
GROUP BY D.DoctorID,D.DoctorName


-------------6. FIND PATIENTS WHOSE PAYMENT METHOD IS PENDING---------

SELECT 
P.PATIENTID,
P.PATIENTNAME,
B.PaymentStatus
FROM Patients P
INNER JOIN Admissions A
ON P.PATIENTID = A. PatientID
INNER JOIN BILLING B
ON A.AdmissionID = B.AdmissionID
WHERE PaymentStatus LIKE 'PENDING'


-----------7.CALCULATE TOTAL REVENUE GENERATED BY EACH DEPARTMENT-------
SELECT 
DP.DEPARTMENTID,
DP.DEPARTMENTNAME,
SUM(B.TOTALAMOUNT)AS TOTALREVENUE
FROM Departments DP
INNER JOIN Doctors D
ON D.DepartmentID = DP.DepartmentID
INNER JOIN  Admissions A
ON D.DoctorID = A.DoctorID
INNER JOIN BILLING B
ON A.AdmissionID = B.AdmissionID
GROUP BY DP.DepartmentID,DP.DepartmentName
ORDER BY TOTALREVENUE DESC


--------------8.FIND THE AVERAGE TREATMENT COST FOR EACH DEPARTMENT---------
SELECT 
DP.DEPARTMENTID,
DP.DEPARTMENTNAME,
AVG(T.COST)AS AVGCOST
FROM DEPARTMENTS DP
INNER JOIN Doctors D
ON DP.DepartmentID = D.DepartmentID
INNER JOIN  Admissions A
ON D.DoctorID = A.DoctorID
INNER JOIN Treatments T
ON A.AdmissionID = T.AdmissionID
GROUP BY DP.DepartmentID,DP.DepartmentName
ORDER BY AVGCOST DESC

----------------------9.DISPLAY THE TOP 3 MOST EXPENSIVE TREATMENTS----------
SELECT TOP 3
TREATMENTNAME,
COST
FROM Treatments
ORDER BY COST DESC


------------------10.FIND DOCTORS WHOSE SALARY IS ABOVE THE AVERAGE SALARY---------

SELECT 
DOCTORNAME,
DoctorID,
DepartmentID,
SALARY
FROM Doctors
WHERE SALARY >
(
SELECT AVG(SALARY)
FROM Doctors
)
ORDER BY SALARY DESC


----------11.FIND PATIENTS WHO STAYED IN THE HOSPITAL FOR THE MAXIMUM NUMBER OF DAYS-----------

SELECT
PATIENTID,
 MAX(DATEDIFF(DD,AdmitDate,DischargeDate)) AS MAXDAYS
 FROM Admissions
 GROUP BY PATIENTID
 ORDER BY MAXDAYS DESC


 ------------12.CALCULATE THE AVERAGE HOSPITAL STAY FOR EACH DEPARTMENT------------
 SELECT
 A.PATIENTID,
 AVG(DATEDIFF(DD,AdmitDate,DischargeDate)) AS AVGDAYS
 FROM Admissions A
 INNER JOIN Doctors D
 ON A.DoctorID = D.DoctorID
 INNER JOIN Departments DP
 ON D.DepartmentID = DP.DepartmentID
 GROUP BY PatientID


 ----------13.FIND PATIENTS WHO DISCHARGED WITH IN 2 DAYS----------
 SELECT 
 PATIENTID,
 DATEDIFF(DD,ADMITDATE,DISCHARGEDATE) AS DAY_FOR_DISCHARGE
 FROM Admissions
 WHERE (
 DATEDIFF(DD,ADMITDATE,DISCHARGEDATE) = 2
 )


 ----------14.FIND DOCTORS WHO HANDLED MORE THAN 3 ADMISSIONS-----
 SELECT 
 D.DOCTORID,
 D.DOCTORNAME,
 COUNT(A.ADMISSIONID)AS TOTAL_ADMISSIONS
 FROM Doctors D
 INNER JOIN Admissions A
 ON D.DoctorID = A.DoctorID
 GROUP BY D.DoctorID,D.DoctorName
 HAVING COUNT(A.ADMISSIONID) =1


 -------------15.FIND DEPARTMENT WITH HIGHEST REVENUE------------

SELECT TOP 1
DP.DEPARTMENTID,
DP.DEPARTMENTNAME,
SUM(B.TOTALAMOUNT)AS TOTALREVENUE
FROM Departments DP
INNER JOIN Doctors D
ON DP.DepartmentID = D.DepartmentID
INNER JOIN Admissions A
ON D.DoctorID = A.DoctorID
INNER JOIN BILLING B
ON A.AdmissionID = B.AdmissionID
GROUP BY DP.DepartmentID,DP.DepartmentName
ORDER BY TOTALREVENUE DESC

----------16.FIND PATIENTS WHO HAVE INSURANCE BUT NOT PAID THEIR BILLS ---------
SELECT 
P.PATIENTID,
P.PATIENTNAME
FROM Patients P
INNER JOIN Admissions A
ON P.PatientID = A.PatientID
INNER JOIN Billing B
ON A.AdmissionID = B.AdmissionID
WHERE Insurance = 'YES' AND PaymentStatus = 'PARTIAL'

-------------------17.FIND THE PERCENTAGE OF BILLS THAT ARE PAID,PENDING AND PARTIAL---------
SELECT 
PAYMENTSTATUS,
COUNT(*)AS TOTALBILS,
ROUND(COUNT(*)*100.0/
(SELECT COUNT(*) FROM BILLING),2) AS PERCENTAGE
FROM BILLING
GROUP BY PaymentStatus

-------------18.FIND MONTHLY REVENUE GENERATED BY HOSPITAL-----
SELECT 
YEAR(A.ADMITDATE) AS YEAR,
MONTH(A.ADMITDATE) AS MONTH,
SUM(B.TOTALAMOUNT)
FROM Admissions A
INNER JOIN  Billing B
ON A.AdmissionID = B.AdmissionID
GROUP BY YEAR(A.ADMITDATE),MONTH(A.ADMITDATE)
ORDER BY 
YEAR,MONTH


-----------19.FIND THE NUMBER OF APPOINTMENTS FOR EACH DOCTOR--------
SELECT 
A.DOCTORID,
A.APPOINTMENTID,
D.DOCTORNAME,
COUNT(A.APPOINTMENTID) AS NO_OF_APPOINTMNTS
FROM Appointments A
INNER JOIN Doctors D
ON A.DoctorID = D.DoctorID
GROUP BY A.DoctorID,A.AppointmentID,D.DoctorName


--------20.FIND DOCTORS WHO HAD PENDING APPOINTMENTS---------
SELECT 
D.DOCTORID,
D.DOCTORNAME,
A.Status
FROM Doctors D
INNER JOIN Appointments A
ON D.DoctorID = A.DoctorID
WHERE A.Status='PENDING'

--------------21.RANK DOCTORS BASED ON REVENUE GENERATED USING RANK()---------
SELECT 
D.DOCTORID,
D.DOCTORNAME,
SUM(B.TOTALAMOUNT)AS REVENUE,
RANK()OVER(ORDER BY SUM(B.TOTALAMOUNT) DESC)AS RANK_REVENUE
FROM Doctors D
INNER JOIN Admissions A
ON D.DoctorID = A.DoctorID
INNER JOIN Billing B
ON A.AdmissionID = B.AdmissionID
GROUP BY D.DoctorID,D.DoctorName


------------22.FIND THE SECOND HIGHEST TREATMENT COST USING CTE------------
WITH CTE AS 
(
SELECT 
TREATMENTNAME,
COST,
DENSE_RANK()OVER(ORDER BY COST DESC)AS RANK_NO
FROM Treatments
)
SELECT 
TREATMENTNAME,
COST
FROM CTE
WHERE RANK_NO=2



-------------23.FIND PATIENTS WHO ADMITTED IN SAME DAY AS TODAY-------

SELECT 
PATIENTID,
ADMITDATE
FROM Admissions
WHERE DAY(ADMITDATE)=DAY (GETDATE())

---------------24.FIND THE BUSIEST DAY BASED ON THE APPOINTMENTS---------
SELECT TOP 1
AppointmentDATE,
COUNT(AppointmentID)AS TOTAL_Appointment
FROM Appointments
GROUP BY AppointmentDATE
ORDER BY TOTAL_Appointment DESC


-------------25.FIND PATIENTS WHOSE TREATMENT COST IS ABOVE THE DEPARTMENT AVERAGE
SELECT
    P.PatientID,
    P.PatientName,
    D.DepartmentName,
    T.TreatmentName,
    T.Cost
FROM Patients P
JOIN Admissions A
    ON P.PatientID = A.PatientID
JOIN Treatments T
    ON A.AdmissionID = T.AdmissionID
JOIN Doctors DR
    ON A.DoctorID = DR.DoctorID
JOIN Departments D
    ON DR.DepartmentID = D.DepartmentID
WHERE T.Cost >
(
    SELECT AVG(T2.Cost)
    FROM Treatments T2
    JOIN Admissions A2
        ON T2.AdmissionID = A2.AdmissionID
    JOIN Doctors DR2
        ON A2.DoctorID = DR2.DoctorID
    WHERE DR2.DepartmentID = DR.DepartmentID
);


----------------26.FIND DUPLICATE PATIENT PHONE NUMBERS--------
SELECT 
PATIENTID,
PATIENTNAME,
PHONE,
COUNT(*)AS DUPLICATE_PHONE
FROM Patients
GROUP BY PHONE,PatientID,PatientName
HAVING COUNT(*)>1


---------------------27.FIND THE TOP 5 CITIES WITH HIGHEST NUMBER OF PATIENTS-------

SELECT TOP 5
PATIENTID,
PATIENTNAME,
CITY,
COUNT(*)AS TOTAL_PATIENTS
FROM Patients
GROUP BY CITY,PATIENTID,
PatientName
ORDER BY TOTAL_PATIENTS DESC



-------------------28.FIND DEPARTMENTS WHERE THE AVERAGE DOCTORS EXPERIENCE IS GREATER THAN 10 YEARS
SELECT 
DEPARTMENTID,
EXPERIENCEYEARS,
AVG(EXPERIENCEYEARS)AS AVG_EXPERIENCE
FROM DOCTORS
GROUP BY 
DEPARTMENTID,
EXPERIENCEYEARS
HAVING AVG(EXPERIENCEYEARS) > 10
ORDER BY AVG_EXPERIENCE DESC


---------29.FIND DOCTORS WHO HAVEN'T TREATED ANY PATIENTS---------
SELECT
D.DOCTORID,
D.DOCTORNAME,
COUNT(A.PATIENTID)AS NO_OF_PATIENTS
FROM Doctors D
INNER JOIN Admissions A
ON D.DoctorID = A.DoctorID
INNER JOIN Treatments T
ON A.AdmissionID = T.AdmissionID
GROUP BY D.DOCTORID,
D.DOCTORNAME
HAVING COUNT(A.PATIENTID) < 1


----------------30. Build a complete hospital performance report showing:
--1.Total Patients
--2.Total Doctors
--3.Total Revenue
--4.Total Admissions
--5.Average Treatment Cost
--6.Average Stay Duration
--7.Paid vs Pending Bills
--8.Insurance vs Non-Insurance Patients


--1.Total Patients
SELECT 
COUNT(*)AS TOTAL_PATIENTS
FROM PATIENTS

--2.Total Doctors
SELECT 
COUNT(*)AS TOTAL_DOCTORS
FROM Doctors

--3.Total Revenue
SELECT 
SUM(TOTALAMOUNT) AS TOTAL_REVENUE 
FROM BILLING

--4.Total Admissions
SELECT 
COUNT(*) AS TOTAL_ADMISSION 
FROM Admissions


--5.Average Treatment Cost

SELECT 
AVG(COST)AS AVG_TREATEMENT_COST
FROM Treatments

--6.Average Stay Duration
SELECT 
AVG(DATEDIFF(DAY,ADMITDATE,DISCHARGEDATE))AS AVG_STAY_DAYS
FROM Admissions


--7.Paid vs Pending Bills
SELECT 
PAYMENTSTATUS,
COUNT(*)AS BILLS
FROM BILLING
GROUP BY PAYMENTSTATUS


--8.Insurance vs Non-Insurance Patients

SELECT 
INSURANCE,
COUNT(*)AS INSURANCE
FROM BILLING
GROUP BY INSURANCE


--------------------------31.REVENUE TREND MONTH-OVER-MONTH  (LAG())----------
WITH MonthlyRevenue AS
(
    SELECT
        YEAR(A.AdmitDate) AS Year,
        MONTH(A.AdmitDate) AS Month,
        SUM(B.TotalAmount) AS TotalRevenue
    FROM Admissions A
    JOIN Billing B
        ON A.AdmissionID = B.AdmissionID
    GROUP BY YEAR(A.AdmitDate), MONTH(A.AdmitDate)
)

SELECT
    Year,
    Month,
    TotalRevenue,
    LAG(TotalRevenue) OVER(ORDER BY Year, Month) AS PreviousMonthRevenue,
    TotalRevenue -
    LAG(TotalRevenue) OVER(ORDER BY Year, Month) AS RevenueDifference
FROM MonthlyRevenue
ORDER BY Year, Month;


------------------32.RUNNING TOTAL OF HOSPITAL REVENUE------------

WITH MonthlyRevenue AS
(
    SELECT
        YEAR(A.AdmitDate) AS Year,
        MONTH(A.AdmitDate) AS Month,
        SUM(B.TotalAmount) AS TotalRevenue
    FROM Admissions A
    JOIN Billing B
        ON A.AdmissionID = B.AdmissionID
    GROUP BY YEAR(A.AdmitDate), MONTH(A.AdmitDate)
)

SELECT
    Year,
    Month,
    TotalRevenue,
    SUM(TotalRevenue) OVER(
        ORDER BY Year, Month
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningTotalRevenue
FROM MonthlyRevenue
ORDER BY Year, Month;


-------------33.TOP DOCTORS IN EACH DEPARTMENT-------
WITH DoctorRevenue AS
(
    SELECT 
        d.DoctorID,
        d.DoctorName,
        d.DepartmentID,
        SUM(b.TotalAmount) AS TotalRevenue,
        ROW_NUMBER() OVER
        (
            PARTITION BY d.DepartmentID
            ORDER BY SUM(b.TotalAmount) DESC
        ) AS RN
    FROM Doctors d
    JOIN Admissions a
        ON d.DoctorID = a.DoctorID
    JOIN Billing b
        ON a.AdmissionID = b.AdmissionID
    GROUP BY
        d.DoctorID,
        d.DoctorName,
        d.DepartmentID
)

SELECT
    DepartmentID,
    DoctorID,
    DoctorName,
    TotalRevenue
FROM DoctorRevenue
WHERE RN = 1
ORDER BY DepartmentID;


-------------------34.TOP TREATMENT BY REVENUE---------
SELECT TOP 1
T.TREATMENTNAME,
SUM(B.TOTALAMOUNT)AS TOP_TREATMENT
FROM Treatments T
INNER JOIN BILLING B
ON T.AdmissionID =  B.AdmissionID
GROUP BY T.TREATMENTNAME
ORDER BY TOP_TREATMENT DESC


---------------35.PATIENTS WHO VISITED MULTIPLE DEPARTMENT----------

SELECT 
P.PATIENTID,
P.PATIENTNAME,
COUNT(DP.DEPARTMENTID)AS COUNT_DEPT
FROM PATIENTS P
INNER JOIN APPOINTMENTS A
ON P.PATIENTID = A.PATIENTID
INNER JOIN DOCTORS D
ON A.DoctorID = D.DoctorID
INNER JOIN Departments DP
ON D.DepartmentID = DP.DepartmentID
GROUP BY P.PATIENTID,
P.PATIENTNAME
HAVING COUNT(DP.DEPARTMENTID) > 1


------------36.DOCTORS WHOSE REVENUE INCREASED MONTH-OVER-MONTH
WITH DoctorRevenue AS
(
    SELECT
        d.DoctorID,
        d.DoctorName,
        YEAR(a.AdmitDate) AS RevenueYear,
        MONTH(a.AdmitDate) AS RevenueMonth,
        SUM(b.TotalAmount) AS MonthlyRevenue
    FROM Doctors d
    JOIN Admissions a
        ON d.DoctorID = a.DoctorID
    JOIN Billing b
        ON a.AdmissionID = b.AdmissionID
    GROUP BY
        d.DoctorID,
        d.DoctorName,
        YEAR(a.AdmitDate),
        MONTH(a.AdmitDate)
),
RevenueComparison AS
(
    SELECT *,
           LAG(MonthlyRevenue) OVER
           (
               PARTITION BY DoctorID
               ORDER BY RevenueYear, RevenueMonth
           ) AS PreviousMonthRevenue
    FROM DoctorRevenue
)

SELECT
    DoctorID,
    DoctorName,
    RevenueYear,
    RevenueMonth,
    PreviousMonthRevenue,
    MonthlyRevenue,
    MonthlyRevenue - ISNULL(PreviousMonthRevenue,0) AS RevenueIncrease
FROM RevenueComparison
WHERE MonthlyRevenue > ISNULL(PreviousMonthRevenue,0)
ORDER BY DoctorID, RevenueYear, RevenueMonth;


-------------37.RE-ADMISSION RATE---------

WITH Readmissions AS
(
    SELECT
        A1.PatientID,
        A1.AdmissionID AS FirstAdmission,
        A1.DischargeDate,
        MIN(A2.AdmitDate) AS NextAdmission
    FROM Admissions A1
    JOIN Admissions A2
        ON A1.PatientID = A2.PatientID
       AND A2.AdmitDate > A1.DischargeDate
    GROUP BY
        A1.PatientID,
        A1.AdmissionID,
        A1.DischargeDate
)
SELECT
    COUNT(*) AS TotalReadmissions,
    (COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM Admissions)
    ) AS ReadmissionRate
FROM Readmissions
WHERE DATEDIFF(DAY, DischargeDate, NextAdmission) <= 30;


----------------38.AVERATE  WAITING TIME BETWEEN  APPOINMENT AND ADDMISSION 
SELECT 
AP.PatientID,
AP.AppointmentDate,
A.ADMITDATE,
AVG(DATEDIFF(DAY,AP.AppointmentDate,A.ADMITDATE))AS AVG_WAIT_TIME
FROM Appointments AP
INNER JOIN Admissions A
ON AP.PatientID = A.PatientID
GROUP BY AP.AppointmentDate,
A.ADMITDATE,AP.PATIENTID



-------------39.DOCTORS UTILIZATION PERCENTAGE-------
SELECT 
D.DOCTORID,
D.DOCTORNAME,
COUNT(A.PATIENTID)AS TOTAL_UTILITY,
ROUND(COUNT(A.PATIENTID)*100.0 /
(SELECT COUNT(*)FROM Appointments),2)AS UTILITY_PERCENTAGE
FROM DOCTORS D
INNER JOIN APPOINTMENTS A
ON D.DOCTORID = A.DOCTORID 
GROUP BY D.DOCTORID,
D.DOCTORNAME,
A.PATIENTID
ORDER BY UTILITY_PERCENTAGE


-------------40.DEPARTMENT OCCUPANCY RATE-----------

SELECT
    dp.DepartmentName,
    COUNT(a.AdmissionID) AS TotalAdmissions,
    ROUND(
        COUNT(a.AdmissionID) * 100.0 /
        (SELECT COUNT(*) FROM Admissions),
      2
    ) AS OccupancyRate
FROM Departments dp
JOIN Doctors d
    ON dp.DepartmentID = d.DepartmentID
JOIN Admissions a
    ON d.DoctorID = a.DoctorID
GROUP BY dp.DepartmentName
ORDER BY OccupancyRate DESC;




--------------41.PATIENTS WITH THE HIGHEST LIFETIME SPENDING------------


SELECT TOP 5
P.PATIENTID,
P.PATIENTNAME,
SUM(B.TOTALAMOUNT)AS LIFETIME_SPENDING
FROM Patients P
INNER JOIN Admissions A
ON P.PatientID = A.PatientID
INNER JOIN BILLING B
ON A.AdmissionID = B.AdmissionID
GROUP BY P.PATIENTID,P.PATIENTNAME
ORDER BY LIFETIME_SPENDING DESC


-----------42.DOCTORS EARNING LESS THAN THE AVERAGE SALARY OF THEIR DEPARTMENT

SELECT
DoctorID,
DoctorNAME,
SALARY 
FROM Doctors
WHERE 
SALARY <
( SELECT AVG(SALARY)
FROM DOCTORS);

-----------43.REVENUE CONTRIBUTON PERCENTAGE BY DEPARTMENT-------
SELECT 
DP.DEPARTMENTNAME,
SUM(B.TOTALAMOUNT)AS DEPT_REVENUE,
ROUND(
SUM(B.TOTALAMOUNT)*100.0/(SELECT SUM(TOTALAMOUNT)FROM BILLING ),2) AS REVENUE_CONTRIBUTON_PERCENTAGE
FROM BILLING B
INNER JOIN Admissions A
ON B.AdmissionID = A.AdmissionID
INNER JOIN Doctors D
ON A.DoctorID = D.DoctorID
INNER JOIN Departments DP
ON D.DepartmentID = DP.DepartmentID
GROUP BY DP.DEPARTMENTNAME
ORDER BY REVENUE_CONTRIBUTON_PERCENTAGE DESC 


----------44.HIGHEST PAYING INSURANCE PATIENTS
SELECT 
P.PATIENTID,
P.PATIENTNAME,
B.TotalAmount
FROM Patients P
INNER JOIN Admissions A
ON P.PatientID = A.PatientID
INNER JOIN Billing B
ON A.AdmissionID = B.AdmissionID
WHERE B.Insurance LIKE 'YES'
ORDER BY B.TotalAmount DESC


-------------45.PATIENTS WITH MULTIPLE TREATMENT--------
SELECT
P.PATIENTID,
P.PATIENTNAME,
COUNT(TreatmentID)AS MULTIPLE_TREATMENT
FROM Patients P
INNER JOIN Admissions A
ON P.PatientID = A.PatientID
INNER JOIN Treatments T
ON A.AdmissionID = T.AdmissionID
GROUP BY P.PATIENTID,P.PATIENTNAME
HAVING COUNT(TreatmentID) >1


-------------------46.LONGEST GAP BETWEEN TWO ADMISSION OF THE SAME PATIENT


WITH AdmissionGap AS
(
    SELECT
        PatientID,
        AdmitDate,
        LAG(AdmitDate) OVER
        (
            PARTITION BY PatientID
            ORDER BY AdmitDate
        ) AS PreviousAdmitDate
    FROM Admissions
)
SELECT TOP 1
    PatientID,
    PreviousAdmitDate,
    AdmitDate,
    DATEDIFF(DAY, PreviousAdmitDate, AdmitDate) AS GapInDays
FROM AdmissionGap
WHERE PreviousAdmitDate IS NOT NULL
ORDER BY GapInDays DESC;


----------------47.FIND THE LAST PATIENT TREATED BY EACH DOCTOR-------
WITH CTE AS
(
    SELECT
        d.DoctorID,
        d.DoctorName,
        p.PatientName,
        a.AdmitDate,
        ROW_NUMBER() OVER(PARTITION BY d.DoctorID ORDER BY a.AdmitDate ASC) AS FirstPatient,
        ROW_NUMBER() OVER(PARTITION BY d.DoctorID ORDER BY a.AdmitDate DESC) AS LastPatient
    FROM Admissions a
    INNER JOIN Doctors d
        ON a.DoctorID = d.DoctorID
    INNER JOIN Patients p
        ON a.PatientID = p.PatientID
)

SELECT
    DoctorID,
    DoctorName,
    MAX(CASE WHEN FirstPatient = 1 THEN PatientName END) AS FirstPatient,
    MAX(CASE WHEN LastPatient = 1 THEN PatientName END) AS LastPatient
FROM CTE
GROUP BY DoctorID, DoctorName
ORDER BY DoctorID;

--------------------48.TOP 10 PATIENTS BY BILING AMOUNT
SELECT TOP 10
P.PATIENTID,
P.PATIENTNAME,
SUM(B.TotalAmount)AS BILLING_AMOUNT
FROM PATIENTS P
INNER JOIN Admissions A
ON P.PATIENTID = A.PatientID
INNER JOIN Billing B
ON A.AdmissionID = B.AdmissionID
GROUP BY P.PATIENTID,P.PATIENTNAME
ORDER BY BILLING_AMOUNT DESC



----------------49.DOCTORS WITH NO APPOINTMANTS LAST 30 DAYS
SELECT 
D.DOCTORID,
D.DOCTORNAME,
D.DEPARTMENTID
FROM Doctors D
INNER JOIN Appointments A
ON D.DoctorID = A.DoctorID
AND A.AppointmentDate >=DATEADD(DAY,-30,GETDATE())
WHERE A.AppointmentID IS NULL;



--------------------50.HOSPITAL KPI DASHBOARD 
SELECT
    (SELECT COUNT(*) FROM Patients) AS TotalPatients,

    (SELECT COUNT(*) FROM Doctors) AS TotalDoctors,

    (SELECT COUNT(*) FROM Departments) AS TotalDepartments,

    (SELECT COUNT(*) FROM Appointments) AS TotalAppointments,

    (SELECT COUNT(*) FROM Admissions) AS TotalAdmissions,

    (SELECT SUM(TotalAmount) FROM Billing) AS TotalRevenue,

    (SELECT AVG(TotalAmount) FROM Billing) AS AverageBillAmount,

    (SELECT SUM(PaidAmount) FROM Billing) AS TotalCollectedAmount,

    (SELECT COUNT(*) FROM Billing
     WHERE PaymentStatus = 'Paid') AS PaidBills,

    (SELECT COUNT(*) FROM Billing
     WHERE PaymentStatus = 'Pending') AS PendingBills,

    (SELECT COUNT(*) FROM Billing
     WHERE PaymentStatus = 'Partial') AS PartialBills,

    (SELECT COUNT(*) FROM Billing
     WHERE Insurance = 'Yes') AS InsurancePatients,

    (SELECT COUNT(*) FROM Billing
     WHERE Insurance = 'No') AS NonInsurancePatients,

    (SELECT AVG(DATEDIFF(DAY, AdmitDate, DischargeDate))
     FROM Admissions) AS AvgHospitalStayDays;



































































































































































































































































































































































































































































































































































































































