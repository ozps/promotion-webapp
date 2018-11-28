-- MySQL dump 10.13  Distrib 8.0.12, for osx10.14 (x86_64)
--
-- Host: localhost    Database: DBproject
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Adds`
--

DROP TABLE IF EXISTS `Adds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Adds` (
  `GiftID` int(11) NOT NULL,
  `ShippingDetailsID` int(11) NOT NULL,
  PRIMARY KEY (`GiftID`,`ShippingDetailsID`),
  KEY `ShippingDetailsID` (`ShippingDetailsID`),
  CONSTRAINT `adds_ibfk_1` FOREIGN KEY (`GiftID`) REFERENCES `gift` (`promotionid`),
  CONSTRAINT `adds_ibfk_2` FOREIGN KEY (`ShippingDetailsID`) REFERENCES `shippingdetails` (`shippingdetailsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adds`
--

LOCK TABLES `Adds` WRITE;
/*!40000 ALTER TABLE `Adds` DISABLE KEYS */;
/*!40000 ALTER TABLE `Adds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `App`
--

DROP TABLE IF EXISTS `App`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `App` (
  `AppID` int(11) NOT NULL,
  `AppName` varchar(20) NOT NULL,
  PRIMARY KEY (`AppID`),
  CONSTRAINT `app_ibfk_1` FOREIGN KEY (`AppID`) REFERENCES `privilege` (`privilegeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `App`
--

LOCK TABLES `App` WRITE;
/*!40000 ALTER TABLE `App` DISABLE KEYS */;
/*!40000 ALTER TABLE `App` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Applies`
--

DROP TABLE IF EXISTS `Applies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Applies` (
  `PrivilegeID` int(11) NOT NULL,
  `PromotionID` int(11) NOT NULL,
  PRIMARY KEY (`PrivilegeID`,`PromotionID`),
  KEY `PromotionID` (`PromotionID`),
  CONSTRAINT `applies_ibfk_1` FOREIGN KEY (`PrivilegeID`) REFERENCES `privilege` (`privilegeid`),
  CONSTRAINT `applies_ibfk_2` FOREIGN KEY (`PromotionID`) REFERENCES `promotion` (`promotionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Applies`
--

LOCK TABLES `Applies` WRITE;
/*!40000 ALTER TABLE `Applies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Applies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Asserts`
--

DROP TABLE IF EXISTS `Asserts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Asserts` (
  `PrivilegeID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  PRIMARY KEY (`PrivilegeID`,`CustomerID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `asserts_ibfk_1` FOREIGN KEY (`PrivilegeID`) REFERENCES `privilege` (`privilegeid`),
  CONSTRAINT `asserts_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Asserts`
--

LOCK TABLES `Asserts` WRITE;
/*!40000 ALTER TABLE `Asserts` DISABLE KEYS */;
INSERT INTO `Asserts` VALUES (1,1),(4,1),(10,1),(18,1),(2,2),(6,2),(17,2),(2,3),(7,3),(10,3),(12,3),(22,3),(15,4),(23,4);
/*!40000 ALTER TABLE `Asserts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Card`
--

DROP TABLE IF EXISTS `Card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Card` (
  `CardID` int(11) NOT NULL,
  `CardType` varchar(10) NOT NULL,
  `CardClass` varchar(20) NOT NULL,
  `Bank` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CardID`),
  CONSTRAINT `card_ibfk_1` FOREIGN KEY (`CardID`) REFERENCES `privilege` (`privilegeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Card`
--

LOCK TABLES `Card` WRITE;
/*!40000 ALTER TABLE `Card` DISABLE KEYS */;
INSERT INTO `Card` VALUES (1,'Credit','M Legend','SCB'),(2,'Credit','M Luxe','SCB'),(3,'Credit','M Live','SCB'),(4,'Credit','Infinite','BBL'),(5,'Credit','Platinum Leader','BBL'),(6,'Credit','Platinum','BBL'),(7,'Credit','The Wisdom','Kbank'),(8,'Credit','The Premier','Kbank'),(9,'Credit','The Passion','Kbank'),(10,'Credit','Platinum','KTB'),(11,'Credit','Titanium','KTB'),(12,'Credit','Classic','KTB'),(13,'MemberCard','Standard',NULL);
/*!40000 ALTER TABLE `Card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(20) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (1,'Food'),(2,'Fashion'),(3,'Sport and travel'),(4,'Baby and toy'),(5,'Health and beauty'),(6,'Electronic device');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(11) DEFAULT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `CustomerMidname` varchar(50) DEFAULT NULL,
  `CustomerSurname` varchar(50) NOT NULL,
  `CustomerAddress` varchar(80) NOT NULL,
  `CustomerEmail` varchar(30) NOT NULL,
  `CustomerBirthDate` date NOT NULL,
  `CustomerPhone` varchar(10) NOT NULL,
  `CustomerSex` char(1) DEFAULT NULL,
  `AttendancePoint` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CustomerID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`employeeid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,1,'Somying1','Ying1','Suay1','Siam','first@gmail.com','1993-06-11','0900000001','F',8),(2,2,'Somying2','Ying2','Suay2','Saladang','second@gmail.com','1994-07-02','0900000002','F',7),(3,3,'Somying3','Ying3','Suay3','Jatujak','third@gmail.com','2000-08-13','0900000003','F',6),(4,4,'Somying4','Ying4','Suay4','Talard Plu','fourth@gmail.com','1999-09-09','0900000004','F',5);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Deals`
--

DROP TABLE IF EXISTS `Deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Deals` (
  `StoreID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  PRIMARY KEY (`StoreID`,`EmployeeID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `deals_ibfk_1` FOREIGN KEY (`StoreID`) REFERENCES `store` (`storeid`),
  CONSTRAINT `deals_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`employeeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deals`
--

LOCK TABLES `Deals` WRITE;
/*!40000 ALTER TABLE `Deals` DISABLE KEYS */;
INSERT INTO `Deals` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1);
/*!40000 ALTER TABLE `Deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Department` (
  `DepartmentID` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(200) NOT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (1,'Programmer'),(2,'Project Manager'),(3,'Developer'),(4,'System Analyst');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Discount`
--

DROP TABLE IF EXISTS `Discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Discount` (
  `PromotionID` int(11) NOT NULL,
  `PercentDiscount` int(11) DEFAULT NULL,
  `ItemDiscount` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PromotionID`),
  CONSTRAINT `discount_ibfk_1` FOREIGN KEY (`PromotionID`) REFERENCES `promotion` (`promotionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Discount`
--

LOCK TABLES `Discount` WRITE;
/*!40000 ALTER TABLE `Discount` DISABLE KEYS */;
INSERT INTO `Discount` VALUES (3,20,'Adidas pureboost DPR'),(4,30,'Adidas pureboost DPR'),(5,30,'Adidas Fading linear');
/*!40000 ALTER TABLE `Discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Employee` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentID` int(11) NOT NULL,
  `EmployeeName` varchar(20) NOT NULL,
  `EmployeeMidname` varchar(20) DEFAULT NULL,
  `EmployeeSurname` varchar(20) NOT NULL,
  `EmployeeAddress` varchar(80) NOT NULL,
  `EmployeePhone` varchar(10) NOT NULL,
  `EmployeeBirthDate` date NOT NULL,
  `EmployeeSex` char(1) DEFAULT NULL,
  `ProfilePhoto` blob,
  `DateHired` date NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `DepartmentID` (`DepartmentID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`departmentid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,1,'Panjapol','Oz','Sanguanpanich','Talad Plu','0811111111','1997-01-01','M',NULL,'2018-05-16'),(2,2,'Phakin','Kok','Deesee','U-Center','0822222222','1997-02-20','M',NULL,'2017-04-14'),(3,3,'Warit','Dol','Prasartritha','MBK','0933333333','1998-03-24','M',NULL,'2018-06-15'),(4,4,'Tanat','Nat','Hophisarn','Phetchaburi','0944444444','1998-04-10','M',NULL,'2017-05-12');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gift`
--

DROP TABLE IF EXISTS `Gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Gift` (
  `PromotionID` int(11) NOT NULL,
  `GiftName` varchar(20) DEFAULT NULL,
  `GiftType` varchar(20) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  `Weight` float DEFAULT NULL,
  PRIMARY KEY (`PromotionID`),
  CONSTRAINT `gift_ibfk_1` FOREIGN KEY (`PromotionID`) REFERENCES `promotion` (`promotionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gift`
--

LOCK TABLES `Gift` WRITE;
/*!40000 ALTER TABLE `Gift` DISABLE KEYS */;
INSERT INTO `Gift` VALUES (5,'Teddy Bear',NULL,100,179);
/*!40000 ALTER TABLE `Gift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Have`
--

DROP TABLE IF EXISTS `Have`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Have` (
  `StoreID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  PRIMARY KEY (`StoreID`,`CategoryID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `have_ibfk_1` FOREIGN KEY (`StoreID`) REFERENCES `store` (`storeid`),
  CONSTRAINT `have_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Have`
--

LOCK TABLES `Have` WRITE;
/*!40000 ALTER TABLE `Have` DISABLE KEYS */;
INSERT INTO `Have` VALUES (1,1),(2,1),(5,1),(3,2),(7,2),(4,4),(5,5),(6,6);
/*!40000 ALTER TABLE `Have` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Manages`
--

DROP TABLE IF EXISTS `Manages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Manages` (
  `PPCID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  PRIMARY KEY (`PPCID`,`EmployeeID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `manages_ibfk_1` FOREIGN KEY (`PPCID`) REFERENCES `ppc` (`ppcid`),
  CONSTRAINT `manages_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`employeeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Manages`
--

LOCK TABLES `Manages` WRITE;
/*!40000 ALTER TABLE `Manages` DISABLE KEYS */;
INSERT INTO `Manages` VALUES (1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2);
/*!40000 ALTER TABLE `Manages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Offers`
--

DROP TABLE IF EXISTS `Offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Offers` (
  `StoreID` int(11) NOT NULL,
  `PrivilegeID` int(11) NOT NULL,
  `PromotionID` int(11) NOT NULL,
  PRIMARY KEY (`StoreID`,`PrivilegeID`,`PromotionID`),
  KEY `PrivilegeID` (`PrivilegeID`),
  KEY `PromotionID` (`PromotionID`),
  CONSTRAINT `offers_ibfk_1` FOREIGN KEY (`StoreID`) REFERENCES `store` (`storeid`),
  CONSTRAINT `offers_ibfk_2` FOREIGN KEY (`PrivilegeID`) REFERENCES `privilege` (`privilegeid`),
  CONSTRAINT `offers_ibfk_3` FOREIGN KEY (`PromotionID`) REFERENCES `promotion` (`promotionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Offers`
--

LOCK TABLES `Offers` WRITE;
/*!40000 ALTER TABLE `Offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhoneOperator`
--

DROP TABLE IF EXISTS `PhoneOperator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PhoneOperator` (
  `OperatorID` int(11) NOT NULL,
  `OperatorName` varchar(20) NOT NULL,
  `OperatorClass` varchar(20) NOT NULL,
  PRIMARY KEY (`OperatorID`),
  CONSTRAINT `phoneoperator_ibfk_1` FOREIGN KEY (`OperatorID`) REFERENCES `privilege` (`privilegeid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhoneOperator`
--

LOCK TABLES `PhoneOperator` WRITE;
/*!40000 ALTER TABLE `PhoneOperator` DISABLE KEYS */;
INSERT INTO `PhoneOperator` VALUES (15,'TruemoveH','Standard'),(16,'TruemoveH','Red Card'),(17,'TruemoveH','Black Red'),(18,'AIS','Standard'),(19,'AIS','SerenadeEmerald'),(20,'AIS','SerenadeGold'),(21,'AIS','SerenadePlatinum'),(22,'Dtac','Standard'),(23,'Dtac','Blue Member');
/*!40000 ALTER TABLE `PhoneOperator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PPC`
--

DROP TABLE IF EXISTS `PPC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PPC` (
  `PPCID` int(11) NOT NULL AUTO_INCREMENT,
  `PPCName` varchar(200) NOT NULL,
  `PPCType` varchar(200) NOT NULL,
  PRIMARY KEY (`PPCID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PPC`
--

LOCK TABLES `PPC` WRITE;
/*!40000 ALTER TABLE `PPC` DISABLE KEYS */;
INSERT INTO `PPC` VALUES (1,'ธนาคารไทยพาณิชย์','Bank'),(2,'ธนาคารกรุงเทพ','Bank'),(3,'ธนาคารกสิกรไทย','Bank'),(4,'ธนาคารกรุงไทย','Bank'),(5,'7-Eleven','Brand'),(6,'Samsung','Brand'),(7,'True','Brand'),(8,'AIS','Brand'),(9,'Dtac','Brand');
/*!40000 ALTER TABLE `PPC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Privilege`
--

DROP TABLE IF EXISTS `Privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Privilege` (
  `PrivilegeID` int(11) NOT NULL AUTO_INCREMENT,
  `PrivilegeType` varchar(15) NOT NULL,
  `PPCID` int(11) NOT NULL,
  PRIMARY KEY (`PrivilegeID`),
  KEY `PPCID` (`PPCID`),
  CONSTRAINT `privilege_ibfk_1` FOREIGN KEY (`PPCID`) REFERENCES `ppc` (`ppcid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Privilege`
--

LOCK TABLES `Privilege` WRITE;
/*!40000 ALTER TABLE `Privilege` DISABLE KEYS */;
INSERT INTO `Privilege` VALUES (1,'Card',1),(2,'Card',1),(3,'Card',1),(4,'Card',2),(5,'Card',2),(6,'Card',2),(7,'Card',3),(8,'Card',3),(9,'Card',3),(10,'Card',4),(11,'Card',4),(12,'Card',4),(13,'Card',5),(14,'App',6),(15,'PhoneOperator',7),(16,'PhoneOperator',7),(17,'PhoneOperator',7),(18,'PhoneOperator',8),(19,'PhoneOperator',8),(20,'PhoneOperator',8),(21,'PhoneOperator',8),(22,'PhoneOperator',9),(23,'PhoneOperator',9);
/*!40000 ALTER TABLE `Privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Promotion`
--

DROP TABLE IF EXISTS `Promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Promotion` (
  `PromotionID` int(11) NOT NULL AUTO_INCREMENT,
  `StoreID` int(11) DEFAULT NULL,
  `PromotionName` varchar(25) NOT NULL,
  `PromotionDesc` varchar(100) NOT NULL,
  `PromotionType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PromotionID`),
  KEY `StoreID` (`StoreID`),
  CONSTRAINT `promotion_ibfk_1` FOREIGN KEY (`StoreID`) REFERENCES `store` (`storeid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Promotion`
--

LOCK TABLES `Promotion` WRITE;
/*!40000 ALTER TABLE `Promotion` DISABLE KEYS */;
INSERT INTO `Promotion` VALUES (1,2,'ไก่จัดเอง','เลือกจัดชุดเมนูโปรดได้ตามใจ ง่ายๆแค่ 3 ขั้นตอน 299B',NULL),(2,2,'ไก่พร้อมลุย ชิลลีชีส','ไก่กรอบชิลลี่ชีส 3 ชิ้น\nไก่ทอด 2 ชิ้น\nวิงซ์แซ่บ 6 ชิ้น\nมันบด (ปกติ) 1 ถ้วย\n259B',NULL),(3,3,'ลดราคารองเท้า','Adidas pureboost DPR','Discount'),(4,3,'ลดราคารองเท้า','Adidas Neo','Discount'),(5,3,'ลดราคาเสื้อ','Adidas Fading linear เสื้อยืด 800 -> 560B','Discount'),(6,5,'ของที่ระลึกจาก Amway','สะสมแต้ม Attendant จาก Application รับของที่ละลึกสุดพิเศษ','Gift');
/*!40000 ALTER TABLE `Promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShippingCompany`
--

DROP TABLE IF EXISTS `ShippingCompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ShippingCompany` (
  `ShippingCompanyID` int(11) NOT NULL AUTO_INCREMENT,
  `ShippingCompanyName` varchar(30) NOT NULL,
  `ShippingCompanyAddress` varchar(50) NOT NULL,
  `ShippingCompanyTel` varchar(10) NOT NULL,
  `ShippingMakeCondate` date NOT NULL,
  `ShippingConExp` date NOT NULL,
  PRIMARY KEY (`ShippingCompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShippingCompany`
--

LOCK TABLES `ShippingCompany` WRITE;
/*!40000 ALTER TABLE `ShippingCompany` DISABLE KEYS */;
INSERT INTO `ShippingCompany` VALUES (1,'Kerry express','Siam square','0922767171','2018-07-19','2018-12-20'),(2,'SCG express','????????','022398999','2018-08-20','2018-12-15');
/*!40000 ALTER TABLE `ShippingCompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShippingDetail`
--

DROP TABLE IF EXISTS `ShippingDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ShippingDetail` (
  `ShippingID` int(11) NOT NULL AUTO_INCREMENT,
  `ShippingCompanyID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `CustomerAddress` varchar(200) DEFAULT NULL,
  `TrackNo` varchar(20) DEFAULT NULL,
  `TransactionID` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`ShippingID`),
  KEY `ShippingCompanyID` (`ShippingCompanyID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `TransactionID` (`TransactionID`),
  CONSTRAINT `shippingdetail_ibfk_1` FOREIGN KEY (`ShippingCompanyID`) REFERENCES `shippingcompany` (`shippingcompanyid`),
  CONSTRAINT `shippingdetail_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`customerid`),
  CONSTRAINT `shippingdetail_ibfk_3` FOREIGN KEY (`TransactionID`) REFERENCES `transactiont` (`transactionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShippingDetail`
--

LOCK TABLES `ShippingDetail` WRITE;
/*!40000 ALTER TABLE `ShippingDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShippingDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Store`
--

DROP TABLE IF EXISTS `Store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Store` (
  `StoreID` int(11) NOT NULL AUTO_INCREMENT,
  `StoreName` varchar(200) NOT NULL,
  `Contact` varchar(200) NOT NULL,
  PRIMARY KEY (`StoreID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Store`
--

LOCK TABLES `Store` WRITE;
/*!40000 ALTER TABLE `Store` DISABLE KEYS */;
INSERT INTO `Store` VALUES (1,'Bonchon','023213129'),(2,'KFC','facebook: kfc'),(3,'Adidas','www.adidas.co.th?'),(4,'Uptoys','idline: storeuptoys'),(5,'AMWAY','www.amwayshopping.com'),(6,'IT City','www.itcity.co.th'),(7,'H&M','020309777');
/*!40000 ALTER TABLE `Store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransactionT`
--

DROP TABLE IF EXISTS `TransactionT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TransactionT` (
  `TransactionID` int(11) NOT NULL AUTO_INCREMENT,
  `DateOfTransaction` date NOT NULL,
  `DateSent` date NOT NULL,
  `DateReceive` date NOT NULL,
  PRIMARY KEY (`TransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransactionT`
--

LOCK TABLES `TransactionT` WRITE;
/*!40000 ALTER TABLE `TransactionT` DISABLE KEYS */;
/*!40000 ALTER TABLE `TransactionT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Uploads`
--

DROP TABLE IF EXISTS `Uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Uploads` (
  `EmployeeID` int(11) NOT NULL,
  `PromotionID` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeID`,`PromotionID`),
  KEY `PromotionID` (`PromotionID`),
  CONSTRAINT `uploads_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`employeeid`),
  CONSTRAINT `uploads_ibfk_2` FOREIGN KEY (`PromotionID`) REFERENCES `promotion` (`promotionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Uploads`
--

LOCK TABLES `Uploads` WRITE;
/*!40000 ALTER TABLE `Uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `Uploads` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-14 21:00:59
