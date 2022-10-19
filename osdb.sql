/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : osdb

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 08/10/2022 00:22:58
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
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissions_group_id_b120cbf9`(`group_id`) USING BTREE,
  INDEX `auth_group_permissions_permission_id_84c5c92e`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = FIXED;

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
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  INDEX `auth_permission_content_type_id_2f476e4b`(`content_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_user_id_6a12ed8b`(`user_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544`(`group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permissions_user_id_a95ead1b`(`user_id`) USING BTREE,
  INDEX `auth_user_user_permissions_permission_id_1fbb5f2c`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜品分类id',
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：1正常 9删除',
  `create_at` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 6, '双拼套餐', 1, '2022-04-26 10:20:30', '2022-04-26 03:44:53');
INSERT INTO `category` VALUES (2, 6, '盖饭', 1, '2022-04-26 10:20:30', '2022-04-26 10:20:30');
INSERT INTO `category` VALUES (3, 6, '小菜', 1, '2022-04-26 10:20:30', '2022-04-26 10:20:30');
INSERT INTO `category` VALUES (4, 6, '汤/饮料', 9, '2022-04-26 10:20:30', '2022-04-26 04:40:19');
INSERT INTO `category` VALUES (5, 2, '双拼套餐', 9, '2022-04-26 10:20:30', '2022-04-27 04:52:17');
INSERT INTO `category` VALUES (6, 6, '盖饭', 1, '2022-04-26 10:20:30', '2022-04-26 10:20:30');
INSERT INTO `category` VALUES (7, 6, '小菜', 1, '2022-04-26 10:20:30', '2022-04-26 10:20:30');
INSERT INTO `category` VALUES (8, 6, '汤/饮料', 1, '2022-04-26 10:20:30', '2022-04-26 10:20:30');
INSERT INTO `category` VALUES (9, 6, '盖饭', 1, '2022-04-26 10:20:30', '2022-04-26 10:20:30');
INSERT INTO `category` VALUES (10, 6, '双拼套餐', 9, '2022-04-26 10:20:30', '2022-04-26 03:50:25');
INSERT INTO `category` VALUES (11, 6, '小炒', 1, '2022-04-26 10:20:30', '2022-04-26 10:20:30');
INSERT INTO `category` VALUES (12, 6, '红烧肉', 1, '2022-04-26 04:38:58', '2022-04-26 04:38:58');
INSERT INTO `category` VALUES (13, 6, '面条', 1, '2022-04-11 11:15:56', '2022-04-26 11:15:56');
INSERT INTO `category` VALUES (14, 6, '双拼套餐', 1, '2022-04-11 11:30:49', '2022-04-11 11:30:49');
INSERT INTO `category` VALUES (15, 2, '', 1, '2022-09-22 02:56:29', '2022-09-22 02:56:29');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `class_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `open_id` int NOT NULL,
  `student_id` int NOT NULL,
  `score` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`class_id`) USING BTREE,
  INDEX `open_id`(`open_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, 11, 19060813, 'I');
INSERT INTO `class` VALUES (2, 11, 19060814, 'B');
INSERT INTO `class` VALUES (3, 11, 21190214, 'B');
INSERT INTO `class` VALUES (4, 21, 19060814, 'D');
INSERT INTO `class` VALUES (5, 31, 19060814, 'C');
INSERT INTO `class` VALUES (6, 31, 21190214, 'A');

-- ----------------------------
-- Table structure for collegetable
-- ----------------------------
DROP TABLE IF EXISTS `collegetable`;
CREATE TABLE `collegetable`  (
  `college_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `college_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`college_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collegetable
-- ----------------------------
INSERT INTO `collegetable` VALUES ('CL01', '计算机科学与技术学院');
INSERT INTO `collegetable` VALUES ('CL02', '材料学院');
INSERT INTO `collegetable` VALUES ('CL03', '文学院');
INSERT INTO `collegetable` VALUES ('CL04', '物理学院');
INSERT INTO `collegetable` VALUES ('CL05', '环化学院');
INSERT INTO `collegetable` VALUES ('CL06', '电影学院');
INSERT INTO `collegetable` VALUES ('CL07', '音乐学院');
INSERT INTO `collegetable` VALUES ('CL08', '机自学院');
INSERT INTO `collegetable` VALUES ('CL09', '马克思主义学院');
INSERT INTO `collegetable` VALUES ('CL10', '美术学院');
INSERT INTO `collegetable` VALUES ('CL11', '经管学院');
INSERT INTO `collegetable` VALUES ('CL12', '通信学院');

-- ----------------------------
-- Table structure for couresetable
-- ----------------------------
DROP TABLE IF EXISTS `couresetable`;
CREATE TABLE `couresetable`  (
  `course_id` int NOT NULL,
  `course_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `credit` int NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of couresetable
-- ----------------------------
INSERT INTO `couresetable` VALUES (1, '数据库原理', 4);
INSERT INTO `couresetable` VALUES (2, '操作系统', 5);
INSERT INTO `couresetable` VALUES (3, '编译原理', 2);
INSERT INTO `couresetable` VALUES (4, '面向对象', 6);
INSERT INTO `couresetable` VALUES (5, 'python计算', 4);
INSERT INTO `couresetable` VALUES (6, '计算机基础', 5);
INSERT INTO `couresetable` VALUES (7, 'C语言入门', 2);
INSERT INTO `couresetable` VALUES (8, '生活中的经济学', 4);
INSERT INTO `couresetable` VALUES (9, '科学计算', 2);
INSERT INTO `couresetable` VALUES (10, '艺术与审美', 2);
INSERT INTO `couresetable` VALUES (11, '哲学与人生', 4);
INSERT INTO `couresetable` VALUES (12, '计算机系统结构', 4);
INSERT INTO `couresetable` VALUES (13, '模式识别', 5);
INSERT INTO `couresetable` VALUES (14, '消费主义', 2);
INSERT INTO `couresetable` VALUES (15, '数据结构（1）', 2);
INSERT INTO `couresetable` VALUES (16, '数据结构（2）', 6);
INSERT INTO `couresetable` VALUES (17, '大学物理（1）', 6);
INSERT INTO `couresetable` VALUES (18, '大学物理（2）', 4);
INSERT INTO `couresetable` VALUES (19, '大学物理（3）', 5);
INSERT INTO `couresetable` VALUES (20, '线性代数', 2);

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
  INDEX `django_admin_log_content_type_id_c4bce8eb`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2022-06-02 05:25:41.706839');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2022-06-02 05:25:41.830989');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2022-06-02 05:25:43.199698');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2022-06-02 05:25:43.493066');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-02 05:25:43.512441');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2022-06-02 05:25:43.680596');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2022-06-02 05:25:43.776075');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2022-06-02 05:25:43.878039');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2022-06-02 05:25:43.894776');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2022-06-02 05:25:43.998394');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2022-06-02 05:25:44.018558');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2022-06-02 05:25:44.018558');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2022-06-02 05:25:44.110077');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2022-06-02 05:25:44.196613');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2022-06-02 05:25:44.291517');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2022-06-02 05:25:44.310798');
INSERT INTO `django_migrations` VALUES (17, 'sessions', '0001_initial', '2022-06-02 05:27:21.518986');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('nblbkpjv5jq5whszuqfom1nkydp3s5gz', '.eJzdmulu20gMgF8l0N822iE5nEOvsikCHaPGu60d-NgiKPLuy7EtW5YUWdrNHxsIhCSgNfx4c5LfyT9hvajfylUVkixhsD75mmxeVq-LZb1Kst_Jokoy8zVZ5j-jwNPOcOD4LJQ8vS2fdrZ24WnnXVU_7diW4fiCvbQOWqSZaisS3lTyfXBaJMqVHPz8uihFDIz2xhKiT0mBIk7_ev0uMkW-XA4KsUHQLv2-qEUqr6p12Gz2x7FWXtSyXo5jj_FZGCNP1PFoMkV8cvw9Ud6Hkde9vqyWkRScd9oq8BDV3Wzz7U7OANF8HfJteM63IoQK8VHpR4AHUBlRpqP5dq_VqMS7vEQEvq_Wbz8Wm220MjSmhpapmUoxr8G6jDS8NyGoqOOiEl3-PHwCD-Z-PjqqefPz8W0XhhYLGHbEmHrSwGyPlj4daUOO8lRBDnPK-S_yAxuxlCOl5fyAIN-bsoharBfi7AwxVVcNpPhB-YxQvkYNhGIjJQY6oNFsNIFKjSOnFHbRjHMcOaq9TQ19LqCoHwEpI54BqGcDstUpSmCSpS6gU7kAWuTik6FMts-Bq1DfJLCxCWRsR5WpzCH_u8FrRgyAgwZwqFPy1rDinoctuliIbHHw7fnIAzOYycxaoCYxHx1p53MYSmM9c9zjODuyR-CnE0CmaAaBm03gjRJPsAbSPU9wkIrq89zFmuxjBeYCmkjsMLnpTCiOmRqJ1EQitUtqqepDEehGoh_hpyF-D6BTpbVCuhqJLdrpead1hnOKCajZCMpwKs1SqmG_E1wpIHo6B0-sHw0HzHeFt6lFAkTocnjLePb4bN1NRnaO7mPdeFh3ZEqd02ilPHV0l1GF4wxVVzFpvBQ0V-fSuGyh4iAT7EWvbgUZTwe00rSmppQZGgiHinsUto2wnZR_MFaA7JXo7Vnus6JXWp8V1aYayDXMrl0MSqP_2FsoxMrofQ99bAxwg-hkdGqdxA70xgBLbl91FBzm4TP0jPbnP25_aB4UZQwZu3PY82wClv5HThq5DPK96unjWlF6CW-Tc4tgelyztIqP4vpIgKL2mWBsEhkmMDKBMBuwtld0rK3r6PgybiMl6TMBTSegj8v_yQf6GHi-CTw_ITPhvG1ALzet8tgRP810gCOrQudDp_YLdFGNTXSqNdBLgrFReLByyqtUylpGYtUbQIb2GAwh7oOs4jZF-ks3JY-D8fQYw5j7I6UBpC6IzU4xNpYkw4hOdIszhvG-l-fD-8z_mBhJWsHY-gpSCCVrzikzNvQO83hROhWPGeivnjrosqEypYb_0q5ZZ3qsWO8R6Fy3cGxk6iHsbyBkfXYpS2Nxvabjyj2B1XgI9PlBFRUc6TfHtFeZ0oe0l7kqO_eQyRcH397fo2qraldumxuI9uJ2f_cJF9vAvd4pJKdouK97hcvB88bvCy7m4pu9M7iYdO_n3uBykLrZ-4BEin12L5cCnXH19m4GOgP0fV4PCOWpJNz8Kt8drG51OReFThg3vKHL5H3CuN01_evFH_nud9dNTjF3N_tuAqeh7aaXXvn1acu74c1XQLarbf7j-edqGd6STMV_Avi5WO42Yd1KsfjjUUMEkBZDMYCXi_LvzpWXz01clHWIefyabza_Vuvq-SXfvER2Isit9xJxYFURnK5VwNJiHqDiwz1W85FN_iMq7YCNb__XgPkAWz0oqdTSmD7MLLXHdlEiUoe8fAnrNifRBShIZ-lCiuciHuQqNlOyOEBZlDkoQFVxqIvAvgyVN7krPclOiHU-QCnbPrFtUdIQpXlULgYpaKndg5SXEkL5KxRtwhipbUJxpHIKr1EOQLpQoWZfu9zqUDitXJzWbW2VMaGmagBSgweHyZUIbhBkxuBxyIPE-_u_af_Lbg:1o0aqE:zZeBxxRIzm4WB2qJOmqozncLLrbcnIwfYV9KJo7biuY', '2022-06-27 03:34:14.281410');
INSERT INTO `django_session` VALUES ('bbxmfa75y8g5vv2ej72zdw5vbrw4gu69', 'NjI2ODI2MDg0ZjIyNzI3MTJkNjFlNmZmNDhjYTkwYzMyOGY2YWMxMzp7InZlcmlmeWNvZGUiOiIyNDUwIiwiYWRtaW51c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6IjIxMTkwMjI5Iiwibmlja25hbWUiOiJcdTllYzRcdTY3NDMiLCJwYXNzd29yZF9oYXNoIjoiMTMzMWE3OTkyNjMxNzBiZTg0ZjBlMmM3MmFlMWQ1NjEiLCJwYXNzd29yZF9zYWx0IjoiODE1Njk0Iiwic3RhdHVzIjo2LCJjcmVhdGVfYXQiOiIyMDIyLTA0LTEwIDAxOjU2OjEwIiwidXBkYXRlX2F0IjoiMjAyMi0wNC0xMCAwMzo1ODoxMCJ9fQ==', '2022-09-27 16:12:29.695358');
INSERT INTO `django_session` VALUES ('feg8jvsam1ayvojhkrh38d9w13gnifqb', 'OTIwNjVhNTk1ZTFkZjUzMjg5MzUwNTBhYmZmNzQ3NWZiMjUyOTczMDp7InZlcmlmeWNvZGUiOiI3OTg2Iiwid2VidXNlciI6eyJpZCI6NDgsInVzZXJuYW1lIjoiMjExOTAyMTQiLCJuaWNrbmFtZSI6Ilx1Njc0ZVx1NWUxYlx1NTM5ZiIsInBhc3N3b3JkX2hhc2giOiIxMzMxYTc5OTI2MzE3MGJlODRmMGUyYzcyYWUxZDU2MSIsInBhc3N3b3JkX3NhbHQiOiI4MTU2OTQiLCJzdGF0dXMiOjEsImNyZWF0ZV9hdCI6IjIwMjItMDktMDkgMTc6Mzc6MDAiLCJ1cGRhdGVfYXQiOiIyMDIyLTA5LTEwIDE3OjM3OjA0In0sImFkbWludXNlciI6eyJpZCI6MSwidXNlcm5hbWUiOiIyMTE5MDIyOSIsIm5pY2tuYW1lIjoiXHU5ZWM0XHU2NzQzIiwicGFzc3dvcmRfaGFzaCI6IjEzMzFhNzk5MjYzMTcwYmU4NGYwZTJjNzJhZTFkNTYxIiwicGFzc3dvcmRfc2FsdCI6IjgxNTY5NCIsInN0YXR1cyI6NiwiY3JlYXRlX2F0IjoiMjAyMi0wNC0xMCAwMTo1NjoxMCIsInVwZGF0ZV9hdCI6IjIwMjItMDQtMTAgMDM6NTg6MTAifSwidGVhY2hlcnVzZXIiOnsiaWQiOjcyLCJ1c2VybmFtZSI6IjEwMTUiLCJuaWNrbmFtZSI6Ilx1NmQ0Ylx1OGJkNVx1NjU1OVx1NWUwOCIsInBhc3N3b3JkX2hhc2giOiI1YTU1MDI0MzU2NTI4ZWQ4NDEwMzdlYWVhMzczMDNiYSIsInBhc3N3b3JkX3NhbHQiOiI1Mzg2NDQiLCJzdGF0dXMiOjMsImNyZWF0ZV9hdCI6IjIwMjItMDktMjMgMTY6MTY6NTMiLCJ1cGRhdGVfYXQiOiIyMDIyLTA5LTIzIDE2OjE2OjUzIn19', '2022-10-19 20:19:59.214536');

-- ----------------------------
-- Table structure for judge
-- ----------------------------
DROP TABLE IF EXISTS `judge`;
CREATE TABLE `judge`  (
  `judge_id` int NOT NULL,
  `judge` int NULL DEFAULT NULL,
  PRIMARY KEY (`judge_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of judge
-- ----------------------------
INSERT INTO `judge` VALUES (1, 1);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '会员表id',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态:1正常/2禁用/9删除',
  `create_at` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, 'lixiaofeng', 'moren.png', '11234567899', 9, '2022-04-11 10:20:30', '2022-04-11 10:20:30');
INSERT INTO `member` VALUES (2, 'jack', 'moren.png', '12345678965', 1, '2022-04-11 10:20:30', '2022-04-11 10:20:30');
INSERT INTO `member` VALUES (3, 'wo879', 'moren.png', '13456789522', 1, '2022-04-11 10:20:30', '2022-04-11 10:20:30');
INSERT INTO `member` VALUES (4, 'mt100', 'moren.png', '13567895563', 1, '2022-04-11 10:20:30', '2022-04-11 10:20:30');
INSERT INTO `member` VALUES (5, '顾客', 'moren.png', '12345678901', 1, '2022-04-11 10:20:30', '2022-04-11 10:20:30');
INSERT INTO `member` VALUES (6, '顾客', 'moren.png', '12345678902', 1, '2022-04-11 10:20:30', '2022-04-11 10:20:30');
INSERT INTO `member` VALUES (7, '顾客', 'moren.png', '12345678903', 1, '2022-04-11 10:20:30', '2022-04-11 10:20:30');
INSERT INTO `member` VALUES (8, '顾客', 'moren.png', '12345678904', 1, '2022-04-11 10:20:30', '2022-04-11 10:20:30');
INSERT INTO `member` VALUES (9, '顾客', 'moren.png', '12345678905', 1, '2022-04-11 10:20:30', '2022-04-11 10:20:30');
INSERT INTO `member` VALUES (10, '顾客', 'moren.png', '12345678906', 1, '2022-04-11 10:20:30', '2022-04-11 10:20:30');
INSERT INTO `member` VALUES (11, '顾客', 'moren.png', '12345678909', 1, '2022-04-11 10:20:30', '2022-04-11 10:20:30');
INSERT INTO `member` VALUES (12, '顾客', 'moren.png', '18642805564', 1, '2022-04-11 10:20:30', '2022-04-11 10:20:30');
INSERT INTO `member` VALUES (13, '顾客', 'moren.png', '13116051729', 1, '2022-04-11 10:20:30', '2022-04-11 10:20:30');
INSERT INTO `member` VALUES (14, '顾客', 'moren.png', '13161485799', 1, '2022-04-11 10:20:30', '2022-04-11 10:20:30');
INSERT INTO `member` VALUES (15, '顾客', 'moren.png', '11234567888', 1, '2022-04-11 10:20:30', '2022-04-11 10:20:30');
INSERT INTO `member` VALUES (16, '顾客', 'moren.png', '19919940344', 1, '2022-04-11 10:20:30', '2022-04-11 10:20:30');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `notice_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int NULL DEFAULT NULL,
  `notice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, 21190214, '你又满绩啦', '2022-10-06 21:35:42');

-- ----------------------------
-- Table structure for opencoursetable
-- ----------------------------
DROP TABLE IF EXISTS `opencoursetable`;
CREATE TABLE `opencoursetable`  (
  `open_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` int NULL DEFAULT NULL,
  `teacher_id` int NULL DEFAULT NULL,
  `time` int NULL DEFAULT NULL,
  `number` int NULL DEFAULT NULL,
  PRIMARY KEY (`open_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of opencoursetable
-- ----------------------------
INSERT INTO `opencoursetable` VALUES (1, 1, 1015, 3, 10);
INSERT INTO `opencoursetable` VALUES (2, 20, 1015, 9, 4);
INSERT INTO `opencoursetable` VALUES (3, 20, 1014, 7, 2);
INSERT INTO `opencoursetable` VALUES (7, 6, 1015, 7, 2);
INSERT INTO `opencoursetable` VALUES (20, 5, 1015, 4, 0);
INSERT INTO `opencoursetable` VALUES (23, 15, 1015, 8, 1);

-- ----------------------------
-- Table structure for openhistory
-- ----------------------------
DROP TABLE IF EXISTS `openhistory`;
CREATE TABLE `openhistory`  (
  `open_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_id` int NULL DEFAULT NULL,
  `teacher_id` int NULL DEFAULT NULL,
  `time` int NULL DEFAULT NULL,
  PRIMARY KEY (`open_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of openhistory
-- ----------------------------
INSERT INTO `openhistory` VALUES (11, 1, 1015, 3);
INSERT INTO `openhistory` VALUES (21, 20, 1015, 9);
INSERT INTO `openhistory` VALUES (31, 20, 1014, 7);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `order_id` int UNSIGNED NULL DEFAULT NULL COMMENT '订单id',
  `product_id` int UNSIGNED NULL DEFAULT NULL COMMENT '菜品id',
  `product_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜品名称',
  `price` double(6, 2) UNSIGNED NULL DEFAULT NULL COMMENT '单价',
  `quantity` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '数量',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态:1正常/9删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单详情信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1, 4, 1, '红烧肉+狮子头+饮料', 25.00, 1, 1);
INSERT INTO `order_detail` VALUES (2, 4, 2, '红烧肉+番茄鸡蛋', 22.00, 1, 1);
INSERT INTO `order_detail` VALUES (3, 4, 7, '肥牛饭', 19.00, 1, 1);
INSERT INTO `order_detail` VALUES (4, 5, 1, '红烧肉+狮子头+饮料', 25.00, 1, 1);
INSERT INTO `order_detail` VALUES (5, 6, 3, '梅菜扣肉+番茄鸡蛋', 22.00, 1, 1);
INSERT INTO `order_detail` VALUES (6, 6, 12, '单份香辣笋干烧肉', 15.00, 1, 1);
INSERT INTO `order_detail` VALUES (7, 6, 13, '番茄蛋花汤', 4.00, 1, 1);
INSERT INTO `order_detail` VALUES (8, 7, 2, '红烧肉+番茄鸡蛋', 22.00, 1, 1);
INSERT INTO `order_detail` VALUES (9, 7, 6, '木须肉饭', 16.00, 2, 1);
INSERT INTO `order_detail` VALUES (10, 7, 14, '王老吉', 6.00, 1, 1);
INSERT INTO `order_detail` VALUES (11, 7, 11, '菜心', 6.00, 1, 1);
INSERT INTO `order_detail` VALUES (12, 8, 2, '红烧肉+番茄鸡蛋', 22.00, 1, 1);
INSERT INTO `order_detail` VALUES (13, 8, 5, '梅菜扣肉饭', 19.00, 1, 1);
INSERT INTO `order_detail` VALUES (14, 9, 1, '红烧肉+狮子头+饮料', 25.00, 1, 1);
INSERT INTO `order_detail` VALUES (15, 9, 13, '番茄蛋花汤', 4.00, 1, 1);
INSERT INTO `order_detail` VALUES (16, 10, 1, '红烧肉+狮子头+饮料', 25.00, 1, 1);
INSERT INTO `order_detail` VALUES (17, 10, 2, '红烧肉+番茄鸡蛋', 22.00, 1, 1);
INSERT INTO `order_detail` VALUES (18, 11, 1, '红烧肉+狮子头+饮料', 25.00, 1, 1);
INSERT INTO `order_detail` VALUES (19, 11, 2, '红烧肉+番茄鸡蛋', 22.00, 2, 1);
INSERT INTO `order_detail` VALUES (20, 11, 12, '单份香辣笋干烧肉', 15.00, 1, 1);
INSERT INTO `order_detail` VALUES (21, 11, 13, '番茄蛋花汤', 4.00, 1, 1);
INSERT INTO `order_detail` VALUES (22, 12, 1, '红烧肉+狮子头+饮料', 25.00, 1, 1);
INSERT INTO `order_detail` VALUES (23, 12, 6, '木须肉饭', 16.00, 2, 1);
INSERT INTO `order_detail` VALUES (24, 12, 13, '番茄蛋花汤', 4.00, 1, 1);
INSERT INTO `order_detail` VALUES (25, 13, 1, '红烧肉+狮子头+饮料', 25.00, 2, 1);
INSERT INTO `order_detail` VALUES (26, 13, 6, '木须肉饭', 16.00, 1, 1);
INSERT INTO `order_detail` VALUES (27, 13, 9, '单个肉丸子', 4.00, 2, 1);
INSERT INTO `order_detail` VALUES (28, 13, 14, '王老吉', 6.00, 1, 1);
INSERT INTO `order_detail` VALUES (29, 14, 1, '红烧肉+狮子头+饮料', 25.00, 5, 1);
INSERT INTO `order_detail` VALUES (30, 14, 2, '红烧肉+番茄鸡蛋', 22.00, 7, 1);
INSERT INTO `order_detail` VALUES (31, 14, 6, '木须肉饭', 16.00, 1, 1);
INSERT INTO `order_detail` VALUES (32, 15, 14, '王老吉', 6.00, 2, 1);
INSERT INTO `order_detail` VALUES (33, 15, 9, '木须肉', 12.00, 1, 1);
INSERT INTO `order_detail` VALUES (34, 15, 3, '梅菜扣肉+番茄鸡蛋', 22.00, 1, 1);
INSERT INTO `order_detail` VALUES (35, 15, 6, '木须肉饭', 16.00, 1, 1);
INSERT INTO `order_detail` VALUES (36, 16, 1, '红烧肉+狮子头+饮料', 25.00, 1, 1);
INSERT INTO `order_detail` VALUES (37, 17, 20, '豌杂面', 25.00, 1, 1);
INSERT INTO `order_detail` VALUES (38, 18, 15, '果粒橙', 5.00, 1, 1);
INSERT INTO `order_detail` VALUES (39, 18, 9, '木须肉', 12.00, 1, 1);
INSERT INTO `order_detail` VALUES (40, 18, 4, '肥牛+番茄鸡蛋', 22.00, 1, 1);
INSERT INTO `order_detail` VALUES (41, 19, 3, '梅菜扣肉+番茄鸡蛋', 22.00, 1, 1);
INSERT INTO `order_detail` VALUES (42, 19, 2, '红烧肉+番茄鸡蛋', 22.00, 2, 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单表id',
  `shop_id` int UNSIGNED NULL DEFAULT NULL COMMENT '店铺id号',
  `member_id` int UNSIGNED NULL DEFAULT NULL COMMENT '会员id',
  `user_id` int UNSIGNED NULL DEFAULT NULL COMMENT '操作员id',
  `money` double(8, 2) NULL DEFAULT NULL COMMENT '金额',
  `status` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '订单状态:1过行中/2无效/3已完成',
  `payment_status` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '支付状态:1未支付/2已支付/3已退款',
  `create_at` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (4, 1, 0, 1, 66.00, 3, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `orders` VALUES (5, 1, 0, 1, 25.00, 3, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `orders` VALUES (6, 1, 0, 3, 41.00, 3, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `orders` VALUES (7, 1, 0, 1, 66.00, 3, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `orders` VALUES (8, 1, 0, 1, 41.00, 1, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `orders` VALUES (9, 1, 0, 1, 29.00, 2, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `orders` VALUES (10, 1, 0, 1, 47.00, 1, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `orders` VALUES (11, 1, 0, 1, 88.00, 3, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `orders` VALUES (12, 1, 0, 1, 61.00, 3, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `orders` VALUES (13, 1, 0, 1, 80.00, 3, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `orders` VALUES (14, 1, 0, 2, 295.00, 2, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `orders` VALUES (15, 1, 0, 2, 62.00, 1, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `orders` VALUES (16, 1, 0, 15, 25.00, 1, 2, '2022-04-10 05:48:50', '2022-04-10 05:48:50');
INSERT INTO `orders` VALUES (17, 6, 0, 1, 25.00, 3, 2, '2022-04-11 12:00:54', '2022-04-11 12:00:54');
INSERT INTO `orders` VALUES (18, 6, 0, 1, 39.00, 3, 2, '2022-04-26 03:53:13', '2022-04-26 03:53:13');
INSERT INTO `orders` VALUES (19, 6, 0, 1, 66.00, 3, 2, '2022-04-29 11:12:15', '2022-04-29 11:12:15');

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '支付表id',
  `order_id` int UNSIGNED NULL DEFAULT NULL COMMENT '订单id',
  `member_id` int UNSIGNED NULL DEFAULT NULL COMMENT '会员id',
  `money` double(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '支付金额',
  `type` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '付款方式：1会员付款/2收银收款',
  `bank` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '收款银行渠道:1微信/2余额/3现金/4支付宝',
  `status` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '支付状态:1未支付/2已支付/3已退款',
  `create_at` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES (2, 4, 0, 66.00, 2, 3, 2, '2022-04-26 10:20:30', '2022-04-26 10:20:30');
INSERT INTO `payment` VALUES (3, 5, 0, 25.00, 2, 3, 2, '2022-04-26 10:20:30', '2022-04-26 10:20:30');
INSERT INTO `payment` VALUES (4, 6, 0, 41.00, 2, 3, 2, '2022-04-26 10:20:30', '2022-04-26 10:20:30');
INSERT INTO `payment` VALUES (5, 7, 0, 66.00, 2, 3, 2, '2022-04-26 10:20:30', '2022-04-26 10:20:30');
INSERT INTO `payment` VALUES (6, 8, 0, 41.00, 2, 3, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `payment` VALUES (7, 9, 0, 29.00, 2, 1, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `payment` VALUES (8, 10, 0, 47.00, 2, 3, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `payment` VALUES (9, 11, 0, 88.00, 2, 3, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `payment` VALUES (10, 12, 0, 61.00, 2, 3, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `payment` VALUES (11, 13, 0, 80.00, 2, 3, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `payment` VALUES (12, 14, 0, 295.00, 2, 4, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `payment` VALUES (13, 15, 0, 62.00, 2, 3, 2, '2020-07-25 10:20:30', '2020-07-25 10:20:30');
INSERT INTO `payment` VALUES (14, 16, 0, 25.00, 2, 3, 2, '2022-04-10 05:48:50', '2022-04-10 05:48:50');
INSERT INTO `payment` VALUES (15, 17, 0, 25.00, 2, 3, 2, '2022-04-11 12:00:54', '2022-04-11 12:00:54');
INSERT INTO `payment` VALUES (16, 18, 0, 39.00, 2, 3, 2, '2022-04-26 03:53:13', '2022-04-26 03:53:13');
INSERT INTO `payment` VALUES (17, 19, 0, 66.00, 2, 3, 2, '2022-04-29 11:12:15', '2022-04-29 11:12:15');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜品id',
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `category_id` int NULL DEFAULT NULL COMMENT '菜品分类id',
  `cover_pic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜品图片',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜品名称',
  `price` double(6, 2) NULL DEFAULT NULL COMMENT '单价',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态：1:正常  2:停售  9:删除',
  `create_at` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 6, 13, '1536657620.5485704.jpg', '红烧肉+狮子头+饮料', 25.00, 1, '2022-04-11 09:20:20', '2022-04-11 11:30:12');
INSERT INTO `product` VALUES (2, 6, 1, '1536658352.9341557.jpg', '红烧肉+番茄鸡蛋', 22.00, 1, '2022-04-05 09:32:32', '2022-04-11 10:20:30');
INSERT INTO `product` VALUES (3, 6, 1, '1536658415.6838002.jpg', '梅菜扣肉+番茄鸡蛋', 22.00, 1, '2022-04-11 09:33:35', '2022-04-11 10:20:30');
INSERT INTO `product` VALUES (4, 6, 1, '1536658574.2847373.jpg', '肥牛+番茄鸡蛋', 22.00, 1, '2022-04-11 09:36:14', '2022-04-11 10:20:30');
INSERT INTO `product` VALUES (5, 6, 13, '1536658659.0446993.jpg', '梅菜扣肉饭', 19.00, 1, '2022-04-11 09:37:39', '2022-04-11 11:18:52');
INSERT INTO `product` VALUES (6, 6, 2, '1536658824.3976505.jpg', '木须肉饭', 16.00, 1, '2022-04-11 09:40:24', '2022-04-11 10:20:30');
INSERT INTO `product` VALUES (7, 6, 2, '1536658863.6732855.jpg', '肥牛饭', 19.00, 1, '2022-04-11 09:41:03', '2022-04-11 10:20:30');
INSERT INTO `product` VALUES (8, 6, 2, '1536658960.3954134.jpg', '无骨咖喱鸡饭', 18.00, 1, '2022-04-11 09:42:40', '2022-04-11 10:20:30');
INSERT INTO `product` VALUES (9, 6, 3, '1536659114.0440235.jpg', '木须肉', 12.00, 1, '2022-04-11 09:44:25', '2022-04-11 10:20:30');
INSERT INTO `product` VALUES (10, 6, 3, '1536659065.7972637.jpg', '番茄鸡蛋', 4.00, 1, '2022-04-11 09:45:14', '2022-04-11 10:20:30');
INSERT INTO `product` VALUES (11, 6, 3, '1536659197.7231221.jpg', '青菜', 4.00, 1, '2022-04-11 09:46:37', '2022-04-11 10:20:30');
INSERT INTO `product` VALUES (12, 6, 3, '1536659253.8842716.jpg', '单份香辣笋干烧肉', 15.00, 1, '2022-04-11 09:47:33', '2022-04-11 10:20:30');
INSERT INTO `product` VALUES (13, 6, 4, '1536659311.8699493.jpg', '番茄蛋花汤', 4.00, 1, '2022-04-11 09:48:31', '2022-04-11 10:20:30');
INSERT INTO `product` VALUES (14, 6, 8, '1536659364.7892513.jpg', '王老吉', 6.00, 1, '2022-04-11 09:49:24', '2022-04-26 03:51:58');
INSERT INTO `product` VALUES (15, 6, 8, '1536659563.3897648.jpg', '果粒橙', 5.00, 1, '2022-04-11 09:52:43', '2022-04-26 03:52:15');
INSERT INTO `product` VALUES (16, 6, 8, '1536659605.5561771.jpg', '矿泉水', 3.00, 1, '2022-04-11 09:53:25', '2022-04-26 03:51:40');
INSERT INTO `product` VALUES (17, 6, 13, '1536659688.4856157.jpg', '乌梅汁', 4.00, 1, '2022-04-11 09:54:48', '2022-04-11 11:18:38');
INSERT INTO `product` VALUES (18, 6, 7, '1536659065.7972636.jpg', '番茄鸡蛋', 4.00, 1, '2022-04-11 06:17:18', '2022-04-11 10:20:30');
INSERT INTO `product` VALUES (19, 6, 10, '1536658666.8341557.jpg', '红烧肉+西红柿鸡蛋', 24.00, 1, '2022-04-11 08:46:28', '2022-04-11 07:34:07');
INSERT INTO `product` VALUES (20, 6, 13, '1649675838.530486.jpg', '豌杂面', 25.00, 1, '2022-04-11 11:17:18', '2022-04-26 03:50:04');

-- ----------------------------
-- Table structure for scoretable
-- ----------------------------
DROP TABLE IF EXISTS `scoretable`;
CREATE TABLE `scoretable`  (
  `id` int NOT NULL,
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `student_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teacher_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `course_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scoretable
-- ----------------------------
INSERT INTO `scoretable` VALUES (1, '78', '1', '19060801', '1001', 'C001');
INSERT INTO `scoretable` VALUES (2, '59', '1', '19060802', '1001', 'C001');
INSERT INTO `scoretable` VALUES (3, '89', '1', '19060803', '1001', 'C001');
INSERT INTO `scoretable` VALUES (4, '56', '1', '19060804', '1001', 'C001');
INSERT INTO `scoretable` VALUES (5, '91', '1', '19060805', '1001', 'C001');
INSERT INTO `scoretable` VALUES (6, '87', '1', '19060806', '1001', 'C001');
INSERT INTO `scoretable` VALUES (7, '58', '1', '19060807', '1001', 'C001');
INSERT INTO `scoretable` VALUES (8, '60', '1', '19060808', '1001', 'C001');
INSERT INTO `scoretable` VALUES (9, '96', '1', '19060809', '1001', 'C001');
INSERT INTO `scoretable` VALUES (10, '91', '1', '19060810', '1001', 'C001');
INSERT INTO `scoretable` VALUES (11, '78', '1', '19060811', '1001', 'C001');
INSERT INTO `scoretable` VALUES (12, '77', '1', '19060812', '1001', 'C001');
INSERT INTO `scoretable` VALUES (13, '78', '1', '19060813', '1001', 'C001');
INSERT INTO `scoretable` VALUES (14, '79', '1', '19060814', '1001', 'C001');
INSERT INTO `scoretable` VALUES (15, '81', '2', '19060801', '1002', 'C001');
INSERT INTO `scoretable` VALUES (16, '82', '2', '19060802', '1002', 'C002');
INSERT INTO `scoretable` VALUES (17, '83', '2', '19060803', '1002', 'C003');
INSERT INTO `scoretable` VALUES (18, '86', '2', '19060804', '1002', 'C004');
INSERT INTO `scoretable` VALUES (19, '95', '2', '19060805', '1002', 'C005');
INSERT INTO `scoretable` VALUES (20, '97', '2', '19060806', '1002', 'C006');
INSERT INTO `scoretable` VALUES (21, '56', '2', '19060807', '1002', 'C007');
INSERT INTO `scoretable` VALUES (22, '90', '2', '19060808', '1002', 'C008');
INSERT INTO `scoretable` VALUES (23, '89', '2', '19060809', '1002', 'C009');
INSERT INTO `scoretable` VALUES (24, '56', '2', '19060810', '1002', 'C010');
INSERT INTO `scoretable` VALUES (25, '91', '2', '19060811', '1002', 'C011');
INSERT INTO `scoretable` VALUES (26, '87', '2', '19060812', '1002', 'C012');
INSERT INTO `scoretable` VALUES (27, '58', '2', '19060813', '1002', 'C013');
INSERT INTO `scoretable` VALUES (28, '56', '2', '19060814', '1002', 'C016');
INSERT INTO `scoretable` VALUES (29, '90', '3', '19060801', '1001', 'C014');
INSERT INTO `scoretable` VALUES (30, '89', '3', '19060802', '1002', 'C015');
INSERT INTO `scoretable` VALUES (31, '56', '3', '19060803', '1003', 'C017');
INSERT INTO `scoretable` VALUES (32, '91', '3', '19060804', '1004', 'C018');
INSERT INTO `scoretable` VALUES (33, '87', '3', '19060805', '1005', 'C019');
INSERT INTO `scoretable` VALUES (34, '58', '3', '19060806', '1006', 'C001');
INSERT INTO `scoretable` VALUES (35, '56', '3', '19060807', '1007', 'C002');
INSERT INTO `scoretable` VALUES (36, '90', '4', '19060808', '1008', 'C003');
INSERT INTO `scoretable` VALUES (37, '89', '4', '19060809', '1009', 'C004');
INSERT INTO `scoretable` VALUES (38, '56', '4', '19060810', '1010', 'C005');
INSERT INTO `scoretable` VALUES (39, '91', '4', '19060811', '1011', 'C006');
INSERT INTO `scoretable` VALUES (40, '87', '4', '19060812', '1012', 'C007');
INSERT INTO `scoretable` VALUES (41, '58', '5', '19060813', '1013', 'C008');
INSERT INTO `scoretable` VALUES (42, '56', '5', '19060814', '1014', 'C009');
INSERT INTO `scoretable` VALUES (43, '90', '5', '19060801', '1001', 'C010');
INSERT INTO `scoretable` VALUES (44, '89', '5', '19060802', '1002', 'C011');
INSERT INTO `scoretable` VALUES (45, '56', '5', '19060803', '1003', 'C012');
INSERT INTO `scoretable` VALUES (46, '91', '5', '19060804', '1004', 'C013');
INSERT INTO `scoretable` VALUES (47, '87', '5', '19060805', '1005', 'C016');
INSERT INTO `scoretable` VALUES (48, '58', '5', '19060806', '1006', 'C014');
INSERT INTO `scoretable` VALUES (49, '74', '5', '19060807', '1007', 'C015');
INSERT INTO `scoretable` VALUES (50, '60', '5', '19060808', '1002', 'C017');
INSERT INTO `scoretable` VALUES (51, '61', '6', '19060809', '1003', 'C018');
INSERT INTO `scoretable` VALUES (52, '62', '6', '19060810', '1004', 'C019');
INSERT INTO `scoretable` VALUES (53, '63', '6', '19060811', '1005', 'C020');
INSERT INTO `scoretable` VALUES (54, '64', '6', '19060812', '1006', 'C001');
INSERT INTO `scoretable` VALUES (55, '80', '6', '19060813', '1007', 'C002');
INSERT INTO `scoretable` VALUES (56, '81', '6', '19060814', '1008', 'C003');
INSERT INTO `scoretable` VALUES (57, '82', '7', '19060801', '1009', 'C004');
INSERT INTO `scoretable` VALUES (58, '56', '7', '19060802', '1010', 'C005');
INSERT INTO `scoretable` VALUES (59, '91', '7', '19060803', '1011', 'C006');
INSERT INTO `scoretable` VALUES (60, '87', '7', '19060804', '1012', 'C007');
INSERT INTO `scoretable` VALUES (61, '58', '7', '19060805', '1013', 'C008');
INSERT INTO `scoretable` VALUES (62, '56', '8', '19060806', '1014', 'C009');
INSERT INTO `scoretable` VALUES (63, '90', '8', '19060807', '1001', 'C010');
INSERT INTO `scoretable` VALUES (64, '89', '8', '19060808', '1002', 'C011');
INSERT INTO `scoretable` VALUES (65, '56', '8', '19060809', '1003', 'C012');
INSERT INTO `scoretable` VALUES (66, '91', '8', '19060810', '1004', 'C013');
INSERT INTO `scoretable` VALUES (67, '87', '8', '19060811', '1005', 'C016');
INSERT INTO `scoretable` VALUES (68, '58', '8', '19060812', '1006', 'C014');
INSERT INTO `scoretable` VALUES (69, '74', '8', '19060813', '1007', 'C015');
INSERT INTO `scoretable` VALUES (70, '60', '8', '19060814', '1008', 'C017');
INSERT INTO `scoretable` VALUES (71, '82', '8', '19060801', '1009', 'C018');
INSERT INTO `scoretable` VALUES (72, '83', '9', '19060802', '1001', 'C019');
INSERT INTO `scoretable` VALUES (73, '84', '9', '19060803', '1002', 'C020');
INSERT INTO `scoretable` VALUES (74, '85', '9', '19060804', '1003', 'C001');
INSERT INTO `scoretable` VALUES (75, '89', '9', '19060805', '1004', 'C002');
INSERT INTO `scoretable` VALUES (76, '90', '9', '19060806', '1005', 'C003');
INSERT INTO `scoretable` VALUES (77, '91', '10', '19060807', '1006', 'C004');
INSERT INTO `scoretable` VALUES (78, '92', '11', '19060808', '1007', 'C005');
INSERT INTO `scoretable` VALUES (79, '93', '10', '19060809', '1008', 'C006');
INSERT INTO `scoretable` VALUES (80, '91', '11', '19060810', '1009', 'C007');
INSERT INTO `scoretable` VALUES (81, '92', '10', '19060811', '1010', 'C008');
INSERT INTO `scoretable` VALUES (82, '93', '11', '19060812', '1011', 'C009');
INSERT INTO `scoretable` VALUES (83, '91', '13', '19060813', '1012', 'C010');
INSERT INTO `scoretable` VALUES (84, '92', '13', '19060814', '1013', 'C011');
INSERT INTO `scoretable` VALUES (85, '93', '13', '19060801', '1014', 'C012');
INSERT INTO `scoretable` VALUES (86, '86', '12', '19060802', '1001', 'C013');
INSERT INTO `scoretable` VALUES (87, '87', '12', '19060803', '1001', 'C016');
INSERT INTO `scoretable` VALUES (88, '88', '13', '19060804', '1002', 'C014');
INSERT INTO `scoretable` VALUES (89, '89', '12', '19060805', '1003', 'C015');
INSERT INTO `scoretable` VALUES (90, '90', '13', '19060806', '1004', 'C017');
INSERT INTO `scoretable` VALUES (91, '91', '12', '19060807', '1005', 'C018');
INSERT INTO `scoretable` VALUES (92, '92', '12', '19060808', '1006', 'C019');
INSERT INTO `scoretable` VALUES (93, '93', '13', '19060809', '1007', 'C020');
INSERT INTO `scoretable` VALUES (94, '94', '14', '19060810', '1008', 'C001');
INSERT INTO `scoretable` VALUES (95, '95', '14', '19060811', '1009', 'C002');
INSERT INTO `scoretable` VALUES (96, '96', '14', '19060812', '1010', 'C003');
INSERT INTO `scoretable` VALUES (97, '97', '14', '19060813', '1001', 'C004');
INSERT INTO `scoretable` VALUES (98, '98', '14', '19060814', '1002', 'C005');
INSERT INTO `scoretable` VALUES (99, '99', '14', '19060801', '1003', 'C006');
INSERT INTO `scoretable` VALUES (100, '100', '14', '19060802', '1004', 'C007');
INSERT INTO `scoretable` VALUES (101, '86', '15', '19060803', '1005', 'C008');
INSERT INTO `scoretable` VALUES (102, '94', '15', '19060804', '1006', 'C009');
INSERT INTO `scoretable` VALUES (103, '95', '15', '19060805', '1007', 'C010');
INSERT INTO `scoretable` VALUES (104, '96', '15', '19060806', '1008', 'C011');
INSERT INTO `scoretable` VALUES (105, '90', '15', '19060807', '1009', 'C012');
INSERT INTO `scoretable` VALUES (106, '91', '16', '19060808', '1010', 'C013');
INSERT INTO `scoretable` VALUES (107, '96', '16', '19060809', '1011', 'C016');
INSERT INTO `scoretable` VALUES (108, '97', '16', '19060810', '1012', 'C014');
INSERT INTO `scoretable` VALUES (109, '94', '16', '19060811', '1013', 'C015');
INSERT INTO `scoretable` VALUES (110, '95', '16', '19060812', '1014', 'C017');
INSERT INTO `scoretable` VALUES (111, '96', '16', '19060813', '1001', 'C018');
INSERT INTO `scoretable` VALUES (112, '97', '16', '19060814', '1002', 'C019');
INSERT INTO `scoretable` VALUES (113, '98', '17', '19060801', '1003', 'C020');
INSERT INTO `scoretable` VALUES (114, '99', '17', '19060802', '1004', 'C001');
INSERT INTO `scoretable` VALUES (115, '94', '17', '19060803', '1005', 'C002');
INSERT INTO `scoretable` VALUES (116, '95', '17', '19060804', '1006', 'C003');
INSERT INTO `scoretable` VALUES (117, '96', '17', '19060805', '1007', 'C004');
INSERT INTO `scoretable` VALUES (118, '87', '17', '19060806', '1008', 'C005');
INSERT INTO `scoretable` VALUES (119, '58', '17', '19060807', '1009', 'C006');
INSERT INTO `scoretable` VALUES (120, '56', '17', '19060808', '1010', 'C007');
INSERT INTO `scoretable` VALUES (121, '90', '17', '19060809', '1011', 'C008');
INSERT INTO `scoretable` VALUES (122, '89', '17', '19060810', '1012', 'C009');
INSERT INTO `scoretable` VALUES (123, '99', '17', '19060811', '1013', 'C010');
INSERT INTO `scoretable` VALUES (124, '94', '18', '19060812', '1014', 'C011');
INSERT INTO `scoretable` VALUES (125, '95', '18', '19060813', '1001', 'C012');
INSERT INTO `scoretable` VALUES (126, '96', '18', '19060814', '1002', 'C013');
INSERT INTO `scoretable` VALUES (127, '87', '18', '19060801', '1001', 'C016');
INSERT INTO `scoretable` VALUES (128, '58', '18', '19060802', '1002', 'C014');
INSERT INTO `scoretable` VALUES (129, '56', '18', '19060803', '1003', 'C015');
INSERT INTO `scoretable` VALUES (130, '90', '18', '19060804', '1004', 'C017');
INSERT INTO `scoretable` VALUES (131, '89', '18', '19060805', '1005', 'C018');
INSERT INTO `scoretable` VALUES (132, '99', '18', '19060806', '1006', 'C019');
INSERT INTO `scoretable` VALUES (133, '94', '18', '19060807', '1007', 'C020');
INSERT INTO `scoretable` VALUES (134, '95', '18', '19060808', '1008', 'C001');
INSERT INTO `scoretable` VALUES (135, '96', '19', '19060809', '1009', 'C002');
INSERT INTO `scoretable` VALUES (136, '87', '19', '19060810', '1010', 'C003');
INSERT INTO `scoretable` VALUES (137, '58', '19', '19060811', '1011', 'C004');
INSERT INTO `scoretable` VALUES (138, '56', '19', '19060812', '1012', 'C005');
INSERT INTO `scoretable` VALUES (139, '90', '19', '19060813', '1013', 'C006');
INSERT INTO `scoretable` VALUES (140, '96', '19', '19060814', '1014', 'C007');
INSERT INTO `scoretable` VALUES (141, '87', '20', '19060801', '1001', 'C008');
INSERT INTO `scoretable` VALUES (142, '58', '20', '19060802', '1002', 'C009');
INSERT INTO `scoretable` VALUES (143, '56', '20', '19060803', '1003', 'C010');
INSERT INTO `scoretable` VALUES (144, '90', '20', '19060804', '1004', 'C011');
INSERT INTO `scoretable` VALUES (145, '89', '21', '19060805', '1005', 'C012');
INSERT INTO `scoretable` VALUES (146, '99', '21', '19060806', '1006', 'C013');
INSERT INTO `scoretable` VALUES (147, '94', '21', '19060807', '1007', 'C016');
INSERT INTO `scoretable` VALUES (148, '90', '21', '19060808', '1008', 'C014');
INSERT INTO `scoretable` VALUES (149, '89', '21', '19060809', '1009', 'C015');
INSERT INTO `scoretable` VALUES (150, '96', '21', '19060810', '1010', 'C017');
INSERT INTO `scoretable` VALUES (151, '87', '21', '19060811', '1011', 'C018');
INSERT INTO `scoretable` VALUES (152, '58', '21', '19060812', '1012', 'C019');
INSERT INTO `scoretable` VALUES (153, '29', '21', '19060813', '1013', 'C020');
INSERT INTO `scoretable` VALUES (154, '80', '21', '19060814', '1014', 'C001');

-- ----------------------------
-- Table structure for selectcourse
-- ----------------------------
DROP TABLE IF EXISTS `selectcourse`;
CREATE TABLE `selectcourse`  (
  `select_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `open_id` int NULL DEFAULT NULL,
  `student_id` int NULL DEFAULT NULL,
  `main` int NULL DEFAULT NULL,
  PRIMARY KEY (`select_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of selectcourse
-- ----------------------------
INSERT INTO `selectcourse` VALUES (36, 2, 19060803, 1);
INSERT INTO `selectcourse` VALUES (2, 7, 21190214, 1);
INSERT INTO `selectcourse` VALUES (29, 1, 19060809, 1);
INSERT INTO `selectcourse` VALUES (13, 23, 21190214, 1);
INSERT INTO `selectcourse` VALUES (14, 1, 21190215, 1);
INSERT INTO `selectcourse` VALUES (17, 1, 19060801, 1);
INSERT INTO `selectcourse` VALUES (32, 20, 21190214, 2);
INSERT INTO `selectcourse` VALUES (21, 1, 19060802, 1);
INSERT INTO `selectcourse` VALUES (22, 1, 19060803, 1);
INSERT INTO `selectcourse` VALUES (23, 1, 19060804, 1);
INSERT INTO `selectcourse` VALUES (24, 1, 19060805, 1);
INSERT INTO `selectcourse` VALUES (25, 1, 19060806, 1);
INSERT INTO `selectcourse` VALUES (26, 1, 19060807, 1);
INSERT INTO `selectcourse` VALUES (35, 2, 19060802, 1);
INSERT INTO `selectcourse` VALUES (31, 1, 21190214, 1);
INSERT INTO `selectcourse` VALUES (37, 2, 19060804, 1);
INSERT INTO `selectcourse` VALUES (38, 2, 19060805, 1);
INSERT INTO `selectcourse` VALUES (39, 3, 19060802, 1);
INSERT INTO `selectcourse` VALUES (40, 3, 19060803, 1);
INSERT INTO `selectcourse` VALUES (41, 20, 19060802, 2);
INSERT INTO `selectcourse` VALUES (42, 20, 19060803, 2);
INSERT INTO `selectcourse` VALUES (44, 23, 19060807, 1);
INSERT INTO `selectcourse` VALUES (45, 20, 19060807, 2);
INSERT INTO `selectcourse` VALUES (46, 7, 19060807, 2);

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `cover_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图片',
  `banner_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标Logo',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺地址',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：1:正常 2:暂停 9:删除',
  `create_at` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES (1, '田老师红烧肉-朝阳将台路店', '12341234.jpg', 'lg.jpg', '北京市朝阳区将台乡东八间房村西临8号', '12345678905', 9, '2020-07-20 10:12:34', '2022-04-11 12:39:59');
INSERT INTO `shop` VALUES (2, '田老师红烧肉-海淀区上地店', '57892456.jpg', 'lg.jpg', '北京市海定区上地三街嘉华大厦A座10号', '13456789209', 9, '2020-07-21 12:23:45', '2022-04-11 12:40:03');
INSERT INTO `shop` VALUES (3, '田老师红烧肉-西城玉渊潭店', '23454567.jpg', 'lg.jpg', '北京市宣武区玉渊潭南路东123号', '12345677654', 9, '2020-07-24 08:20:32', '2022-04-11 11:14:02');
INSERT INTO `shop` VALUES (6, '日新楼美食城-久号饭庄', '1649673229.301035.jpg', '1649673229.3562148.gif', '吉林大学前卫南区日新楼', '18984701914', 1, '2022-04-11 10:33:49', '2022-04-11 10:33:49');

-- ----------------------------
-- Table structure for studenttable
-- ----------------------------
DROP TABLE IF EXISTS `studenttable`;
CREATE TABLE `studenttable`  (
  `user_id` int NOT NULL,
  `date_of_graduation` int NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_of_birth` date NULL DEFAULT NULL,
  `social_number` int NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of studenttable
-- ----------------------------
INSERT INTO `studenttable` VALUES (19060801, 2011, '学生', '2022-09-09', 21180000);
INSERT INTO `studenttable` VALUES (19060802, 2019, '学生', '2001-10-17', 21190001);
INSERT INTO `studenttable` VALUES (19060803, 2016, '学生', '1999-07-31', 21190002);
INSERT INTO `studenttable` VALUES (19060804, 2020, '学生', '2002-01-25', 21190003);
INSERT INTO `studenttable` VALUES (19060805, 2019, '学生', '2001-10-22', 21190004);
INSERT INTO `studenttable` VALUES (19060806, 2017, '学生', '2003-05-21', 21190005);
INSERT INTO `studenttable` VALUES (19060807, 2021, '学生', '2003-05-11', 21190006);
INSERT INTO `studenttable` VALUES (19060808, 2020, '学生', '2002-01-11', 21190007);
INSERT INTO `studenttable` VALUES (19060809, 2021, '学生', '2003-05-09', 21190008);
INSERT INTO `studenttable` VALUES (19060810, 2017, '学生', '2003-05-22', 21190009);
INSERT INTO `studenttable` VALUES (19060811, 2019, '学生', '2001-10-13', 21190010);
INSERT INTO `studenttable` VALUES (19060812, 2018, '学生', '2000-06-11', 21190011);
INSERT INTO `studenttable` VALUES (19060813, 2021, '学生', '2003-05-27', 21190012);
INSERT INTO `studenttable` VALUES (19060814, 2020, '学生', '2002-01-04', 21190013);
INSERT INTO `studenttable` VALUES (21190214, 2019, '学生', '2001-06-06', 21190014);
INSERT INTO `studenttable` VALUES (19060800, 2018, '学生', '2004-06-02', 21180000);
INSERT INTO `studenttable` VALUES (21190215, 2018, '学生', '2022-09-09', 11111111);
INSERT INTO `studenttable` VALUES (21190216, 2018, '学生', '2022-09-04', 20000000);
INSERT INTO `studenttable` VALUES (21190217, 2000, '学生', '2022-10-13', 11111111);

-- ----------------------------
-- Table structure for teachertable
-- ----------------------------
DROP TABLE IF EXISTS `teachertable`;
CREATE TABLE `teachertable`  (
  `user_id` int NOT NULL,
  `college_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_of_birth` date NULL DEFAULT NULL,
  `social_security_number` int NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teachertable
-- ----------------------------
INSERT INTO `teachertable` VALUES (1001, '计算机科学与技术学院', '2022-09-16', 21190299, '副教授');
INSERT INTO `teachertable` VALUES (1002, '材料学院', '2022-09-03', 21190298, '副教授');
INSERT INTO `teachertable` VALUES (1003, '文学院', '1974-06-01', 21190216, '讲师');
INSERT INTO `teachertable` VALUES (1004, '计算机科学与技术学院', '1975-02-21', 21190217, '教授');
INSERT INTO `teachertable` VALUES (1005, '材料学院', '1974-04-10', 21190218, '院长');
INSERT INTO `teachertable` VALUES (1006, '文学院', '1974-06-19', 21190219, '教授');
INSERT INTO `teachertable` VALUES (1007, '文学院', '1959-12-01', 21190220, '讲师');
INSERT INTO `teachertable` VALUES (1008, '计算机科学与技术学院', '1979-07-27', 21190221, '教授');
INSERT INTO `teachertable` VALUES (1009, '文学院', '1990-02-01', 21190222, '教授');
INSERT INTO `teachertable` VALUES (1010, '计算机科学与技术学院', '1970-07-30', 21190223, '教授');
INSERT INTO `teachertable` VALUES (1012, '文学院', '1976-08-01', 21190225, '副教授');
INSERT INTO `teachertable` VALUES (1013, '材料学院', '1973-10-23', 21190226, '讲师');
INSERT INTO `teachertable` VALUES (1014, '计算机科学与技术学院', '1973-03-02', 21190227, '讲师');
INSERT INTO `teachertable` VALUES (1016, '文学院', '2022-09-10', 123456, '教授');
INSERT INTO `teachertable` VALUES (1015, '文学院', '2022-09-10', 11111111, '讲师');
INSERT INTO `teachertable` VALUES (1011, '材料学院', '1986-07-24', 21190224, '讲师');
INSERT INTO `teachertable` VALUES (1018, '文学院', '2022-09-16', 2225, '副教授');
INSERT INTO `teachertable` VALUES (1021, '计算机科学与技术学院', '2022-10-12', 11111111, '副教授');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '员工账号id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工账号',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `password_hash` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `password_salt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码干扰值',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态:1正常/2禁用/9删除',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '21190229', '黄权', '1331a799263170be84f0e2c72ae1d561', '815694', 6, '2022-04-10 01:56:10', '2022-04-10 03:58:10');
INSERT INTO `user` VALUES (19, '19060801', '柯昌二', '1c7c76c2523ffeb3e778d93ff7187d3c', '439991', 1, '2022-06-08 09:04:46', '2022-06-08 09:04:46');
INSERT INTO `user` VALUES (20, '19060802', '杜冠男', '8ed2459f8a74eb840844027f7066ef3d', '419182', 1, '2022-06-08 09:06:56', '2022-06-08 09:06:56');
INSERT INTO `user` VALUES (21, '19060803', '赵健康', 'ed5be1c4589a4b15552dfb1ea52f900c', '241064', 1, '2022-06-08 09:07:26', '2022-06-08 09:07:26');
INSERT INTO `user` VALUES (22, '19060804', '黄权', '02ef57600628cf57428602ae40425bce', '457669', 1, '2022-06-08 09:07:50', '2022-06-08 09:07:50');
INSERT INTO `user` VALUES (23, '19060805', '李帛原', '82821a5682e2b15c5f8ec42d80e451b1', '584050', 1, '2022-06-08 09:08:22', '2022-06-08 09:08:22');
INSERT INTO `user` VALUES (24, '19060806', '林伟', 'f916bc7a4451739ee0d98c5e4eb9b0bc', '849728', 1, '2022-06-08 09:08:52', '2022-06-08 09:08:52');
INSERT INTO `user` VALUES (25, '19060807', '测试用', 'aad6141009de9393c3fa8502f70e197a', '469602', 1, '2022-06-08 09:09:18', '2022-09-14 02:16:38');
INSERT INTO `user` VALUES (26, '19060808', '赵四', '01cca07ea25245119685afba05ce9196', '426970', 1, '2022-06-08 09:09:49', '2022-06-08 09:09:49');
INSERT INTO `user` VALUES (27, '19060809', '狄云', 'a1d905160bef55ca4c485200911c7a7a', '680187', 1, '2022-06-08 09:10:09', '2022-06-08 09:10:33');
INSERT INTO `user` VALUES (28, '19060810', '水生', '9edb808d388cc14d5c9165ab4471231e', '169551', 1, '2022-06-08 09:11:24', '2022-06-08 09:11:24');
INSERT INTO `user` VALUES (29, '19060811', '赵括', '32e40e1e685d234ed56c3e8019b6a7b3', '941143', 1, '2022-06-08 09:11:42', '2022-06-08 09:11:42');
INSERT INTO `user` VALUES (30, '19060812', '廉颇', '527ca61971ee2b2e2c8f2d039649e9b4', '955045', 1, '2022-06-08 09:12:05', '2022-06-08 09:12:05');
INSERT INTO `user` VALUES (31, '19060813', '杨过', 'd13ffcbf3df9baf7b4dda4aa8767af82', '112678', 1, '2022-06-08 09:12:24', '2022-06-08 09:12:24');
INSERT INTO `user` VALUES (32, '19060814', '小龙女', '0600cc6a27ed612199ac59a1eb04baba', '214402', 1, '2022-06-08 09:12:44', '2022-06-08 09:12:44');
INSERT INTO `user` VALUES (33, '1001', '教师你好', 'bca10120d5efbe59ced96a8c938472fa', '557357', 3, '2022-06-08 09:14:16', '2022-06-08 09:14:16');
INSERT INTO `user` VALUES (34, '1002', '教师再见', '96d8d9f6d06426de21d412c1c4c24001', '425654', 3, '2022-06-08 09:14:32', '2022-06-08 09:14:32');
INSERT INTO `user` VALUES (35, '1003', '教师丙', '4a825cc69253448efad400cc2e27436a', '548502', 3, '2022-06-08 09:14:53', '2022-06-08 09:14:53');
INSERT INTO `user` VALUES (36, '1004', '李帛原', 'e1c6d957d6b580d0a54d66086278581b', '614448', 3, '2022-06-08 09:15:09', '2022-06-08 09:15:09');
INSERT INTO `user` VALUES (37, '1005', '教师丁', 'ef529ae51dd4216c152ff3b31304385d', '939226', 3, '2022-06-08 09:15:26', '2022-06-08 09:15:26');
INSERT INTO `user` VALUES (38, '1006', '教师戊', '94571156d4d68dd2a04738b0652d15fc', '186550', 3, '2022-06-08 09:15:42', '2022-06-08 09:15:42');
INSERT INTO `user` VALUES (40, '1007', '教师己', 'b3e1e7938d1f61ad838a079678cfdb91', '655691', 3, '2022-06-08 09:16:22', '2022-06-08 09:16:22');
INSERT INTO `user` VALUES (41, '1008', '教师庚', 'ce55e8f8e5a181f80dd4524aa96c608d', '529393', 3, '2022-06-08 09:17:20', '2022-06-08 09:17:20');
INSERT INTO `user` VALUES (42, '1009', '教师辛', '790873add3f604f1717b79c7713cad29', '615487', 3, '2022-06-08 09:17:36', '2022-06-08 09:17:36');
INSERT INTO `user` VALUES (43, '1010', '教师壬', '0bd853193365720abb1124de5ed73e4b', '334138', 3, '2022-06-08 09:18:39', '2022-06-08 09:18:39');
INSERT INTO `user` VALUES (44, '1011', '教师癸', 'c8271ed3bf6d6e70e16b9a96d35f7ccd', '714896', 3, '2022-06-08 09:19:01', '2022-06-08 09:19:01');
INSERT INTO `user` VALUES (45, '1012', '教师子', '81617297fe19491afda7929d5c7998d0', '676140', 3, '2022-06-08 09:19:16', '2022-06-08 09:19:16');
INSERT INTO `user` VALUES (46, '1013', '教师丑', '8ee564fbcd310434312da7559d4c8886', '862504', 3, '2022-06-08 09:19:34', '2022-06-08 09:19:34');
INSERT INTO `user` VALUES (47, '1014', '教师寅', '96a8158f00da8759df84c7bde3e52652', '732442', 3, '2022-06-08 09:19:49', '2022-06-08 09:19:49');
INSERT INTO `user` VALUES (48, '21190214', '李帛原', '1331a799263170be84f0e2c72ae1d561', '815694', 1, '2022-09-09 17:37:00', '2022-09-10 17:37:04');
INSERT INTO `user` VALUES (69, '21190215', '测试学生', '7a0bcb091bddf0cdc494b6ec34b4c6af', '606752', 1, '2022-09-23 15:57:44', '2022-09-23 15:57:44');
INSERT INTO `user` VALUES (70, '21190216', '测试学生2', '530b9f87c9e7af1d776dd81ba416a31e', '704314', 1, '2022-09-23 15:58:39', '2022-09-23 15:58:39');
INSERT INTO `user` VALUES (72, '1015', '测试教师', '5a55024356528ed841037eaea37303ba', '538644', 3, '2022-09-23 16:16:53', '2022-09-23 16:16:53');
INSERT INTO `user` VALUES (73, '1016', '测试教师2', 'f6c4b9a9c606ac8acae2fd18790eb98a', '874325', 3, '2022-09-27 10:39:22', '2022-09-27 10:39:22');
INSERT INTO `user` VALUES (75, '1018', '测试教师34', 'bda7c7b738d270621303b04bc5f1de03', '920493', 3, '2022-09-27 10:42:17', '2022-09-27 10:42:17');
INSERT INTO `user` VALUES (82, '1021', '测试3', 'eced422578262906dce388d4739f7b49', '412940', 3, '2022-10-05 20:17:45', '2022-10-05 20:17:45');
INSERT INTO `user` VALUES (83, '21190217', '测试', '1363cd25309399ea4e487906f184e7d9', '516690', 1, '2022-10-05 20:39:04', '2022-10-05 20:39:04');

SET FOREIGN_KEY_CHECKS = 1;
