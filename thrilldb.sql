-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: thrilltrack
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `ActivityID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) NOT NULL,
  `Description` text,
  `Location` varchar(255) DEFAULT NULL,
  `Duration` varchar(50) DEFAULT NULL,
  `ImageURL` varchar(255) DEFAULT NULL,
  `ThumbnailURL` varchar(255) DEFAULT NULL,
  `ActivityTypeID` int DEFAULT NULL,
  `DifficultyLevel` varchar(50) DEFAULT NULL,
  `LCity` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ActivityID`),
  KEY `ActivityTypeID` (`ActivityTypeID`),
  CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`ActivityTypeID`) REFERENCES `activitytypes` (`ActivityTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'Ratangad Fort Trekking','Ratan means Jewel in Hindi. This hill fort is indeed a jewel among all the hill forts here in Sahyadri. It is located in the district of Ahmednagar and is about 4255 feet above sea level. It lies in the Ajoba mountain range surrounded by great mountains of Kulang, Alang, Kalsubai, Katarabai, Ajoba, and Ghanchakkar. Geographically, Ratangad is at the banks of Bhandardara lake of Ahmednagar district. With views of the lake and the highest mountains in Sahyadris, it looks very much lost in time. At the base of this fort is an ancient Lord Shiva (Amruteshwar) temple, an absolute paragon of high-class architecture of our ancestors.','Ratanwadi village Ahmednagar MH','1 Day, 1 Hour','acti_res/ratangad1.jpg','acti_res/ratangad.jpg',1,'Moderate','Pune'),(2,'Kalsubai Peak Trekking','Kalsubai Peak Trek with a height of 1646 meters or 5400 Feet is famous as the highest peak in Maharashtra. Kalsubai Mountain lies in the Sahyadri mountain range falling under Kalsubai Harishchandragad Wildlife Sanctuary. Kalsubai Height being the highest peak commands a beautiful view. Since Bhandardara Dam and Kalsubai Peak are extremely famous, enough effort has been made to make this trek easy. There are steel railings, chains, and ladders at places where it is difficult to climb.','Bari village Ahmednagar MH','1 Night, 1 Day','acti_res/Kalsubai1.jpg','acti_res/Kalsubai.jpg',1,'Moderate','Mumbai'),(3,'Torna Fort Trekking','Torna is one of the grandest forts of the Sahyadris. Situated at an elevation of 1400 m above MSL, Torna earns the much-glorified title of ????????. It is Swarajya\'s first conquered fort and has some astonishing features like ?????? ????, ??????????. Torna provides a scenic view of Panshet backwaters, Pabey ghat, Sinhagad, Rajgad Fort, etc. This fort is a must-visit on anyone\'s trekking/adventure list. As stated by James Douglas \"If Sinhagad is a Lion?s cave then Torna is an eagle?s nest, this fort truly stands for what his words.','Velhe village in Pune District of Maharashtra','15 Hours','acti_res/torna.jpg','acti_res/torna(1).jpg',1,'Moderate','Pune'),(4,'Rajgad Fort Trekking','Rajgad is an enormous fort. Rajgad means King of all forts. It is located southwest 60 Kms from Pune. Chhatrapati Shivaji Maharaj spent a great deal of his time on this fort close to 25 years. Rajgad is famous for its construction layout. The fort can be divided into four different parts based on geographical terrain and fortification. There are three sub-plateau Machi, namely Padmavati Machi, Suvela Machi, and Sanjevani Machi, and at the center is the Ballekilla.','Gunjavane village in Pune MH','16 Hours','acti_res/raj1.jpg','acti_res/raj.jpg',1,'Moderate','Pune'),(5,'Visapur Fort Trekking','The famous monsoon Sahyadri Fort is more massive than the twin fort Lohagad. Visapur Fort Lonavala is at a higher altitude than Lohagad fort. Many caves, water tanks, old houses, arches, waterfalls, and temples are on the Sahyadri Fort. There are two buildings which are roofless now, government offices from the past. A stone-built home at Visapur Fort called Peshwas Wada is popular. Lord Hanuman carving is seen at the Fort, and there are many temples dedicated to him at the Fort. Visapur is an ideal trekking destination near Mumbai, Pune, Lonavala.','Visapur village in Maharashtra','1 Day','acti_res/visapur1.jpg','acti_res/visapur.jpg',1,'Easy','Pune'),(6,'Rajmachi Fort Trekking','Rajmachi Fort is a historical fort having two stronghold forts in Lonavala. Forts of Rajmachi Lonavala are Shrivardhan and Manaranjan. Visible from Mumbai Pune Expressway on the right-hand side of Borghat, a popular spot near Khandala known as Rajmachi View Point. Rajmachi is a famous spot for trekking in popular Lonavala Hill Stations. \n\nLonavala to Rajmachi Fort is a 16 km trekking distance from Lonavala, and there are many routes to reach Rajmachi Fort. We will be staying at Udhewadi Village, located below the two Balekilla; only camping during the winter and summer months is possible at Udhewadi. \n\nIn the monsoon, you can see the beautiful Kataldhar waterfall from Shrivardhan Fort. Rajmachi Fort near Karjat has many caves used by trekkers for night halt. Rajmachi Fort is located strategically overlooking Borghat, a historical trade route in Sahyadri Mountains. Popular among trekkers of India as one of the best trekking places in Maharashtra.','Gunjavane Kondhane village Raigad District MH','1 Day','acti_res/Rajmachi1.jpg','acti_res/Rajmachi.jpg',1,'Moderate','Pune'),(7,'Lohgad Fort Trekking','Description-Lohagad Fort means Iron Fort in Marathi. Situated close to the hill station of Lonavala Khandala and 52 km northwest of Pune, Lohagad rises to an elevation of 1,033 meters, or 3,389 feet, above sea level. The Lohagad Killa is connected to the neighboring Visapur Fort, which is on its eastern side by a small range. The range divides the basins of the Indrayani River and the Pavana River. Lohagad Pune overlooks the Pawna lake, located to the south of the mountain. The hill extends to the northwest to a fortified spur, called Vinchu Kata Scorpions Tail, because of its resembling shape. The four large gates of Lohagad are still in good condition and reasonably intact. The fort has been declared as a protected monument by the Archaeology Survey of India. The best trekking routes near Mumbai and Pune for beginners. On the bucket list of all Mumbai hikers are places near Lonavala to visit.','Lohagad village Pune district MH','1 Day','acti_res/lohgad1.jpg','acti_res/lohgad.jpg',1,'Easy','Pune'),(8,'Matheran Camping','Matheran Hill Station is one of the most surreal sites near which is only 110 kilometers from Pune and 80 kilometers from Mumbai. This exceptional and unexplored campsite is situated around Neral, which is perfect for an awesome weekend getaway. Close yet far from the swarmed Lonavala, you can camp here and enjoy nature at its utmost. \n\nLife in the city makes it a must to set out on a quick weekend getaway, to escape the chaos and madness of the urban jungle. Matheran Hill Station camping is one of a kind as it presents its campers with myriad visuals of scenic beauty, never seen before. The campsite will give you a true raw camping experience in nature. \n\nLocated on the mound of the Matheran near Neral Karjat is a quiet campsite encircled by historical hiking routes of Dodhani, Garbett, One tree hill, and Peb Fort. The Matheran Lake water is supposed to be sparkling that reflects the sky. Matheran campsite countryside backdrop and old-world charm are what attract the campers most to this peaceful abode.','Kasturba Rd, Matheran, MH','Overnight (4 PM to next day 11 AM)','acti_res/matheran1.jpg','acti_res/matheran.jpg',2,'Easy','Mumbai'),(9,'Dehne Asangaon Camping','Embark on a stargazing and photography tour at Dehne around new moon nights along with tented camping and stay under the stars with the cool breeze from the surrounding mountain range. Here, learn about how to explore the Northern Hemisphere Constellations and identify them with the help of telescopes as the experts guide you properly. You will be able to understand the star photography technique and shoot the milky way and the obvious star trails. Plan for an extravagant weekend getaway to feel refreshed amid the splendid nature when the twinkling stars take care of you.','suburban Thane Mumbai MH','Overnight (4 PM to next day 11 AM)','acti_res/dehne1.jpg','acti_res/dehne.jpg',2,'Easy','Mumbai'),(10,'Pawna Lake Camping','Pawna Lake Camping Is An Activity Of Spending A Holiday Living In A Tent. Sometimes, city life can be a bit much. You need respite with some green space, lake water, fresh air to clear the mind. A quick weekend escape can do wonders to recharge the battery. And you would be surprised to know many excellent Pawna Lake Camping locations are just a short drive from Pune, Mumbai.','Lonavla district MH','Overnight (4 PM to next day 11 AM)','acti_res/pawna1.jpg','acti_res/pawna.jpg',2,'Easy','Pune'),(11,'Karjat Riverside Camping','Thrill Track introduces our new campsite at Karjat with water sports with limited capacity to avoid overcrowding. Camping near Mumbai, our campsite is an ideal distance and budget-friendly. We provide twin-sharing and triple-sharing tents with veg and non-veg food available. Enjoy water sports activities like boating and kayaking.','Karjat Dahivali MH','Overnight (4 PM to next day 11 AM)','acti_res/karjat1.jpg','acti_res/karjat.jpg',2,'Easy','Mumbai'),(12,'Alibaug Beach Camping','Weekend Feels bring you Alibaug Beach Camping. Alibaug beach is clean, uncrowded, and peaceful, making it ideal for beach camping. The camping will be among the greenery of the coconut groves inside Revdanda Fort. The Revdanda fort is on the beach itself. If laying back on hammocks is not your style, you can spend your day participating in water sports, playing beach volleyball, or just getting a dip in the water. The nighttime is the best as you can see the star-filled sky, light up a bonfire, try your hand at BBQ & just chill with your buddies. The sea breeze coupled with the ambiance at our campsite doubles up the fun quotient.','Main Beach Koliwada Alibag MH','Overnight (4 PM to next day 11 AM)','acti_res/alibagh1.jpg','acti_res/alibagh.jpg',2,'Easy','Mumbai'),(13,'Scuba Diving In Malvan','Malvan refers to a picturesque town with beautiful beaches that serve as ideal spots for various adventure activities & water sports. This pristine & offbeat destination lets you soothe your eyes with scenic landscapes of wide-stretched beaches & explore underwater aquatic life at the same time. Go for scuba diving along with some other adventure sports such as parasailing, speedboat, jet skiing, etc. No matter if you are a beginner or an expert, these watersports can be enjoyed alone or with your family. Experience a thrilling 10-minute underwater dive up to 25 feet in the Arabian Sea. Enjoy fun water sports like Parasailing, Jet Ski Ride, Banana Ride, Bumper Ride & Boat Ride. Get accompanied by a certified PADI instructor to ensure a safe scuba diving experience.','Malvan Beach, Goa','10 mins dive with PADI instructor','acti_res/malvan1.png','acti_res/malvan.jpg',3,'Hard','Pune'),(14,'Tarkarli Scuba Diving','If you love thrill and adventure, then embark on a fun-filled day out and avail this exciting activity of Tarkarli scuba diving that is surely going to fill your heart with immense satisfaction. Enjoy this amazing activity and go deep into the blue body of water and witness the underwater life by yourself! Tarkarli Scuba Diving will surely pump up your adrenaline rush and get you moving. \nEnjoy the best 30-minutes of your life as you dive under the water and witness the aquatic life around you. You will be able to get an HD video of your underwater experience to make it a memorable time that you will always cherish. Dive into this course with a PADI certified Scuba Diving instructor who will guide you step by step through the techniques of breathing underwater and other essential skills.','Dandeshwar Temple Tarkarli Beach, Malvan','10 mins dive with PADI instructor','acti_res/tarkali1.jpg','acti_res/tarkali.jpg',3,'Hard','Pune'),(15,'Scuba Diving in Mumbai','Come along with your friends and family to indulge in the most thrilling activity, scuba diving, that will fascinate you enough if you are a water sports lover. Explore the elusive creatures of water life as you go deep into the water, touch the rocks, sit on the bottom, and play with the sand. Appreciate the feel of absolute freedom as you enjoy scuba diving. \n\nLeave all your worries behind and get a sense of relaxation as you keep focusing on breathing while going deep into the water. It is the perfect opportunity to feel amazed by the truly beautiful natural environment and feel closer to nature. The wild Scuba Diving experience is all set to thrill you, and the place welcomes the water sports lovers with a warm heart. Dive into this course with a PADI certified Scuba Diving instructor who will guide you step by step through the techniques of breathing underwater and other essential skills.','Mumbai, Maharashtra','45 mins dive with PADI instructor','acti_res/Mumbai1.jpg','acti_res/Mumbai.jpg',3,'Hard','Pune'),(16,'Kataldhar waterfall rappelling','Kataldhar waterfall is a trek found in Ulhas Valley near Lonavala in the Pune region, Maharashtra. Lonavala region includes many waterfalls, and Kataldhar waterfall is one of the most different amongst all others in Lonavala. It is not much known because it\'s challenging to reach due to its dense forest, and one can easily get lost there in the woods. Kataldhar Waterfall is a seasonal waterfall, and after the monsoon season, the waterfall dries up. \n\nKataldhar waterfall is a seasonal waterfall, so the rappelling event depends on the flow of the waterfall. This rappelling event is about 350 feet and an overhang of more than 100 feet. \n\nAge Group: 16 to 50 yrs \n\nWeight limit for activity - 35 kgs to 95 kgs \n\nEndurance Level: High','Fanasrai village Lonavala MH','3 hrs','acti_res/kataldhar.jpg','acti_res/kataldhar(1).jpg',4,'Tough','Pune'),(17,'Madheghat Waterfall Rappelling','Madhe Ghat is located in Maharashtra state India around 62 km southwest of Pune bordering Raigad district and in the vicinity of Torna Fort, Rajgad, Raigad Fort and backwaters of Bhatghar dam. \n\nAge Group: 16 to 50 yrs \n\nEndurance Level: High  \n\nWeight limit for activity - 35 kgs to 95 kgs','Madheghat via Nasrapur Velha MH','1 hr','acti_res/Madheghat1.jpg','acti_res/Madheghat.jpg',4,'Medium','Pune'),(18,'Dhangar Waterfall Rappelling','Dhangar Waterfall Rappelling is famous for beautiful views and beautiful monsoon weather. Add to it the excitement of rappelling down a 75 feet waterfall and Flying Fox activity.  \n\nOur day will begin with a trek to Dhangar Waterfall. Parking is available at a village nearby, and we will share the location after registration. The mountain range of Navara Navari can be seen in the background. During monsoon, many waterfalls are available nearby, and the forest comes alive with rains. \n\nAge Group: 16 to 50 yrs \n\nEndurance Level: High  \n\nWeight limit for activity - 35 kgs to 95 kgs','Badlapur station MH','1 Day','acti_res/Dhangar1.jpg','acti_res/Dhangar.jpg',4,'Medium','Mumbai'),(19,'Bekare Waterfall Rappelling','Monsoon season has begun, and we welcome adventure sports enthusiasts at Bekare Waterfall Rappelling. Bhivpuri near Karjat is famous for many Waterfall Rappelling locations like Diksal Waterfall, Bhivpuri Waterfall Rappelling, and Ashane. Located close to Mumbai, Panvel, and Thane, it is easy to travel for a one-day picnic and adventure sports activities.  \n\nWe will spend the weekend trekking and relaxing at the waterfall. Soak in the beautiful monsoon views and get refreshed and energized for Waterfall Rappelling. You can take many pictures and create videos using an action camera to share your memories with your friends and families on social media. Bekare Waterfall is located near Bekare village. Bhivpuri is an ideal weekend getaway near Mumbai for a one-day outing, easily reachable by train or vehicle. \n\nAge Group: 16 to 50 yrs \n\nEndurance Level: High  \n\nWeight limit for activity - 35 kgs to 95 kgs','Bekre Village MH','1 Day','acti_res/bekare1.jpg','acti_res/bekare.jpg',4,'Medium','Mumbai'),(20,'Diksal Waterfall Rappelling','Description: Diksal waterfall is located near Bhivpuri station. You would need to trek one hour from Bhivpuri railway station to reach Diksal Waterfall. The height of the waterfall is 115 feet. The trek is very easy with beautiful panoramic views of the surrounding. You will walk beside the Dhom dam while crossing a small water stream. This short trek is one of the most scenic treks that can be done easily by all age groups. \n\nThe waterfall lies just below a small village known as Sagachi wadi. The famous Garbett point trek can be done via this route from the village. On the top of this village, the beautiful Matheran range can be seen. \n\nDiksal Waterfall Height: 115 feet \n\nDiksal Waterfall Rappelling Grade: Thrilling \n\nAge Group: 16 to 50 yrs \n\nEndurance Level: High  \n\nWeight limit for activity - 35 kgs to 95 kgs','Bhivpuri Road MH','1 Day','acti_res/diksal1.jpg','acti_res/diksal.jpg',4,'Medium','Mumbai');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_organizers`
--

DROP TABLE IF EXISTS `activity_organizers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_organizers` (
  `ActivityID` int NOT NULL,
  `OrganizerID` int NOT NULL,
  PRIMARY KEY (`ActivityID`,`OrganizerID`),
  KEY `OrganizerID` (`OrganizerID`),
  CONSTRAINT `activity_organizers_ibfk_1` FOREIGN KEY (`ActivityID`) REFERENCES `activities` (`ActivityID`),
  CONSTRAINT `activity_organizers_ibfk_2` FOREIGN KEY (`OrganizerID`) REFERENCES `organizers` (`OrganizerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_organizers`
--

LOCK TABLES `activity_organizers` WRITE;
/*!40000 ALTER TABLE `activity_organizers` DISABLE KEYS */;
INSERT INTO `activity_organizers` VALUES (3,1),(3,3),(1,4),(2,4),(3,4),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4),(11,4),(12,4),(13,4),(14,4),(15,4),(16,4),(17,4),(18,4),(19,4),(20,4),(1,5),(2,5),(3,5),(4,5),(5,5),(7,5),(8,5),(10,5),(11,5),(12,5),(13,5),(14,5),(15,5),(16,5),(17,5),(18,5),(19,5),(20,5),(1,6),(2,6),(3,6),(6,6),(9,6),(11,6),(12,6),(13,6),(14,6),(15,6),(16,6),(17,6),(18,6),(19,6),(20,6);
/*!40000 ALTER TABLE `activity_organizers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activityoccurrences`
--

DROP TABLE IF EXISTS `activityoccurrences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activityoccurrences` (
  `OccurrenceID` int NOT NULL AUTO_INCREMENT,
  `ActivityID` int DEFAULT NULL,
  `OrganizerID` int DEFAULT NULL,
  `OccurrenceDate` date DEFAULT NULL,
  `OccurrenceTime` time DEFAULT NULL,
  `MaximumCapacity` int DEFAULT NULL,
  `AvailableCapacity` int DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`OccurrenceID`),
  KEY `ActivityID` (`ActivityID`),
  KEY `OrganizerID` (`OrganizerID`),
  CONSTRAINT `activityoccurrences_ibfk_1` FOREIGN KEY (`ActivityID`) REFERENCES `activity_organizers` (`ActivityID`),
  CONSTRAINT `activityoccurrences_ibfk_2` FOREIGN KEY (`OrganizerID`) REFERENCES `activity_organizers` (`OrganizerID`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activityoccurrences`
--

LOCK TABLES `activityoccurrences` WRITE;
/*!40000 ALTER TABLE `activityoccurrences` DISABLE KEYS */;
INSERT INTO `activityoccurrences` VALUES (1,3,1,'2024-11-26','16:00:00',50,50,1550.00),(2,3,3,'2028-01-26','06:00:00',500,500,1880.00),(3,1,4,'2024-05-15','06:30:00',40,40,500.00),(4,1,5,'2024-05-22','06:00:00',60,60,800.00),(5,1,6,'2024-05-28','04:30:00',30,30,900.00),(6,2,4,'2024-05-25','06:30:00',40,40,500.00),(7,2,5,'2024-05-22','06:00:00',60,60,800.00),(8,2,6,'2024-05-28','04:30:00',30,30,900.00),(9,3,4,'2024-05-25','06:30:00',40,38,500.00),(10,3,5,'2024-05-22','06:00:00',60,60,800.00),(11,3,6,'2024-05-28','04:30:00',30,30,900.00),(12,4,4,'2024-05-25','06:30:00',40,40,500.00),(13,4,5,'2024-05-22','06:00:00',60,60,800.00),(14,4,6,'2024-05-28','04:30:00',30,30,900.00),(15,5,4,'2024-05-25','06:30:00',40,40,500.00),(16,5,5,'2024-05-22','06:00:00',60,60,800.00),(17,5,6,'2024-05-28','04:30:00',30,30,900.00),(18,6,4,'2024-05-25','06:30:00',40,40,500.00),(19,6,5,'2024-05-22','06:00:00',60,60,800.00),(20,6,6,'2024-05-28','04:30:00',30,30,900.00),(21,7,4,'2024-05-25','06:30:00',40,40,500.00),(22,7,5,'2024-05-22','06:00:00',60,60,800.00),(23,7,6,'2024-05-28','04:30:00',30,30,900.00),(24,8,4,'2024-05-25','06:30:00',40,38,500.00),(25,8,5,'2024-05-22','06:00:00',60,60,800.00),(26,8,6,'2024-05-28','04:30:00',30,30,900.00),(27,9,4,'2024-05-25','06:30:00',40,40,500.00),(28,9,5,'2024-05-22','06:00:00',60,60,800.00),(29,9,6,'2024-05-28','04:30:00',30,30,900.00),(30,10,4,'2024-05-25','06:30:00',40,40,500.00),(31,10,5,'2024-05-22','06:00:00',60,60,800.00),(32,10,6,'2024-05-28','04:30:00',30,30,900.00),(33,11,4,'2024-05-25','06:30:00',40,40,500.00),(34,11,5,'2024-05-22','06:00:00',60,60,800.00),(35,11,6,'2024-05-28','04:30:00',30,30,900.00),(36,12,4,'2024-05-25','06:30:00',40,40,500.00),(37,12,5,'2024-05-22','06:00:00',60,60,800.00),(38,12,6,'2024-05-28','04:30:00',30,30,900.00),(39,13,4,'2024-05-25','06:30:00',40,40,500.00),(40,13,5,'2024-05-22','06:00:00',60,60,800.00),(41,13,6,'2024-05-28','04:30:00',30,30,900.00),(42,14,4,'2024-05-25','06:30:00',40,40,500.00),(43,14,5,'2024-05-22','06:00:00',60,60,800.00),(44,14,6,'2024-05-28','04:30:00',30,30,900.00),(45,15,4,'2024-05-25','06:30:00',40,40,500.00),(46,15,5,'2024-05-22','06:00:00',60,60,800.00),(47,15,6,'2024-05-28','04:30:00',30,30,900.00),(48,16,4,'2024-05-25','06:30:00',40,40,500.00),(49,16,5,'2024-05-22','06:00:00',60,60,800.00),(50,16,6,'2024-05-28','04:30:00',30,30,900.00),(51,17,4,'2024-05-25','06:30:00',40,40,500.00),(52,17,5,'2024-05-22','06:00:00',60,60,800.00),(53,17,6,'2024-05-28','04:30:00',30,30,900.00),(54,18,4,'2024-05-25','06:30:00',40,40,500.00),(55,18,5,'2024-05-22','06:00:00',60,60,800.00),(56,18,6,'2024-05-28','04:30:00',30,30,900.00),(57,19,4,'2024-05-25','06:30:00',40,40,500.00),(58,19,5,'2024-05-22','06:00:00',60,60,800.00),(59,19,6,'2024-05-28','04:30:00',30,30,900.00),(60,20,4,'2024-05-25','06:30:00',40,40,500.00),(61,20,5,'2024-05-22','06:00:00',60,60,800.00),(62,20,6,'2024-05-28','04:30:00',30,30,900.00);
/*!40000 ALTER TABLE `activityoccurrences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activitytypes`
--

DROP TABLE IF EXISTS `activitytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activitytypes` (
  `ActivityTypeID` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`ActivityTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activitytypes`
--

LOCK TABLES `activitytypes` WRITE;
/*!40000 ALTER TABLE `activitytypes` DISABLE KEYS */;
INSERT INTO `activitytypes` VALUES (1,'Trekking'),(2,'Camping'),(3,'Scuba Diving'),(4,'Rappelling');
/*!40000 ALTER TABLE `activitytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `OccurrenceID` int DEFAULT NULL,
  `BookingDate` datetime DEFAULT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL,
  `PaymentStatus` enum('Pending','Completed','Cancelled') DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `UserID` (`UserID`),
  KEY `OccurrenceID` (`OccurrenceID`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`OccurrenceID`) REFERENCES `activityoccurrences` (`OccurrenceID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (20,2,3,'2024-04-15 02:57:52',5000.00,'Completed'),(21,2,3,'2024-04-15 02:59:46',5000.00,'Completed'),(22,2,3,'2024-04-15 03:01:51',5000.00,'Pending'),(23,2,3,'2024-04-15 03:01:51',5000.00,'Completed'),(24,2,24,'2024-04-15 03:03:55',1000.00,'Completed'),(25,6,9,'2024-04-15 07:23:28',1000.00,'Pending'),(26,6,9,'2024-04-15 07:23:28',1000.00,'Completed');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizers`
--

DROP TABLE IF EXISTS `organizers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizers` (
  `OrganizerID` int NOT NULL AUTO_INCREMENT,
  `OrganizerName` varchar(100) NOT NULL,
  `OrganizerEmail` varchar(255) DEFAULT NULL,
  `OrganizerPassword` varchar(20) DEFAULT NULL,
  `Description` text,
  PRIMARY KEY (`OrganizerID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizers`
--

LOCK TABLES `organizers` WRITE;
/*!40000 ALTER TABLE `organizers` DISABLE KEYS */;
INSERT INTO `organizers` VALUES (1,'Organizer 1','org1@gmail.com','org1pass@1','Hii this is organzier 1'),(2,'Organizer 2','org2@gmail.com','org2pass@2','Hii this is organzier 2'),(3,'Organizer 3','org3@gmail.com','org3pass@3','Hii this is organzier 3'),(4,'Great Indian Trekkers','git@gmail.com','Git@123','Great Operators'),(5,'GS Travellers','git@gmail.com','Git@123','Great Operators'),(6,'GS Travellers','git@gmail.com','Git@123','Great Operators');
/*!40000 ALTER TABLE `organizers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participants` (
  `ParticipantID` int NOT NULL AUTO_INCREMENT,
  `BookingID` int DEFAULT NULL,
  `ParticipantName` varchar(100) NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Gender` enum('Male','Female','Other') DEFAULT NULL,
  `ContactInformation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ParticipantID`),
  KEY `BookingID` (`BookingID`),
  CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `bookings` (`BookingID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
INSERT INTO `participants` VALUES (27,20,'Vivek Pravin Jain','2000-06-10','Male','09423596363'),(28,21,'Vivek Pravin Jain','2001-01-01','Male','09423596363'),(29,23,'Vivek Pravin Jain','2000-01-01','Male','09423596363'),(30,24,'Mahesh','2000-01-01','Male','6542364125'),(31,24,'Mahesh ka baap','2000-01-01','Male','6464464646'),(32,26,'Vivek','2002-01-01','Male','9423596363'),(33,26,'Mahesh','2002-02-05','Male','9444663322');
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'vivj753@gmail.com','Vivek@123','Vivek','2002-06-10','Pune','9423596363'),(2,'viv@gmail.com','Vivek@11','Vivek','2002-06-10','Pune','9423596363'),(3,'mahesh@gmail.com','Mahesh@123','Mahesh Bhagat','2002-01-01','Pune and Mumabi','9494949494'),(4,'abcdef@gmail.com','Abcdef@123','Name updated','2000-01-01','Mumbai','9494225566'),(5,'naveena@gmail.com','Naveena@123','Naveena','2000-01-01','Pune','9363855274'),(6,'user1@gmail.com','User@1234','User2','2000-01-01','Pune','852396321');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-22 19:05:37
