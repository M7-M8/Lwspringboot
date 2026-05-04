-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: Lwspringboot
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Lwspringboot`
--

/*!40000 DROP DATABASE IF EXISTS `Lwspringboot`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Lwspringboot` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `Lwspringboot`;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货人',
  `phone` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话',
  `isdefault` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否默认地址[是/否]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'2026-03-12 05:01:36',11,'宇宙银河系金星1号','金某','13823888881','是'),(2,'2026-03-12 05:01:36',12,'宇宙银河系木星1号','木某','13823888882','是'),(3,'2026-03-12 05:01:36',13,'宇宙银河系水星1号','水某','13823888883','是'),(4,'2026-03-12 05:01:36',14,'宇宙银河系火星1号','火某','13823888884','是'),(5,'2026-03-12 05:01:36',15,'宇宙银河系土星1号','土某','13823888885','是'),(6,'2026-03-12 05:01:36',16,'宇宙银河系月球1号','月某','13823888886','是'),(7,'2026-03-12 05:01:36',17,'宇宙银河系黑洞1号','黑某','13823888887','是'),(8,'2026-03-12 05:01:36',18,'宇宙银河系地球1号','地某','13823888888','是');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tablename` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'shangpinxinxi' COMMENT '商品表名',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `picture` longtext COLLATE utf8mb4_unicode_ci COMMENT '图片',
  `buynumber` int(11) NOT NULL COMMENT '购买数量',
  `price` double DEFAULT NULL COMMENT '单价',
  `dianpuming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商户名称',
  PRIMARY KEY (`id`),
  KEY `price` (`price`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`price`) REFERENCES `shangpinxinxi` (`price`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='购物车表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chargerecord`
--

DROP TABLE IF EXISTS `chargerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chargerecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `role` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色',
  `amount` double NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='充值记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chargerecord`
--

LOCK TABLES `chargerecord` WRITE;
/*!40000 ALTER TABLE `chargerecord` DISABLE KEYS */;
INSERT INTO `chargerecord` VALUES (1,'2026-03-12 05:01:36',1,'用户名1','角色1',1),(2,'2026-03-12 05:01:36',2,'用户名2','角色2',2),(3,'2026-03-12 05:01:36',3,'用户名3','角色3',3),(4,'2026-03-12 05:01:36',4,'用户名4','角色4',4),(5,'2026-03-12 05:01:36',5,'用户名5','角色5',5),(6,'2026-03-12 05:01:36',6,'用户名6','角色6',6),(7,'2026-03-12 05:01:36',7,'用户名7','角色7',7),(8,'2026-03-12 05:01:36',8,'用户名8','角色8',8);
/*!40000 ALTER TABLE `chargerecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `adminid` bigint(20) DEFAULT NULL COMMENT '管理员id',
  `ask` longtext COLLATE utf8mb4_unicode_ci COMMENT '提问',
  `reply` longtext COLLATE utf8mb4_unicode_ci COMMENT '回复',
  `isreply` int(11) DEFAULT NULL COMMENT '是否回复',
  `isread` int(11) DEFAULT '0' COMMENT '已读/未读(1:已读,0:未读)',
  `uname` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `uimage` longtext COLLATE utf8mb4_unicode_ci COMMENT '用户头像',
  `type` int(11) DEFAULT '1' COMMENT '内容类型(1:文本,2:图片,3:视频,4:文件,5:表情)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='AI智能导购';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,'2026-03-12 05:01:36',1,1,'提问1','回复1',1,1,'用户名1','upload/chat_uimage1.jpg,upload/chat_uimage2.jpg,upload/chat_uimage3.jpg',1),(2,'2026-03-12 05:01:36',2,2,'提问2','回复2',2,2,'用户名2','upload/chat_uimage2.jpg,upload/chat_uimage3.jpg,upload/chat_uimage4.jpg',2),(3,'2026-03-12 05:01:36',3,3,'提问3','回复3',3,3,'用户名3','upload/chat_uimage3.jpg,upload/chat_uimage4.jpg,upload/chat_uimage5.jpg',3),(4,'2026-03-12 05:01:36',4,4,'提问4','回复4',4,4,'用户名4','upload/chat_uimage4.jpg,upload/chat_uimage5.jpg,upload/chat_uimage6.jpg',4),(5,'2026-03-12 05:01:36',5,5,'提问5','回复5',5,5,'用户名5','upload/chat_uimage5.jpg,upload/chat_uimage6.jpg,upload/chat_uimage7.jpg',5),(6,'2026-03-12 05:01:36',6,6,'提问6','回复6',6,6,'用户名6','upload/chat_uimage6.jpg,upload/chat_uimage7.jpg,upload/chat_uimage8.jpg',6),(7,'2026-03-12 05:01:36',7,7,'提问7','回复7',7,7,'用户名7','upload/chat_uimage7.jpg,upload/chat_uimage8.jpg,upload/chat_uimage1.jpg',7),(8,'2026-03-12 05:01:36',8,8,'提问8','回复8',8,8,'用户名8','upload/chat_uimage8.jpg,upload/chat_uimage1.jpg,upload/chat_uimage2.jpg',8);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatmessage`
--

DROP TABLE IF EXISTS `chatmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatmessage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `uid` bigint(20) NOT NULL COMMENT '用户ID',
  `fid` bigint(20) NOT NULL COMMENT '好友用户ID',
  `content` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `format` int(11) DEFAULT NULL COMMENT '格式(1:文字，2:图片)',
  `isread` int(11) DEFAULT '0' COMMENT '消息已读(0:未读，1:已读)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatmessage`
--

LOCK TABLES `chatmessage` WRITE;
/*!40000 ALTER TABLE `chatmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(200) DEFAULT NULL COMMENT '配置参数值',
  `url` varchar(500) DEFAULT NULL COMMENT 'url',
  `type` int(11) DEFAULT NULL COMMENT '参数类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','upload/picture1.jpg',NULL,1),(2,'picture2','upload/picture2.jpg',NULL,1),(3,'picture3','upload/picture3.jpg',NULL,1),(11,'baidu','{\"appId\":\"49214550\",\"apiKey\":\"7Otjpv2kn0ljQk45qXOXh5MO\",\"secretKey\":\"BMfbXRbTIVaB4C3SbRTtGqDv1wHDvyXS\"}',NULL,2),(21,'bLoginBackgroundImg','',NULL,3),(22,'bRegisterBackgroundImg','',NULL,3),(23,'bIndexBackgroundImg','',NULL,3),(24,'bTopLogo','',NULL,3),(25,'bHomeLogo','',NULL,3),(26,'fLoginBackgroundImg','',NULL,3),(27,'fRegisterBackgroudImg','',NULL,3),(28,'fTopLogo','',NULL,3);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussshangpinxinxi`
--

DROP TABLE IF EXISTS `discussshangpinxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussshangpinxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COLLATE utf8mb4_unicode_ci COMMENT '头像',
  `nickname` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `reply` longtext COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
  `thumbsupnum` int(11) DEFAULT '0' COMMENT '赞',
  `crazilynum` int(11) DEFAULT '0' COMMENT '踩',
  `istop` int(11) DEFAULT '0' COMMENT '置顶(1:置顶,0:非置顶)',
  `tuserids` longtext COLLATE utf8mb4_unicode_ci COMMENT '赞用户ids',
  `cuserids` longtext COLLATE utf8mb4_unicode_ci COMMENT '踩用户ids',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品信息评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussshangpinxinxi`
--

LOCK TABLES `discussshangpinxinxi` WRITE;
/*!40000 ALTER TABLE `discussshangpinxinxi` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussshangpinxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `uid` bigint(20) NOT NULL COMMENT '用户ID',
  `fid` bigint(20) NOT NULL COMMENT '好友用户ID',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `picture` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `role` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  `tablename` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表名',
  `alias` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '别名',
  `type` int(11) DEFAULT '0' COMMENT '类型(0:好友申请，1:好友，2:消息)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='好友表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gonggaoxinxi`
--

DROP TABLE IF EXISTS `gonggaoxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gonggaoxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gonggaobiaoti` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `gonggaojianjie` longtext COLLATE utf8mb4_unicode_ci COMMENT '公告简介',
  `fabushijian` datetime DEFAULT NULL COMMENT '发布时间',
  `gonggaofengmian` longtext COLLATE utf8mb4_unicode_ci COMMENT '公告封面',
  `gonggaoneirong` longtext COLLATE utf8mb4_unicode_ci COMMENT '公告内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='公告信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gonggaoxinxi`
--

LOCK TABLES `gonggaoxinxi` WRITE;
/*!40000 ALTER TABLE `gonggaoxinxi` DISABLE KEYS */;
INSERT INTO `gonggaoxinxi` VALUES (1,'2026-03-12 05:01:35','最新快讯','信息公示','2026-03-12 13:01:35','upload/gonggaoxinxi_gonggaofengmian1.jpg,upload/gonggaoxinxi_gonggaofengmian2.jpg,upload/gonggaoxinxi_gonggaofengmian3.jpg','此处文本编辑框是内容详细的操作，您可以对框内现有的文字进行任意修改，无论是修改具体内容、调整语句逻辑还是增删文字都没问题；若要插入图片，点击上方工具栏的图片标识，选择本地图片文件，就能将图片插入并展示出来，所有操作都进行保存。​'),(2,'2026-03-12 05:01:35','公告信息','官方快讯','2026-03-12 13:01:35','upload/gonggaoxinxi_gonggaofengmian2.jpg,upload/gonggaoxinxi_gonggaofengmian3.jpg,upload/gonggaoxinxi_gonggaofengmian4.jpg','此编辑框内的默认内容为可编辑状态，您可对文字进行修改，比如调整语句顺序、更换文字内容等；插入图片时，支持上传图片，上传后图片会直接在编辑框中展示，也能一键删除不需要的图片。'),(3,'2026-03-12 05:01:35','资讯新闻','通知','2026-03-12 13:01:35','upload/gonggaoxinxi_gonggaofengmian3.jpg,upload/gonggaoxinxi_gonggaofengmian4.jpg,upload/gonggaoxinxi_gonggaofengmian5.jpg','此处文本编辑框是内容详细的操作提示，您能轻松对框内文字进行修改，像更正错误文字、调整文字内容等都能实现；插入图片的话，点击工具栏上的图片按钮，选择要插入的图片，图片就会在编辑框中展示，支持随时再次编辑。'),(4,'2026-03-12 05:01:35','通知公告','热点','2026-03-12 13:01:35','upload/gonggaoxinxi_gonggaofengmian4.jpg,upload/gonggaoxinxi_gonggaofengmian5.jpg,upload/gonggaoxinxi_gonggaofengmian6.jpg','编辑框中的默认提示允许您进行文字修改操作，像更正错别字、调整文字内容等都能轻松完成；插入图片的话，点击工具栏中的图片按钮，选择图片后即可在编辑框中展示，所有修改实时可见且支持随时编辑。​\n'),(5,'2026-03-12 05:01:35','新闻中心','公告','2026-03-12 13:01:35','upload/gonggaoxinxi_gonggaofengmian5.jpg,upload/gonggaoxinxi_gonggaofengmian6.jpg,upload/gonggaoxinxi_gonggaofengmian7.jpg','您看到的编辑框内默认提示可作为创作起点，支持对现有内容进行全面修改，包括删除冗余文字、替换表述方式等；插入图片时，既可以从本地上传，也能粘贴网络图片地址，图片插入后会直接在文本中展示，完成后点击空白处即可保存设置。​'),(6,'2026-03-12 05:01:35','最新通知','综合资讯','2026-03-12 13:01:35','upload/gonggaoxinxi_gonggaofengmian6.jpg,upload/gonggaoxinxi_gonggaofengmian7.jpg,upload/gonggaoxinxi_gonggaofengmian8.jpg','此编辑框内已详情的内容，您可以直接对现有文字进行修改，无论是调整文字内容、更正表述还是增减文字数量都能实现；若需插入图片，只需点击上方工具栏的图片图标，选择本地文件或输入图片链接即可插入展示，所有操作完成后提交后系统会保存您的修改。​'),(7,'2026-03-12 05:01:35','公告栏','消息类','2026-03-12 13:01:35','upload/gonggaoxinxi_gonggaofengmian7.jpg,upload/gonggaoxinxi_gonggaofengmian8.jpg,upload/gonggaoxinxi_gonggaofengmian1.jpg','编辑框中展示的默认内容仅为示例，您可任意修改其中的文字表述，比如更换词语、调整语句顺序等；当需要插入图片时，点击编辑框上方的 “插入图片” 按钮，上传图片后即可直接在编辑框中展示。'),(8,'2026-03-12 05:01:35','最新公示','时效资讯','2026-03-12 13:01:35','upload/gonggaoxinxi_gonggaofengmian8.jpg,upload/gonggaoxinxi_gonggaofengmian1.jpg,upload/gonggaoxinxi_gonggaofengmian2.jpg','此处文本编辑框是内容详细的操作，您可以对框内现有的文字进行任意修改，无论是修改具体内容、调整语句逻辑还是增删文字都没问题；若要插入图片，点击上方工具栏的图片标识，选择本地图片文件，就能将图片插入并展示出来，所有操作都进行保存。​');
/*!40000 ALTER TABLE `gonggaoxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `orderid` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `picture` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `buynumber` int(11) DEFAULT NULL COMMENT '购买数量',
  `price` double DEFAULT NULL COMMENT '单价',
  `total` double DEFAULT NULL COMMENT '总价',
  `type` int(11) DEFAULT NULL COMMENT '支付类型',
  `status` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单状态',
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `tel` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `consignee` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货人',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `tablename` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'shangpinxinxi' COMMENT '商品表名',
  `logistics` longtext COLLATE utf8mb4_unicode_ci COMMENT '物流',
  `dianpuming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商户名称',
  `groupno` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '团购编号',
  `sfsh` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '是否审核',
  `shhf` longtext COLLATE utf8mb4_unicode_ci COMMENT '审核回复',
  `role` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户角色',
  `returnreason` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退货原因',
  `ordertype` int(11) DEFAULT NULL COMMENT '订单类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderid` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shangjia`
--

DROP TABLE IF EXISTS `shangjia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shangjia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dianpuming` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺名',
  `mima` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `fuzeren` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人',
  `xingbie` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `lianxidianhua` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `touxiang` longtext COLLATE utf8mb4_unicode_ci COMMENT '头像',
  `zizhiwenjian` longtext COLLATE utf8mb4_unicode_ci COMMENT '资质文件',
  `sfsh` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext COLLATE utf8mb4_unicode_ci COMMENT '审核回复',
  `money` double DEFAULT '0' COMMENT '余额',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dianpuming` (`dianpuming`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商家';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shangjia`
--

LOCK TABLES `shangjia` WRITE;
/*!40000 ALTER TABLE `shangjia` DISABLE KEYS */;
INSERT INTO `shangjia` VALUES (21,'2026-03-12 05:01:35','嘉乐便利店','e10adc3949ba59abbe56e057f20f883e','赵伟','女','13590123456','upload/shangjia_touxiang1.jpg','','是','',200,0),(22,'2026-03-12 05:01:35','佳惠生活','e10adc3949ba59abbe56e057f20f883e','刘芳','男','13512345678','upload/shangjia_touxiang2.jpg','','是','',200,0),(23,'2026-03-12 05:01:35','鑫盛百货','e10adc3949ba59abbe56e057f20f883e','王强','女','13401234567','upload/shangjia_touxiang3.jpg','','是','',200,0),(24,'2026-03-12 05:01:35','佳禾商贸','e10adc3949ba59abbe56e057f20f883e','赵刚','女','13467890123','upload/shangjia_touxiang4.jpg','','是','',200,0),(25,'2026-03-12 05:01:35','和顺商行','e10adc3949ba59abbe56e057f20f883e','赵敏','男','13434567890','upload/shangjia_touxiang5.jpg','','是','',200,0),(26,'2026-03-12 05:01:35','诚鑫百货','e10adc3949ba59abbe56e057f20f883e','李军','女','13490123456','upload/shangjia_touxiang6.jpg','','是','',200,0),(27,'2026-03-12 05:01:35','悦客优品','e10adc3949ba59abbe56e057f20f883e','王明','男','13423456789','upload/shangjia_touxiang7.jpg','','是','',200,0),(28,'2026-03-12 05:01:35','聚福百货','e10adc3949ba59abbe56e057f20f883e','张雨','男','13501234567','upload/shangjia_touxiang8.jpg','','是','',200,0);
/*!40000 ALTER TABLE `shangjia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shangpinfenlei`
--

DROP TABLE IF EXISTS `shangpinfenlei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shangpinfenlei` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shangpinfenlei` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品分类',
  PRIMARY KEY (`id`),
  KEY `shangpinfenlei_40k3` (`shangpinfenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shangpinfenlei`
--

LOCK TABLES `shangpinfenlei` WRITE;
/*!40000 ALTER TABLE `shangpinfenlei` DISABLE KEYS */;
INSERT INTO `shangpinfenlei` VALUES (1,'2026-03-12 05:01:35','女装'),(2,'2026-03-12 05:01:35','母婴用品'),(3,'2026-03-12 05:01:35','家居清洁'),(4,'2026-03-12 05:01:35','男装'),(5,'2026-03-12 05:01:35','宠物用品'),(6,'2026-03-12 05:01:35','汽车用品'),(7,'2026-03-12 05:01:35','美妆护肤'),(8,'2026-03-12 05:01:35','珠宝饰品');
/*!40000 ALTER TABLE `shangpinfenlei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shangpinxinxi`
--

DROP TABLE IF EXISTS `shangpinxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shangpinxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shangpinmingcheng` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `shangpinfenlei` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品分类',
  `shangpintupian` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品图片',
  `guige` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规格',
  `pinpai` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '品牌',
  `shangpinmiaoshu` longtext COLLATE utf8mb4_unicode_ci COMMENT '商品描述',
  `dianpuming` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '店铺名',
  `onelimittimes` int(11) DEFAULT '-1' COMMENT '单限',
  `alllimittimes` int(11) DEFAULT '-1' COMMENT '库存',
  `price` double NOT NULL DEFAULT '0' COMMENT '价格',
  `thumbsupnum` int(11) DEFAULT '0' COMMENT '赞',
  `crazilynum` int(11) DEFAULT '0' COMMENT '踩',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `reversetime` datetime DEFAULT NULL COMMENT '倒计结束时间',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  `discussnum` int(11) DEFAULT '0' COMMENT '评论数',
  `onshelves` int(11) DEFAULT '1' COMMENT '是否上架(1:上架，0:下架)',
  `groupprice` double DEFAULT '0' COMMENT '团购价',
  `grouppeople` int(11) DEFAULT '0' COMMENT '拼团人数',
  `curpeople` int(11) DEFAULT '0' COMMENT '当前人数',
  `storeupnum` int(11) DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`),
  KEY `shangpinxinxi_price` (`price`),
  KEY `shangpinfenlei` (`shangpinfenlei`),
  CONSTRAINT `shangpinxinxi_ibfk_1` FOREIGN KEY (`shangpinfenlei`) REFERENCES `shangpinfenlei` (`shangpinfenlei`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shangpinxinxi`
--

LOCK TABLES `shangpinxinxi` WRITE;
/*!40000 ALTER TABLE `shangpinxinxi` DISABLE KEYS */;
INSERT INTO `shangpinxinxi` VALUES (1,'2026-03-12 05:01:35','高腰牛仔短裤','女装','upload/shangpinxinxi_高腰牛仔短裤1.jpg,upload/shangpinxinxi_高腰牛仔短裤2.jpg,upload/shangpinxinxi_高腰牛仔短裤3.jpg','27码','蓝调','棉弹牛仔面料高腰设计修身显瘦百搭日常穿搭','嘉乐便利店',36,115,150,1,1,'2026-03-12 13:01:35','2026-03-13 00:00:00',1,0,1,9.9,2,0,1),(2,'2026-03-12 05:01:35','婴儿纯棉连体衣','母婴用品','upload/shangpinxinxi_婴儿纯棉连体衣1.jpg,upload/shangpinxinxi_婴儿纯棉连体衣2.jpg,upload/shangpinxinxi_婴儿纯棉连体衣3.jpg','66码','萌宝适','A类婴幼儿面料无骨缝制柔软亲肤透气适合0-1岁婴儿','佳惠生活',28,135,134,2,2,'2026-03-12 13:01:35','2026-03-13 00:00:00',2,0,1,9.9,2,0,2),(3,'2026-03-12 05:01:35','柠檬香型洗洁精','家居清洁','upload/shangpinxinxi_柠檬香型洗洁精1.jpg,upload/shangpinxinxi_柠檬香型洗洁精2.jpg,upload/shangpinxinxi_柠檬香型洗洁精3.jpg','500ml/瓶','清柠','天然柠檬精华配方温和去油污易冲洗无残留','鑫盛百货',72,109,52,3,3,'2026-03-12 13:01:35','2026-03-13 00:00:00',3,0,1,9.9,2,0,3),(4,'2026-03-12 05:01:35','纯棉修身衬衫','男装','upload/shangpinxinxi_纯棉修身衬衫1.jpg,upload/shangpinxinxi_纯棉修身衬衫2.jpg,upload/shangpinxinxi_纯棉修身衬衫3.jpg','XL码','棉致','精选长绒棉面料柔软透气版型修身适合商务场合穿着','佳禾商贸',78,178,171,4,4,'2026-03-12 13:01:35','2026-03-13 00:00:00',4,0,1,9.9,2,0,4),(5,'2026-03-12 05:01:35','宠物鸡肉冻干','宠物用品','upload/shangpinxinxi_宠物鸡肉冻干1.jpg,upload/shangpinxinxi_宠物鸡肉冻干2.jpg,upload/shangpinxinxi_宠物鸡肉冻干3.jpg','50g/袋','宠乐多','纯鸡肉冻干保留营养口感酥脆适合猫狗通用','和顺商行',55,156,105,5,5,'2026-03-12 13:01:35','2026-03-13 00:00:00',5,0,1,9.9,2,0,5),(6,'2026-03-12 05:01:35','汽车玻璃水','汽车用品','upload/shangpinxinxi_汽车玻璃水1.jpg,upload/shangpinxinxi_汽车玻璃水2.jpg,upload/shangpinxinxi_汽车玻璃水3.jpg','2L/瓶','车洁士','高效去污配方防雾防冻适合各类汽车玻璃清洁','诚鑫百货',26,88,88,6,6,'2026-03-12 13:01:35','2026-03-13 00:00:00',6,0,1,9.9,2,0,6),(7,'2026-03-12 05:01:35','补水保湿面膜','美妆护肤','upload/shangpinxinxi_补水保湿面膜1.jpg,upload/shangpinxinxi_补水保湿面膜2.jpg,upload/shangpinxinxi_补水保湿面膜3.jpg','5片/盒','水肌语','高浓度玻尿酸精华深层补水锁水改善肌肤干燥暗沉','悦客优品',44,101,82,7,7,'2026-03-12 13:01:35','2026-03-13 00:00:00',7,0,1,9.9,2,0,7),(8,'2026-03-12 05:01:35','银质项链','珠宝饰品','upload/shangpinxinxi_银质项链1.jpg,upload/shangpinxinxi_银质项链2.jpg,upload/shangpinxinxi_银质项链3.jpg','链长45cm','银韵','925银材质抛光工艺防过敏简约设计适合日常佩戴','聚福百货',32,142,144,8,8,'2026-03-12 13:01:35','2026-03-13 00:00:00',8,0,1,9.9,2,0,8);
/*!40000 ALTER TABLE `shangpinxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shequxinxi`
--

DROP TABLE IF EXISTS `shequxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shequxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shequ` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '社区',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shequ` (`shequ`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='社区信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shequxinxi`
--

LOCK TABLES `shequxinxi` WRITE;
/*!40000 ALTER TABLE `shequxinxi` DISABLE KEYS */;
INSERT INTO `shequxinxi` VALUES (1,'2026-03-12 05:01:35','四季花城社区'),(2,'2026-03-12 05:01:35','碧水蓝天社区'),(3,'2026-03-12 05:01:35','恒大绿洲社区'),(4,'2026-03-12 05:01:35','阳光新城社区'),(5,'2026-03-12 05:01:35','保利花园社区'),(6,'2026-03-12 05:01:35','东方明珠社区'),(7,'2026-03-12 05:01:35','和谐家园社区'),(8,'2026-03-12 05:01:35','阳光花园社区');
/*!40000 ALTER TABLE `shequxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '商品id',
  `tablename` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表名',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `picture` longtext COLLATE utf8mb4_unicode_ci COMMENT '图片',
  `type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '类型',
  `inteltype` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(500) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `role` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '管理员' COMMENT '角色',
  `image` longtext COLLATE utf8mb4_unicode_ci COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2026-03-12 05:01:36','admin','admin','管理员','upload/image1.jpg');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xitongzixun`
--

DROP TABLE IF EXISTS `xitongzixun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xitongzixun` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `fenlei` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类',
  `jianjie` longtext COLLATE utf8mb4_unicode_ci COMMENT '简介',
  `fabushijian` date DEFAULT NULL COMMENT '发布时间',
  `fengmian` longtext COLLATE utf8mb4_unicode_ci COMMENT '封面',
  `neirong` longtext COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `thumbsupnum` int(11) DEFAULT '0' COMMENT '赞',
  `crazilynum` int(11) DEFAULT '0' COMMENT '踩',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  `storeupnum` int(11) DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统资讯';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xitongzixun`
--

LOCK TABLES `xitongzixun` WRITE;
/*!40000 ALTER TABLE `xitongzixun` DISABLE KEYS */;
INSERT INTO `xitongzixun` VALUES (1,'2026-03-12 05:01:35','儿童绘画比赛','文体活动','面向5-12岁儿童的公益艺术赛事','2026-03-12','upload/xitongzixun_fengmian1.jpg,upload/xitongzixun_fengmian2.jpg,upload/xitongzixun_fengmian3.jpg','4月10日前提交作品，设创意奖/色彩奖等6奖项',1,1,'2026-03-12 13:01:35',1,1),(2,'2026-03-12 05:01:35','新冠疫苗接种','医疗服务','社区卫生站疫苗接种时间调整','2026-03-12','upload/xitongzixun_fengmian2.jpg,upload/xitongzixun_fengmian3.jpg,upload/xitongzixun_fengmian4.jpg','每周二四全天可接种，无需预约',2,2,'2026-03-12 13:01:35',2,2),(3,'2026-03-12 05:01:35','停水应急通知','应急预案','因管道维修临时停水通知及应对指南','2026-03-12','upload/xitongzixun_fengmian3.jpg,upload/xitongzixun_fengmian4.jpg,upload/xitongzixun_fengmian5.jpg','3月25日9:00-17:00全区停水，请提前储水并关闭阀门',3,3,'2026-03-12 13:01:35',3,3),(4,'2026-03-12 05:01:35','物业服务月报','物业公示','上月物业服务数据及问题整改汇总','2026-03-12','upload/xitongzixun_fengmian4.jpg,upload/xitongzixun_fengmian5.jpg,upload/xitongzixun_fengmian6.jpg','公共区域报修处理率98%，绿化补种120平米',4,4,'2026-03-12 13:01:35',4,4),(5,'2026-03-12 05:01:35','闲置物品市集','公益活动','居民闲置物品交换绿色平台','2026-03-12','upload/xitongzixun_fengmian5.jpg,upload/xitongzixun_fengmian6.jpg,upload/xitongzixun_fengmian7.jpg','每周六上午在中心广场举办，免摊位费',5,5,'2026-03-12 13:01:35',5,5),(6,'2026-03-12 05:01:35','停车管理办法','制度公示','新修订地下车位使用管理细则','2026-03-12','upload/xitongzixun_fengmian6.jpg,upload/xitongzixun_fengmian7.jpg,upload/xitongzixun_fengmian8.jpg','明确月租300元临停5元/小时收费标准',6,6,'2026-03-12 13:01:35',6,6),(7,'2026-03-12 05:01:35','垃圾分类指南','环保科普','新版垃圾分类标准图文解析','2026-03-12','upload/xitongzixun_fengmian7.jpg,upload/xitongzixun_fengmian8.jpg,upload/xitongzixun_fengmian1.jpg','详解四类垃圾投放要求及误区分案例',7,7,'2026-03-12 13:01:35',7,7),(8,'2026-03-12 05:01:35','电梯维护公告','设施维护','三期电梯年度检测时间安排','2026-03-12','upload/xitongzixun_fengmian8.jpg,upload/xitongzixun_fengmian1.jpg,upload/xitongzixun_fengmian2.jpg','检测期间需分段停运，每单元耗时约4小时',8,8,'2026-03-12 13:01:35',8,8);
/*!40000 ALTER TABLE `xitongzixun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `mima` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `xingming` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `xingbie` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '性别',
  `shouji` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机',
  `touxiang` longtext COLLATE utf8mb4_unicode_ci COMMENT '头像',
  `shequ` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '社区',
  `sfsh` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext COLLATE utf8mb4_unicode_ci COMMENT '审核回复',
  `money` double DEFAULT '0' COMMENT '余额',
  `pquestion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密保问题',
  `panswer` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密保答案',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhanghao` (`zhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (11,'2026-03-12 05:01:35','004','e10adc3949ba59abbe56e057f20f883e','女','女','15012345678','upload/yonghu_touxiang1.jpg','四季花城社区','是','',200,'密保问题1','密保答案1',0),(12,'2026-03-12 05:01:35','008','e10adc3949ba59abbe56e057f20f883e','男','男','13276543210','upload/yonghu_touxiang2.jpg','碧水蓝天社区','是','',200,'密保问题2','密保答案2',0),(13,'2026-03-12 05:01:35','006','e10adc3949ba59abbe56e057f20f883e','女','女','13187654321','upload/yonghu_touxiang3.jpg','恒大绿洲社区','是','',200,'密保问题3','密保答案3',0),(14,'2026-03-12 05:01:35','001','e10adc3949ba59abbe56e057f20f883e','女','女','13812345678','upload/yonghu_touxiang4.jpg','阳光新城社区','是','',200,'密保问题4','密保答案4',0),(15,'2026-03-12 05:01:35','005','e10adc3949ba59abbe56e057f20f883e','男','男','13790123456','upload/yonghu_touxiang5.jpg','保利花园社区','是','',200,'密保问题5','密保答案5',0),(16,'2026-03-12 05:01:35','007','e10adc3949ba59abbe56e057f20f883e','女','女','13654321098','upload/yonghu_touxiang6.jpg','东方明珠社区','是','',200,'密保问题6','密保答案6',0),(17,'2026-03-12 05:01:35','003','e10adc3949ba59abbe56e057f20f883e','男','男','15212345678','upload/yonghu_touxiang7.jpg','和谐家园社区','是','',200,'密保问题7','密保答案7',0),(18,'2026-03-12 05:01:35','002','e10adc3949ba59abbe56e057f20f883e','男','男','15267890123','upload/yonghu_touxiang8.jpg','阳光花园社区','是','',200,'密保问题8','密保答案8',0);
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-17 13:39:40
