/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.5.36 : Database - book
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`book` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `book`;

/*Table structure for table `t_book` */

CREATE TABLE `t_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `sales` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `img_path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `t_book` */

insert  into `t_book`(`id`,`name`,`price`,`author`,`sales`,`stock`,`img_path`) values 
(1,'Think in java ',80.00,'Bruce Eckel',1034,100,'static/img/tij.jpg'),
(2,'数据结构与算法',78.50,'李春葆',2000,15,'static/img/sjjgysf.jpg'),
(3,'c++primer',68.00,'Stanley BLippman',100035,16,'static/img/cp.jpg'),
(4,'head first java',50.00,'KathySierra',1006,44,'static/img/hfj.jpg'),
(5,'java并发编程的艺术',59.00,'方腾飞',14,95,'static/img/bfbcdys.jpg'),
(8,'函数式编程思维',49.00,'Neal Ford',47,36,'static/img/hssbcsx.jpg'),
(10,'鸟哥的Linux私房菜',88.00,'鸟哥',52,62,'static/img/nlsfc.jpg'),
(11,'Spring MVC+Mybatis ',82.00,'朱爱光',52,74,'static/img/smcrmdxmsz.jpg'),
(12,'Spring 实战',40.00,'Craig walls',49,81,'static/img/ssz.jpg'),
(15,'Elasticsearch服务器开发',59.00,'Rafa. Ku. Marek Rogoziński',136,174,'static/img/fwqkf.jpg'),
(16,'Redis入门指南',79.00,'李子骅',22,80,'static/img/rmzn.jpg'),
(19,'大话设计模式',89.00,'程杰',29,1,'static/img/dhsjms.jpg'),
(23,'深入理解Java虚拟机',45.00,'周志明',24,8917,'static/img/srljxnj.jpg'),
(24,'TCPIP详解',45.00,'KevinR.Fall，W.RichardStevens',150,15,'static/img/tcpip.jpg');

/*Table structure for table `t_order` */

CREATE TABLE `t_order` (
  `order_id` varchar(50) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_order` */

insert  into `t_order`(`order_id`,`create_time`,`price`,`status`,`user_id`) values 
('16099097219621','2021-01-06 05:08:41',340.00,2,1),
('16099224036781','2021-01-06 08:40:03',715.75,2,1),
('16100026531139','2021-01-07 06:57:33',178.00,1,9);

/*Table structure for table `t_order_item` */

CREATE TABLE `t_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `total_price` decimal(11,2) DEFAULT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `t_order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `t_order_item` */

insert  into `t_order_item`(`id`,`name`,`count`,`price`,`total_price`,`order_id`) values 
(31,'c++primer',5,68.00,340.00,'16099097219621'),
(32,'大话设计模式',5,89.15,445.75,'16099224036781'),
(33,'数据结构与算法',6,45.00,270.00,'16099224036781'),
(34,'Redis入门指南',1,79.00,79.00,'16100026531139'),
(35,'Elasticsearch服务器开发',1,59.00,59.00,'16100026531139'),
(36,'Spring 实战',1,40.00,40.00,'16100026531139'),
(37,'1321',132,12313.00,13123.00,NULL);

/*Table structure for table `t_user` */

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`username`,`password`,`email`) values 
(1,'admin','wlby0208','1467059722@qq.com'),
(4,'wlby0208','wlby0208','1467059722@qq.com'),
(8,'jnnzhuzhu','123456','1467059722@qq.com'),
(9,'123456','123456','1467059722@qq.com'),
(10,'123456777','123456','1467059722@qq.com'),
(11,'lllllllll','123456','1467059722@qq.com'),
(12,'12345688','123456','1467059722@qq.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
