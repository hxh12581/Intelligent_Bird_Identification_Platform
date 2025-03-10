/*
 Navicat Premium Data Transfer

 Source Server         : hexiaohui
 Source Server Type    : MySQL
 Source Server Version : 80029 (8.0.29)
 Source Host           : localhost:3306
 Source Schema         : db_bird

 Target Server Type    : MySQL
 Target Server Version : 80029 (8.0.29)
 File Encoding         : 65001

 Date: 10/03/2025 20:44:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 观察数据', 7, 'add_observation');
INSERT INTO `auth_permission` VALUES (26, 'Can change 观察数据', 7, 'change_observation');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 观察数据', 7, 'delete_observation');
INSERT INTO `auth_permission` VALUES (28, 'Can view 观察数据', 7, 'view_observation');
INSERT INTO `auth_permission` VALUES (29, 'Can add 鸟类数据', 8, 'add_bird');
INSERT INTO `auth_permission` VALUES (30, 'Can change 鸟类数据', 8, 'change_bird');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 鸟类数据', 8, 'delete_bird');
INSERT INTO `auth_permission` VALUES (32, 'Can view 鸟类数据', 8, 'view_bird');
INSERT INTO `auth_permission` VALUES (33, 'Can add 用户数据', 9, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (34, 'Can change 用户数据', 9, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 用户数据', 9, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (36, 'Can view 用户数据', 9, 'view_userinfo');
INSERT INTO `auth_permission` VALUES (37, 'Can add 媒体数据', 10, 'add_mediasocial');
INSERT INTO `auth_permission` VALUES (38, 'Can change 媒体数据', 10, 'change_mediasocial');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 媒体数据', 10, 'delete_mediasocial');
INSERT INTO `auth_permission` VALUES (40, 'Can view 媒体数据', 10, 'view_mediasocial');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$600000$FQIMmDA7CbEmLCqwpCc315$BZTUDGBddsaIZw713pUVylVNEzoABGElGF5ijiK67H8=', '2025-01-20 09:02:46.805007', 1, 'admin', '', '', '', 1, 1, '2024-05-16 07:03:17.183269');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$260000$n9sjMznAyOJI6zL8KAYN5l$5lIJT12qzaL2Znh/G2zOP/BPej/ylqPma0TqdWexhsQ=', '2024-05-21 04:07:28.587341', 1, 'test', '', '', '', 1, 1, '2024-05-21 03:49:56.177339');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for birds_bird
-- ----------------------------
DROP TABLE IF EXISTS `birds_bird`;
CREATE TABLE `birds_bird`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `family` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `genus` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `size` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `plumage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `habitat` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `distribution` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `iucn_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `love_number` int NOT NULL,
  `observations_number` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of birds_bird
-- ----------------------------
INSERT INTO `birds_bird` VALUES (1, 'img/birds/BALDEAGLE.jpg', '秃鹰', '鹰形目', '鹰科', '美洲鹫科加州神鹫属', '成年秃鹰体长通常在71-96厘米之间，翼展在1.5到1.8米之间，重量在3到6.8公斤之间。', '秃鹰的羽毛颜色以棕色为主，头部和尾部的羽毛为白色。幼鸟的头部和尾部也是棕色的，随着年龄的增长，它们会逐渐变成成鸟的白色羽毛。', '秃鹰栖息于多种环境，包括森林、河流、湖泊和海岸线附近，它们通常在水体附近筑巢，因为这些地方有丰富的食物来源。', '秃鹰主要分布在北美洲，从阿拉斯加到加拿大，再到美国，甚至延伸到墨西哥北部。', '无危', 0, 0, '2024-05-22');
INSERT INTO `birds_bird` VALUES (2, 'img/birds/ALBATROSS.jpg', '信天翁', '鹱形目', '信天翁科', '信天翁属', '信天翁的大小差异较大，翼展可以从最小的约2米到最大的超过3米', '信天翁的羽毛通常是白色或灰色，翅膀的尖端可能是黑色或深色，有些种类的头部有鲜明的颜色。', '信天翁主要栖息在海洋上，它们在海上飞行和觅食，但会回到陆地上繁殖', '信天翁广泛分布于全球的大洋中，尤其是南半球的海域，如南太平洋和南大西洋', '易危', 0, 0, '2024-05-03');
INSERT INTO `birds_bird` VALUES (3, 'img/birds/AMERICANFLAMINGO.jpg', '美洲红鹮', '鹳形目', '红鹮科', '美洲鹮属', '美洲红鹮是一种大型鸟类，平均身高约为1.1到1.5米，翼展约为1.3到1.5米', '美洲红鹮最显著的特征是其粉红色的羽毛，这种颜色来源于它们食用的富含虾青素的食物，如虾和藻类。它们的喙是弯曲的，颜色为黑色，腿也是黑色的', '美洲红鹮通常栖息在温暖的沿海湿地、河口、泻湖和沿海沼泽地，它们需要浅水区域来寻找食物', '美洲红鹮的地理分布范围从墨西哥南部经过中美洲和加勒比地区一直延伸到南美洲的北部', '近危', 0, 0, '2024-05-03');
INSERT INTO `birds_bird` VALUES (4, 'img/birds/AZUREJAY.jpg', '蔚蓝松鸦', '雀形目', '鸦科', '松鸦属', '蔚蓝松鸦的体型中等，长度大约在20到23厘米之间', '这种鸟类以其鲜艳的蓝色羽毛而著名，同时它们的头部和颈部带有闪亮的蓝色，背部和翅膀则呈深蓝色，下体是白色或淡蓝色', '蔚蓝松鸦主要栖息在中美洲的山地森林中，特别是云雾森林和橡树森林', '蔚蓝松鸦的地理分布范围主要在墨西哥南部到中美洲，包括危地马拉和哥斯达黎加', '无危', 0, 0, '2024-05-03');
INSERT INTO `birds_bird` VALUES (5, 'img/birds/IVORYBILLEDARACARI.jpg', '象牙嘴噪鹃', '鴷形目', '啄木鸟科', '噪鹃属', '象牙嘴噪鹃是一种大型啄木鸟，体长可达46到53厘米，翼展大约为64到76厘米', '象牙嘴噪鹃的羽毛颜色对比鲜明，雄性的头部呈鲜红色，背部主要是黑色带有白色斑点，而雌性的头部颜色较淡，通常为灰色或灰白色', '象牙嘴噪鹃主要栖息在古老的森林中，特别是有大型橡树和松树的地区', '象牙嘴噪鹃的地理分布范围历史上覆盖了从佛罗里达州到得克萨斯州的东南部美国，以及古巴和一些墨西哥地区', '极度濒危', 0, 0, '2024-05-03');
INSERT INTO `birds_bird` VALUES (6, 'img/birds/JANDAYAPARAKEET.jpg', '珍妮鹦鹉', '鹦形目', '鹦鹉科', '鹦鹉科属', '珍妮鹦鹉是一种中等体型的鹦鹉，体长大约在30到35厘米之间', '珍妮鹦鹉的羽毛颜色非常鲜艳，通常以绿色为主，头部和颈部有蓝色或黄色的斑点，翅膀上有红色或橙色的斑块', '珍妮鹦鹉主要栖息在开阔的森林、林地和稀树草原中，它们喜欢在树木繁茂的地区活动', '珍妮鹦鹉的地理分布范围主要在南美洲的巴西东北部', '无危', 0, 0, '2024-05-03');
INSERT INTO `birds_bird` VALUES (7, 'img/birds/LAZULI BUNTING.jpg', '蓝宝石鹀', '雀形目', '鹀科', '鹀属', '蓝宝石鹀体型较小，体长约为15-18厘米', '雄性蓝宝石鹀以其鲜艳的蓝色羽毛而著名，特别是在头部和背部。它们的胸部通常是栗色，而雌性和幼鸟的颜色较为柔和，以棕色和灰色为主', '蓝宝石鹀栖息在开阔的林地、灌木丛和草原中，它们喜欢有丰富灌丛和草本植物的环境', '蓝宝石鹀的地理分布范围主要在北美洲的西部，从加拿大的南部到美国西部的各州，以及墨西哥的部分地区', '无危', 0, 0, '2024-05-03');
INSERT INTO `birds_bird` VALUES (8, 'img/birds/MILITARYMACAW.jpg', '军鹦鹉', '鹦形目', '鹦鹉科', '金刚鹦鹉属', '军鹦鹉是一种体型较大的鹦鹉，体长通常在70到85厘米之间，翼展可以达到1米', '军鹦鹉以其鲜艳的羽毛而著名，通常为绿色，头部和颈部有黄色或橙色的带状羽毛，翅膀和尾部有蓝色的羽毛', '军鹦鹉栖息在热带雨林、稀树草原和开阔的森林中，它们喜欢树木繁茂的环境', '主要在南美洲的北部，包括亚马逊盆地的部分地区，以及中美洲的一些地区', '易危', 0, 0, '2024-05-05');
INSERT INTO `birds_bird` VALUES (9, 'img/birds/PEACOCK.jpg', '孔雀', '鸡形目', '雉科', '孔雀属', '孔雀是一种体型较大的鸟类，雄性孔雀（孔雀）体长可达约180-210厘米，雌性孔雀（珠鸡）体长则相对较小', '雄性孔雀以其华丽的羽毛而著名，特别是其尾羽，可以展开成巨大的扇形，上面带有眼状的图案。雌性的羽毛通常是棕色或灰色，带有杂色条纹', '孔雀自然栖息在草原和森林边缘，它们喜欢开阔的林地和灌木丛', '孔雀的地理分布范围原产于南亚和东南亚，尤其是印度次大陆，但由于人工饲养，它们在世界其他地区也有分布', '无危', 1, -1, '2024-05-05');
INSERT INTO `birds_bird` VALUES (10, 'img/birds/PINKROBIN.jpg', '粉红鸫', '雀形目', '鸫科', '鸫属', '粉红鸫的体型描述需要具体数据，但一般来说，鸫科鸟类体型从中等到小型', '粉红鸫的羽毛颜色可能包括粉红色，这通常是雄性的特征，而雌性和幼鸟的颜色可能更为朴素', '粉红鸫的栖息地可能包括森林、灌木丛和其他树木繁茂的地区，它们倾向于在树木或灌丛中活动', '粉红鸫的地理分布范围可能局限于特定的地理区域，这取决于具体的物种。一些种类可能分布在非洲，而其他种类可能分布在亚洲', '无危', 0, 0, '2024-05-05');
INSERT INTO `birds_bird` VALUES (11, 'img/birds/REDBEARDEDBEEEATER.jpg', '红胡蜂虎', '佛法僧目', '蜂虎科', '蜂虎属', '红胡蜂虎体型中等，体长大约在30厘米左右', '雄性红胡蜂虎以其鲜艳的红色胡须状羽毛和绿色的身体而著名。雌性和幼鸟的颜色较为柔和，通常以绿色和棕色为主', '红胡蜂虎栖息在开阔的森林和林地，特别是靠近水源的地方，因为它们主要捕食空中的昆虫，如蜜蜂和蝴蝶', '红胡蜂虎的地理分布范围主要在非洲的中部和南部地区', '无危', 0, 0, '2024-05-05');
INSERT INTO `birds_bird` VALUES (12, 'img/birds/YELLOWBREASTEDCHAT.jpg', '黄胸噪鹟', '雀形目', '拟鹂科', '噪鹟属', '黄胸噪鹟体型较大，体长通常在20-25厘米之间', '雄性黄胸噪鹟的胸部呈鲜艳的黄色，与黑色的头部和背部形成鲜明对比。雌性和幼鸟的颜色较为柔和，通常以棕色和灰色为主', '黄胸噪鹟栖息在森林边缘、灌木丛和湿地，它们喜欢密集的灌木和下层植被', '黄胸噪鹟的地理分布范围主要在北美洲的东部，从加拿大南部到美国东部各州，以及中美洲和南美洲的部分地区', '无危', 0, 0, '2024-05-05');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (8, 'birds', 'bird');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (10, 'media', 'mediasocial');
INSERT INTO `django_content_type` VALUES (7, 'observations', 'observation');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (9, 'user', 'userinfo');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-05-15 07:02:41.868461');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2024-05-15 07:02:42.122961');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2024-05-15 07:02:42.191005');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2024-05-15 07:02:42.197612');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2024-05-15 07:02:42.203048');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2024-05-15 07:02:42.245137');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2024-05-15 07:02:42.278640');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2024-05-15 07:02:42.313773');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2024-05-15 07:02:42.320173');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2024-05-15 07:02:42.349546');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2024-05-15 07:02:42.351547');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2024-05-15 07:02:42.358070');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2024-05-15 07:02:42.389112');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2024-05-15 07:02:42.421105');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2024-05-15 07:02:42.449455');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2024-05-15 07:02:42.455987');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2024-05-15 07:02:42.487652');
INSERT INTO `django_migrations` VALUES (18, 'birds', '0001_initial', '2024-05-15 07:02:42.505309');
INSERT INTO `django_migrations` VALUES (19, 'observations', '0001_initial', '2024-05-15 07:02:42.545338');
INSERT INTO `django_migrations` VALUES (20, 'sessions', '0001_initial', '2024-05-15 07:02:42.563393');
INSERT INTO `django_migrations` VALUES (21, 'user', '0001_initial', '2024-05-15 07:02:42.703361');
INSERT INTO `django_migrations` VALUES (22, 'media', '0001_initial', '2024-05-15 07:08:44.077537');
INSERT INTO `django_migrations` VALUES (23, 'media', '0002_auto_20240515_1639', '2024-05-15 08:39:54.138178');
INSERT INTO `django_migrations` VALUES (24, 'media', '0003_remove_mediasocial_user', '2024-05-15 08:47:11.507587');
INSERT INTO `django_migrations` VALUES (25, 'user', '0002_userinfo_media', '2024-05-15 08:47:11.575258');
INSERT INTO `django_migrations` VALUES (26, 'user', '0003_remove_userinfo_media', '2024-05-15 10:01:34.528739');
INSERT INTO `django_migrations` VALUES (27, 'media', '0004_mediasocial_user', '2024-05-15 10:01:34.563958');
INSERT INTO `django_migrations` VALUES (28, 'user', '0004_alter_userinfo_image', '2024-05-16 01:08:12.330788');
INSERT INTO `django_migrations` VALUES (29, 'user', '0005_alter_userinfo_sex', '2024-05-16 03:18:53.310182');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('b53onxqfgtc0290qsehq2tg29f62vpic', '.eJzFlctS6zAMhl-l43VvjpPYZsmeOStWhOnIl7SGXM7EDRum737spMOhJoHQMMPGaiVZ-qWvSV9Ra3WzMwrdYLZEO2iPh92bC2F04RMgn3XlA-oJqn29lnV1bIxY-5T1OWrXd7XSxe0596LAAezB3U4kBUqTmBEWRTynUnMOTKcx5QIDF4zzHBQAYZyIiGKgJI2AQIylc-rUFy111VpX6-E1QxWUOkM3iwzdmkbZDC3dR-PE9c4cmkUOK2kaWeg-WHqJ1ocv72dZyzXOnaGSCmfShG69IameULZtij62AVWaaiO8nO7c9Amg1P14joue80SjQcmmLcWAyClDnpaLnxrs9OjD2igfxdttFDpw2OxOKwPzKCTAI2fiPCGzKZReTn_aWhooxmF8TJ3IZMrIA0yuHTNEEIcOEjb7I9wD-AJHU1czHxDGpdecCJXPRlO_U_X-yzih0RsTQX1jDwO8rp09xJOGjiRsdu9kzuNEk4h5dRGhszn5t3d3mCqvx-Fcpk0kMmHSARLXThcunoUOOoRdQNwZiT39mMmuGesU0Jh87Gl9T3swulArKI7fgjU8QPu2phCO_3_tVz8K5n_KRCg_M_QX3D4bNMCCt0O1tIxHVPgidiXr_Scr2zd1-_eLnfU5v760SYOGK8PhT5ufHtHpH9zlGf8:1tZngl:5Feje7v6dvFTcDI3zu7S-4MecsT2z5UyaIz77Y7_D_U', '2025-02-03 09:03:19.365196');
INSERT INTO `django_session` VALUES ('d5owhq6yxu6aozd2c44pexxic29avzpe', '.eJzFlUtzozAMx79Kxuc8MMbY9Nh7Z089LZ2M_CDxLo8dHPbSyXdfGzLdxoWWhs70YiWSLP2lXyDPqLO63RuF7jBdoz10p-P-xYUwuvIJkL917QPqF9SHZiub-tQasfUp20vUbh8apcv7S-5VgSPYo7sdRziKeFoILKUiDIqUJzLLlKJURwoTxiOZxakiEEegYuASswIURARLkknqi1a67qyr9fM5RzVUOkd3qxzdm1bZHK3dR-PEDc4C2lUBG2laWeohWHmJ1oev7-d5l2lcOMMkE86klEXekFTPKNu15RDbgapMvRNeTn_uhgRQ6nE6x0UveaLVoGTbVWJE5Jwhz-vVVw12fvJhbZSPOnBx6MBhswetDCyjQCGLnUkKShZTqLyc4bSNNFBOw3ibOpPJnJFHmNw6ZoggCR0kbPZDuAfwL5xMUy98QHgmvWYqVLEYTfNK1esv04Qmb8wE9Yk9jPC6dfYQTxo6aNjs0clcxonRmHt1MWGLOfm3d3-Yumim4VynzSQyY9IRErdOFy6ehw42hl1A0huJPf2Ey74Z7xWwhLztaX1PezS6VBsoT5-CNT5A97KmEI7_fx1WPwnmf8pMKF8z9Afc3hs0wIKjsVpaJhMqfBG7kc3hnZUd2qb788HOhpxvX9qsQcOV4fCnnZ2f0PkfU_YaJw:1s7oF3:3u6k6PSQjVNHEmtSud6tuhBq0EdT_wDW_q8-G0ykNXE', '2024-05-31 03:26:45.850387');
INSERT INTO `django_session` VALUES ('g9gop8mtilts41apt3sf06x8kvdg2lk2', 'eyJ1c2VyX2lkIjoxOH0:1trcT4:lvLeYcK5kS0WV6_mjwSCKkBM7TKCEN5eYKHppM-hEJ4', '2025-03-24 12:42:50.599393');
INSERT INTO `django_session` VALUES ('hlt6bzckv19tsw9ueep8pmyn61ykuf6n', '.eJzFlUtv2zAMx79K4HMefkiW1WPvxU49zUVASXSizY_Bincp8t0n2cGWqHbrxgXmg5SQFMk_f368BnvoTsd9Z7DdaxU8BHGwvrYJkD-xdg71A-pDs5VNfWq12LqQ7cVrtk-NwvLxEnuT4AjmaE8nBBinaC8SxQkhFCHMFEHgEVcZZgXh9iIYh4oWLIt5IpkMkUrBRZim4JJWWHfG5vr-mgc1VJgHD6s8eNStMnmwtj-1bW4wFtCuCthI3coSB2flWjTOfXs-zzuOUWE3JpmwW0pZ6LYkxRlpu7YcfDtQla53wrXTr7shAJR6no6x3kucaBGUbLtKjDQ5R-R5vfoqYecX50atnDcKw9g3RH6xJ1QallGgwGO7kYImiylUrp1hNY3UUE7DeBs6k8kcySNM7pXpIyC-IfGLfRP2AfwNJ93UCx-QjEvXMxWqWIymuerq-s80ockTM0F9Yg4jvO7V7uNJfQP1iz3bNpdxYjTOXHdxwhZzcm_vftF10UzDuQ2bSWSG0hES96rzB5_5BjaGXQDpNxk5-iSTfbGs74CR5G1N42qao8ZSbaA8fQrWuIDu75h8OO77Oox-Esy_kJlQvkb0B9zeE-phicKxXCjJRBcuidnI5vDOyA5t0_36YGZDzH8f2iyh_sgi_9bm55fg_AekeBYM:1s9Gkr:3iQn1DRsxOsjw5ZadJ1sFjh9VZ_239BaSGtdOlnmEss', '2024-06-04 04:05:37.400057');
INSERT INTO `django_session` VALUES ('mhswigg9l7jujyoz6hjpsaxd1sokxkbh', 'eyJ1c2VyX2lkIjoxNX0:1sBq0P:ZJEaeAZNogWG0zSR_4xB9D50SaRm0ikQqKNZYIAMoA4', '2024-06-11 06:08:17.196573');
INSERT INTO `django_session` VALUES ('micxl0v1vuekikrdndz4n8e98jinv59b', 'eyJ1c2VyX2lkIjoxNX0:1sCwAh:-PJ5Tz6OV2mSW4uRmgdxcIPteIpKt_BomG4O8Ty7HbA', '2024-06-14 06:55:27.735180');
INSERT INTO `django_session` VALUES ('wo9o5sy0xuupj73v73jffofpj1bz61a1', '.eJzFlktzozAMx79KhnMePOwY99h7p6eelk5GtkXiXR4dHPbSyXdfGzLdxIWWhs6Ug51IsqS_fpDwGuygPR52rcFmp1VwF8TB8tImQP7ByjnUb6j29VrW1bHRYu1C1mevWT_UCov7c-xVggOYgz2dEGCcor1IFCeEUIQwVQSBR1ylmOaE24tgHCqaszTmiWQyRCoFF-F2Cy5piVVrbK5fr1lQQYlZcLfIgnvdKJMFS_tR2-Z6Yw7NIoeV1I0ssHeWrkXj3Nfns6zlGOV2Y5IJu20pC92WbHFC2rYpet8GVKmrjXDtdOumDwClnsZjrPccJxoEJZu2FANNThF5Wi6-S9jp2blRK-eNwjD2DZFf7AGVhnkUKPDYbiSnyWwKpWunX00tNRTjMN6HTmQyRfIAk1tl-giIb0j8Yo_CPoB_4ajrauYDknLpeqZC5bPR1BddXX4ZJzR6YiKoL8xhgNet2n08W99A_WJPts15nBiNU9ddnLDZnNyvd7foKq_H4VyHTSQyQekAiVvV-YNPfQMbwi6AdJuMHH2Syq5Y2nXASPK-pnE1zUFjoVZQHL8Ea1hA-zYmH477f-1HPwrmf8hEKN8j-hNuHwn1sEThUC6UZKQLl8SsZL3_YGT7pm5fPplZH_PjQ5sk1B9Z5N_a_PRsX53eXu8ievoH3gsaBw:1s9Nn1:aZV77XEg7WgccmwdyYf61D7PBjvdYkE5CWpi5wTVLB0', '2024-06-04 11:36:19.504203');

-- ----------------------------
-- Table structure for media_mediasocial
-- ----------------------------
DROP TABLE IF EXISTS `media_mediasocial`;
CREATE TABLE `media_mediasocial`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `media_text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `release_time` datetime(6) NOT NULL,
  `media_support` int NOT NULL,
  `media_dislike` int NOT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `media_mediasocial_user_id_553896f3_fk_user_userinfo_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `media_mediasocial_user_id_553896f3_fk_user_userinfo_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of media_mediasocial
-- ----------------------------
INSERT INTO `media_mediasocial` VALUES (42, 'hello!', '2025-01-20 09:02:28.812682', 0, 0, 18);

-- ----------------------------
-- Table structure for observations_observation
-- ----------------------------
DROP TABLE IF EXISTS `observations_observation`;
CREATE TABLE `observations_observation`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `additional_notes` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `observation_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tags` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bird_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `observations_observation_bird_id_52492afa_fk_birds_bird_id`(`bird_id` ASC) USING BTREE,
  CONSTRAINT `observations_observation_bird_id_52492afa_fk_birds_bird_id` FOREIGN KEY (`bird_id`) REFERENCES `birds_bird` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of observations_observation
-- ----------------------------
INSERT INTO `observations_observation` VALUES (15, '2025-03-10 12:43:40.209889', '无', '无', '无', 'img/upload_observation/4b0bff12-fdad-11ef-8032-44e517fec936.jpg', '', NULL);

-- ----------------------------
-- Table structure for user_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `user_userinfo`;
CREATE TABLE `user_userinfo`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resume` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_userinfo
-- ----------------------------
INSERT INTO `user_userinfo` VALUES (18, 'test', '35a3f7d03f891c71d1b62ed3e8e2bd85', NULL, NULL, NULL, NULL, NULL, NULL, 'img/avatar/default.png', '2025-01-20 07:36:37.976526');

-- ----------------------------
-- Table structure for user_userinfo_love
-- ----------------------------
DROP TABLE IF EXISTS `user_userinfo_love`;
CREATE TABLE `user_userinfo_love`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `observation_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_userinfo_love_userinfo_id_observation_id_afc890dd_uniq`(`userinfo_id` ASC, `observation_id` ASC) USING BTREE,
  INDEX `user_userinfo_love_observation_id_c690d969_fk_observati`(`observation_id` ASC) USING BTREE,
  CONSTRAINT `user_userinfo_love_observation_id_c690d969_fk_observati` FOREIGN KEY (`observation_id`) REFERENCES `observations_observation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_userinfo_love_userinfo_id_7c8faf81_fk_user_userinfo_user_id` FOREIGN KEY (`userinfo_id`) REFERENCES `user_userinfo` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_userinfo_love
-- ----------------------------

-- ----------------------------
-- Table structure for user_userinfo_observation
-- ----------------------------
DROP TABLE IF EXISTS `user_userinfo_observation`;
CREATE TABLE `user_userinfo_observation`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` int NOT NULL,
  `observation_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_userinfo_observatio_userinfo_id_observation__f0fc9418_uniq`(`userinfo_id` ASC, `observation_id` ASC) USING BTREE,
  INDEX `user_userinfo_observ_observation_id_16cff7bb_fk_observati`(`observation_id` ASC) USING BTREE,
  CONSTRAINT `user_userinfo_observ_observation_id_16cff7bb_fk_observati` FOREIGN KEY (`observation_id`) REFERENCES `observations_observation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_userinfo_observ_userinfo_id_3614ee72_fk_user_user` FOREIGN KEY (`userinfo_id`) REFERENCES `user_userinfo` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_userinfo_observation
-- ----------------------------
INSERT INTO `user_userinfo_observation` VALUES (15, 18, 15);

SET FOREIGN_KEY_CHECKS = 1;
