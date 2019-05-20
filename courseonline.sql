CREATE DATABASE  IF NOT EXISTS `courseonline` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `courseonline`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: courseonline
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `advertiseing`
--

DROP TABLE IF EXISTS `advertiseing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertiseing` (
  `AD_id` varchar(32) NOT NULL,
  `AD_image` varchar(30) NOT NULL,
  `AD_del` varchar(1) DEFAULT NULL,
  `AD_date` varchar(20) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AD_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertiseing`
--

LOCK TABLES `advertiseing` WRITE;
/*!40000 ALTER TABLE `advertiseing` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertiseing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basedata`
--

DROP TABLE IF EXISTS `basedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basedata` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `info` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbivv4vclsndbdsgw3tuope100` (`type_id`),
  CONSTRAINT `FKbivv4vclsndbdsgw3tuope100` FOREIGN KEY (`type_id`) REFERENCES `basetype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basedata`
--

LOCK TABLES `basedata` WRITE;
/*!40000 ALTER TABLE `basedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `basedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basetype`
--

DROP TABLE IF EXISTS `basetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basetype` (
  `id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basetype`
--

LOCK TABLES `basetype` WRITE;
/*!40000 ALTER TABLE `basetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `basetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bc_courseinfo`
--

DROP TABLE IF EXISTS `bc_courseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bc_courseinfo` (
  `course_id` varchar(50) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `course_jj` varchar(50) DEFAULT NULL,
  `course_name` varchar(25) NOT NULL,
  `course_type` varchar(20) DEFAULT NULL,
  `course_fbrq` varchar(20) DEFAULT NULL,
  `url` varchar(32) DEFAULT NULL,
  `course_open` varchar(2) DEFAULT NULL,
  `course_clicksum` int(11) DEFAULT NULL,
  `imageurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `FKiiyhwmlv3wa8r50p4lujifujl` (`teacher_id`),
  CONSTRAINT `FKiiyhwmlv3wa8r50p4lujifujl` FOREIGN KEY (`teacher_id`) REFERENCES `bc_teacher` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bc_courseinfo`
--

LOCK TABLES `bc_courseinfo` WRITE;
/*!40000 ALTER TABLE `bc_courseinfo` DISABLE KEYS */;
INSERT INTO `bc_courseinfo` VALUES ('2a0508d21dc44343',2014001,'课件资源','BOS项目实战','ppt','2018-03-13 16:12:39','D:\\upload\\BOS项目实战.ppt','1',0,NULL),('325921b8c16e47a1',NULL,NULL,'报告','doc','2018-03-13 12:48:25','D:\\upload\\报告.doc','1',0,NULL),('997827d8970245b4',NULL,NULL,'接收函','doc','2018-03-13 16:40:40','D:\\upload\\接收函.doc','1',0,NULL),('b643790a89654e47',NULL,NULL,'VLSI设计基础复习题','doc','2018-03-14 17:07:23','D:\\upload\\VLSI设计基础复习题.doc','1',0,'F:\\workspace\\courseonline_parent\\courseonline_web\\src\\main\\webapp\\uploadimage\\bg.jpg'),('edb58ed1dd7945f2',NULL,NULL,'大赛','docx','2018-03-13 12:47:51','D:\\upload\\大赛.docx','1',0,NULL);
/*!40000 ALTER TABLE `bc_courseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bc_notice`
--

DROP TABLE IF EXISTS `bc_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bc_notice` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `title` varchar(20) NOT NULL,
  `content` varchar(50) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqcxd2tfmeutnmkcye16ygdgsx` (`teacher_id`),
  CONSTRAINT `FKqcxd2tfmeutnmkcye16ygdgsx` FOREIGN KEY (`teacher_id`) REFERENCES `bc_teacher` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bc_notice`
--

LOCK TABLES `bc_notice` WRITE;
/*!40000 ALTER TABLE `bc_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `bc_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bc_posts`
--

DROP TABLE IF EXISTS `bc_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bc_posts` (
  `posts_id` varchar(32) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `subject` varchar(15) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `createtime` varchar(20) DEFAULT NULL,
  `broser` int(11) DEFAULT NULL,
  PRIMARY KEY (`posts_id`),
  KEY `FKk5ib0x0fk4tp0b4v30w8m8co9` (`teacher_id`),
  CONSTRAINT `FKk5ib0x0fk4tp0b4v30w8m8co9` FOREIGN KEY (`teacher_id`) REFERENCES `bc_teacher` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bc_posts`
--

LOCK TABLES `bc_posts` WRITE;
/*!40000 ALTER TABLE `bc_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bc_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bc_teacher`
--

DROP TABLE IF EXISTS `bc_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bc_teacher` (
  `teacher_id` int(11) NOT NULL,
  `teachername` varchar(4) NOT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `deltag` varchar(1) NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bc_teacher`
--

LOCK TABLES `bc_teacher` WRITE;
/*!40000 ALTER TABLE `bc_teacher` DISABLE KEYS */;
INSERT INTO `bc_teacher` VALUES (2014001,'孔晓付','13976422874','81dc9bdb52d04dc20036dbd8313ed055','0');
/*!40000 ALTER TABLE `bc_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_user`
--

DROP TABLE IF EXISTS `course_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_user` (
  `id` varchar(32) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nativeplace` varchar(32) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `station` varchar(40) DEFAULT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_user`
--

LOCK TABLES `course_user` WRITE;
/*!40000 ALTER TABLE `course_user` DISABLE KEYS */;
INSERT INTO `course_user` VALUES ('1','admin','81dc9bdb52d04dc20036dbd8313ed055',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `course_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson` (
  `cid` varchar(32) NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  `cjj` varchar(255) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  `ctime` int(5) DEFAULT NULL,
  `cstate` varchar(5) DEFAULT NULL,
  `ctype` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES ('402880e6624161e60162416311660000','Java语言基础','主要讲述了Java语言概述，标识符、关键字和数据类型，表达式和流程控制，数组与字符串，对象、类和方法，Java语言中的接口、包和异常，Java语言的输入与输出，Java语言的图形用户界面，多线程，多媒体编程和网络编程',1,3,'0','java基础课程'),('402880e66243d6ca016243ef9db80000','前端课程','讲述html,css,div,js ,jquery等',0,0,'0','java基础课程'),('402880e66243d6ca016243f0a6320001','mysql数据库','讲述数据库基本sql，与java连接方法',0,0,'0','java基础课程'),('402880e66243d6ca016243f1d3580002','Javaweb开发案例—shop商城','讲述javaweb基础的实际应用开发，有关商店管理系统的设计',0,0,'0','java基础课程'),('402880e66243d6ca016243f35baf0003','hibernate框架','讲述hibernate框架原理，配置，映射文件',0,0,'0','java进阶课程');
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materia` (
  `mid` varchar(32) NOT NULL,
  `mname` varchar(32) DEFAULT NULL,
  `murl` varchar(80) DEFAULT NULL,
  `mtime` varchar(30) DEFAULT NULL,
  `mcid` varchar(32) DEFAULT NULL,
  `mfilename` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES ('402880e66242d904016242dd1f2b0000','html相关软件','F:\\workspace\\courseonline_parent\\courseonline_web\\src\\main\\webapp\\materia\\资料.zip','2018-03-20 18:03:30','402880e6624161e60162416311660000','资料');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `nid` varchar(32) NOT NULL,
  `ncontent` varchar(120) DEFAULT NULL,
  `ntime` varchar(30) DEFAULT NULL,
  `ncid` varchar(32) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `FKq5xjybk8v36jqh0kwgnohj1a9` (`teacher_id`),
  CONSTRAINT `FKq5xjybk8v36jqh0kwgnohj1a9` FOREIGN KEY (`teacher_id`) REFERENCES `bc_teacher` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES ('1','周一下午、周三上午、周五下午该课程进行视频更新！','2018-03-28 22:13:02','402880e6624161e60162416311660000',NULL),('2','该课程每日晚凌晨更新','2018-03-27 22:13:34','402880e66243d6ca016243ef9db80000',NULL),('3','该课程每周日更新一次','2018-03-28 22:13:52','402880e66243d6ca016243f0a6320001',NULL),('4','该课程即将结束更新','2018-03-27 22:14:13','402880e66243d6ca016243f1d3580002',NULL);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_posts_cy`
--

DROP TABLE IF EXISTS `student_posts_cy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_posts_cy` (
  `stu_posts_id` int(11) NOT NULL,
  `student_id` varchar(15) DEFAULT NULL,
  `posts_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`stu_posts_id`),
  KEY `FK2e6agwjd7505759evf5f1c36h` (`student_id`),
  KEY `FKo71thi4s2yoqi3qevhfshdna6` (`posts_id`),
  CONSTRAINT `FK2e6agwjd7505759evf5f1c36h` FOREIGN KEY (`student_id`) REFERENCES `studentinfo` (`student_id`),
  CONSTRAINT `FKo71thi4s2yoqi3qevhfshdna6` FOREIGN KEY (`posts_id`) REFERENCES `bc_posts` (`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_posts_cy`
--

LOCK TABLES `student_posts_cy` WRITE;
/*!40000 ALTER TABLE `student_posts_cy` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_posts_cy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentinfo`
--

DROP TABLE IF EXISTS `studentinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentinfo` (
  `student_id` varchar(15) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `profession` varchar(10) DEFAULT NULL,
  `birthday` varchar(20) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `email` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `FKsfr0kumm4pem8j4xhw766d5b6` (`teacher_id`),
  CONSTRAINT `FKsfr0kumm4pem8j4xhw766d5b6` FOREIGN KEY (`teacher_id`) REFERENCES `bc_teacher` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentinfo`
--

LOCK TABLES `studentinfo` WRITE;
/*!40000 ALTER TABLE `studentinfo` DISABLE KEYS */;
INSERT INTO `studentinfo` VALUES ('201112301127',NULL,'蒋朝忠','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术','1993-03-11','广西全州县石塘镇青山村委夏竹园村','13737731230','496981095@qq.com'),('201212301011',NULL,'蓝珉华','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术','1991-03-14','广西南宁市西乡塘区北湖北路33号','13378308127','820548320@qq.com'),('201212301013',NULL,'汤浩','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术','1994-03-17','广西桂林市叠彩路4号院2单元402','18877327673','1031475851@qq.com'),('201212301014',NULL,'王鹏','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术','1997-03-12','广西桂林全州县才湾镇白石八甲村','15707720675','877252774@qq.com'),('201212301032',NULL,'邱必静','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术','1990-02-02','广西贺州市钟山县英家镇圳背067','13378312392','435617180@qq.com'),('201212301036',NULL,'何艳妮','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术','2005-03-16','广西来宾市忻城县遂意乡弄江村何家屯4号','15677079279','1114988495@qq.com'),('201212301042',NULL,'李健','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术','1992-03-03','广西百色市田东县平马镇东宁东路31号','15677349994','1743796295@qq.com'),('201212301047',NULL,'唐晓瑜','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术','1994-03-08','安徽省马鞍山市含山县清溪镇','18577380119','862961363@qq.com'),('201212301088',NULL,'洪朝表','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术','1999-03-15','福建省晋江市龙湖镇后坑区中北区29号','13378309446','362049939@qq.com'),('201212301093',NULL,'许宏飞','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术','2018-03-02','广西南宁市西乡塘区人民西路76号','13307867026','284779608@qq.com'),('201212301096',NULL,'吴非凡','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术','1998-03-02','广西南宁市宾阳县芦圩镇闭村','15078341565','1018702935@qq.com'),('201212301105',NULL,'林楚雄','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术','1995-03-08','广西梧州长洲区西堤三路5号','13378308802','597821738@qq.com'),('201212301106',NULL,'赖文君','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术','1997-03-12','广西合浦廉州镇堂排村委会赖屋','15677079796','985003998@qq.com'),('201212301118',NULL,'孙贵森','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术','2002-03-12','云南省曲靖市宣威市龙潭镇龙潭村委会高田村','18565646139','178721856@qq.com'),('201212301141',NULL,'唐永佳','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术','1991-07-24','广西梧州市藤县藤州镇胜西村中胜三组6号','13307734301','1033856522@qq.com'),('201212301143',NULL,'罗天南','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西合浦县廉州镇明园南路二巷27号','13097919000','1401582324@qq.com'),('201212301148',NULL,'陈青伟','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西贵港市港南区桥圩镇振南村井塘屯6号','18378310687','461757157@qq.com'),('201212301152',NULL,'李广','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西陆川县良田镇良兴街','15677079692','1315893307@qq.com'),('201212301158',NULL,'李苏衡','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西河池市南丹县芒场镇12号','18565542561','413559349@qq.com'),('201212301171',NULL,'陆柳洁','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西柳州市柳南区和平路工程区68-1-2','1747223392','1747223392@qq.com'),('201212301187',NULL,'石光辉','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西北流市沙桐镇上安村中央村组','13217832008','434718677@qq.com'),('201212301190',NULL,'陈连梅','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西钟山县燕塘镇聚义村','15677079307','937856581@qq.com'),('201212301201',NULL,'彭文静','男','81dc9bdb52d04dc20036dbd8313ed055','信息安全',NULL,'广西桂林市恭城县三江乡茅塘村','15677079659','459656925@qq.com'),('201212301211',NULL,'卢苡茜','女','81dc9bdb52d04dc20036dbd8313ed055','信息安全',NULL,'广西柳州市雅儒路250号天江一都2-4-4-2','13307729384','475815004@qq.com'),('201212301225',NULL,'陈楠','男','81dc9bdb52d04dc20036dbd8313ed055','信息安全',NULL,'广西陆川县学宫巷百货公司宿舍','15677079770','1016789557@qq.com'),('201212301231',NULL,'杨虹','女','81dc9bdb52d04dc20036dbd8313ed055','信息安全',NULL,'广西百色市平果县御景华庭13栋B单元601','18877328053','286395634@qq.com'),('201212301235',NULL,'洪宇','男','81dc9bdb52d04dc20036dbd8313ed055','信息安全',NULL,'云南省昭通市昭阳区望海佳园9栋1单元202','15677079635','332746458@qq.com'),('201310100315',NULL,'胡晨茜','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'安徽省安庆市戏校南路南3巷1栋602','18378342231','1274434635@qq.com'),('201311700433',NULL,'庞淦文','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西玉林市博白县朝阳西路丽江华苑','15077306171','416388066@qq.com'),('201311700481',NULL,'吴雨农','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西桂林资源县河西路218号','18677317817','804084740@qq.com'),('201311700523',NULL,'梁荣基','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西贺州市钟山县羊头镇大岩155号','15577400968','727551454@qq.com'),('201312300018',NULL,'周泽宇','男','81dc9bdb52d04dc20036dbd8313ed055','信息安全',NULL,'广西桂林市灵川江岸美城','15578382793','aiyoungzhou@qq.com'),('201312300019',NULL,'杨建明','男','81dc9bdb52d04dc20036dbd8313ed055','信息安全',NULL,'广西桂林荔浦县杜莫镇仙女岩屯','15007831926','1582865965@qq.com'),('201312300039',NULL,'李源园','男','81dc9bdb52d04dc20036dbd8313ed055','信息安全',NULL,'广西河池市金城江区矿山机械厂','18677323073','248750560@qq.com'),('201312300040',NULL,'宋世伟','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西南宁青秀区东葛路荣和中央公园','18978335842','1147368655@qq.com'),('201312300055',NULL,'邵玉馥','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'山东省成武县天宫镇邵柳园村','18677315969','1491586937@qq.com'),('201312300057',NULL,'周杰','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'湖南省东安县南桥镇曾凼村','18378309536','1324835342@qq.com'),('201312300059',NULL,'黄小芳','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西南宁市江南区沙井三津3队','13557030135','836201527@qq.com'),('201312300062',NULL,'林彦旭','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西崇左市龙州县','18378395033','527692771@qq.com'),('201312300082',NULL,'韦全光','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西柳州柳南区革新路八区','18077227015','503800496@qq.com'),('201312300086',NULL,'全培方','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西柳州市柳城县太平镇杨梅村','15677330134','1135629718@qq.com'),('201312300090',NULL,'李积韬','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西桂林市西山','18378396251','1298103829@qq.com'),('201312300099',NULL,'卢思然','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西梧州市蝶山区下三云路东街40号','18677317071','1548914909@qq.com'),('201312300104',NULL,'李桂荣','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西省梧州万秀区旺甫镇浔阳路37号','18377401608','702365916@qq.com'),('201312300114',NULL,'李宽','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西防城港市防城区那梭镇东山村','18378395059','867072862@qq.com'),('201312300124',NULL,'韦强德','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西贵港市平南县六陈镇','18378532540','891653498@qq.com'),('201312300132',NULL,'黄俞丰','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西玉林市容县灵山镇','13036935081','1306708518@qq.com'),('201312300134',NULL,'吕玉华','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西陆川县长安街二街二巷68号','18778399236','724264462@qq.com'),('201312300138',NULL,'陈俊霖','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西玉林博白县东平镇新郑村','18934782512','798810047@qq.com'),('201312300140',NULL,'邹龙成','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西玉林市博白县龙潭镇大坝路015号','15107730284','1002894997@qq.com'),('201312300144',NULL,'陈宇锋','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西玉林市北流市桂塘路三区52号','18378395936','337540029@qq.com'),('201312300145',NULL,'李科龙','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西北流市清湾镇平旦村','18378330578','931561633@qq.com'),('201312300146',NULL,'许杰','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西北流市清湾镇中龙村','18378396082','435398223@qq.com'),('201312300149',NULL,'甘桂华','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西北流市城西公园园前小区48-2号','18577342270','782300503@qq.com'),('201312300150',NULL,'黄敬','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西百色田东县祥周镇祥周村','13297830405','903223696@qq.com'),('201312300153',NULL,'黄杲','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西百色平果县海城乡那海村社王屯23号','18877331417','584250314@qq.com'),('201312300174',NULL,'李瑶','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西来宾市金秀县桐木镇','15507834077','543464401@qq.com'),('201312300181',NULL,'陆舟婵','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西崇左市江州区友谊大道友谊茗城5号楼','15607730374','806295277@qq.com'),('201312300228',NULL,'罗晨玲','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西百色平果县榜圩镇乐圩街','15578357802','786795699@qq.com'),('201312300229',NULL,'农鲤瑕','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西百色市田东县平马镇中山小学','18677321520','loving_0504ff@163.com'),('201312300230',NULL,'冉艾双','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西宜州北牙乡豆竹村饭正山屯','15577353830','307675141@qq.com'),('201312300233',NULL,'张妙','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西来宾市兴宾区南京路一巷19号','15177271814','a4287235@qq.com'),('201312300235',NULL,'蓝雅萍','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西来宾市忻城县古蓬镇龙球村','18077331817','2277145008@qq.com'),('201412300001',NULL,'胡海杰','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'安徽宣城市杨柳镇三长村鸡场','13557332351','1327301442@qq.com'),('201412300002',NULL,'许群范','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'江西省吉安市夏造镇夏造村庄背组22号','13557536759','1092588013@qq.com'),('201412300003',NULL,'郑普元','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'山东省菏泽市东明县解放街79号','13597331987','1342774181@qq.com'),('201412300004',NULL,'潘卜荣','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西南宁市友爱北路55号1栋2单元203','13307869123','405073188@qq.com'),('201412300005',NULL,'莫程程','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西南宁市马山县古零镇古零新街','18376968376','670692990@qq.com'),('201412300006',NULL,'蒙燕','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西宾阳县新桥镇清平村委会岭岗村','13557255960','1823675876@qq.com'),('201412300007',NULL,'刘炳宏','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西柳州市南亚名邸19-1-7-2','13607728839','1835378269@qq.com'),('201412300008',NULL,'赖振宇','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西融安县东方上城14-2-503','18589955635','673760272@qq.com'),('201412300009',NULL,'廖敏淑','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西龙胜各族自治县龙脊镇金江村大山组913号','18290152348','1208894976@qq.com'),('201412300011',NULL,'秦晓婷','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西桂林临桂县六塘镇','15877014167','1611226400@qq.com'),('201412300012',NULL,'汤中明','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西梧州市新兴2路京梧东苑','17707745121','2264561787@qq.com'),('201412300013',NULL,'冯洁玲','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西梧州市苍梧县新地镇训村','15607837090','1601796472@qq.com'),('201412300014',NULL,'梁倍源','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西岑溪市交警大队','18077468000','192700941@qq.com'),('201412300015',NULL,'孙祥裕','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西北海市银海区福成镇大彬斗村','18777950057','1603026723@qq.com'),('201412300016',NULL,'叶秋彤','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西北海市云南路宝来居1-3-502','18677911137','931421976@qq.com'),('201412300017',NULL,'吴科庆','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西北海市四川路渔业公司宿舍','15078371329','740636777@qq.com'),('201412300018',NULL,'王丽霞','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西北海市铁山港区营盘镇','15677099430','1130395325@qq.com'),('201412300019',NULL,'徐振洪','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西合浦县闸口镇瓦窑村','18077335616','841597408@qq.com'),('201412300020',NULL,'庞兴豪','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西合浦县石湾镇清水村委员会庞西队','13367838013','949563920@qq.com'),('201412300021',NULL,'古桂任','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西钦州市钦北区小董镇城西二街46号','18577394095','1477798789@qq.com'),('201412300022',NULL,'关薇','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西钦州市群利一巷7号','13677779910','1092532944@qq.com'),('201412300023',NULL,'张世铭','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西壮族自治区钦州市灵山县新圩镇六峰村委会十三队38号','18897886976','8938336882@qq.com'),('201412300024',NULL,'甘雪凤','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西贵港市覃塘区樟木乡沙水村甘沙屯54号','18278361877','1244045603@qq.com'),('201412300025',NULL,'李俊毅','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西贵港市平南县朝东三街38号','18290065006','935066726@qq.com'),('201412300026',NULL,'符志强','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西博白县东平镇英梅村','18077550464','1049716530@qq.com'),('201412300027',NULL,'刘一君','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西博白县泓河旺角小区17栋1601','18290161510','512064271@qq.com'),('201412300028',NULL,'陈晓培','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西玉林北流市新圩镇西宁街149号','18290066630','925070638@qq.com'),('201412300029',NULL,'苏熠','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西百色市右江区中山一路5号','18077683583','375786610@qq.com'),('201412300030',NULL,'杨樱','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西百色靖西县宾山小区453号','15577331660','912207720@qq.com'),('201412300031',NULL,'卢春月','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西凌云县加尤镇加尤村海乐屯8号','15577390050','1024323397@qq.com'),('201412300032',NULL,'杨舒婷','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西隆林县德峨乡弄杂村十五队062号','18778339639','2060784705@qq.com'),('201412300033',NULL,'罗志管','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西百色市隆林县者保乡作欢村那老屯018号','13557536730','1280377573@qq.com'),('201412300034',NULL,'黄程灵','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西贺州市八步区沙田镇逸石村15组','15177328261','710454924@qq.com'),('201412300035',NULL,'黄仅媚','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西河池市都安县高岭镇龙洲村6号','13557330096','2863904826@qq.com'),('201412300036',NULL,'李洪斌','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西来宾市兴宾区大湾镇小南产村52号','18290161885','1196254832@qq.com'),('201412300037',NULL,'农光宝','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西崇左市天等县东平乡三寿村','18978326664','774597299@qq.com'),('201412300038',NULL,'郑嘉钰','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'四川省攀枝花市百家巷16号2栋一单元1号','15977321214','2160603844@qq.com'),('201412300040',NULL,'徐密','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'贵州省大方县文阁乡三元村和平组','18877385495','1437892248@qq.com'),('201412300041',NULL,'句英平','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'陕西省汉中市城固县桔园镇李家堡村三组110号','15717736877','852349580@qq.com'),('201412300042',NULL,'唐琦','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'内蒙古赤峰市翁牛特旗乌丹镇塾邸连云小区2号楼5单元9楼','18204862933','564629436@qq.com'),('201412300043',NULL,'王海兰','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'安徽省阜阳市颍东区新华办事处付寨村后刘庄','15977383240','371840644@qq.com'),('201412300044',NULL,'乐雨琪','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'安徽省宣城市郎溪县独山村乐湾26号','15956354306','1725218877@qq.com'),('201412300045',NULL,'刘宇','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'福建省永安市江滨花园6-4-401','18677311409','704050929@qq.com'),('201412300046',NULL,'李琪珍','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'湖南省平江县梅仙镇团山村472号','15907889296','2359448794@qq.com'),('201412300047',NULL,'周晖','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西南宁新阳北三里泰富新村3-3-705','15697739351','936122435@qq.com'),('201412300048',NULL,'黄世媚','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西南宁市西乡塘区雅里上坡66号','18707738629','360302394@qq.com'),('201412300050',NULL,'韦丁铭','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西南宁市上林县西燕镇覃浪村马安庄','13768133204','2516400391@qq.com'),('201412300051',NULL,'姜玮舜','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西柳州市屏山大道387号201室','18577392379','275351109@qq.com'),('201412300052',NULL,'廖仁玉','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西临桂县两江镇大洲村委会咸进村18-1号','13558238073','1848226146@qq.com'),('201412300053',NULL,'潘金杰','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西梧州市苍梧县梨埠镇旺湾村','18677334028','467124896@qq.com'),('201412300054',NULL,'李唐乐','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西梧州市龙圩区龙泉路西里三段40号','18290100966','245399318@qq.com'),('201412300055',NULL,'罗天成','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西合浦县名园南路二巷27号','18007709273','2640233581@qq.com'),('201412300056',NULL,'傅修坤','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西合浦县山口镇北界村委墩仔村18号','18707896232','1961802087@qq.com'),('201412300057',NULL,'吴礼双','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西北海铁山港区营盘镇黄稍村委','18178359223','191287027@qq.com'),('201412300058',NULL,'刘小梅','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西合浦县山口镇面坝村37号','13667735339','2594516679@qq.com'),('201412300059',NULL,'张海鸥','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西防城港港口区企沙镇赤沙','13667830035','314693225@qq.com'),('201412300060',NULL,'李辉','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西防城港港口区企沙镇文明路4号','18577349114','867520931@qq.com'),('201412300061',NULL,'黄飞喜','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西钦州市建安街14号','13667783583','1098171817@qq.com'),('201412300062',NULL,'梁君业','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西灵山县平南镇桃禾村委沙路村委会沙路一队15号','17677617017','740240773@qq.com'),('201412300063',NULL,'陈常田','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西钦州浦北那新村委山角队','15887738495','1366409175@qq.com'),('201412300064',NULL,'廖红燕','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西贵港港北区庆丰六松村松村队','13597325097','1258580115@qq.com'),('201412300065',NULL,'邓厚锻','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西平南丹竹镇东山村','13060636743','596135176@qq.com'),('201412300066',NULL,'郭膑源','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西桂平市城东街54号','13557737291','389823124@qq.com'),('201412300067',NULL,'江娜','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西陆川县良田镇竹山村黄坭塘队10号','15307733267','1273119575@qq.com'),('201412300068',NULL,'林熙杰','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西陆川县新洲中路90号','18776336788','1937196288@qq.com'),('201412300069',NULL,'黄文涛','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西玉林博白县凤山镇龙城村龙塘队037号','18707735870','1424453962@qq.com'),('201412300070',NULL,'李荣健','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西北流市白马镇白马村乌石组032号','15577322505','1103645014@qq.com'),('201412300071',NULL,'纪治贵','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西百色凌云县加尤镇东哈村猛娥屯2号','15207731565','1947626266@qq.com'),('201412300072',NULL,'苏瑾然','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西百色平果县黎明乡蟠桃村','13557532295','1297824199@qq.com'),('201412300073',NULL,'廖豆豆','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西百色田东县中国工商银行田东县支行中山路89号','15507834230','236062950@qq.com'),('201412300074',NULL,'罗浩检','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西百色田东县平马镇怀民村那料屯26号','18677336701','2511255360@qq.com'),('201412300075',NULL,'汤霁绚','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西贺州八步区里松文汉十组','15878395102','1250909861@qq.com'),('201412300076',NULL,'韦涛','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西河池东兰镇同拉村','18677079157','993638658@qq.com'),('201412300077',NULL,'覃福','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西来宾市兴宾区良塘乡新山村','18007736420','286441448@qq.com'),('201412300078',NULL,'李桃','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西崇左市大新县桃城镇养利路94号','13557537172','1061563689@qq.com'),('201412300080',NULL,'洪青','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'贵州省毕节市洪山路虎踞路岩脚组22号','18377331076','1162315907@qq.com'),('201412300081',NULL,'唐宁','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'云南弥勒市朋普新街48号','15177327870','1716640382@qq.com'),('201412300082',NULL,'董饶饶','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'陕西省汉中市镇巴县青水镇向家坪村','13667739660','969731401@qq.com'),('201412300083',NULL,'陈可','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'天津市南开区格调春天17号楼2门','18577396422','953630282@qq.com'),('201412300084',NULL,'齐璇','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'天津市宝坻区龙熙帝景小区1号楼1门1001','13558233633','707861624@qq.com'),('201412300085',NULL,'赵彦喆','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'内蒙古包头市昆区少先30街坊27栋28号','15607733437','1143157706@qq.com'),('201412300086',NULL,'董进','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'安徽省怀宁县金拱镇人形河居委会人行河小区第二栋三单元206','15578356148','329225762@qq.com'),('201412300087',NULL,'陈智红','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'安徽省池州市贵池区牛头山镇','18290161015','2554287132@qq.com'),('201412300088',NULL,'巫传传','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'江西省吉安市永丰县码镇三江村三江村','13667831892','1148787962@qq.com'),('201412300089',NULL,'蒙虹吉','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'山东济宁市梁山县黑虎庙乡黑虎庙村','15677310713','778556403@qq.com'),('201412300090',NULL,'刘宁','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'湖南省祁东风石堰镇画眉村3组','15577330744','1357990845@qq.com'),('201412300091',NULL,'刘达升','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西南宁市江南区吴圩镇祥宁村坛学坡20号','15678377756','840214755@qq.com'),('201412300092',NULL,'刘慧婷','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西南宁市江南区五一中路南五里万兴小学东南村16队19号','13397704733','775393513@qq.com'),('201412300093',NULL,'陈双武','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西南宁横县那阳镇那阳村委五安村38号','18677347660','815094585@qq.com'),('201412300094',NULL,'罗凤慈','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西来宾合山市岭南镇教育路49号2栋2号','18290161135','731477881@qq.com'),('201412300095',NULL,'韦如萍','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西柳州市成团镇同乐村黄毛屯28号','15717735154','2767503269@qq.com'),('201412300096',NULL,'梁玲','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西柳州融水苗族自治县新国村麻洞屯','18577398274','1137779620@qq.com'),('201412300097',NULL,'谭洁馨','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西桂林八里街白云巷1号','13481333069','1169960242@qq.com'),('201412300098',NULL,'肖雅娟','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西桂林资源县资源镇石溪村肖家二组','18775051192','1902366216@qq.com'),('201412300099',NULL,'钟浩','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西梧州市长洲区梧桐新苑20幢一单元702','18577358364','631197865@qq.com'),('201412300100',NULL,'黎凤洁','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西梧州市龙圩区新地镇洞心村坦上2组72号','18377331277','786631935@qq.com'),('201412300101',NULL,'关启淼','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西苍梧县沙头镇横江村坪尾组38号','13667832102','1034179012@qq.com'),('201412300102',NULL,'覃文敏','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西岑溪市三堡镇河边村里老组76-1号','18107733721','924214560@qq.com'),('201412300103',NULL,'卢大杭','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西北海福成镇端田村委会长歧山村5号','15577430519','896291490@qq.com'),('201412300104',NULL,'黄在才','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西北海市铁山港区南康镇黄丽窝村委会广和村','13677860015','1329205217@qq.com'),('201412300105',NULL,'沈德锦','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西北海市合浦县山口镇新圩村委会桃根村152号','18172662486','2780393700@qq.com'),('201412300106',NULL,'罗泽恒','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西北海市合浦县廉州镇环珠南路29号','18577397952','584400319@qq.com'),('201412300107',NULL,'宣文静','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西防城港市防城区群星大道638号','13132737515','121341107@qq.com'),('201412300109',NULL,'李曼','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西合浦县石湾镇大浪村委会下三队76号','18577357021','438595416@qq.com'),('201412300110',NULL,'梁力成','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西钦州市钦北区长滩镇荣庆村委荣庆村五队8-2号','18977761526','741708029@qq.com'),('201412300111',NULL,'黄方华','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西浦北县小江镇鲤鱼路11号2号楼一单元202','18877383408','787886061@qq.com'),('201412300112',NULL,'詹茂荣','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广东东莞市塘厦镇莲湖新村3座701','18607730344','493304435@qq.com'),('201412300113',NULL,'刘莹','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西玉林博白县新田镇那花上高村','18677312490','1824783591@qq.com'),('201412300114',NULL,'蔡明佳','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西博白那林镇那林村西成角队','15677316359','862240375@qq.com'),('201412300115',NULL,'林昌乐','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西北流市新松路0047号','18178346920','541429113@qq.com'),('201412300116',NULL,'李玉萍','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西百色市田林县新市街209号','18607738662','1903302031@qq.com'),('201412300117',NULL,'岑卓霖','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西贺州市八步区中华园小区蓝爵七街七号','18677328704','505098704@qq.com'),('201412300118',NULL,'蒙伊平','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西河池市环江毛南族自治县环江人家小区四栋二单元601','18290017992','671589719@qq.com'),('201412300119',NULL,'韦光武','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西柳州市柳南区柳邕路359号','13633080532','719036785@qq.com'),('201412300120',NULL,'汤璐凤','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'重庆市垫江县永安镇清水村5组78号','18977358419','1135399582@qq.com'),('201412300121',NULL,'武凡琪','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'云南昆明市禄劝县龙溪苑小区5栋3单元601','18290161632','873021165@qq.com'),('201412300122',NULL,'王鑫','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'陕西西安市灞桥区纺星二区16号楼一单元12号','15577322606','921152385@qq.com'),('201412300123',NULL,'闫一帆','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'陕西省渭南市富平县王寮镇仵新村七良组','13667831511','1658374128@qq.com'),('201412300124',NULL,'何博','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西柳州柳北区雅儒路239号','18775106679','775083404@qq.com'),('201412300125',NULL,'解沙沙','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'山西省临汾市尧都区金殿镇东靳南村东西路29','18677342296','2088300298@qq.com'),('201412300126',NULL,'王飞飞','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'安徽省铜陵市商北新村104栋8号','18076766647','1254071858@qq.com'),('201412300127',NULL,'唐庆鑫','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西南宁市望州南路63号','13367734907','1092684053@qq.com'),('201412300128',NULL,'周权锋','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西南宁良庆区大沙田光明新街6巷61号','13557333950','695873042@qq.com'),('201412300129',NULL,'曾一恒','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西南宁市邕武路22号','15677094212','1003847253@qq.com'),('201412300131',NULL,'黄昌恒','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西桂林市荔浦县双江镇同福村石灰窑屯4号','13457390926','1009886087@qq.com'),('201412300132',NULL,'陈宇熙','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西梧州市万秀区东中路70号','18172501201','574822146@qq.com'),('201412300133',NULL,'黄恩强','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西梧州市藤县藤州镇碧水阁小区2栋1302房','18290161219','809575260@qq.com'),('201412300134',NULL,'黎俊谷','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西岑溪市马路镇福塘村','15677377387','1204680765@qq.com'),('201412300135',NULL,'高梽华','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西岑溪恬景路99号','18577324282','568487623@qq.com'),('201412300136',NULL,'郭建华','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西北海市海城区和平路19号','18977934458','1271650489@qq.com'),('201412300137',NULL,'覃海润','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西北海市福成镇国有三合口农场庙山分场18号','13557835192','435692006@qq.com'),('201412300138',NULL,'沈玲','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西合浦县山口镇中堂村委会竹根村76号','13667769806','849682417@qq.com'),('201412300139',NULL,'陈日康','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西合浦县白沙镇平田村8号','15607733564','469565455@qq.com'),('201412300140',NULL,'陈铭坤','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西合浦县曲樟乡李家水村委马冲村','18278906267','1041619184@qq.com'),('201412300141',NULL,'农晶莹','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西灵山县烟墩镇西冲村','18577353156','534257501@qq.com'),('201412300142',NULL,'梁家宝','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西钦州金钟街39号','13557736583','429833151@qq.com'),('201412300143',NULL,'陈吉锴','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西钦州市钦北区福盛家园八栋1401','13667830310','137540310@qq.com'),('201412300144',NULL,'陈小敏','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西贵港市平南县平南镇月亮湾','15577394921','349592274@qq.com'),('201412300145',NULL,'黄丽冰','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西贵港市桂平白沙镇','18290161772','948705192@qq.com'),('201412300146',NULL,'吴颖杰','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广东佛山市南海区黄岐西苑大夏D座603','18577398954','735881850@qq.com'),('201412300147',NULL,'黄家德','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西柳江县穿山镇广西农垦国有新兴农场华侨一队11栋3号之二','15296007410','752444819@qq.com'),('201412300148',NULL,'覃友','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西玉林市兴业城隍镇莲塘村红旗一号','18807739750','826976490@qq.com'),('201412300149',NULL,'苏彦','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西玉林容县杨梅镇杨梅村南蛇队23号','18677362456','709936456@qq.com'),('201412300150',NULL,'林萍萍','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西博白县东平镇六荣水明滩','15177327796','1041019568@qq.com'),('201412300151',NULL,'朱泓光','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西玉林博白县沙河镇沙河大队','18778381364','1811729171@qq.com'),('201412300152',NULL,'黄伟聪','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西北流市清湾镇中龙村塘冲组21号','18775560853','1243166374@qq.com'),('201412300153',NULL,'邓钊荣','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西北流市清湾镇中龙村塘冲组21号','15207732500','850366739@qq.com'),('201412300154',NULL,'姚秋燕','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西凌云县逻楼镇山逻村','15507738239','1664925593@qq.com'),('201412300155',NULL,'沈素珍','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西贺州市平桂区公会镇新农村二十八组','15177436601','1364225607@qq.com'),('201412300156',NULL,'刘明秀','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西贺州富川县城北镇窑厂村','15677301675','243291269@qq.com'),('201412300157',NULL,'韦东艳','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西河池市东兰县大同乡和龙村纳矿屯','15296061670','158943243@qq.com'),('201412300158',NULL,'黄蕊莎','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西柳州融水县三防镇本洞村','13667735377','3023283984@qq.com'),('201412300159',NULL,'覃韬','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西大化县新华东路56号1栋4单元','15277850462','33106482784@qq.com'),('201412300160',NULL,'李柳艳','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西来宾市武宣县二塘镇乐业村','18707738075','1065388052@qq.com'),('201412300161',NULL,'莫崇杨','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西崇左市江州区驮卢镇驮日村驮街屯','13647877525','1123853968@qq.com'),('201412300162',NULL,'刘力','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'重庆市梁平县石安镇里程村六组83号','13557530175','1367636569@qq.com'),('201412300163',NULL,'李海闻','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'陕西西电科大新校区','15207731501','120072581@qq.com'),('201412300164',NULL,'郭建','男','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'陕西省西安市雁塔区鱼化寨华洲城2-17','15677300564','741810935@qq.com'),('201412300166',NULL,'张若琦','女','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广东省广州市天河区东莞庄路电子五所112号31栋3单元401房','15078369168','690235331@qq.com'),('201412300167',NULL,'王莹','女','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广东省韶关市乳源县得月小区B栋702','18290161800','1142245000@qq.com'),('201412300170',NULL,'刘望庭','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'上海市浦东新区沈社公路38弄37号','15221266280','542251835@qq.com'),('201412300171',NULL,'顾施吉','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'上海市浦东新区泥城镇人民村214号','18516356484','992956724@qq.com'),('201412300172',NULL,'李晓君','女','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西南宁市庆良区庆良庆镇大沙田建设路南二里四巷3号','13557333960','784140214@qq.com'),('201412300173',NULL,'方凯德','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西南宁西乡塘区金陵镇乐勇村','18777354343','572326904@qq.com'),('201412300174',NULL,'彭家辉','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西南宁市兴宁区长罡路3号','13667735753','672036547@qq.com'),('201412300175',NULL,'潘秋梅','女','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西南宁市武鸣县锣圩镇大杨村4队','13667739573','847286551@qq.com'),('201412300176',NULL,'黄海安','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西南宁市马山县金钗镇加雅村','13667812849','1329050192@qq.com'),('201412300177',NULL,'覃瑞国','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西宾阳县商贸贸城南区','15078366058','630693395@qq.com'),('201412300178',NULL,'覃靖','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西柳州市柳城县海润广场4栋1单元702','18276867958','593110574@qq.com'),('201412300179',NULL,'周敏','女','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西桂林市叠彩区芦笛路23号','13737743414','773256305@qq.com'),('201412300180',NULL,'黄健','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西桂兴安县湘漓镇阳安村委会水溪村29号','18277370593','1399975708@qq.com'),('201412300181',NULL,'邹定军','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西资源县梅溪乡戈洞村','15677398071','906975820@qq.com'),('201412300182',NULL,'韦沛佚','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西桂林市荔浦县荔城镇','18777345224','1056164691@qq.com'),('201412300183',NULL,'欧宇健','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西梧州市长洲区兴梧路23号6幢3单元606房','13667832838','1030978483@qq.com'),('201412300184',NULL,'严金勇','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西梧州市苍梧县梨埠料口村','13667736736','2826540056@qq.com'),('201412300185',NULL,'韦艳琼','女','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西梧州市藤县太平镇七政村岑岭组17号','18877383949','1324165594@qq.com'),('201412300186',NULL,'梁剑明','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西梧州市岑溪市归义镇龙王村180号','13667830767','2382179939@qq.com'),('201412300187',NULL,'苏启砚','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西梧州岑溪市马路镇','15177328100','173614381@qq.com'),('201412300188',NULL,'刘广','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西北海市三中路8号D座','18290160691','931077056@qq.com'),('201412300189',NULL,'沈力','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西北海市合浦县沙田镇对达村委会','18877942363','89369284@qq.com'),('201412300190',NULL,'程书娜','女','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西北海市银浦区福成镇','15907736755','952833605@qq.com'),('201412300191',NULL,'覃星善','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西防城港市港口区福兴院','15677370347','251176064@qq.com'),('201412300192',NULL,'禤德奎','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西防城港市防城区滩营乡','13667831256','759739581@qq.com'),('201412300193',NULL,'陈泰鹏','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西防城港市凯乐路仙人湾小区','13907803229','215840289@qq.com'),('201412300194',NULL,'李滢杰','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西钦州市钦州港大华财富广场二期','13978327334','1069394635@qq.com'),('201412300195',NULL,'黄春秀','女','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西钦州市钦北区板城镇新兴村','13977304057','3038989285@qq.com'),('201412300196',NULL,'韦慧玉','女','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西贵港市覃塘区东龙镇','18378328277','1205738302@qq.com'),('201412300197',NULL,'吉华','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西贵港市覃塘区东龙镇','15578385091','510104909@qq.com'),('201412300198',NULL,'覃美容','女','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西贵港市覃塘区东龙镇龙扶村扶屯3号','13667739872','2387722895@qq.com'),('201412300199',NULL,'黄诗华','女','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西贵港市桂平麻垌镇','18078027180','836992682@qq.com'),('201412300200',NULL,'潘勇任','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西贵港市桂平市社坡镇','13557932881','528552138@qq.com'),('201412300201',NULL,'陈锐民','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西玉林市容县六王镇古里村','15677331124','1187843358@qq.com'),('201412300202',NULL,'陈旭华','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西玉林市陆川县大桥镇','15177327931','1115436355@qq.com'),('201412300203',NULL,'张家豪','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西玉林市北流市北流镇河泉村','18677379658','164774174@qq.com'),('201412300204',NULL,'李馨玲','女','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西百色市德保县东安大街30号','15078382403','1003860280@qq.com'),('201412300205',NULL,'吴庆龙','男','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西贺州市钟山县钟山镇新里厂','15977384549','865684127@qq.com'),('201412300206',NULL,'孟菲','女','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西河池市金城江区思源路','15907875247','245157289@qq.com'),('201412300207',NULL,'范明瓶','女','81dc9bdb52d04dc20036dbd8313ed055','软件工程',NULL,'广西上林县明亮镇华亭街92号','18877311163','1932235298@qq.com'),('201412300208',NULL,'黄苒贺','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西百色市右江区东合一路景名苑','18376758358','904557105@qq.com'),('201412300209',NULL,'杨运萌','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'江苏省南京市浦口区大坝头28号','15651892135','1114263855@qq.com'),('201412300210',NULL,'徐鹏飞','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'江苏省泰兴市河失镇印庄前路21号','13617735250','2543577650@qq.com'),('201412300211',NULL,'张金琳','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'福建省三明市宁化县翠江镇金鸡山37号','18290161211','644228442@qq.com'),('201412300212',NULL,'陈兆毅','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'福建省福州市晋安区三八新村','13557536675','425547874@qq.com'),('201412300213',NULL,'马州华','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'江西省赣州市兴国县平川大道中心花园113号','13557537177','798609895@qq.com'),('201412300214',NULL,'李世华','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'江西省吉安市永丰县码镇院前村','13755484717','1207711356@qq.com'),('201412300215',NULL,'穆安琦','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'山东省淄博市张店区体坛小区50号楼1单元301室','15078384142','526943441@qq.com'),('201412300216',NULL,'孙浩','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'山东省泰安市宁阳县鹤洸路81号','15677302171','1025515191@qq.com'),('201412300217',NULL,'常瀚','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'河南省濮阳市教育局家属院7号楼1楼西','18236085599','584662818@qq.com'),('201412300218',NULL,'于文朋','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'河南省沈丘县卞路口乡王庄79号','18378308432','1376932986@qq.com'),('201412300219',NULL,'岑展铭','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西省南宁市桃源路方洲公寓','18607830420','824646808@qq.com'),('201412300220',NULL,'凌正霖','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西南宁市良庆区金象四区华阳街三里1号','18978903669','862576566@qq.com'),('201412300221',NULL,'何秋婷','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西南宁良庆区北园路19号','13471162094','851260211@qq.com'),('201412300222',NULL,'黄丹婷','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西南宁市西乡塘区新阳北三路10-1号9栋','18577318024','644510814@qq.com'),('201412300223',NULL,'黄吉安','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西南宁市上林县大丰镇向阳路56号','18579434374','308438179@qq.com'),('201412300224',NULL,'杨玲','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西来宾市兴宾区五山乡马则村民委寺番村','13667739576','1628067868@qq.com'),('201412300225',NULL,'谭鑫','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西象州县象州镇温泉大道126号','13667831779','826546772@qq.com'),('201412300226',NULL,'莫丽星','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西柳州市三江侗族自治县程村乡大树村','13667831651','979343340@qq.com'),('201412300227',NULL,'伍艳燕','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西桂林市临桂区两江镇城联村91号','18278382355','602740165@qq.com'),('201412300228',NULL,'石荣琴','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西临桂县宛田乡瓮洲村委会瓮潭村50号','13597326024','648721785@qq.com'),('201412300229',NULL,'秦小云','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西桂林市灵川县灵西路','18076779021','549013924@qq.com'),('201412300230',NULL,'何冬梅','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西藤县古龙镇陈平村那龙组','15907874790','1069941880@qq.com'),('201412300231',NULL,'孙自翔','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西北海市银海区福成镇西村村委员四队54号','18707737953','1287147377@qq.com'),('201412300232',NULL,'叶秋婷','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西北海市银海区福成镇三合口村委会独丰岭村11号','13557733821','443493114@qq.com'),('201412300233',NULL,'黄莉方','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西上思县在妙镇联合村平卜屯六号','13557238015','1067322546@qq.com'),('201412300234',NULL,'吴勇','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西钦州市钦南区东场镇','15177328207','1157140851@qq.com'),('201412300235',NULL,'刘雨茵','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西岑城镇义州大道192号','15677331154','1063400897@qq.com'),('201412300236',NULL,'陈雅慧','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西灵山县伯劳镇伯劳村委会大坪岭队36号','18577344095','1176704352@qq.com'),('201412300237',NULL,'梁雪华','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西贵港市覃塘区大岭乡大岭村旧湴屯113号','13557332565','770523489@qq.com'),('201412300238',NULL,'梁晃榜','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广东东莞市长安镇乌沙村','15507834172','824533716@qq.com'),('201412300239',NULL,'陈小英','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西玉林陆川县横山镇高冲村高冲队026号','18577324015','1627350173@qq.com'),('201412300240',NULL,'李国旋','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西玉林市陆川县古城镇八角村','18376557142','575639105@qq.com'),('201412300241',NULL,'黄婷','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西玉林市兴业县富阳庙岭村','13393645614','159038105@qq.com'),('201412300242',NULL,'许悦','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西百色市凌云县泗城镇','15677342245','454624582@qq.com'),('201412300243',NULL,'左静','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西壮族自治区贺州市昭平县五将镇新旺村','15177327863','1113290499@qq.com'),('201412300244',NULL,'严秀莲','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西贺州昭平县富罗镇三合村','13667830021','1642419976@qq.com'),('201412300245',NULL,'董吉连','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西省贺州市钟山县回龙镇新寨','15577366953','1040393142@qq.com'),('201412300246',NULL,'韦合','女','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西柳州市柳南区革新路革新一区17栋','15607732161','675122264@qq.com'),('201412300247',NULL,'江祖起','男','81dc9bdb52d04dc20036dbd8313ed055','信息管理与信息系统',NULL,'广西来宾市兴宾区高安乡敖塘下村','15507834165','374358433@qq.com'),('201512300309',NULL,'苏小丹','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西上思县在妙镇环州路152号','13631598925','781930843@qq.com'),('201512300330',NULL,'庞凤娟','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西陆川县沙湖乡新街村陆子塘队','15678260136','532918127@qq.com'),('201512300338',NULL,'董芹','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西钟山县回龙镇石阶头8号','18376706327','1250273097@qq.com'),('201512300339',NULL,'朱燕萍','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西合浦县石康镇一街114号','18277191847','943017902@qq.com'),('201512300340',NULL,'赵海霞','女','81dc9bdb52d04dc20036dbd8313ed055','计算机科学与技术',NULL,'广西靖西县安宁乡新造村','18277192463','761109249@qq.com');
/*!40000 ALTER TABLE `studentinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentlesson`
--

DROP TABLE IF EXISTS `studentlesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentlesson` (
  `slid` varchar(32) NOT NULL,
  `student_id` varchar(16) DEFAULT NULL,
  `lesson_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`slid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentlesson`
--

LOCK TABLES `studentlesson` WRITE;
/*!40000 ALTER TABLE `studentlesson` DISABLE KEYS */;
INSERT INTO `studentlesson` VALUES ('10d886413f954362','00001','402880e6624161e60162416311660000');
/*!40000 ALTER TABLE `studentlesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subjectID` int(11) NOT NULL AUTO_INCREMENT,
  `subjectTitle` varchar(1024) DEFAULT NULL,
  `subjectOptionA` varchar(1024) DEFAULT NULL,
  `subjectOptionB` varchar(1024) DEFAULT NULL,
  `subjectOptionC` varchar(1024) DEFAULT NULL,
  `subjectOptionD` varchar(1024) DEFAULT NULL,
  `subjectAnswer` varchar(1024) DEFAULT NULL,
  `subjectParse` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`subjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'下列不可作为 java 语言标识符的是',' a1 ','$1','_1','11','D',''),(2,'整型数据类型中，需要内存空间最少的是','short','long','int','byte','D','');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vedio`
--

DROP TABLE IF EXISTS `vedio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vedio` (
  `vid` varchar(32) NOT NULL,
  `vname` varchar(32) DEFAULT NULL,
  `vurl` varchar(150) DEFAULT NULL,
  `vtime` varchar(32) DEFAULT NULL,
  `vcid` varchar(32) DEFAULT NULL,
  `vfilename` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vedio`
--

LOCK TABLES `vedio` WRITE;
/*!40000 ALTER TABLE `vedio` DISABLE KEYS */;
INSERT INTO `vedio` VALUES ('402880e66251c91b016251cf77f40000','视频demo','F:\\workspace\\courseonline_parent\\courseonline_web\\src\\main\\webapp\\vedio\\02.mp4','2018-03-23 15:42:53','402880e6624161e60162416311660000','02'),('402880e66251c91b016251d0143d0001','视频demo1','F:\\workspace\\courseonline_parent\\courseonline_web\\src\\main\\webapp\\vedio\\video.mp4','2018-03-23 15:43:33','402880e6624161e60162416311660000','video'),('402880e66251c91b016251d0bfa00002','视频demo2','F:\\workspace\\courseonline_parent\\courseonline_web\\src\\main\\webapp\\vedio\\oceans-clip.mp4','2018-03-23 15:44:17','402880e6624161e60162416311660000','oceans-clip');
/*!40000 ALTER TABLE `vedio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-29 16:48:34
