CREATE DATABASE IF NOT EXISTS `user_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `user_db`;
DROP TABLE IF EXISTS `user_form`;
CREATE TABLE `user_form` (

  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;