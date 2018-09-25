-- MySQL dump 10.13  Distrib 5.7.21, for macos10.13 (x86_64)
--
-- Host: localhost    Database: Learning_log
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (7,'xxx'),(4,'可操作主题、笔记、历史记录'),(3,'可操作分组'),(1,'可操作用户信息'),(5,'空白组');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (4,1,22),(1,1,23),(3,1,24),(10,3,7),(8,3,8),(9,3,9),(11,4,16),(12,4,17),(13,4,18),(14,4,19),(15,4,20),(16,4,21),(17,4,25),(18,4,26),(19,4,27);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add topic',6,'add_topic'),(17,'Can change topic',6,'change_topic'),(18,'Can delete topic',6,'delete_topic'),(19,'Can add entry',7,'add_entry'),(20,'Can change entry',7,'change_entry'),(21,'Can delete entry',7,'delete_entry'),(22,'Can add user',8,'add_user'),(23,'Can change user',8,'change_user'),(24,'Can delete user',8,'delete_user'),(25,'Can add history',9,'add_history'),(26,'Can change history',9,'change_history'),(27,'Can delete history',9,'delete_history');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-04-07 03:40:42.158936','2','xxxxxx',3,'',8,1),(2,'2018-04-07 03:45:14.699910','5','test3',3,'',8,1),(3,'2018-04-07 03:45:14.706513','4','test2',3,'',8,1),(4,'2018-04-10 06:30:05.577984','3','test1',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',8,1),(5,'2018-04-10 06:30:05.581444','1','ll_admin',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',8,1),(6,'2018-04-20 08:58:33.294000','3','test1',2,'[{\"changed\": {\"fields\": [\"isAlive\"]}}]',8,1),(7,'2018-04-20 09:00:36.683412','3','test1',2,'[]',8,1),(8,'2018-04-20 09:16:35.486376','3','test1',2,'[{\"changed\": {\"fields\": [\"is_active\"]}}]',8,1),(9,'2018-04-20 09:17:02.059926','3','test1',2,'[{\"changed\": {\"fields\": [\"is_active\"]}}]',8,1),(10,'2018-04-22 10:53:22.417381','6','xiezi',2,'[{\"changed\": {\"fields\": [\"is_active\"]}}]',8,1),(11,'2018-05-05 14:22:11.766514','1','测试组',1,'[{\"added\": {}}]',3,1),(12,'2018-05-05 14:32:45.261403','3','test1',2,'[]',8,1),(13,'2018-05-05 14:33:29.931635','9','mingnaichao',1,'[{\"added\": {}}]',8,1),(14,'2018-05-05 14:33:37.853812','9','mingnaichao',2,'[]',8,1),(15,'2018-05-05 14:33:53.645415','9','mingnaichao',3,'',8,1),(16,'2018-05-05 15:05:27.598814','8','lizheng',2,'[]',8,1),(17,'2018-05-06 00:54:09.749399','10','mingnaichao',1,'[{\"added\": {}}]',8,1),(18,'2018-05-06 00:54:16.593247','10','mingnaichao',2,'[]',8,1),(19,'2018-05-06 00:54:17.636674','10','mingnaichao',2,'[]',8,1),(20,'2018-05-06 01:00:22.502552','1','测试组',2,'[]',3,1),(21,'2018-05-06 02:04:58.293274','3','test1',2,'[{\"changed\": {\"fields\": [\"last_login\", \"is_staff\", \"groups\"]}}]',8,1),(22,'2018-05-06 02:06:16.740437','10','mingnaichao',3,'',8,1),(23,'2018-05-06 02:08:23.673705','1','可操作用户',2,'[{\"changed\": {\"fields\": [\"name\", \"permissions\"]}}]',3,1),(24,'2018-05-06 02:08:26.367236','1','可操作用户',2,'[]',3,1),(25,'2018-05-06 02:08:45.739247','2','可操作日志记录',1,'[{\"added\": {}}]',3,1),(26,'2018-05-06 02:09:11.981150','3','可操作分组',1,'[{\"added\": {}}]',3,1),(27,'2018-05-06 02:10:30.520719','4','可操作主题、笔记、历史记录',1,'[{\"added\": {}}]',3,1),(28,'2018-05-06 02:10:54.727451','3','test1',2,'[{\"changed\": {\"fields\": [\"last_login\", \"groups\"]}}]',8,1),(29,'2018-05-06 02:11:35.589052','3','test1',2,'[{\"changed\": {\"fields\": [\"last_login\", \"groups\"]}}]',8,1),(30,'2018-05-06 02:13:09.015442','3','test1',2,'[{\"changed\": {\"fields\": [\"last_login\", \"groups\"]}}]',8,1),(31,'2018-05-06 02:14:13.738391','3','test1',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',8,1),(32,'2018-05-06 02:14:43.120590','3','test1',2,'[{\"changed\": {\"fields\": [\"is_superuser\"]}}]',8,3),(33,'2018-05-06 02:15:16.786843','3','test1',2,'[{\"changed\": {\"fields\": [\"is_superuser\"]}}]',8,3),(34,'2018-05-06 02:16:13.379122','1','可操作用户信息',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',3,1),(35,'2018-05-06 02:16:54.634605','3','test1',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"groups\"]}}]',8,1),(36,'2018-05-06 02:17:20.632581','3','test1',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',8,1),(37,'2018-05-06 02:22:53.700873','5','空白组',1,'[{\"added\": {}}]',3,1),(38,'2018-05-06 02:23:08.093229','3','test1',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',8,1),(39,'2018-05-19 10:06:23.936165','4','nibaba',3,'',8,1),(40,'2018-05-19 10:06:39.698990','9','123zxc',3,'',8,1),(41,'2018-05-20 00:56:56.562849','3','test1',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"last_login\"]}}]',8,1),(42,'2018-05-26 01:22:44.821590','3','test1',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"last_login\"]}}]',8,1),(43,'2018-05-27 23:46:50.619002','6','permission',1,'[{\"added\": {}}]',3,1),(44,'2018-05-27 23:47:53.951544','3','test1',2,'[{\"changed\": {\"fields\": [\"groups\", \"last_login\"]}}]',8,1),(45,'2018-05-27 23:49:52.720816','3','test1',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',8,1),(46,'2018-05-27 23:50:15.702992','3','test1',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',8,1),(47,'2018-05-27 23:50:29.402001','6','permission',3,'',3,3),(48,'2018-05-27 23:50:39.278759','2','可操作日志记录',3,'',3,3),(49,'2018-05-27 23:50:45.624447','3','test1',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',8,1),(50,'2018-05-28 03:31:58.100354','3','test1',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"last_login\"]}}]',8,1),(51,'2018-05-28 03:32:19.941700','3','test1',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',8,1),(52,'2018-05-28 03:39:35.939120','3','test1',2,'[{\"changed\": {\"fields\": [\"groups\", \"last_login\"]}}]',8,1),(53,'2018-05-28 03:40:06.171770','7','xxx',1,'[{\"added\": {}}]',3,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(7,'learning_logs','entry'),(9,'learning_logs','history'),(6,'learning_logs','topic'),(5,'sessions','session'),(8,'users','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-04-06 14:32:41.204649'),(2,'contenttypes','0002_remove_content_type_name','2018-04-06 14:32:41.262545'),(3,'auth','0001_initial','2018-04-06 14:32:41.458471'),(4,'auth','0002_alter_permission_name_max_length','2018-04-06 14:32:41.490481'),(5,'auth','0003_alter_user_email_max_length','2018-04-06 14:32:41.498551'),(6,'auth','0004_alter_user_username_opts','2018-04-06 14:32:41.505391'),(7,'auth','0005_alter_user_last_login_null','2018-04-06 14:32:41.511933'),(8,'auth','0006_require_contenttypes_0002','2018-04-06 14:32:41.515545'),(9,'auth','0007_alter_validators_add_error_messages','2018-04-06 14:32:41.522521'),(10,'auth','0008_alter_user_username_max_length','2018-04-06 14:32:41.529153'),(11,'auth','0009_alter_user_last_name_max_length','2018-04-06 14:32:41.535754'),(12,'users','0001_initial','2018-04-06 14:32:41.757404'),(13,'admin','0001_initial','2018-04-06 14:32:41.851835'),(14,'admin','0002_logentry_remove_auto_add','2018-04-06 14:32:41.861781'),(15,'learning_logs','0001_initial','2018-04-06 14:32:41.888388'),(16,'learning_logs','0002_entry','2018-04-06 14:32:41.944423'),(17,'learning_logs','0003_auto_20180331_2209','2018-04-06 14:32:42.004345'),(18,'learning_logs','0004_topic_name','2018-04-06 14:32:42.047017'),(19,'learning_logs','0005_auto_20180331_2239','2018-04-06 14:32:42.053576'),(20,'learning_logs','0006_entry_name','2018-04-06 14:32:42.097106'),(21,'learning_logs','0007_auto_20180331_2303','2018-04-06 14:32:42.109859'),(22,'learning_logs','0008_auto_20180331_2304','2018-04-06 14:32:42.122176'),(23,'learning_logs','0009_auto_20180404_1940','2018-04-06 14:32:42.214409'),(24,'learning_logs','0010_topic_owner','2018-04-06 14:32:42.272512'),(25,'learning_logs','0011_remove_topic_owner','2018-04-06 14:32:42.320326'),(26,'learning_logs','0012_topic_owner','2018-04-06 14:32:42.395863'),(27,'learning_logs','0013_remove_topic_name','2018-04-06 14:32:42.429495'),(28,'learning_logs','0014_auto_20180406_1613','2018-04-06 14:32:42.441642'),(29,'learning_logs','0015_auto_20180406_2232','2018-04-06 14:32:42.516687'),(30,'sessions','0001_initial','2018-04-06 14:32:42.562688'),(31,'users','0002_auto_20180407_1146','2018-04-07 03:46:10.245970'),(32,'learning_logs','0016_entry_owner','2018-04-09 13:19:10.244587'),(33,'learning_logs','0017_auto_20180410_0903','2018-04-10 01:03:19.336404'),(34,'users','0003_auto_20180420_1656','2018-04-20 08:56:58.953522'),(35,'users','0004_auto_20180420_1707','2018-04-20 09:07:12.262462'),(36,'users','0005_auto_20180420_1716','2018-04-20 09:16:12.891688'),(37,'learning_logs','0018_history','2018-05-05 13:27:23.362497'),(38,'learning_logs','0019_auto_20180505_2137','2018-05-05 13:37:17.594990'),(39,'users','0006_auto_20180505_2304','2018-05-05 15:04:14.694673'),(40,'users','0007_auto_20180505_2305','2018-05-05 15:05:10.513854'),(41,'users','0008_auto_20180506_0949','2018-05-06 01:49:44.849735'),(42,'users','0009_auto_20180506_0951','2018-05-06 01:51:52.557852'),(43,'users','0010_auto_20180506_0953','2018-05-06 01:53:06.840846'),(44,'learning_logs','0020_history_num','2018-05-06 03:06:56.273423'),(45,'learning_logs','0021_auto_20180506_1106','2018-05-06 03:06:56.286705');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('322oyu76hkk88mazxenhucjvrk1yyua5','ZWRjNmM0OTI2MjBhN2I1NGYzNDdmZGFkZjk1NzY0ZGMzOTk2MzU4YTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNGUwNDhmNDM0NjgzZDE5ZDFlMzVjYmFiOTg4ZjJmZGE1OWE1NTA2In0=','2018-04-26 12:28:42.150444'),('3jtqtjbclj38kzw9u1wa5jju3eqo8ol9','YTkyMzRjOTJjNjFmOWNiMzAzYzdlODg2NzMyYTAyMjZhNzNkNjk0NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYmU5Y2VmZDg0MzU5MjM3Yjk4OTEwYjVjN2UxZDk2YzEyMDZhNDkxIn0=','2018-05-20 02:11:24.166316'),('5o9grzjow8w5t2py8t7x8i4kgl8pzudy','YTkyMzRjOTJjNjFmOWNiMzAzYzdlODg2NzMyYTAyMjZhNzNkNjk0NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYmU5Y2VmZDg0MzU5MjM3Yjk4OTEwYjVjN2UxZDk2YzEyMDZhNDkxIn0=','2018-06-10 23:45:44.426280'),('ab1n0gotui2q1ld8ocql3t035z1i360o','YTkyMzRjOTJjNjFmOWNiMzAzYzdlODg2NzMyYTAyMjZhNzNkNjk0NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYmU5Y2VmZDg0MzU5MjM3Yjk4OTEwYjVjN2UxZDk2YzEyMDZhNDkxIn0=','2018-05-19 14:16:49.370728'),('c1m6qv3rj6b0q9597g0qlah1tp8xghmw','OGJiNDIxM2YzZWFlZWJkZjUxNmFlNDQ3ODcwZjVhMmZjYmNjNzU4NDp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZWMyY2U1OGM1MzdlN2VjOTEwNzYzM2U2MjliZjMzYjAzOGUyNGJjIn0=','2018-04-26 12:30:27.157823'),('do3sjk5r71rcmcmm4zd7fhqfj63ja518','YTkyMzRjOTJjNjFmOWNiMzAzYzdlODg2NzMyYTAyMjZhNzNkNjk0NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYmU5Y2VmZDg0MzU5MjM3Yjk4OTEwYjVjN2UxZDk2YzEyMDZhNDkxIn0=','2018-04-23 16:03:25.045363'),('ez8s17yi9ku5u9xuq3q571fsas9d3anz','YTkyMzRjOTJjNjFmOWNiMzAzYzdlODg2NzMyYTAyMjZhNzNkNjk0NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYmU5Y2VmZDg0MzU5MjM3Yjk4OTEwYjVjN2UxZDk2YzEyMDZhNDkxIn0=','2018-05-31 09:46:55.857651'),('f9fdooigwznv9bfimgh26pvt2ki7gtdr','YTkyMzRjOTJjNjFmOWNiMzAzYzdlODg2NzMyYTAyMjZhNzNkNjk0NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYmU5Y2VmZDg0MzU5MjM3Yjk4OTEwYjVjN2UxZDk2YzEyMDZhNDkxIn0=','2018-05-17 12:32:26.047572'),('j6twy9491upse0oqd556ksjetuioamg5','YTkyMzRjOTJjNjFmOWNiMzAzYzdlODg2NzMyYTAyMjZhNzNkNjk0NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYmU5Y2VmZDg0MzU5MjM3Yjk4OTEwYjVjN2UxZDk2YzEyMDZhNDkxIn0=','2018-06-24 01:10:24.927881'),('jcfcnd48p7s3sttwpcym4h8r7pb3gkoo','YTkyMzRjOTJjNjFmOWNiMzAzYzdlODg2NzMyYTAyMjZhNzNkNjk0NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYmU5Y2VmZDg0MzU5MjM3Yjk4OTEwYjVjN2UxZDk2YzEyMDZhNDkxIn0=','2018-06-13 05:58:57.607010'),('kkgwlcf1y9tfj5jbz8y8n3i5o0gmn7w9','YjI0Y2Q1NzQxZGJlNzVjYzVkNDZmZWRkYWIxZDJmZWRkZGRjMTE4Mzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlZmNlMzAwMTAxYTUxYTNjYmYwYWMzNWRjZjJjN2FjN2FlYzI3MmIzIn0=','2018-05-04 09:17:08.262706'),('n9as5jgd5w0kutihrxglvfup68rq5lc6','YTkyMzRjOTJjNjFmOWNiMzAzYzdlODg2NzMyYTAyMjZhNzNkNjk0NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYmU5Y2VmZDg0MzU5MjM3Yjk4OTEwYjVjN2UxZDk2YzEyMDZhNDkxIn0=','2018-05-03 13:53:27.152711'),('tqqawzsl1yk8v9t90hvub24kyv1xjujx','YTkyMzRjOTJjNjFmOWNiMzAzYzdlODg2NzMyYTAyMjZhNzNkNjk0NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYmU5Y2VmZDg0MzU5MjM3Yjk4OTEwYjVjN2UxZDk2YzEyMDZhNDkxIn0=','2018-05-29 05:02:47.834075'),('w9038rw8bghy7x1t8n1m1az0u4fyto56','YTkyMzRjOTJjNjFmOWNiMzAzYzdlODg2NzMyYTAyMjZhNzNkNjk0NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYmU5Y2VmZDg0MzU5MjM3Yjk4OTEwYjVjN2UxZDk2YzEyMDZhNDkxIn0=','2018-04-24 15:32:04.966493');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entry`
--

DROP TABLE IF EXISTS `entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_owner_id_1082d35f_fk_users_user_id` (`owner_id`),
  KEY `entry_topic_id_b6c7c41d_fk_topic_id` (`topic_id`),
  CONSTRAINT `entry_owner_id_1082d35f_fk_users_user_id` FOREIGN KEY (`owner_id`) REFERENCES `users_user` (`id`),
  CONSTRAINT `entry_topic_id_b6c7c41d_fk_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entry`
--

LOCK TABLES `entry` WRITE;
/*!40000 ALTER TABLE `entry` DISABLE KEYS */;
INSERT INTO `entry` VALUES (41,'sadfasdfads','2018-04-12 12:31:31.988546',26,5),(43,'《活着》是作家余华的代表作之一，讲诉了在大时代背景下，随着内战、三反五反，大跃进，文化大革命等社会变革，徐福贵的人生和家庭不断经受着苦难，到了最后所有亲人都先后离他而去，仅剩下年老的他和一头老牛相依为命。','2018-04-20 09:51:40.879065',27,1),(44,'《穆斯林的葬礼》是霍达创作的一部长篇小说，该小说以回族手工匠人梁亦清的玉器作坊奇珍斋升沉起伏为主线，在历史的背景下描写梁家三代人不同的命运变迁，表现了主人公为追求理想和事业，为完善自身素质所发出的蓬勃不息的命运意识。','2018-04-20 09:52:53.247436',28,1),(45,'《穆斯林的葬礼》正是着眼于伊斯兰文化与中国传统文化的交融冲突，在中国社会和世界格局的大历史背景下以小见大，通过讲述一个穆斯林家族六十年间的兴衰，三代人命运的沉浮以及在不同时代有着不同内容却又交错扭结的爱情悲剧，融宗教信仰与现实生活，传统文化与现代文化，人性之美与价值之美于一体，折射了在漫长的历史进程中，回族既有保持其阿拉伯民族的 文化渊源的一面，又有与汉文化相互渗透、相互融合的一面。因此，冰心称“它是现代中国百花齐放的文坛上的一朵异卉奇花，挺然独立”','2018-04-20 09:53:20.987244',28,1),(46,'《教父》是由弗朗西斯·福特·科波拉执导，马龙·白兰度、阿尔·帕西诺等主演的黑帮电影，于1972年3月24日在美国上映。\r\n该片改编自马里奥·普佐的同名小说，讲述了以维托·唐·科莱昂为首的黑帮家族的发展过程以及科莱昂的小儿子迈克如何接任父亲成为黑帮首领的故事。1973年该片获得第45届奥斯卡奖最佳电影、最佳男主角、最佳改编剧本奖 [1]  。2007年被美国电影协会选为“百年百佳影片第二位”','2018-04-20 09:54:05.997701',29,1),(47,'jijiiji','2018-04-22 10:49:30.604917',30,6),(48,'gfdghfdghfd','2018-04-22 10:50:34.382408',30,6),(49,'xxxxx','2018-04-23 03:36:10.705070',32,7),(50,'yyyy','2018-04-23 03:36:14.827066',32,7),(51,'哈哈','2018-04-26 10:42:54.001103',33,8);
/*!40000 ALTER TABLE `entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_added` datetime(6) NOT NULL,
  `text` varchar(100) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `history_owner_id_02811237_fk_users_user_id` (`owner_id`),
  CONSTRAINT `history_owner_id_02811237_fk_users_user_id` FOREIGN KEY (`owner_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (15,'2018-05-06 03:13:33.074402','活着',1,22),(17,'2018-05-06 03:16:59.877221','穆斯林的葬礼',1,6),(21,'2018-05-06 04:14:12.203865','教父',1,1),(22,'2018-05-12 13:50:46.167729','白夜行',1,2),(23,'2018-05-13 01:36:27.342392','龙族',1,1),(24,'2018-05-15 04:57:21.360593','解忧杂货店',1,1),(25,'2018-05-15 04:58:46.362487','解忧杂货店',3,1),(26,'2018-05-15 04:59:36.448603','平凡的世界',3,1),(27,'2018-05-15 05:01:40.768650','三国',3,1),(28,'2018-05-15 05:01:48.423132','三国演义',3,2),(29,'2018-05-15 05:02:54.308657','西游记',1,1),(30,'2018-05-15 05:03:10.461967','红楼梦',3,1),(31,'2018-05-15 05:03:37.597374','倚天屠龙记',1,2),(32,'2018-05-15 05:03:46.940086','笑傲江湖',3,1),(33,'2018-05-15 05:04:24.450315','小王子',3,1),(34,'2018-05-15 05:04:41.123064','仙逆',1,1),(35,'2018-05-15 05:07:05.235435','仙逆',3,1),(36,'2018-05-15 05:17:52.131194','三国演义',1,3),(37,'2018-05-15 05:18:37.810418','滚雪球',1,1),(38,'2018-05-15 05:44:03.258375','毛泽东庄',1,1),(39,'2018-05-15 06:02:03.717904','水浒传',1,1),(41,'2018-05-19 01:55:11.821400','小王子',1,1),(42,'2018-05-19 01:56:43.230957','小王子',10,1),(43,'2018-06-10 01:12:05.315633','法医秦明',1,1);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(200) NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_owner_id_0d58bd1c_fk_users_user_id` (`owner_id`),
  CONSTRAINT `topic_owner_id_0d58bd1c_fk_users_user_id` FOREIGN KEY (`owner_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (26,'sadfds','2018-04-12 12:31:14.828557',5),(27,'活着','2018-04-20 09:51:19.863329',1),(28,'穆斯林的葬礼','2018-04-20 09:52:24.418390',1),(29,'教父','2018-04-20 09:53:32.083444',1),(30,'huozhe','2018-04-22 10:49:17.919054',6),(31,'4636','2018-04-22 10:50:29.870987',6),(32,'xxxx','2018-04-23 03:36:04.678239',7),(33,'星期四','2018-04-26 10:42:48.700722',8);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user`
--

DROP TABLE IF EXISTS `users_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `users_user_email_243f6e77_uniq` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES (1,'pbkdf2_sha256$100000$UxR1dumM5JQo$g7JbQdVESzcf3MeBBmdPb1p3erzI3vWHySccl2Mmkck=','2018-06-10 01:10:24.917065',1,'ll_admin','','','17686400080@163.com',1,1,'2018-04-06 15:08:45.556602',''),(3,'pbkdf2_sha256$100000$zPwrnf9HerV6$xpkTW64Mp7ZsWY40jQvhDnNyp6Jzh9VONRdXiNCBJ74=','2018-05-28 03:32:00.000000',0,'test1','','','1163312045@qq.com',1,1,'2018-04-07 02:06:00.000000',''),(5,'pbkdf2_sha256$100000$EkmpdFytVHyy$6n97zZtLxXCqPdvO5Ylw6KezQdwkbup8SPgXynjxFv8=','2018-04-12 12:30:27.155917',0,'yangshao','','','892916454@qq.com',0,1,'2018-04-12 12:30:26.928716',''),(6,'pbkdf2_sha256$100000$vc5NknO69PQz$1qtxKedWt0k8VVVSCXBTZyKZdblThXnznye3X6CRz2A=','2018-04-22 10:48:33.513918',0,'xiezi','','','jianailain@163.com',0,0,'2018-04-22 10:48:33.275458',''),(7,'pbkdf2_sha256$100000$CoswVTXxwI4o$8Aq7fnmm4KTMizzOOTNWCH4NgUSQYNU4OgsQzDMgBPs=','2018-04-23 03:35:54.809578',0,'qwerty','','','000@163.com',0,1,'2018-04-23 03:35:54.549145',''),(8,'pbkdf2_sha256$100000$YzbCQCzF4Asr$HEPMWm7ue4X4JQo+JwzQdWSHVbe7+TqmMJDL6YPgn3k=','2018-04-26 10:42:31.197104',0,'lizheng','','','789@qq.com',0,1,'2018-04-26 10:42:30.949029',''),(10,'pbkdf2_sha256$100000$avvIgchgfLIA$AfpZ3DaNbGRJ1DGa2OZu9FbdaAckTijXZBNh9LDsJg8=','2018-05-19 01:56:26.992926',0,'mahong','','','666@126.com',0,1,'2018-05-19 01:56:26.750945','');
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_groups`
--

DROP TABLE IF EXISTS `users_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_groups_user_id_group_id_b88eab82_uniq` (`user_id`,`group_id`),
  KEY `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_groups`
--

LOCK TABLES `users_user_groups` WRITE;
/*!40000 ALTER TABLE `users_user_groups` DISABLE KEYS */;
INSERT INTO `users_user_groups` VALUES (12,3,5);
/*!40000 ALTER TABLE `users_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_user_permissions`
--

DROP TABLE IF EXISTS `users_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_user_permissions_user_id_permission_id_43338c45_uniq` (`user_id`,`permission_id`),
  KEY `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_user_permissions`
--

LOCK TABLES `users_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-16  7:12:31
