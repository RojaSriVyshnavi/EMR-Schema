-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: emr
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `diagnostics`
--

DROP TABLE IF EXISTS `diagnostics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostics` (
  `diagnostic_id` int NOT NULL,
  `visit_id` int NOT NULL,
  `diagnosis_code` varchar(100) NOT NULL,
  `diagnosis_description` varchar(255) NOT NULL,
  `Test` varchar(255) NOT NULL,
  PRIMARY KEY (`diagnostic_id`),
  KEY `diagnostics_ibfk_1` (`visit_id`),
  CONSTRAINT `diagnostics_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`visit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostics`
--

LOCK TABLES `diagnostics` WRITE;
/*!40000 ALTER TABLE `diagnostics` DISABLE KEYS */;
INSERT INTO `diagnostics` VALUES (1,1215,'K21.9','Gastroesophageal Reflux Disease without Esophagitis','Endoscopy'),(2,1623,'M54.2','Cervicalgia','Skin Prick Test'),(3,9873,'I20.9','Angina Pectoris','Complete Blood Count'),(4,1871,'F32.9',' Major Depressive Disorder, Single Episode, Unspecified','Hamilton Rating Scale for Depression (HAM-D)'),(5,1984,'N18.9','Chronic Kidney Disease','Serum Creatinine'),(6,3876,'G47.00','Insomnia','Neurological Examination'),(7,1923,'I10','Essential (Primary) Hypertension','Rapid Antigen Test'),(8,1054,'M54.5','Low Back Pain','MRI'),(9,1567,'J45.909','Asthma','Chest X-Ray'),(10,4345,'E11.9','Type 2 Diabetes Mellitus Without Complications','Blood glucose level'),(11,7655,'Z00.0','General Adult Medical Examination without Abnormal Findings','Blood test'),(12,6343,'G40.909','Epilepsy','EEG'),(13,7098,'K50.90','Crohns Disease','Colonoscopy'),(14,8106,'J30.1','Allergic Rhinitis due to Pollen','Sputum test'),(15,9098,'M25.511','Pain in Right Shoulder','CT Scan'),(16,1093,'H40.9','Glaucoma','Eye Test'),(17,1984,'A49.9','Bacterial infection','Stool examination'),(18,1812,'A92.0','Japanese encephalitis','MRI Brain'),(19,2032,'A00.0','Cholera due to Vibrio cholerae 01, biovar cholerae','PCR'),(20,1852,'A75.9','Typhus fever','Fever Profile');
/*!40000 ALTER TABLE `diagnostics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `patient_id` int NOT NULL,
  `patient_name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (11,'john danny','1990-01-15','Male','123-456-7890'),(32,'Michael Johnson','1982-08-10','Male','555-111-3333'),(45,'Jane Smith','1985-05-20','Female','987-654-3210'),(47,'Emily Davis','1995-03-25','Female','444-222-1111'),(58,'Robert Brown','1978-12-05','Male','999-888-7777'),(63,'Sophia White','1993-06-18','Female','666-333-1111');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `providers` (
  `provider_id` int NOT NULL,
  `provider_name` varchar(50) NOT NULL,
  `speciality` varchar(50) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES (125,'Dr. Harry','Cardiologist','555-111-2222'),(278,'Dr.Tom','Dermatologist','555-333-4444'),(312,'Dr. Will','Oncologist','555-555-5555'),(498,'Dr. Taylor','Pediatrician','555-777-8888'),(534,'Dr. Andrew','Orthopedic Surgeon','555-999-0000'),(623,'Dr. Max','Psychiatrist','555-222-3333');
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment` (
  `medication_id` varchar(45) NOT NULL,
  `visit_id` int NOT NULL,
  `medication_name` varchar(100) NOT NULL,
  `dosage` varchar(20) NOT NULL,
  PRIMARY KEY (`medication_id`),
  KEY `treatment_ibfk_1` (`visit_id`),
  CONSTRAINT `treatment_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`visit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES ('AA',1215,'Protonix','40mg'),('BB',1623,'Ibuprofen','400mg'),('CC',9873,'Nitroglycerin','0.4mg sublingual'),('DD',9098,'Acetaminophen','500mg'),('EE',8106,'Loratadine','10mg'),('GH',1054,'Tramadol','50mg'),('HH',6343,'Lamotrigine','100mg'),('IK',7655,'Vitamin D supplement','1 tablet'),('JJ',1852,'Antibiotics (as per specific type of typhus)','500mg'),('KK',7098,'Infliximab','IV infusion'),('MM',1984,'Antibiotic (based on culture sensitivity)','650mg'),('OP',1567,'Albuterol','Inhalation'),('pp',1093,'Timolol','0.25%'),('RQ',1812,'Vaccination (Japanese Encephalitis)','300mg'),('RR',1984,'Losartan','50mg'),('TU',4345,'Metformin','500mg'),('TY',3876,'Zolpidem','10mg'),('UH',1923,'Amlodipine','5mg'),('VV',2032,'Oral Rehydration Solution (ORS)','As per prescription'),('YY',1871,'Sertraline','50mg');
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visits` (
  `visit_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `provider_id` int NOT NULL,
  `visit_date` date NOT NULL,
  `symptoms` varchar(255) NOT NULL,
  PRIMARY KEY (`visit_id`),
  KEY `visits_ibfk_1` (`patient_id`),
  KEY `visits_ibfk_2` (`provider_id`),
  CONSTRAINT `visits_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  CONSTRAINT `visits_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (1054,58,498,'2023-10-20','Back pain'),(1093,32,125,'2024-01-10','Flu symptoms'),(1215,45,312,'2024-03-20','Eczema flare-up'),(1567,11,125,'2023-01-02','Chest pain'),(1623,63,498,'2024-04-25','Annual physical'),(1812,63,125,'2024-06-10','Digestive problems'),(1852,11,623,'2023-12-01','Migraine'),(1871,63,534,'2023-11-25','Stress and insomnia'),(1923,32,278,'2024-07-15','Headache and dizziness'),(1984,58,278,'2024-02-15','Diabetes checkup'),(2032,58,312,'2024-08-20','Allergy checkup'),(2123,45,278,'2023-02-05','Skin rash'),(3876,32,312,'2023-03-10','Fatigue and weight loss'),(4345,47,498,'2023-04-15','Rheumatoid arthritis'),(6343,63,623,'2023-06-25','Anxiety and depression'),(7098,45,125,'2023-07-01','High fever'),(7655,58,534,'2023-05-20','Joint pain'),(8106,32,278,'2023-08-10','Allergic reaction'),(9098,47,312,'2023-09-15','Routine checkup'),(9873,47,534,'2024-05-01','Respiratory issues');
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-30 21:38:44
