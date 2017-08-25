-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: museum
-- ------------------------------------------------------
-- Server version	5.7.16

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `board_id` int(11) NOT NULL AUTO_INCREMENT,
  `board_desc` varchar(255) DEFAULT NULL,
  `board_name` varchar(150) DEFAULT NULL,
  `dearjhon` varchar(255) DEFAULT NULL,
  `topic_num` int(11) DEFAULT NULL,
  `privacy` int(11) DEFAULT NULL,
  PRIMARY KEY (`board_id`),
  UNIQUE KEY `board_id` (`board_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'砰砰砰','怦然心动','dearjhon',1,1),(2,'编程记录','扫地老头','dearjhon1',2,0),(3,'Loving Movie','心爱的电影','dearjhon2',1,0);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(5000) DEFAULT NULL,
  `c_vn_post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  UNIQUE KEY `c_id` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'谢谢',5);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_son`
--

DROP TABLE IF EXISTS `comment_son`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_son` (
  `son_id` int(11) NOT NULL AUTO_INCREMENT,
  `fa_id` int(11) DEFAULT NULL,
  `son_area` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`son_id`),
  UNIQUE KEY `son_id` (`son_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_son`
--

LOCK TABLES `comment_son` WRITE;
/*!40000 ALTER TABLE `comment_son` DISABLE KEYS */;
INSERT INTO `comment_son` VALUES (1,1,'不用');
/*!40000 ALTER TABLE `comment_son` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` varchar(255) NOT NULL,
  `address` varchar(32) NOT NULL,
  `idCard` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `phone` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `digest` int(11) DEFAULT NULL,
  `topic_replies` int(11) DEFAULT NULL,
  `topic_title` varchar(100) DEFAULT NULL,
  `use_id` int(11) DEFAULT NULL,
  `topic_son_num` int(11) DEFAULT NULL,
  `topic_post_url` varchar(100) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,1,'2017-07-20 21:22:48',1,0,'enako(えなこ) ',1,1,'vn/vn_post.jsp?topic_id=1','enako1.jpg'),(2,2,'2017-07-31 12:50:43',1,0,'算法与数据结构',2,0,'vn/vn_post.jsp?topic_id=2','suanfa.jpg'),(3,2,'2017-08-07 12:09:00',1,0,'python',2,2,'vn/vn_post.jsp?topic_id=3','python1.jpg'),(4,2,'2017-08-09 00:13:29',1,0,'扫地僧',2,9,'vn/vn_post.jsp?topic_id=4','saodiseng.jpg'),(5,3,'2017-08-20 21:58:45',1,0,'I LOVE IT',2,1,'vn/vn_post.jsp?topic_id=5','movie.jpg');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `credit` int(11) DEFAULT NULL,
  `locked` int(11) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,200,0,'123456','法布雷加钊',1),(2,200,0,'lyzlhl617130','Aragami',2),(3,0,0,'666','测试用户',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vn_post`
--

DROP TABLE IF EXISTS `vn_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vn_post` (
  `vn_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `post_title` varchar(100) DEFAULT NULL,
  `t_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `post_url` varchar(255) DEFAULT NULL,
  `post_privacy` int(11) DEFAULT NULL,
  PRIMARY KEY (`vn_id`),
  UNIQUE KEY `vn_id` (`vn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vn_post`
--

LOCK TABLES `vn_post` WRITE;
/*!40000 ALTER TABLE `vn_post` DISABLE KEYS */;
INSERT INTO `vn_post` VALUES (1,1,'2017-07-20 22:00:26','enako接受采访',1,2,'vn/vn_post_show.jsp',1),(2,2,'2017-08-09 00:41:11','170809python爬虫学习',3,2,'vn/vn_post_show.jsp',0),(3,2,'2017-08-09 14:09:49','网站上线回顾',4,2,'vn/vn_post_show.jsp',0),(4,2,'2017-08-09 14:23:17','域名解析和绑定服务器',4,2,'vn/vn_post_show.jsp',0),(5,2,'2017-08-10 02:24:56','关于通过url传参获得的参数中文出现问号的解决办法',4,2,'vn/vn_post_show.jsp',0),(6,2,'2017-08-14 22:59:22','BeautifulSoup的使用语句',3,2,'vn/vn_post_show.jsp',0),(8,2,'2017-08-16 20:29:52','i386和x86_64的区别',4,2,'vn/vn_post_show.jsp',0),(9,2,'2017-08-17 01:08:15','centos启动时的小误解和linux登陆时的密码不回显',4,2,'vn/vn_post_show.jsp',0),(10,2,'2017-08-18 00:10:33','Centos的网络配置',4,2,'vn/vn_post_show.jsp',0),(11,3,'2017-08-20 22:18:17','Explicit innocence',5,2,'vn/vn_post_show.jsp',0),(12,2,'2017-08-23 23:21:14','关于BIOS开启了Intel Virtual Technology仍然无效的解决办法',4,2,'vn/vn_post_show.jsp',0),(13,2,'2017-08-23 23:28:27','仅供测试',4,2,'vn/vn_post_show.jsp',0),(14,2,'2017-08-25 00:02:46','ssh公钥创建和clone项目',4,2,'vn/vn_post_show.jsp',0);
/*!40000 ALTER TABLE `vn_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vn_post_image`
--

DROP TABLE IF EXISTS `vn_post_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vn_post_image` (
  `image_vn_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(100) DEFAULT NULL,
  `i_connect_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`image_vn_id`),
  UNIQUE KEY `image_vn_id` (`image_vn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vn_post_image`
--

LOCK TABLES `vn_post_image` WRITE;
/*!40000 ALTER TABLE `vn_post_image` DISABLE KEYS */;
INSERT INTO `vn_post_image` VALUES (1,'enako7.jpg',1),(2,'enako8.jpg',1),(3,'enako4.jpg',1),(4,'enako6.jpg',1),(5,'enako5.jpg',1),(6,'enako2.jpg',1),(7,'enako1.jpg',1),(8,'enako.jpg',1),(9,'1708092.png',2),(10,'1708091.png',2),(11,'wangzhanshangxianhuigu.png',3),(12,'yumingbangding.png',4),(13,'urlchuancanzhongwenluanma.png',5),(14,'hs8_19201.jpg',7),(15,'Linuxquestion.org.png',8),(16,'i386.png',8),(17,'mimahuixian.png',9),(18,'myeth0.png',10),(19,'tudo9.png',10),(20,'tudo5.png',10),(21,'tudo4.png',10),(22,'tudo3.png',10),(23,'tudo2.png',10),(24,'todo1.png',10),(25,'configuration.png',10),(26,'explicit innocence1.png',11),(27,'explicit innocence2.png',11),(28,'explicit innocence5.png',11),(29,'explicit innocence3.png',11),(30,'explicit innocence4.png',11),(31,'explicit innocence7.png',11),(32,'explicit innocence8.png',11),(33,'explicit innocence6.png',11),(34,'explicit innocence9.png',11),(35,'explicit innocence10.png',11),(36,'cant open vt.png',12),(37,'四个月学前端.jpg',13),(38,'sshpublickeyandclone.png',14);
/*!40000 ALTER TABLE `vn_post_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vn_post_text`
--

DROP TABLE IF EXISTS `vn_post_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vn_post_text` (
  `text_vn_id` int(11) NOT NULL AUTO_INCREMENT,
  `text_content` varchar(5000) DEFAULT NULL,
  `t_connect_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`text_vn_id`),
  UNIQUE KEY `text_vn_id` (`text_vn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vn_post_text`
--

LOCK TABLES `vn_post_text` WRITE;
/*!40000 ALTER TABLE `vn_post_text` DISABLE KEYS */;
INSERT INTO `vn_post_text` VALUES (1,'这是在youtube上找到的enako接受采访的一个小视频。。。。',1),(2,'今天看了一些python简单爬虫的视频\r\n给eclipse暗转PyDev插件',2),(3,'关于通过url传参获得的参数中文出现问号的解决办法\r\n\r\n开始的做法是这样的，在本地运行的时候中文不会出现问号，然而当网站上线后就会出现问号\r\n\r\n改进做法：传参前进行处理，获取后也要进行处理\r\n这样在网站上线后中文都不会出现乱码或者问号\r\n记录完毕',5),(4,'今晚学了BeautifulSoup的语法和一些实际的例子\r\nclass为python的系统语法，所以要加一个下划线',6),(5,'仅供测试所用，无任何意义 ',7),(6,'Nothing!Just see the video.',8),(7,'Today I haved completed the network configuration for centos linux.Before that,I haved searched a host of solutions that may be helped.Finally I was lucky.\r\n\r\nThank you very much!!!\r\n\r\n\r\nThere were some errors When I finished the file called eth1 and then prepared to save it.\r\nERROR:“Can\'t open file for writing”\r\nThe Key is the permissions.  used command \'sudo\'  liked  sudo vim.... it worked.\r\n\r\nThat is all.\r\n\r\nThere is the main problem i have to record.\r\n\r\nMAC==HWADDR \r\nThat must be the same while you rewrite the file(eth0,1,2)\r\n',10),(8,'Yesterday I saw a movie called explicit innocence.The cc is English on youtube.I love it and put it url in my site.So..\r\n\r\n\r\n\r\nurl:https://www.youtube.com/watch?v=aQCnSAVj9f8',11),(9,'关于BIOS开启了Intel Virtual Technology仍然无效的解决办法\r\n\r\n网上找了很多都没有给出解决办法，直到。。。\r\n\r\n之后正常开启vt，进而可以安装win10虚拟机',12),(10,'仅供测试',13),(11,'ssh公钥创建 clone项目',14);
/*!40000 ALTER TABLE `vn_post_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vn_post_video`
--

DROP TABLE IF EXISTS `vn_post_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vn_post_video` (
  `video_vn_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_url` varchar(100) DEFAULT NULL,
  `v_connect_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`video_vn_id`),
  UNIQUE KEY `video_vn_id` (`video_vn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vn_post_video`
--

LOCK TABLES `vn_post_video` WRITE;
/*!40000 ALTER TABLE `vn_post_video` DISABLE KEYS */;
INSERT INTO `vn_post_video` VALUES (1,'enako\'s interview.mp4',1),(2,'sds170809.mp4',2),(3,'170809wangzhanshangxianhuigu.mp4',3),(4,'170809yumingbangding.mp4',4),(5,'urlchuancanzhongwenluanma.mp4',5),(6,'pythonbeautifulsoup.mp4',6),(7,'pythonbeautifulsoupppp.mp4',7),(8,'the difference of i386 and x86_64.mp4',8),(9,'mimahuixianstart.mp4',9),(10,'centos network configuration.mp4',10),(11,'explicit innocence.mp4',11),(12,'cant open vt.mp4',12),(13,'cant open vt.mp4',13),(14,'sshpublickeyandclone.mp4',14);
/*!40000 ALTER TABLE `vn_post_video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-25 16:09:06
