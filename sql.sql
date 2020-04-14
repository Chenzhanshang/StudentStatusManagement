/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.5.40 : Database - stumanage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`stumanage` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `stumanage`;

/*Table structure for table `tb_academy` */

DROP TABLE IF EXISTS `tb_academy`;

CREATE TABLE `tb_academy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `academy` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tb_academy` */

insert  into `tb_academy`(`id`,`academy`) values (1,'南宁学院'),(2,'河池学院');

/*Table structure for table `tb_admin` */

DROP TABLE IF EXISTS `tb_admin`;

CREATE TABLE `tb_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(24) DEFAULT NULL,
  `pass_word` varchar(24) DEFAULT NULL,
  `user_name` varchar(48) DEFAULT NULL,
  `phone` varchar(24) DEFAULT NULL,
  `created_time` date DEFAULT NULL,
  `modified_by` varchar(48) DEFAULT NULL,
  `modified_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tb_admin` */

insert  into `tb_admin`(`id`,`nick_name`,`pass_word`,`user_name`,`phone`,`created_time`,`modified_by`,`modified_time`) values (1,'czs','123456','admin','1887712',NULL,NULL,NULL);

/*Table structure for table `tb_student_course` */

DROP TABLE IF EXISTS `tb_student_course`;

CREATE TABLE `tb_student_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL,
  `course_name` varchar(48) DEFAULT NULL,
  `teacher` varchar(48) DEFAULT NULL,
  `created_by` varchar(48) DEFAULT NULL,
  `modified_by` varchar(48) DEFAULT NULL,
  `grade` varchar(24) DEFAULT NULL,
  `analyze` varchar(48) DEFAULT NULL,
  `created_time` date DEFAULT NULL,
  `modified_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tb_student_course` */

insert  into `tb_student_course`(`id`,`stu_id`,`course_name`,`teacher`,`created_by`,`modified_by`,`grade`,`analyze`,`created_time`,`modified_time`) values (2,1,'高等数学','教师1号','czs','czs','80','良好',NULL,NULL);

/*Table structure for table `tb_student_info` */

DROP TABLE IF EXISTS `tb_student_info`;

CREATE TABLE `tb_student_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(48) DEFAULT NULL,
  `sex` varchar(12) DEFAULT NULL,
  `card_id` varchar(24) DEFAULT NULL,
  `nation` varchar(48) DEFAULT NULL,
  `native_place` varchar(48) DEFAULT NULL,
  `birth_place` varchar(48) DEFAULT NULL,
  `politics_status` varchar(48) DEFAULT NULL,
  `wedding_status` varchar(24) DEFAULT NULL,
  `school_status` varchar(48) DEFAULT NULL,
  `school_time` date DEFAULT NULL,
  `modified_time` date DEFAULT NULL,
  `created_time` date DEFAULT NULL,
  `created_by` varchar(48) DEFAULT NULL,
  `modified_by` varchar(48) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tb_student_info` */

insert  into `tb_student_info`(`id`,`stu_name`,`sex`,`card_id`,`nation`,`native_place`,`birth_place`,`politics_status`,`wedding_status`,`school_status`,`school_time`,`modified_time`,`created_time`,`created_by`,`modified_by`) values (4,'张三','男','1111111111','汉族','广西南宁','广西南宁','群众','未婚','已毕业','2020-03-02',NULL,NULL,'czs','czs'),(5,'李四','女','33333','壮族','广西','广西','团员','已婚','在读','2020-04-10',NULL,NULL,'czs','czs');

/*Table structure for table `tb_student_school` */

DROP TABLE IF EXISTS `tb_student_school`;

CREATE TABLE `tb_student_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` varchar(48) DEFAULT NULL,
  `stu_name` varchar(48) DEFAULT NULL,
  `card_id` varchar(48) DEFAULT NULL,
  `academy` varchar(48) DEFAULT NULL,
  `clazz` varchar(48) DEFAULT NULL,
  `experience` varchar(256) DEFAULT NULL,
  `created_by` varchar(48) DEFAULT NULL,
  `modified_by` varchar(48) DEFAULT NULL,
  `created_time` date DEFAULT NULL,
  `modified_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tb_student_school` */

insert  into `tb_student_school`(`id`,`stu_id`,`stu_name`,`card_id`,`academy`,`clazz`,`experience`,`created_by`,`modified_by`,`created_time`,`modified_time`) values (4,'001','张三','1111111111','南宁学院','计科二班',NULL,'czs','czs',NULL,NULL),(5,'002','李四','33333','南宁学院','通信一班',NULL,'czs','czs',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
