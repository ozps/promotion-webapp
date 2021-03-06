-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: DBweb2
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (1,'Food'),(2,'Fashion'),(3,'Sport and travel'),(4,'Baby and toy'),(5,'Health and beauty'),(6,'Electronic device'),(7,'online shop');
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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,1,'Somying1','Ying1','Suay1','Siam','first@gmail.com','1993-06-11','0900000001','F',8),(2,2,'Somying2','Ying2','Suay2','Saladang','second@gmail.com','1994-07-02','0900000002','F',7),(3,3,'Somying3','Ying3','Suay3','Jatujak','third@gmail.com','2000-08-13','0900000003','F',6),(4,4,'Somying4','Ying4','Suay4','Talard Plu','fourth@gmail.com','1999-09-09','0900000004','F',5),(5,1,'Ursuline',NULL,'Bartolomucci','18 Bluestem Junction','pbartolomucci0@altervista.org','1972-06-23','7483125389','M',18),(6,4,'Charo',NULL,'Felce','073 Waubesa Drive','cfelce1@un.org','2001-08-17','8824247073','M',697),(7,4,'Ros',NULL,'Grishanin','0 Marcy Hill','jgrishanin2@comsenz.com','1973-06-21','8682972858','M',133),(8,3,'Tiffy','Loutitia','Coupman','8 Prairie Rose Place','lcoupman3@live.com','1976-04-16','5836547614','M',762),(9,3,'Christie','Glenden','Bawdon','268 Anderson Parkway','gbawdon4@hatena.ne.jp','2007-06-30','5829777054','F',512),(10,2,'Ertha',NULL,'Ivshin','28 Northfield Pass','vivshin5@uol.com.br','1975-07-22','4274412522','M',604),(11,4,'Mary',NULL,'Midner','07973 Crownhardt Pass','amidner6@ustream.tv','2004-11-03','5585019319','M',544),(12,2,'Chandal',NULL,'Vosper','08186 Hauk Junction','jvosper7@google.com.hk','1989-07-03','9729906711','M',595),(13,4,'Freddie','Carolee','Court','2 Duke Drive','ccourt8@addtoany.com','1971-02-15','6602979914','F',191),(14,1,'Mame','Kellia','Johnsey','24169 Trailsway Lane','kjohnsey9@ycombinator.com','1982-04-12','3886655224','F',536),(15,4,'Sylvia','Janaye','Creagh','238 Hudson Lane','jcreagh0@163.com','1989-10-10','8458438553','M',693),(16,2,'Eldredge',NULL,'Pittel','7826 Harper Plaza','tpittel1@discuz.net','2007-10-04','9023122155','M',65),(17,4,'Alfie',NULL,'Limpkin','20 Corscot Court','llimpkin2@soundcloud.com','1976-05-26','4279246697','F',744),(18,1,'Goldina',NULL,'Cratere','2 Thompson Trail','ecratere3@cnet.com','1980-08-07','7928303558','M',85),(19,4,'Reeta',NULL,'Stiebler','14 Crescent Oaks Way','astiebler4@ibm.com','2007-03-01','5614646975','M',693),(20,1,'Sybille',NULL,'Holde','50569 Schmedeman Circle','vholde5@unesco.org','2003-09-22','9679202904','M',991),(21,4,'Crawford',NULL,'Foro','5 Schlimgen Hill','aforo6@seattletimes.com','1972-06-24','5307793647','M',549),(22,3,'Joline',NULL,'Lett','7 Sundown Place','glett7@ebay.com','1995-10-21','3623046002','M',238),(23,2,'Anet',NULL,'Mcwhinney','0 Weeping Birch Trail','amcwhinney8@state.gov','1996-06-06','2407899145','F',533),(24,4,'Silvain',NULL,'McKinless','0091 Stephen Pass','nmckinless9@exblog.jp','1995-05-29','9414550877','F',440),(25,3,'Julio',NULL,'Lamble','058 Bellgrove Center','plamblea@nydailynews.com','1982-10-15','5366458646','M',942),(26,2,'Norah',NULL,'Hicken','842 Grim Circle','fhickenb@skype.com','1999-11-18','5607517254','F',205),(27,2,'Eadmund',NULL,'Klejin','42164 Chinook Terrace','lklejinc@google.com.br','1980-03-06','2498052049','M',268),(28,3,'Arne',NULL,'Dockrill','48 Hanson Lane','kdockrilld@google.pl','1992-03-10','4873921294','F',206),(29,1,'Quintilla','Edna','Nowaczyk','16 Pankratz Alley','enowaczyke@answers.com','1996-05-08','8164586628','F',997),(30,3,'Haven',NULL,'McKeachie','79109 Hayes Hill','fmckeachief@w3.org','1983-01-11','8509654255','F',932),(31,3,'Oren','Legra','Clayal','0 Gateway Hill','lclayalg@wired.com','1981-06-28','8736875645','F',766),(32,3,'Arielle',NULL,'Cellone','1877 Warbler Hill','vcelloneh@photobucket.com','1971-09-23','7982794685','M',987),(33,3,'Ly',NULL,'Lambrecht','6523 Troy Plaza','mlambrechti@ed.gov','1989-05-20','4314708384','M',750),(34,1,'Corinne','Kassey','Gonzalvo','070 Merrick Street','kgonzalvoj@chicagotribune.com','1997-10-28','3826802484','M',810),(35,1,'Oates',NULL,'Tremblet','90 Cascade Plaza','rtrembletk@google.pl','1977-09-12','9131627446','M',718),(36,2,'Engelbert','Allister','Reglar','198 Hagan Trail','areglarl@flavors.me','1988-02-10','5775990519','M',573),(37,3,'Angelia',NULL,'Clubley','6 Cascade Crossing','sclubleym@squarespace.com','2008-05-05','3238624730','M',843),(38,1,'Carlie',NULL,'Lembcke','9 Mariners Cove Way','dlembcken@163.com','1992-02-17','2578345886','M',926),(39,3,'Bernadina',NULL,'Girodias','7826 Sunbrook Street','rgirodiaso@netscape.com','1971-12-01','6049195563','F',127),(40,1,'Glen',NULL,'Hargreves','51 Oneill Junction','mhargrevesp@state.tx.us','1973-07-23','7203829621','M',716),(41,1,'Dianne','Phelia','Kira','76 Jenifer Court','pkiraq@meetup.com','1985-06-17','9768637519','M',612),(42,4,'Fleming',NULL,'Drinkhall','7 Grasskamp Way','pdrinkhallr@yellowpages.com','1998-07-05','6423275535','M',693),(43,2,'Vanny','Norman','Studde','132 Thompson Crossing','nstuddes@diigo.com','1985-08-07','8545772328','M',469),(44,4,'Nicolais',NULL,'Hyndley','99 Valley Edge Plaza','thyndleyt@squidoo.com','1990-01-15','6422258500','M',797),(45,2,'Olivier',NULL,'Kellert','170 Eggendart Road','ckellertu@photobucket.com','1991-04-13','5357213919','F',347),(46,2,'Karel',NULL,'Rilings','87 Sachtjen Hill','zrilingsv@un.org','1980-10-29','1307782661','F',814),(47,2,'Donnie',NULL,'Pauletto','3 Kensington Trail','apaulettow@google.fr','1972-12-02','7422937364','M',762),(48,1,'Kristofor',NULL,'Milella','01967 East Park','bmilellax@toplist.cz','2002-03-15','5304420481','M',143),(49,2,'Valerye',NULL,'Grannell','4 Clemons Center','dgrannelly@japanpost.jp','1998-10-18','9115932484','M',232),(50,1,'Christean',NULL,'Tottie','7752 Milwaukee Terrace','gtottiez@blogspot.com','2008-05-14','3645184261','M',588),(51,2,'Wernher',NULL,'Gounod','1009 Marcy Parkway','jgounod10@china.com.cn','1982-05-29','6107715181','F',678),(52,3,'Melonie','Brett','Corck','279 Burning Wood Court','bcorck11@usda.gov','1991-09-03','9204005364','F',437),(53,2,'Horst','Travus','Riccelli','2901 Judy Center','triccelli12@slideshare.net','2000-07-24','3565091649','M',619),(54,4,'Antony',NULL,'Windeatt','09 Moose Court','pwindeatt13@tinyurl.com','2001-10-21','1181457622','M',119),(55,3,'Vitoria',NULL,'Oland','225 Russell Court','toland14@macromedia.com','1983-08-05','4799183881','F',892),(56,1,'Jessika',NULL,'Carrington','630 Memorial Court','acarrington15@exblog.jp','2002-06-04','5735477158','F',100),(57,4,'Janek',NULL,'Sellers','90702 Amoth Terrace','msellers16@stumbleupon.com','1989-07-15','9622695017','M',867),(58,4,'Briny','Hayes','Scholte','203 West Plaza','hscholte17@1688.com','1976-01-31','9493573472','M',929),(59,4,'Arleen',NULL,'Paton','69 Columbus Avenue','rpaton18@blogger.com','1994-02-01','3956469504','F',583),(60,4,'Abbott',NULL,'Carnoghan','4247 Prairie Rose Plaza','fcarnoghan19@ibm.com','2002-02-16','1305031438','M',647),(61,3,'Geoffry',NULL,'Stook','81059 Mccormick Plaza','dstook1a@ted.com','1985-03-22','4539062556','F',418),(62,2,'Sandi',NULL,'Meaking','1 Stang Circle','tmeaking1b@eventbrite.com','1973-01-01','4194327959','M',947),(63,2,'Zechariah',NULL,'Steutly','801 Carioca Terrace','gsteutly1c@google.co.jp','1997-01-22','6276020846','M',235),(64,4,'Alexandr',NULL,'MacSherry','32 Crowley Way','bmacsherry1d@delicious.com','2005-01-01','1249392536','F',15),(65,4,'Leoline','Barty','Salaman','01914 Vermont Crossing','bsalaman1e@census.gov','1983-01-22','1497498690','M',120),(66,2,'Joelie',NULL,'Rosborough','6 Division Place','erosborough1f@house.gov','1978-11-23','3112626764','F',436),(67,1,'Delmer',NULL,'Dennerley','73 Chive Trail','ldennerley1g@jigsy.com','1979-05-30','9438203947','F',751),(68,2,'Randene','Ezechiel','Covotto','12552 Commercial Point','ecovotto1h@tiny.cc','1999-07-16','9309509248','F',306),(69,1,'Ted',NULL,'Truckell','559 Clarendon Way','jtruckell1i@cbc.ca','1977-04-24','9186460263','F',84),(70,3,'Evvy',NULL,'Rummer','26991 Lakewood Gardens Terrace','mrummer1j@bandcamp.com','1993-02-27','8615015811','F',479),(71,3,'Mario',NULL,'Berndtssen','93028 Twin Pines Hill','jberndtssen1k@fotki.com','1990-04-20','2596983537','F',546),(72,3,'Gabi',NULL,'Farquar','3 Loeprich Center','mfarquar1l@fda.gov','1971-02-19','3621077135','F',639),(73,2,'Herbie',NULL,'Hugues','2873 Artisan Circle','whugues1m@auda.org.au','1984-12-30','8143500774','F',454),(74,1,'Malena','Gail','Hulstrom','6970 Arapahoe Parkway','ghulstrom1n@jimdo.com','1971-10-04','2965654975','M',337),(75,2,'Dunstan',NULL,'Argent','625 Orin Way','rargent1o@nydailynews.com','2004-01-27','7908167785','F',448),(76,3,'Juliana',NULL,'Cluff','95 Roth Drive','dcluff1p@discovery.com','1995-09-08','9161868844','M',350),(77,1,'Alis',NULL,'Naisbitt','24124 Hagan Trail','cnaisbitt1q@devhub.com','2001-03-10','4805444754','F',178),(78,2,'Shalom','Caresse','Greatham','49 Amoth Court','cgreatham1r@icio.us','1995-06-21','6036960872','M',606),(79,2,'Roscoe',NULL,'Crimpe','4 Chinook Drive','scrimpe1s@mozilla.com','1995-10-16','6487106630','M',177),(80,3,'Artemis','Reece','McInility','33 Kinsman Park','rmcinility1t@miitbeian.gov.cn','1988-10-26','5161705256','F',358),(81,1,'Reina',NULL,'Grainge','621 Truax Center','agrainge1u@spotify.com','2005-06-27','2288553724','M',308),(82,1,'Euell',NULL,'Overington','3510 Washington Plaza','roverington1v@reverbnation.com','1986-01-22','9062656856','F',362),(83,3,'Van',NULL,'Garahan','52 Steensland Park','lgarahan1w@digg.com','1977-01-02','3361622269','F',185),(84,3,'Sigfried',NULL,'Ianelli','631 Warner Hill','sianelli1x@springer.com','1983-08-31','6298771136','M',867),(85,3,'Jasmine',NULL,'Vivash','45 Carioca Junction','bvivash1y@un.org','2007-08-31','1029495146','M',809),(86,1,'Saunderson',NULL,'Shippey','47 Westridge Plaza','ashippey1z@artisteer.com','1995-03-21','1685306539','F',549),(87,4,'Alexei',NULL,'Beakes','843 Logan Terrace','dbeakes20@virginia.edu','1985-02-01','2557169493','M',846),(88,2,'Helenelizabeth',NULL,'Levee','9236 Helena Place','wlevee21@prweb.com','2002-06-12','4486882087','M',413),(89,1,'Duncan',NULL,'Leagas','29709 Elmside Point','wleagas22@boston.com','1972-02-08','7578095616','F',481),(90,4,'Edin',NULL,'Roycraft','87 Crowley Alley','droycraft23@nih.gov','1996-07-19','1876789772','F',875),(91,4,'Major',NULL,'Bissiker','3263 Esker Parkway','cbissiker24@npr.org','1988-09-26','7731295602','F',871),(92,1,'Alexine',NULL,'Bolton','6767 Blackbird Street','mbolton25@123-reg.co.uk','1996-04-26','4253696281','M',180),(93,1,'Rafe','Wandie','Cowper','8 Division Parkway','wcowper26@qq.com','1987-05-08','5497524057','F',894),(94,2,'Richmound','Corrianne','Mountain','99341 Johnson Center','cmountain27@nbcnews.com','1988-10-12','3012135601','M',696),(95,2,'Eal',NULL,'Whittier','2161 Oak Terrace','twhittier28@fda.gov','1990-05-16','5772719860','F',246),(96,4,'Cloris','Aurilia','Chidwick','40700 Cambridge Plaza','achidwick29@salon.com','2002-01-16','6987979693','M',113),(97,3,'Jacky',NULL,'Dikelin','812 Rockefeller Point','ddikelin2a@toplist.cz','1979-12-27','4212434002','F',424),(98,1,'Thomasina','Emerson','Kettlestringe','2 Southridge Crossing','ekettlestringe2b@gnu.org','1986-06-14','9125946421','M',295),(99,1,'Kenton',NULL,'Breydin','952 Tomscot Crossing','rbreydin2c@nasa.gov','1981-05-23','8652132412','M',811),(100,2,'Mort','Germaine','Tomenson','91219 Fair Oaks Parkway','gtomenson2d@google.ca','1997-05-13','2427754809','F',12),(101,2,'Garnette',NULL,'Wanka','86 Mcbride Circle','iwanka2e@cnet.com','1971-04-01','6513193537','F',395),(102,1,'Reiko',NULL,'Taylerson','651 Hanson Plaza','ntaylerson2f@elegantthemes.com','1990-06-21','3159075163','M',727),(103,3,'Jessi',NULL,'Gabbat','3 Bunker Hill Crossing','lgabbat2g@elegantthemes.com','1998-12-30','1054017549','F',635),(104,3,'Allie',NULL,'Waleran','889 Little Fleur Trail','mwaleran2h@gravatar.com','1995-12-20','6179205715','F',383),(105,3,'Andras',NULL,'Nangle','57 Fordem Lane','cnangle2i@chicagotribune.com','1986-04-05','9201147506','F',96),(106,4,'Shelbi',NULL,'Dufaire','8219 Mendota Pass','gdufaire2j@cyberchimps.com','1981-05-30','1021343906','M',231),(107,1,'Emmalynn',NULL,'Berni','8617 Hazelcrest Center','kberni2k@xing.com','1972-09-21','7475911800','M',975),(108,3,'Leontyne',NULL,'Bockman','721 North Plaza','lbockman2l@hugedomains.com','1976-07-16','9891369491','F',415),(109,1,'Elissa',NULL,'Folan','43 Prairieview Drive','afolan2m@sakura.ne.jp','1983-06-04','5672503226','F',327),(110,4,'Alyson',NULL,'Fernandez','3082 Schiller Alley','zfernandez2n@state.tx.us','1971-08-16','5839962498','F',891),(111,4,'Eveline',NULL,'Thomas','6319 Schurz Lane','cthomas2o@salon.com','1991-02-08','8877607796','F',423),(112,1,'Magdalene',NULL,'Birbeck','88 Starling Parkway','cbirbeck2p@sakura.ne.jp','1992-06-21','3263198052','M',879),(113,2,'Hi',NULL,'Bealing','31397 Barby Plaza','bbealing2q@1688.com','2002-11-02','5981501695','M',500),(114,2,'Agata','Irwinn','Maffia','011 Golf Course Point','imaffia2r@fc2.com','1985-03-25','2197480222','F',323);
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
INSERT INTO `Discount` VALUES (3,20,'Adidas pureboost DPR'),(4,30,'Adidas pureboost DPR'),(5,30,'Adidas Fading linear'),(7,12,NULL),(8,15,'อาหาร'),(9,10,'อาหาร'),(10,10,'Buffet 399 baht');
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
INSERT INTO `Have` VALUES (1,1),(2,1),(5,1),(9,1),(10,1),(3,2),(7,2),(4,4),(5,5),(6,6),(8,7);
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
INSERT INTO `Offers` VALUES (9,1,8),(10,1,9),(9,2,8),(10,2,9),(9,3,8),(10,3,9),(8,10,7),(8,11,7),(8,12,7),(11,18,10),(11,19,10),(11,20,10),(11,21,10),(8,22,11),(8,23,11);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Promotion`
--

LOCK TABLES `Promotion` WRITE;
/*!40000 ALTER TABLE `Promotion` DISABLE KEYS */;
INSERT INTO `Promotion` VALUES (1,2,'ไก่จัดเอง','เลือกจัดชุดเมนูโปรดได้ตามใจ ง่ายๆแค่ 3 ขั้นตอน 299B',NULL),(2,2,'ไก่พร้อมลุย ชิลลีชีส','ไก่กรอบชิลลี่ชีส 3 ชิ้น\nไก่ทอด 2 ชิ้น\nวิงซ์แซ่บ 6 ชิ้น\nมันบด (ปกติ) 1 ถ้วย\n259B',NULL),(3,3,'ลดราคารองเท้า','Adidas pureboost DPR','Discount'),(4,3,'ลดราคารองเท้า','Adidas Neo','Discount'),(5,3,'ลดราคาเสื้อ','Adidas Fading linear เสื้อยืด 800 -> 560B','Discount'),(6,5,'ของที่ระลึกจาก Amway','สะสมแต้ม Attendant จาก Application รับของที่ละลึกสุดพิเศษ','Gift'),(7,8,'ส่วนลดบัตรเครดิต KTB','รับส่วนลด 12% + คะแนนสะสมสูงสุด x12 เมื่อช้อปตั้งแต่ 1,200 บาท ขึ้นไป','Discount'),(8,9,'กินข้าวกันมั้ย','รับส่วนลดค่าอาหาร 15%','Discount'),(9,10,'กินข้าวกันมั้ย','รับส่วนลดค่าอาหาร 10%','Discount'),(10,11,'ลูกค้า AIS','รับส่วนลด 40 บาท สำหรับ Buffet 399','Discount'),(11,8,'ส่วนลดพิเศษลูกค้า dtac','รับส่วนลดเพิ่ม 399 บาท เพียงกด *140*0990# แล้วโทรออก','Discount');
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
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `store` (
  `StoreID` int(11) NOT NULL AUTO_INCREMENT,
  `StoreName` varchar(200) NOT NULL,
  `Contact` varchar(200) NOT NULL,
  PRIMARY KEY (`StoreID`),
  KEY `StoreName` (`StoreName`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Bonchon','023213129'),(2,'KFC','facebook: kfc'),(3,'Adidas','www.adidas.co.th?'),(4,'Uptoys','idline: storeuptoys'),(5,'AMWAY','www.amwayshopping.com'),(6,'IT City','www.itcity.co.th'),(7,'H&M','020309777'),(8,'Lazada','www.lazada.co.th'),(9,'HONMONO SUSHI','02-185-1447'),(10,'SO asean','02-121-1909'),(11,'Sukishi','www.sukishigroup.com');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
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

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `User` (
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('admin','1234');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-28 23:06:51
