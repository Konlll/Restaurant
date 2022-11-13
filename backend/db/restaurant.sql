/*
Navicat MariaDB Data Transfer

Source Server         : dev
Source Server Version : 101100
Source Host           : localhost:3306
Source Database       : restaurant

Target Server Type    : MariaDB
Target Server Version : 101100
File Encoding         : 65001

Date: 2022-11-14 12:17:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for drinks
-- ----------------------------
DROP TABLE IF EXISTS `drinks`;
CREATE TABLE `drinks` (
  `drinkID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_hungarian_ci NOT NULL,
  `price` smallint(6) NOT NULL,
  `imagePath` varchar(255) COLLATE utf8mb3_hungarian_ci NOT NULL,
  PRIMARY KEY (`drinkID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

-- ----------------------------
-- Records of drinks
-- ----------------------------
INSERT INTO `drinks` VALUES ('1', 'Kóla', '200', 'gulyas.jpg');
INSERT INTO `drinks` VALUES ('2', 'Víz', '140', 'gulyas.jpg');

-- ----------------------------
-- Table structure for meals
-- ----------------------------
DROP TABLE IF EXISTS `meals`;
CREATE TABLE `meals` (
  `mealID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_hungarian_ci NOT NULL,
  `price` smallint(6) NOT NULL,
  `allergens` varchar(255) COLLATE utf8mb3_hungarian_ci DEFAULT '',
  `mealType` enum('Leves','Főétel','Desszert') COLLATE utf8mb3_hungarian_ci DEFAULT NULL,
  `imagePath` varchar(255) COLLATE utf8mb3_hungarian_ci NOT NULL,
  `availability` varchar(12) COLLATE utf8mb3_hungarian_ci DEFAULT NULL,
  PRIMARY KEY (`mealID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

-- ----------------------------
-- Records of meals
-- ----------------------------
INSERT INTO `meals` VALUES ('1', 'Gulyás leves', '500', 'alma körte répa', 'Leves', 'http://localhost:7777/images/gulyas.jpg', '10:00-16:00');
INSERT INTO `meals` VALUES ('4', 'Húsleves', '1000', '', 'Leves', 'http://localhost:7777/images/husleves.jpg', '9:00-14:00');
INSERT INTO `meals` VALUES ('5', 'Céklaleves', '850', '', 'Leves', 'http://localhost:7777/images/ceklaleves.jpg', '10:00-24:00');
INSERT INTO `meals` VALUES ('6', 'Gombaleves', '950', 'tejszín', 'Leves', 'http://localhost:7777/images/gombaleves.jpg', '8:30-23:00');
INSERT INTO `meals` VALUES ('7', 'Zöldségleves', '870', '', 'Leves', 'http://localhost:7777/images/zoldsegleves.jpg', '10:00-16:00');
INSERT INTO `meals` VALUES ('8', 'Tejszínes garnélaleves', '1000', 'tejszín, garnéla', 'Leves', 'http://localhost:7777/images/tejszinesgarnela.jpg', '10:00-15:30');
INSERT INTO `meals` VALUES ('9', 'Bolognai spagetti', '1350', 'paradicsom, tojás', 'Főétel', 'http://localhost:7777/images/bolognai.jpg', '10:00-17:00');
INSERT INTO `meals` VALUES ('10', 'Sonkás pizza', '1400', 'paradicsom', 'Főétel', 'http://localhost:7777/images/sonkaspizza.jpg', '8:30-24:00');
INSERT INTO `meals` VALUES ('11', 'Steak sült burgonyával', '2000', '', 'Főétel', 'http://localhost:7777/images/steakkrumplival.jpg', '12:00-14:00');
INSERT INTO `meals` VALUES ('12', 'Tükörtojás', '1240', 'tojás', 'Főétel', 'http://localhost:7777/images/tukortojas.jpg', '7:30-12:00');
INSERT INTO `meals` VALUES ('13', 'Marhapörkölt', '1400', '', 'Főétel', 'http://localhost:7777/images/marhaporkolt.jpg', '11:00-15:00');
INSERT INTO `meals` VALUES ('14', 'Hamburger', '1350', '', 'Főétel', 'http://localhost:7777/images/hamburger.jpg', '8:30-24:00');
INSERT INTO `meals` VALUES ('15', 'Fagyikehely', '250', 'tej', 'Desszert', 'http://localhost:7777/images/fagyi.jpg', '7:30-24:00');
INSERT INTO `meals` VALUES ('16', 'Amerikai palacsinta', '400', '', 'Desszert', 'http://localhost:7777/images/amerikaipalacsinta.jpg', '7:30-24:00');
INSERT INTO `meals` VALUES ('17', 'Csokis keksz', '150', 'tej', 'Desszert', 'http://localhost:7777/images/csokiskeksz.jpg', '7:30-24:00');
INSERT INTO `meals` VALUES ('18', 'Csokiszelet', '200', 'tej', 'Desszert', 'http://localhost:7777/images/csokiszelet.jpg', '7:30-24:00');
INSERT INTO `meals` VALUES ('19', 'Epres sajttorta', '250', 'tej', 'Desszert', 'http://localhost:7777/images/epressajttorta.jpg', '7:30-24:00');
SET FOREIGN_KEY_CHECKS=1;
