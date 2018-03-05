
--  CREATE TABLE `user` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `userName` varchar(100) NOT NULL,
--   `corp` varchar(100) DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
--
-- CREATE TABLE `teacher` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `teacherName` varchar(100) DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
--
-- CREATE TABLE `course` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `courseName` varchar(100) DEFAULT NULL,
--   `teacher_id` int(11) DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- CREATE TABLE `UserCourse` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `user_id` int(11) DEFAULT NULL,
--   `course_id` int(11) DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--用户表
 CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
   `passWord` varchar(100) NOT NULL,
  `userType` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `img` varchar(300) DEFAULT NULL,
  `summary` varchar(520) NOT NULL,
   `body` varchar(3000) NOT NULL,
  `mark` int(11) DEFAULT 0,
   `currentPrice` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `shopcar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
   `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
   `buyPrice` FLOAT(11) NOT NULL,
   `buyDate` TIMESTAMP ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into user(userName,passWord) values('buyer','reyub');
insert into user(userName,passWord,userType) values('seller','relles',1);