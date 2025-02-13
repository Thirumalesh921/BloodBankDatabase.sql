CREATE DATABASE BloodBankDB;
USE BloodBankDB;


-- DONOR1 Table
CREATE TABLE DONOR1 (
    Donor_id INT PRIMARY KEY,
    Quantity DECIMAL(10,2),
    Date_of_donation DATE
);

-- ContactInfo_Donor Table
CREATE TABLE ContactInfo_Donor (
    Age INT,
    Gender VARCHAR(10),
    Disease VARCHAR(20),
    Address VARCHAR(50),
    Name_ VARCHAR(25),
    Bloodgroup VARCHAR(10),
    Contact VARCHAR(10) PRIMARY KEY,
    Donor_id INT,
    FOREIGN KEY (Donor_id) REFERENCES DONOR1(Donor_id)
);

-- Bloodbank Table
CREATE TABLE Bloodbank (
    id INT PRIMARY KEY,
    name_ VARCHAR(20),
    location VARCHAR(30)
);

-- Manager Table
CREATE TABLE Manager (
    id INT ,
    name_ VARCHAR(30),
    contact VARCHAR(10),
    address VARCHAR(30),
    BloodBank_id INT,
    primary key(id,BloodBank_id),
    FOREIGN KEY (BloodBank_id) REFERENCES Bloodbank(id)
);

-- Blood Table
CREATE TABLE Blood (
    Donor_id INT PRIMARY KEY,
    bloodtype VARCHAR(10),
    quantity DECIMAL(10,2),
    Bloodbank_id INT,
    FOREIGN KEY (Bloodbank_id) REFERENCES Bloodbank(id),
    FOREIGN KEY (Donor_id) REFERENCES DONOR1(Donor_id)
);

-- Clinical_Analyst Table
CREATE TABLE Clinical_Analyst (
    analyst_id INT PRIMARY KEY,
    name_ VARCHAR(20)
);

-- Hospital Table
CREATE TABLE Hospital (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    address VARCHAR(30)
);

-- Employee Table
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    Hospital_id INT,
    name_ VARCHAR(20),
    address VARCHAR(30),
    contact VARCHAR(15),
    FOREIGN KEY (Hospital_id) REFERENCES Hospital(id)
);

-- Patient Table
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    dateofintake DATE,
    disease VARCHAR(10)
);

-- ContactInfo_Patient Table
CREATE TABLE ContactInfo_Patient (
    Name_ VARCHAR(25),
    Age INT,
    Gender VARCHAR(10),
    Address VARCHAR(50),
    Bloodgroup VARCHAR(10),
    Contact VARCHAR(15) PRIMARY KEY,
    patient_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- Donates Table
CREATE TABLE Donates (
    Donor_id INT,
    BloodBank_id INT,
    PRIMARY KEY (Donor_id, BloodBank_id),
    FOREIGN KEY (Donor_id) REFERENCES DONOR1(Donor_id),
    FOREIGN KEY (BloodBank_id) REFERENCES Bloodbank(id)
);

-- Analysed Table
CREATE TABLE Analysed (
    Donor_id INT,
    analyst_id INT,
    PRIMARY KEY (Donor_id, analyst_id),
    FOREIGN KEY (Donor_id) REFERENCES DONOR1(Donor_id),
    FOREIGN KEY (analyst_id) REFERENCES Clinical_Analyst(analyst_id)
);

-- Required_Blood Table
CREATE TABLE Required_Blood (
    Donor_id INT,
    patient_id INT,
    PRIMARY KEY (Donor_id, patient_id),
    FOREIGN KEY (Donor_id) REFERENCES DONOR1(Donor_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- Contacts Table
CREATE TABLE Contacts (
    Bloodbank_id INT,
    Hospital_id INT,
    PRIMARY KEY (Bloodbank_id, Hospital_id),
    FOREIGN KEY (Bloodbank_id) REFERENCES Bloodbank(id),
    FOREIGN KEY (Hospital_id) REFERENCES Hospital(id)
);

-- Inserting data into the database

-- into Donor1 table
 insert into DONOR1 values(1,10.2,'2022-01-10');
 insert into DONOR1 values(2,9.2,'2022-11-11');
 insert into DONOR1 values(3,8.4,'2022-01-12');
 insert into DONOR1 values(4,6,'2022-12-18');
 insert into DONOR1 values(5,11.5,'2022-01-23');
 insert into DONOR1 values(6,10,'2022-02-28');
 insert into DONOR1 values(7,5,'2022-03-29');
 insert into DONOR1 values(8,12,'2022-04-14');
 insert into DONOR1 values(9,11.2,'2022-06-05');
 insert into DONOR1 values(10,7.9,'2022-06-26');
 insert into DONOR1 values(11,6.8,'2022-07-20');
 insert into DONOR1 values(12,15,'2022-08-30');
 insert into DONOR1 values(13,10,'2022-09-13');
 insert into DONOR1 values(14,14.6,'2022-11-10');
insert into donor1 values(15,12.8,'2022-07-11');
 
-- contact_info 
 insert into ContactInfo_Donor values(22,'m','bp','jntu hyderabad','abhay','a-','9876543210',1);
 insert into ContactInfo_Donor values(32,'f','','jubliee hills hyderabad','lakshmi','o+','8765432109',2);
 insert into ContactInfo_Donor values(42,'m','cold','benz circle vijayawada','arya','a+','9441173015',5);
 insert into ContactInfo_Donor values(43,'m','cold','lakshmipuram guntur','karan','b+','7659976939',6);
 insert into ContactInfo_Donor values(28,'m','sugar','bhagyanagar nellore','tushar','ab+','7654321098',3);
 insert into ContactInfo_Donor values(26,'m','','kvp colony guntur','pawan','a+','8000234561',7);
 insert into ContactInfo_Donor values(35,'m','sugar','rtc colony vijayawada','vijay','b-','9008007001',8);
 insert into ContactInfo_Donor values(36,'m','','hyz colony khammam','karthik','o-','6005004001',9);
 insert into ContactInfo_Donor values(30,'m','','kphb hyderabad','ranbir','o+','3002001001',10);
 insert into ContactInfo_Donor values(31,'m','','vijaya nagar colony vijayawada','virat','a+','8765413209',11);
  insert into ContactInfo_Donor values(27,'m','bp','housing board ongole','mahi','b+','7776664441',12);
 insert into ContactInfo_donor values(28,'m','bp','housing board ongole','rohit','o+',4545454545,13);
 insert into ContactInfo_Donor values(33,'m','','svn colony guntur','venkat','o+','9440567431',4);
 insert into ContactInfo_Donor values(27,'m','','jbs colony banglore','rahul','ab-','9494949123',14);
 insert into ContactInfo_Donor values(28,'m','bp','krs colony mumbai','hardik','b-','9441234567',15);

 -- bloodbank contacts
 insert into Bloodbank values(100,'lifeblood bank','jntu hyderabad');
 insert into Bloodbank values(101,'bloodcare center','svn colony guntur');
 insert into Bloodbank values(102,'bloodlink center','housing board onjole');
 insert into Bloodbank values(103,'vitalflow blood bank','jubliee hills hyderabad');
 insert into Bloodbank values(104,'hopelife blood bank','benz circle vijayawada');
 insert into Bloodbank values(105,'angelcare blood bank','jbs colony banglore');
 
-- manager details
 insert into Manager values(1,'raj','1234567890','jntu hyderabad',100);
 insert into Manager values(2,'priya','2345678901','benz circle vijayawada',100);
 insert into Manager values(3,'pooja','3456789012','housing board onjole',100);
 insert into Manager values(1,'arjun','4567890123','kvp colony guntur',101);
 insert into Manager values(2,'neha','5678901234','krs colony mumbai',101);
 insert into Manager values(3,'anjali','6789012345','ntr colony vijayawada',101);
 insert into Manager values(4,'meera','7890123456','housing board onjole',102);
 insert into Manager values(5,'amit','8901234567','patnam bagar khammam',102);
 insert into Manager values(6,'sumit','9012345678','krs colony mumbai',102);
 insert into Manager values(8,'manoj','9898989898','benz circle vijayawada',103);
 insert into Manager values(7,'ajay','8787878787','ntr colony vijayawada',103);
 insert into Manager values(9,'kavitha','7676767676','kvp colony guntur',103);
 insert into Manager values(1,'praveen','6565656565','krs colony mumbai',104);
 insert into Manager values(2,'ravi','5454545454','housing board onjole',104);
 insert into Manager values(3,'pradeep','4343434343','patnam bagar khammam',104);
 insert into Manager values(4,'suma','9998887776','benz circle vijayawada',105);
 insert into Manager values(5,'koushik','6665554443','ntr colony vijayawada',105);
 
-- blood  details
 insert into Blood values(1,'A+',1.5,100);
 insert into Blood values(2,'A+',0.5,100);
 insert into Blood values(3,'O+',2,101);
 insert into Blood values(4,'O+',1.5,101);
 insert into Blood values(5,'A-',1,101);
 insert into Blood values(6,'B+',1.2,102);
 insert into Blood values(7,'B+',1.7,102);
 insert into Blood values(8,'AB+',1.8,102);
 insert into Blood values(9,'O-',1.2,103);
 insert into Blood values(10,'O-',0.5,103);
 insert into Blood values(11,'B-',0.7,103);
 insert into Blood values(12,'AB+',0.8,104);
 insert into Blood values(13,'AB-',0.35,104);
 insert into Blood values(14,'AB-',1,105);
 insert into Blood values(15,'B-',1.5,105);

-- clinical_analyst details
 insert into Clinical_Analyst values(601,'Rohit');
 insert into Clinical_Analyst values(602,'Sanjana');
 insert into Clinical_Analyst values(603,'Dheeraj');
 insert into Clinical_Analyst values(604,'Panvik');
 insert into Clinical_Analyst values(605,'Dhanush');
 insert into Clinical_Analyst values(606,'Sarayu');
 insert into Clinical_Analyst values(607,'Travis');

-- hospital details
 insert into Hospital values(201,'cityscape hospital','jntu hyderabad');
 insert into Hospital values(202,'haven hospital','hyz colony khammam');
 insert into Hospital values(203,'gracecare hospital','jbs colony banglore');
 insert into Hospital values(204,'mercy hospital','kphb hyderabad');
 insert into Hospital values(205,'usha hospital','hitech city hyderabad');
 
 -- employee details
 insert into Employee values(902,201,'Ravi','jntu hyderabad','9876446909');
 insert into Employee values(903,201,'Kapil','lb nagar hyderabad','9896346909');
 insert into Employee values(904,201,'Jalandhar','moosapet hyderabad','9879046909');
 insert into Employee values(905,202,'Gagan','wyra road khammam','9876896909');
 insert into Employee values(906,202,'Saritha','yellandu khammam','9976346909');
 insert into Employee values(907,202,'Krishna','kaman bazaar khammam','9976340909');
 insert into Employee values(908,202,'Gowthami','zp centre khammam','9676346909');
 insert into Employee values(909,203,'Harshit','Ap road Bangalore','8976346909');
 insert into Employee values(910,203,'Rohit','chinnaswamy Bangalore','5646346909');
 insert into Employee values(911,203,'Tilak','jbs colony Bangalore','5656346909');
 insert into Employee values(912,203,'Mahendra','jbs Bangalore','7866346909');
 insert into Employee values(913,204,'Raj','kphb hyderabad','7386346909');
 insert into Employee values(914,204,'Smriti','jntu hyderabad','8336346909');
 insert into Employee values(915,204,'Shreyanka','kothapur hyderabad','9346346909');
 insert into Employee values(916,204,'Nirmala','jntu hyderabad','7886346909');
 insert into Employee values(917,205,'Sabita','hitech hyderabad','6556346909');
 insert into Employee values(918,205,'Koushik','jntu hyderabad','5696346909');
 insert into Employee values(919,205,'Ram','miyapur hyderabad','3476346909');
 insert into Employee values(920,205,'Mahesh','miyapur hyderabad','9886346909');
 insert into Employee values(921,201,'Rahman','pragati nagar hyderabad','9236346909');
 insert into Employee values(922,204,'Jay','lb nagar hyderabad','9566346909');

-- patient details
 insert into Patient values(8101,'2023-02-11','cholera');
 insert into Patient values(8102,'2023-04-12','malaria');
 insert into Patient values(8103,'2023-05-01','leprosy');
 insert into Patient values(8104,'2023-06-19','dengue');
 insert into Patient values(8105,'2023-02-17','small pox');
 insert into Patient values(8106,'2023-01-12','dengue');
 insert into Patient values(8107,'2023-04-23','malaria');
 insert into Patient values(8108,'2023-05-25','psoriasis');
 insert into Patient values(8109,'2023-09-10','dengue');
 insert into Patient values(8110,'2023-11-07','measles');
 insert into Patient values(8111,'2023-12-29','influenza');
 insert into Patient values(8112,'2023-07-21','malaria');
 insert into Patient values(8113,'2023-09-16','dengue');
 insert into Patient values(8114,'2023-01-10','leprosy');
 insert into Patient values(8115,'2023-02-19','cholera');

-- patient contact information
 insert into ContactInfo_Patient values('raju',42,'m','kphb hyd','A+','9873456289',8101);
 insert into ContactInfo_Patient values('anjana',24,'m','jntu hyd','B+','6453456289',8102);
 insert into ContactInfo_Patient values('sirisha',40,'m','moosapet hyd','AB+','6773456289',8103);
 insert into ContactInfo_Patient values('rishi',35,'m','lb nagar hyd','O+','9973456289',8104);
 insert into ContactInfo_Patient values('ankita',32,'m','miyapur hyd','AB-','8973456289',8105);
 insert into ContactInfo_Patient values('gagan',56,'m','jbs bangalore','A+','7773456289',8106);
 insert into ContactInfo_Patient values('rajeev',78,'m','kphb hyd','B+','8873456289',8107);
 insert into ContactInfo_Patient values('jagan',23,'m','ab bangalore','B-','9073456289',8108);
 insert into ContactInfo_Patient values('babu',17,'m','jntu hyd','AB+','9373456289',8109);
 insert into ContactInfo_Patient values('hasini',30,'m','jubilee hyd','AB-','5673456289',8110);
 insert into ContactInfo_Patient values('rani',40,'m','zp kmm','O-','2343456289',8111);
 insert into ContactInfo_Patient values('dheeraj',32,'m','benz circle vjw','O+','9993456289',8112);
 insert into ContactInfo_Patient values('naveen',50,'m','jntu hyd','A+','8783456289',8113);
 insert into ContactInfo_Patient values('farooq',29,'m','miyapur hyd','O+','8883456289',8114);
 insert into ContactInfo_Patient values('mira',4,'m','kphb hyd','AB+','7873456289',8115);
 
 -- into the donates table
 insert into Donates values(1,100);
 insert into Donates values(1,101);
 insert into Donates values(2,102);
 insert into Donates values(2,103);
 insert into Donates values(5,104);
 insert into Donates values(6,105);
 insert into Donates values(3,100);
 insert into Donates values(3,101);
 insert into Donates values(5,102);
 insert into Donates values(5,103);
 insert into Donates values(6,104);
 insert into Donates values(7,105);
 insert into Donates values(8,100);
 insert into Donates values(9,101);
 insert into Donates values(10,102);
 insert into Donates values(11,103);
 insert into Donates values(12,104);
 insert into Donates values(13,105);
 insert into Donates values(4,100);
 insert into Donates values(4,101);
 insert into Donates values(14,101);
 insert into Donates values(15,102);
  
  -- analysed information
 insert into Analysed values(1,601);
 insert into Analysed values(2,601);
 insert into Analysed values(3,602);
 insert into Analysed values(4,602);
 insert into Analysed values(5,603);
 insert into Analysed values(6,604);
 insert into Analysed values(7,604);
 insert into Analysed values(8,601);
 insert into Analysed values(9,605);
 insert into Analysed values(10,606);
 insert into Analysed values(11,606);
 insert into Analysed values(12,607);
 insert into Analysed values(13,607);
 insert into Analysed values(14,602);
 insert into Analysed values(15,603);

-- blood requirement information
 insert into Required_Blood values(1,8101);
 insert into Required_Blood values(2,8103);
 insert into Required_Blood values(3,8105);
 insert into Required_Blood values(4,8107);
 insert into Required_Blood values(5,8109);
 insert into Required_Blood values(6,8111);
 insert into Required_Blood values(7,8113);
 insert into Required_Blood values(8,8115);
 insert into Required_Blood values(9,8102);
 insert into Required_Blood values(10,8104);
 insert into Required_Blood values(11,8106);
 insert into Required_Blood values(12,8108);
 insert into Required_Blood values(13,8110);
 insert into Required_Blood values(14,8112);
 insert into Required_Blood values(15,8114);
 
 -- contacts details
 insert into Contacts values(101,201);
 insert into Contacts values(101,204);
 insert into Contacts values(101,205);
 insert into Contacts values(100,202);
 insert into Contacts values(100,203);
 insert into Contacts values(100,204);
 insert into Contacts values(102,201);
 insert into Contacts values(102,203);
 insert into Contacts values(102,205);
 insert into Contacts values(103,202);
 insert into Contacts values(103,204);
 insert into Contacts values(103,201);
 insert into Contacts values(104,205);
 insert into Contacts values(104,204);
 insert into Contacts values(104,203);
 insert into Contacts values(105,201);
 insert into Contacts values(105,202);
 insert into Contacts values(105,203);
 
 -- executing some queries
 
 --  How many patients are below the age of 25
 select count(patient_id) from contactinfo_patient where age<=25;
 
 -- Give the patients whose blood group is 'AB-'
 select patient_id,name_ from contactinfo_patient
 where bloodgroup like 'AB-';
 
 -- Give the donors who have any disease
 select donor_id,name_,disease from contactinfo_donor
 where disease not like '';
 
-- Give the average age of patients who is suffering from dengue
 select round(avg(c.age),1) from contactinfo_patient c, patient p
 where p.patient_id=c.patient_id
 and p.disease='dengue';
 
 -- Find the disease (if any) suffering by donor named 'Mahi'
 select c.disease from donor1 d,contactinfo_donor c
 where d.donor_id=c.donor_id
 and c.name_='mahi';
 
 
