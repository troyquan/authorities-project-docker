CREATE DATABASE  IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` bigint DEFAULT '0' COMMENT '上级部门id',
  `tree_path` varchar(255) DEFAULT ',' COMMENT '树结构',
  `sort_value` int DEFAULT '1' COMMENT '排序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态（1正常 0停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2018 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT COMMENT='组织机构';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (1,'Guigu LTD',0,',1,',1,'张老师','15659090912',1,'2023-04-18 20:05:04','2023-04-18 20:05:04',0),(10,'BEIJING',1,',1,10,',1,'李老师','18790007789',1,'2023-04-18 20:05:04','2023-04-18 20:05:04',0),(20,'SHANGHAI',1,',1,20,',1,'王老师','15090987678',1,'2023-04-18 20:05:04','2023-04-18 20:05:04',0),(30,'SHENZHEN',1,',1,30,',1,'李老师','15090987678',1,'2023-04-18 20:05:04','2023-04-18 20:05:04',0),(1010,'Education Sec',10,',1,10,1010,',1,'李老师','15090987678',1,'2023-04-18 20:05:04','2023-04-18 20:05:04',0),(1020,'Operation',10,',1,10,1020,',1,'王老师','15090987678',1,'2023-04-18 20:05:04','2023-04-18 20:05:04',0),(1021,'Java',1010,',1,10,1010,1021,',1,'王老师','15090987678',1,'2023-04-18 20:05:04','2023-04-18 20:05:04',0),(1022,'Big Data',1010,',1,10,1010,1022,',1,'王老师','15090987678',1,'2023-04-18 20:05:04','2023-04-18 20:05:04',0),(1024,'Front End',1010,',1,10,1010,1024,',1,'李老师','15090987678',1,'2023-04-18 20:05:49','2023-04-18 20:05:49',0),(1025,'Customer Service',1020,',1,10,1020,1025,',1,'李老师','15090987678',1,'2023-04-18 20:05:49','2023-04-18 20:05:49',0),(1026,'Avdertising',1020,',1,10,1020,1026,',1,'30.607366','15090987678',1,'2023-04-18 20:05:49','2023-04-18 20:05:49',0),(1027,'Offline Oper',1020,',1,10,1020,1027,',1,'李老师','15090987678',1,'2023-04-18 20:05:49','2023-04-18 20:05:49',0),(1028,'Design',1020,',1,10,1020,1028,',1,'李老师','15090987678',1,'2023-04-18 20:05:04','2023-04-18 20:05:04',0),(2012,'Edu Dept1',20,',1,20,2012,',1,'王老师','18909890765',1,'2023-04-18 20:05:04','2023-04-18 20:05:04',0),(2013,'Edu Dept2',30,',1,30,2013,',1,'李老师','18567867895',1,'2023-04-18 20:05:04','2023-04-18 20:05:04',0),(2016,'Java Advanced',2012,',1,20,2012,2012,',1,'张老师','15090909909',1,'2023-04-18 20:05:04','2023-04-18 20:05:04',0),(2017,'Computer Science',2012,',1,20,2012,2012,',1,'李老师','15090980989',1,'2023-04-18 20:05:04','2023-04-18 20:05:04',0);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_login_log`
--

DROP TABLE IF EXISTS `sys_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `username` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `status` tinyint(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示信息',
  `access_time` datetime DEFAULT NULL COMMENT '访问时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1648409352536236034 DEFAULT CHARSET=utf8mb3 COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_login_log`
--

LOCK TABLES `sys_login_log` WRITE;
/*!40000 ALTER TABLE `sys_login_log` DISABLE KEYS */;
INSERT INTO `sys_login_log` VALUES (1648203915945799681,'admin','127.0.0.1',1,'Login Successful',NULL,'2023-04-18 05:56:50',NULL,0),(1648203930852356098,'admin','127.0.0.1',1,'Login Successful',NULL,'2023-04-18 05:56:53',NULL,0),(1648384041144721410,'admin','127.0.0.1',1,'Login Successful',NULL,'2023-04-18 17:52:35',NULL,0),(1648384394443530242,'admin','127.0.0.1',1,'Login Successful',NULL,'2023-04-18 17:53:59',NULL,0),(1648388911142707201,'admin','127.0.0.1',1,'Login Successful',NULL,'2023-04-18 18:11:56',NULL,0),(1648391358854635522,'admin','127.0.0.1',1,'Login Successful',NULL,'2023-04-18 18:21:40',NULL,0),(1648393729034854402,'admin','127.0.0.1',1,'Login Successful',NULL,'2023-04-18 18:31:05',NULL,0),(1648404560866848769,'admin','127.0.0.1',1,'Login Successful',NULL,'2023-04-18 19:14:07',NULL,0),(1648406364178493442,'admin','127.0.0.1',1,'Login Successful',NULL,'2023-04-18 19:21:17',NULL,0),(1648407722096996353,'Yongze','127.0.0.1',1,'Login Successful',NULL,'2023-04-18 19:26:41',NULL,0),(1648407792334811138,'admin','127.0.0.1',1,'Login Successful',NULL,'2023-04-18 19:26:58',NULL,0),(1648408560366465026,'Yongze1','127.0.0.1',1,'Login Successful',NULL,'2023-04-18 19:30:01',NULL,0),(1648408577210789889,'Yongze1','127.0.0.1',1,'Login Successful',NULL,'2023-04-18 19:30:05',NULL,0),(1648408613453770753,'admin','127.0.0.1',1,'Login Successful',NULL,'2023-04-18 19:30:14',NULL,0),(1648408655384227842,'admin','127.0.0.1',1,'Login Successful',NULL,'2023-04-18 19:30:24',NULL,0),(1648408771079909378,'Yongze1','127.0.0.1',1,'Login Successful',NULL,'2023-04-18 19:30:51',NULL,0),(1648409352536236033,'Yongze1','127.0.0.1',1,'Login Successful',NULL,'2023-04-18 19:33:10',NULL,0);
/*!40000 ALTER TABLE `sys_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '所属上级',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '类型(0:目录,1:菜单,2:按钮)',
  `path` varchar(100) DEFAULT NULL COMMENT '路由地址',
  `component` varchar(100) DEFAULT NULL COMMENT '组件路径',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `sort_value` int DEFAULT NULL COMMENT '排序',
  `status` tinyint DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (2,0,'System Management',0,'system','Layout',NULL,'el-icon-s-tools',1,1,'2021-05-31 22:05:37','2023-04-16 05:32:32',0),(3,2,'User Management',1,'sysUser','system/sysUser/list','','el-icon-s-custom',1,1,'2021-05-31 22:05:37','2023-04-16 05:33:00',0),(4,2,'Role Management',1,'sysRole','system/sysRole/list','','el-icon-user-solid',2,1,'2021-05-31 22:05:37','2023-04-16 05:33:08',0),(5,2,'Menu Management',1,'sysMenu','system/sysMenu/list','','el-icon-s-unfold',3,1,'2021-05-31 22:05:37','2023-04-16 05:33:16',0),(6,3,'Check',2,NULL,NULL,'bnt.sysUser.list',NULL,1,1,'2021-05-31 22:05:37','2023-04-16 05:34:14',0),(7,3,'Add',2,NULL,NULL,'bnt.sysUser.add',NULL,1,1,'2021-05-31 22:05:37','2023-04-16 05:34:19',0),(8,3,'Update',2,NULL,NULL,'bnt.sysUser.update',NULL,1,1,'2021-05-31 22:05:37','2023-04-16 05:35:07',0),(9,3,'Delete',2,NULL,NULL,'bnt.sysUser.remove',NULL,1,1,'2021-05-31 22:05:37','2023-04-16 05:35:07',0),(10,4,'Check',2,NULL,NULL,'bnt.sysRole.list',NULL,1,1,'2021-05-31 22:05:37','2023-04-16 05:35:07',0),(11,4,'Add',2,NULL,NULL,'bnt.sysRole.add',NULL,1,1,'2021-05-31 22:05:37','2023-04-16 05:35:07',0),(12,4,'Update',2,NULL,NULL,'bnt.sysRole.update',NULL,1,1,'2021-05-31 22:05:37','2023-04-16 05:35:07',0),(13,4,'Delete',2,NULL,NULL,'bnt.sysRole.remove',NULL,1,1,'2021-05-31 22:05:37','2023-04-16 05:35:07',0),(14,5,'Check',2,NULL,NULL,'bnt.sysMenu.list',NULL,1,1,'2021-05-31 22:05:37','2023-04-16 05:35:07',0),(15,5,'Add',2,NULL,NULL,'bnt.sysMenu.add',NULL,1,1,'2021-05-31 22:05:37','2023-04-16 05:35:07',0),(16,5,'Update',2,NULL,NULL,'bnt.sysMenu.update',NULL,1,1,'2021-05-31 22:05:37','2023-04-16 05:35:07',0),(17,5,'Delete',2,NULL,NULL,'bnt.sysMenu.remove',NULL,1,1,'2021-05-31 22:05:37','2023-04-16 05:35:07',0),(18,3,'Assign Role',2,NULL,NULL,'bnt.sysUser.assignRole',NULL,1,1,'2022-05-23 21:14:32','2023-04-17 05:37:20',0),(19,4,'Assign Authorities',2,'assignAuth','system/sysRole/assignAuth','bnt.sysRole.assignAuth',NULL,1,1,'2022-05-23 21:18:14','2023-04-17 05:37:20',0),(20,2,'Dept Management',1,'sysDept','system/sysDept/list','','el-icon-s-operation',4,1,'2022-05-24 14:07:05','2023-04-17 05:37:20',0),(21,20,'Check',2,NULL,NULL,'bnt.sysDept.list',NULL,1,1,'2022-05-24 14:07:44','2023-04-17 05:37:27',0),(22,2,'Position Management',1,'sysPost','system/sysPost/list','','el-icon-more-outline',5,1,'2022-05-24 14:25:30','2023-04-17 05:39:14',0),(23,22,'Check',2,NULL,NULL,'bnt.sysPost.list',NULL,1,1,'2022-05-24 14:25:45','2023-04-17 05:38:32',0),(24,20,'Add',2,NULL,NULL,'bnt.sysDept.add',NULL,1,1,'2022-05-25 19:31:27','2023-04-17 05:38:32',0),(25,20,'Update',2,NULL,NULL,'bnt.sysDept.update',NULL,1,1,'2022-05-25 19:31:41','2023-04-17 05:38:32',0),(26,20,'Delete',2,NULL,NULL,'bnt.sysDept.remove',NULL,1,1,'2022-05-25 19:31:59','2023-04-17 05:38:32',0),(27,22,'Add',2,NULL,NULL,'bnt.sysPost.add',NULL,1,1,'2022-05-25 19:32:44','2023-04-17 05:38:32',0),(28,22,'Update',2,NULL,NULL,'bnt.sysPost.update',NULL,1,1,'2022-05-25 19:32:58','2023-04-17 05:38:32',0),(29,22,'Delete',2,NULL,NULL,'bnt.sysPost.remove',NULL,1,1,'2022-05-25 19:33:11','2023-04-17 05:38:32',0),(30,34,'Oper Log',1,'sysOperLog','system/sysOperLog/list','','el-icon-document-remove',7,1,'2022-05-26 20:09:59','2023-04-17 05:38:32',0),(31,30,'Check',2,NULL,NULL,'bnt.sysOperLog.list',NULL,1,1,'2022-05-26 20:10:17','2023-04-17 05:38:32',0),(32,34,'Login Log',1,'sysLoginLog','system/sysLoginLog/list','','el-icon-s-goods',8,1,'2022-05-26 20:36:13','2023-04-17 05:38:32',0),(33,32,'Check Log',2,NULL,NULL,'bnt.sysLoginLog.list',NULL,1,1,'2022-05-26 20:36:31','2023-04-17 05:38:32',0),(34,2,'Log Management',0,'log','ParentView','','el-icon-tickets',6,1,'2022-05-31 17:23:07','2023-04-17 05:38:32',0);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` varchar(20) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` varchar(20) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1648411516528701442 DEFAULT CHARSET=utf8mb3 COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (1648200223993585665,'Role Management','INSERT','com.atguigu.system.controller.SysRoleController.saveRole()','POST','MANAGE','admin','','/admin/system/sysRole/save','127.0.0.1','{\"param\":{},\"roleCode\":\"logTest\",\"roleName\":\"logTest\",\"id\":\"1648200223871950850\"}','{\"code\":200,\"message\":\"Operation Successfully\"}',1,'',NULL,'2023-04-18 05:42:10',NULL,0),(1648405397001351170,'Role Management','INSERT','com.atguigu.system.controller.SysRoleController.saveRole()','POST','MANAGE','admin','','/admin/system/sysRole/save','127.0.0.1','{\"param\":{},\"roleCode\":\"测试\",\"roleName\":\"测试类\",\"id\":\"1648405396942630913\"}','{\"code\":200,\"message\":\"Operation Successfully\"}',1,'',NULL,'2023-04-18 19:17:27',NULL,0),(1648407034923200513,'Role Management','DELETE','com.atguigu.system.controller.SysRoleController.removeRole()','DELETE','MANAGE','admin','','/admin/system/sysRole/remove/1648405396942630913','127.0.0.1','','{\"code\":200,\"message\":\"Operation Successfully\"}',1,'',NULL,'2023-04-18 19:23:57',NULL,0),(1648407414717427713,'Role Management','ASSGIN','com.atguigu.system.controller.SysRoleController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRole/doAssign','127.0.0.1','{\"roleIdList\":[\"2\"],\"userId\":\"1648407375030923266\"}','{\"code\":200,\"message\":\"Operation Successfully\"}',1,'',NULL,'2023-04-18 19:25:28',NULL,0),(1648407673178828801,'Role Management','ASSGIN','com.atguigu.system.controller.SysRoleController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRole/doAssign','127.0.0.1','{\"roleIdList\":[\"8\"],\"userId\":\"1648407375030923266\"}','{\"code\":200,\"message\":\"Operation Successfully\"}',1,'',NULL,'2023-04-18 19:26:29',NULL,0),(1648408365968863234,'Role Management','ASSGIN','com.atguigu.system.controller.SysRoleController.doAssign()','POST','MANAGE','admin','','/admin/system/sysRole/doAssign','127.0.0.1','{\"roleIdList\":[\"8\"],\"userId\":\"1648407873930801153\"}','{\"code\":200,\"message\":\"Operation Successfully\"}',1,'',NULL,'2023-04-18 19:29:15',NULL,0),(1648411516528701441,'Role Management','UPDATE','com.atguigu.system.controller.SysRoleController.updateById()','POST','MANAGE','admin','','/admin/system/sysRole/update','127.0.0.1','{\"isDeleted\":0,\"createTime\":1654724344000,\"param\":{},\"roleCode\":\"User Admin\",\"roleName\":\"User Admin\",\"updateTime\":1654724344000,\"id\":\"8\"}','{\"code\":200,\"message\":\"Operation Successfully\"}',1,'',NULL,'2023-04-18 19:41:46',NULL,0);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '岗位名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（1正常 0停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (5,'dsz','Director','1',1,'2023-04-18 20:02:49','2023-04-18 20:02:49',0),(6,'zjl','Manager','2',1,'2023-04-18 20:02:55','2023-04-18 20:02:55',0),(7,'wz','Internet Tech','',1,'2023-04-18 20:02:30','2023-04-18 20:02:30',1),(8,'yyzj','Operation Manager','',1,'2023-04-18 20:02:30','2023-04-18 20:02:30',0);
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) DEFAULT NULL COMMENT '角色编码',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1648405396942630914 DEFAULT CHARSET=utf8mb3 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'System Admin','SYSTEM','system admin','2021-05-31 22:09:18','2023-04-18 19:59:57',0),(2,'Manager','COMMON','common admin','2021-06-01 12:38:40','2023-04-18 19:59:57',0),(8,'User Admin','User Admin',NULL,'2022-06-08 21:39:04','2022-06-08 21:39:04',0),(1646976630324445186,'guest','guest',NULL,'2023-04-14 20:40:02','2023-04-14 20:40:02',0),(1648164876685357058,'normalUser','normalUser',NULL,'2023-04-18 03:21:42','2023-04-18 03:21:42',0),(1648200223871950850,'logTest','logTest',NULL,'2023-04-18 05:42:10','2023-04-18 05:42:10',0),(1648405396942630913,'testClass','testClass','testClass','2023-04-18 19:17:27','2023-04-18 20:00:12',1);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL DEFAULT '0',
  `menu_id` bigint NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_menu_id` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1648408468997746691 DEFAULT CHARSET=utf8mb3 COMMENT='角色菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (1,2,2,'2022-06-02 20:11:27','2022-06-02 20:16:10',1),(2,2,3,'2022-06-02 20:11:27','2022-06-02 20:16:10',1),(3,2,6,'2022-06-02 20:11:27','2022-06-02 20:16:10',1),(4,2,7,'2022-06-02 20:11:27','2022-06-02 20:16:10',1),(5,2,8,'2022-06-02 20:11:27','2022-06-02 20:16:10',1),(6,2,9,'2022-06-02 20:11:27','2022-06-02 20:16:10',1),(7,2,18,'2022-06-02 20:11:27','2022-06-02 20:16:10',1),(8,2,4,'2022-06-02 20:11:27','2022-06-02 20:16:10',1),(9,2,10,'2022-06-02 20:11:27','2022-06-02 20:16:10',1),(10,2,11,'2022-06-02 20:11:27','2022-06-02 20:16:10',1),(11,2,12,'2022-06-02 20:11:27','2022-06-02 20:16:10',1),(12,2,13,'2022-06-02 20:11:27','2022-06-02 20:16:10',1),(13,2,19,'2022-06-02 20:11:27','2022-06-02 20:16:10',1),(14,2,5,'2022-06-02 20:11:27','2022-06-02 20:16:10',1),(15,2,14,'2022-06-02 20:11:27','2022-06-02 20:16:10',1),(16,2,15,'2022-06-02 20:11:27','2022-06-02 20:16:10',1),(17,2,16,'2022-06-02 20:11:27','2022-06-02 20:16:10',1),(18,2,17,'2022-06-02 20:11:27','2022-06-02 20:16:10',1),(19,2,2,'2022-06-02 20:16:10','2022-06-09 13:26:34',1),(20,2,3,'2022-06-02 20:16:10','2022-06-09 13:26:34',1),(21,2,6,'2022-06-02 20:16:10','2022-06-09 13:26:34',1),(22,2,7,'2022-06-02 20:16:10','2022-06-09 13:26:34',1),(23,2,8,'2022-06-02 20:16:10','2022-06-09 13:26:34',1),(24,2,2,'2022-06-09 13:26:34','2022-06-09 13:26:34',0),(25,2,3,'2022-06-09 13:26:34','2022-06-09 13:26:34',0),(26,2,6,'2022-06-09 13:26:34','2022-06-09 13:26:34',0),(27,2,7,'2022-06-09 13:26:34','2022-06-09 13:26:34',0),(28,2,8,'2022-06-09 13:26:34','2022-06-09 13:26:34',0),(29,2,5,'2022-06-09 13:26:34','2022-06-09 13:26:34',0),(30,2,14,'2022-06-09 13:26:34','2022-06-09 13:26:34',0),(31,2,20,'2022-06-09 13:26:34','2022-06-09 13:26:34',0),(32,2,21,'2022-06-09 13:26:34','2022-06-09 13:26:34',0),(1647458944468795393,1646976630324445186,2,'2023-04-16 04:36:35','2023-04-16 04:44:35',1),(1647458944498155522,1646976630324445186,3,'2023-04-16 04:36:35','2023-04-16 04:44:35',1),(1647458944510738433,1646976630324445186,6,'2023-04-16 04:36:35','2023-04-16 04:44:35',1),(1647458944514932738,1646976630324445186,7,'2023-04-16 04:36:35','2023-04-16 04:44:35',1),(1647458944527515650,1646976630324445186,8,'2023-04-16 04:36:35','2023-04-16 04:44:35',1),(1647458944535904258,1646976630324445186,9,'2023-04-16 04:36:35','2023-04-16 04:44:35',1),(1647458944540098561,1646976630324445186,18,'2023-04-16 04:36:35','2023-04-16 04:44:35',1),(1647458944552681474,1646976630324445186,4,'2023-04-16 04:36:35','2023-04-16 04:44:35',1),(1647458944561070082,1646976630324445186,10,'2023-04-16 04:36:35','2023-04-16 04:44:35',1),(1647458944565264386,1646976630324445186,11,'2023-04-16 04:36:35','2023-04-16 04:44:35',1),(1647458944565264387,1646976630324445186,12,'2023-04-16 04:36:35','2023-04-16 04:44:35',1),(1647458944573652993,1646976630324445186,13,'2023-04-16 04:36:35','2023-04-16 04:44:35',1),(1647458944577847297,1646976630324445186,19,'2023-04-16 04:36:35','2023-04-16 04:44:35',1),(1647460959412436994,1646976630324445186,2,'2023-04-16 04:44:35','2023-04-16 04:44:35',0),(1647460959429214210,1646976630324445186,3,'2023-04-16 04:44:35','2023-04-16 04:44:35',0),(1647460959433408513,1646976630324445186,6,'2023-04-16 04:44:35','2023-04-16 04:44:35',0),(1647460959441797121,1646976630324445186,8,'2023-04-16 04:44:35','2023-04-16 04:44:35',0),(1647460959445991426,1646976630324445186,9,'2023-04-16 04:44:35','2023-04-16 04:44:35',0),(1647460959454380034,1646976630324445186,18,'2023-04-16 04:44:35','2023-04-16 04:44:35',0),(1648407625233739778,8,2,'2023-04-18 19:26:18','2023-04-18 19:29:39',1),(1648407625237934081,8,3,'2023-04-18 19:26:18','2023-04-18 19:29:39',1),(1648407625246322689,8,6,'2023-04-18 19:26:18','2023-04-18 19:29:39',1),(1648407625250516993,8,7,'2023-04-18 19:26:18','2023-04-18 19:29:39',1),(1648407625250516994,8,8,'2023-04-18 19:26:18','2023-04-18 19:29:39',1),(1648408468985163777,8,2,'2023-04-18 19:29:39','2023-04-18 19:29:39',0),(1648408468989358081,8,3,'2023-04-18 19:29:39','2023-04-18 19:29:39',0),(1648408468997746690,8,6,'2023-04-18 19:29:39','2023-04-18 19:29:39',0);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机',
  `head_url` varchar(200) DEFAULT NULL COMMENT '头像地址',
  `dept_id` bigint DEFAULT NULL COMMENT '部门id',
  `post_id` bigint DEFAULT NULL COMMENT '岗位id',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` tinyint DEFAULT NULL COMMENT '状态（1：正常 0：停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1648408939221168130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','96e79218965eb72c92a549dd5a330112','admin','1234567896','http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc',1021,5,NULL,1,'2021-05-31 22:08:43','2022-05-25 15:34:25',0),(2,'wangqq','96e79218965eb72c92a549dd5a330112','Lily','15010546381','http://r61cnlsfq.hn-bkt.clouddn.com/b09b3467-3d99-437a-bd2e-dd8c9be92bb8',1022,6,NULL,1,'2022-02-08 15:35:38','2023-04-18 19:24:11',1),(3,'wanggang','96e79218965eb72c92a549dd5a330112','wong','18909098909',NULL,1024,5,NULL,1,'2022-05-24 15:05:40','2023-04-18 19:24:09',1),(1647461036461801473,'test123','96e79218965eb72c92a549dd5a330112','test123','test',NULL,NULL,NULL,NULL,1,'2023-04-16 04:44:54','2023-04-16 05:07:11',1),(1647464725935177730,'test111','123456','test111','test111',NULL,NULL,NULL,NULL,1,'2023-04-16 04:59:33','2023-04-18 19:24:04',1),(1647466608481419265,'test','96e79218965eb72c92a549dd5a330112','test','test',NULL,NULL,NULL,NULL,1,'2023-04-16 05:07:02','2023-04-18 19:24:03',1),(1648407375030923266,'Yongze','93439ca3f7106a76f4409b47d90b5621','Yongze','99999999',NULL,NULL,NULL,NULL,1,'2023-04-18 19:25:18','2023-04-18 19:26:50',1),(1648407873930801153,'Yongze1','93439ca3f7106a76f4409b47d90b5621','Yongze','999999',NULL,NULL,NULL,NULL,1,'2023-04-18 19:27:17','2023-04-18 19:27:17',0),(1648408939221168129,'test1','96e79218965eb72c92a549dd5a330112','test','1554236',NULL,NULL,NULL,NULL,1,'2023-04-18 19:31:31','2023-04-18 19:31:31',0);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint NOT NULL DEFAULT '0' COMMENT '角色id',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_admin_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1648408365868199938 DEFAULT CHARSET=utf8mb3 COMMENT='用户角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (2,2,2,'2022-01-21 01:49:37','2022-02-24 15:43:07',0),(3,1,1,'2022-05-19 14:37:27','2022-05-24 20:55:53',1),(4,2,1,'2022-05-19 14:37:27','2022-05-24 20:55:53',1),(5,1,1,'2022-05-24 20:55:53','2022-05-24 20:55:53',0),(6,2,3,'2022-05-25 20:09:31','2022-05-25 20:09:31',0),(7,2,4,'2022-06-02 15:08:14','2022-06-02 15:15:36',1),(8,2,4,'2022-06-02 15:15:36','2022-06-02 20:10:53',1),(9,1,4,'2022-06-02 15:15:36','2022-06-02 20:10:53',1),(10,1,4,'2022-06-02 20:10:53','2022-06-02 20:10:53',0),(1647461066920837121,1646976630324445186,1647461036461801473,'2023-04-16 04:45:01','2023-04-16 04:45:01',0),(1647467191665836034,1646976630324445186,1647466608481419265,'2023-04-16 05:09:21','2023-04-16 05:09:21',0),(1648407414696456194,2,1648407375030923266,'2023-04-18 19:25:28','2023-04-18 19:26:29',1),(1648407673170440194,8,1648407375030923266,'2023-04-18 19:26:29','2023-04-18 19:26:29',0),(1648408365868199937,8,1648407873930801153,'2023-04-18 19:29:15','2023-04-18 19:29:15',0);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-18 16:09:58
