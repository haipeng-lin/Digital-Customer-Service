/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80042 (8.0.42)
 Source Host           : localhost:3306
 Source Schema         : digital-cs-dev

 Target Server Type    : MySQL
 Target Server Version : 80042 (8.0.42)
 File Encoding         : 65001

 Date: 11/02/2026 14:33:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dh_avatar
-- ----------------------------
DROP TABLE IF EXISTS `dh_avatar`;
CREATE TABLE `dh_avatar`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '形象名称',
  `avatar_type` tinyint NULL DEFAULT 1 COMMENT '形象类型（0-2D 1-3D）',
  `tag_type` tinyint NULL DEFAULT 1 COMMENT '标签类型（0-官方 1-推荐 2-个人）',
  `thumbnail_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '缩略图地址',
  `model_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型文件路径',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0-启用 1-禁用）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '形象表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dh_avatar
-- ----------------------------

-- ----------------------------
-- Table structure for dh_avatar_category
-- ----------------------------
DROP TABLE IF EXISTS `dh_avatar_category`;
CREATE TABLE `dh_avatar_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（1-可用 2-禁用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `order_num` int NULL DEFAULT 0 COMMENT '排序',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2021069009938481155 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dh_avatar_category
-- ----------------------------
INSERT INTO `dh_avatar_category` VALUES (2017522206806786049, '000000', '温柔', '0', '234', 0, 103, 1, '2026-01-31 16:55:53', 1, '2026-02-07 11:45:21');
INSERT INTO `dh_avatar_category` VALUES (2021069009938481154, '000000', '文雅', '0', '1', 1, 103, 1, '2026-02-10 11:49:36', 1, '2026-02-10 11:49:36');

-- ----------------------------
-- Table structure for dh_background
-- ----------------------------
DROP TABLE IF EXISTS `dh_background`;
CREATE TABLE `dh_background`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `backgroud_category` bigint NOT NULL COMMENT '分类ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '背景名称',
  `tag_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '标签类型（0-官方 1-推荐 2-个人）',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '背景Url',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0-启用 1-禁用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `order_num` int NULL DEFAULT 0 COMMENT '排序',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category`(`backgroud_category` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '背景表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dh_background
-- ----------------------------

-- ----------------------------
-- Table structure for dh_background_category
-- ----------------------------
DROP TABLE IF EXISTS `dh_background_category`;
CREATE TABLE `dh_background_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0-启用 1-禁用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `order_num` int NULL DEFAULT 0 COMMENT '排序',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2021110437989253122 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '背景分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dh_background_category
-- ----------------------------
INSERT INTO `dh_background_category` VALUES (2021107291711799297, '000000', '会议室', '1', NULL, 1, 103, 1, '2026-02-10 14:21:43', 1, '2026-02-10 14:21:43');
INSERT INTO `dh_background_category` VALUES (2021110437989253121, '000000', '演播厅', '1', '', 2, 103, 1, '2026-02-10 14:34:13', 1, '2026-02-10 14:45:47');

-- ----------------------------
-- Table structure for dh_chat_message
-- ----------------------------
DROP TABLE IF EXISTS `dh_chat_message`;
CREATE TABLE `dh_chat_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户编号',
  `session_id` bigint NOT NULL COMMENT '会话ID',
  `role` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色（user、agent）',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `model_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型名称',
  `prompt_token` int NULL DEFAULT 0 COMMENT '输入Token',
  `completion_token` int NULL DEFAULT 0 COMMENT '输出Token',
  `latency_ms` int NULL DEFAULT 0 COMMENT '耗时（毫秒）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0-成功 1-失败）',
  `feedback` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '评价（0-未评价 1-赞 2-踩）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_session_id`(`session_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '对话消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dh_chat_message
-- ----------------------------

-- ----------------------------
-- Table structure for dh_chat_session
-- ----------------------------
DROP TABLE IF EXISTS `dh_chat_session`;
CREATE TABLE `dh_chat_session`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户编号',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `channel` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '来源渠道（0-网页 1-APP 2-小程序）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0-AI 1-人工 2-已结束）',
  `create_dept` bigint NULL DEFAULT 0 COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2021063706719232002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '对话会话表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dh_chat_session
-- ----------------------------
INSERT INTO `dh_chat_session` VALUES (2021063706719232001, '000000', 1, '2026-2-10 11:45:00 / 用户admin', '2', '0', 103, 1, '2026-02-10 11:28:32', 1, '2026-02-10 11:46:05');

-- ----------------------------
-- Table structure for dh_overlay
-- ----------------------------
DROP TABLE IF EXISTS `dh_overlay`;
CREATE TABLE `dh_overlay`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '贴图名称',
  `tag_type` tinyint NULL DEFAULT 1 COMMENT '标签类型（1-官方 2-推荐 3-个人）',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '贴图Url',
  `order_num` int NULL DEFAULT 0 COMMENT '排序',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '贴图表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dh_overlay
-- ----------------------------

-- ----------------------------
-- Table structure for dh_render_task
-- ----------------------------
DROP TABLE IF EXISTS `dh_render_task`;
CREATE TABLE `dh_render_task`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `project_id` bigint NOT NULL COMMENT '项目ID',
  `progress` int NULL DEFAULT 0 COMMENT '进度百分比',
  `output_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '视频下载地址',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'WAITING' COMMENT '状态（如：WAITING, RENDERING, SUCCESS, FAIL）',
  `error_msg` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '失败原因',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_project_id`(`project_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '渲染任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dh_render_task
-- ----------------------------

-- ----------------------------
-- Table structure for dh_video_project
-- ----------------------------
DROP TABLE IF EXISTS `dh_video_project`;
CREATE TABLE `dh_video_project`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频标题',
  `config_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '核心字段（人物坐标、背景Id、贴图位置）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频项目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dh_video_project
-- ----------------------------

-- ----------------------------
-- Table structure for flow_category
-- ----------------------------
DROP TABLE IF EXISTS `flow_category`;
CREATE TABLE `flow_category`  (
  `category_id` bigint NOT NULL COMMENT '流程分类ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父流程分类id',
  `ancestors` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `category_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程分类名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_category
-- ----------------------------
INSERT INTO `flow_category` VALUES (100, '000000', 0, '0', 'OA审批', 0, '0', 103, 1, '2026-01-13 09:28:52', NULL, NULL);
INSERT INTO `flow_category` VALUES (101, '000000', 100, '0,100', '假勤管理', 0, '0', 103, 1, '2026-01-13 09:28:52', NULL, NULL);
INSERT INTO `flow_category` VALUES (102, '000000', 100, '0,100', '人事管理', 1, '0', 103, 1, '2026-01-13 09:28:52', NULL, NULL);
INSERT INTO `flow_category` VALUES (103, '000000', 101, '0,100,101', '请假', 0, '0', 103, 1, '2026-01-13 09:28:52', NULL, NULL);
INSERT INTO `flow_category` VALUES (104, '000000', 101, '0,100,101', '出差', 1, '0', 103, 1, '2026-01-13 09:28:52', NULL, NULL);
INSERT INTO `flow_category` VALUES (105, '000000', 101, '0,100,101', '加班', 2, '0', 103, 1, '2026-01-13 09:28:52', NULL, NULL);
INSERT INTO `flow_category` VALUES (106, '000000', 101, '0,100,101', '换班', 3, '0', 103, 1, '2026-01-13 09:28:52', NULL, NULL);
INSERT INTO `flow_category` VALUES (107, '000000', 101, '0,100,101', '外出', 4, '0', 103, 1, '2026-01-13 09:28:52', NULL, NULL);
INSERT INTO `flow_category` VALUES (108, '000000', 102, '0,100,102', '转正', 1, '0', 103, 1, '2026-01-13 09:28:52', NULL, NULL);
INSERT INTO `flow_category` VALUES (109, '000000', 102, '0,100,102', '离职', 2, '0', 103, 1, '2026-01-13 09:28:52', NULL, NULL);

-- ----------------------------
-- Table structure for flow_definition
-- ----------------------------
DROP TABLE IF EXISTS `flow_definition`;
CREATE TABLE `flow_definition`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `flow_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程编码',
  `flow_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程名称',
  `model_value` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'CLASSICS' COMMENT '设计器模型（CLASSICS经典模型 MIMIC仿钉钉模型）',
  `category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程类别',
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程版本',
  `is_publish` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否发布（0未发布 1已发布 9失效）',
  `form_custom` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '审批表单是否自定义（Y是 N否）',
  `form_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批表单路径',
  `activity_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '流程激活状态（0挂起 1激活）',
  `listener_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '监听器类型',
  `listener_path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '监听器路径',
  `ext` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业务详情 存业务表对象json字符串',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新人',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_definition
-- ----------------------------

-- ----------------------------
-- Table structure for flow_his_task
-- ----------------------------
DROP TABLE IF EXISTS `flow_his_task`;
CREATE TABLE `flow_his_task`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `definition_id` bigint NOT NULL COMMENT '对应flow_definition表的id',
  `instance_id` bigint NOT NULL COMMENT '对应flow_instance表的id',
  `task_id` bigint NOT NULL COMMENT '对应flow_task表的id',
  `node_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开始节点编码',
  `node_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开始节点名称',
  `node_type` tinyint(1) NULL DEFAULT NULL COMMENT '开始节点类型（0开始节点 1中间节点 2结束节点 3互斥网关 4并行网关）',
  `target_node_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '目标节点编码',
  `target_node_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '结束节点名称',
  `approver` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批人',
  `cooperate_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '协作方式(1审批 2转办 3委派 4会签 5票签 6加签 7减签)',
  `collaborator` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '协作人',
  `skip_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流转类型（PASS通过 REJECT退回 NONE无动作）',
  `flow_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程状态（0待提交 1审批中 2审批通过 4终止 5作废 6撤销 8已完成 9已退回 10失效 11拿回）',
  `form_custom` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '审批表单是否自定义（Y是 N否）',
  `form_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批表单路径',
  `message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批意见',
  `variable` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '任务变量',
  `ext` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '业务详情 存业务表对象json字符串',
  `create_time` datetime NULL DEFAULT NULL COMMENT '任务开始时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '审批完成时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '历史任务记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_his_task
-- ----------------------------

-- ----------------------------
-- Table structure for flow_instance
-- ----------------------------
DROP TABLE IF EXISTS `flow_instance`;
CREATE TABLE `flow_instance`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `definition_id` bigint NOT NULL COMMENT '对应flow_definition表的id',
  `business_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务id',
  `node_type` tinyint(1) NOT NULL COMMENT '节点类型（0开始节点 1中间节点 2结束节点 3互斥网关 4并行网关）',
  `node_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程节点编码',
  `node_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程节点名称',
  `variable` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '任务变量',
  `flow_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程状态（0待提交 1审批中 2审批通过 4终止 5作废 6撤销 8已完成 9已退回 10失效 11拿回）',
  `activity_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '流程激活状态（0挂起 1激活）',
  `def_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '流程定义json',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新人',
  `ext` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '扩展字段，预留给业务系统使用',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程实例表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_instance
-- ----------------------------

-- ----------------------------
-- Table structure for flow_instance_biz_ext
-- ----------------------------
DROP TABLE IF EXISTS `flow_instance_biz_ext`;
CREATE TABLE `flow_instance_biz_ext`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `business_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业务编码',
  `business_title` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业务标题',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `instance_id` bigint NULL DEFAULT NULL COMMENT '流程实例Id',
  `business_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '业务Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程实例业务扩展表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_instance_biz_ext
-- ----------------------------

-- ----------------------------
-- Table structure for flow_node
-- ----------------------------
DROP TABLE IF EXISTS `flow_node`;
CREATE TABLE `flow_node`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `node_type` tinyint(1) NOT NULL COMMENT '节点类型（0开始节点 1中间节点 2结束节点 3互斥网关 4并行网关）',
  `definition_id` bigint NOT NULL COMMENT '流程定义id',
  `node_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程节点编码',
  `node_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程节点名称',
  `permission_flag` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识（权限类型:权限标识，可以多个，用@@隔开)',
  `node_ratio` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流程签署比例值',
  `coordinate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '坐标',
  `any_node_skip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任意结点跳转',
  `listener_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '监听器类型',
  `listener_path` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '监听器路径',
  `form_custom` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '审批表单是否自定义（Y是 N否）',
  `form_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批表单路径',
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '版本',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新人',
  `ext` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '节点扩展属性',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_node
-- ----------------------------

-- ----------------------------
-- Table structure for flow_skip
-- ----------------------------
DROP TABLE IF EXISTS `flow_skip`;
CREATE TABLE `flow_skip`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `definition_id` bigint NOT NULL COMMENT '流程定义id',
  `now_node_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '当前流程节点的编码',
  `now_node_type` tinyint(1) NULL DEFAULT NULL COMMENT '当前节点类型（0开始节点 1中间节点 2结束节点 3互斥网关 4并行网关）',
  `next_node_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '下一个流程节点的编码',
  `next_node_type` tinyint(1) NULL DEFAULT NULL COMMENT '下一个节点类型（0开始节点 1中间节点 2结束节点 3互斥网关 4并行网关）',
  `skip_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '跳转名称',
  `skip_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '跳转类型（PASS审批通过 REJECT退回）',
  `skip_condition` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '跳转条件',
  `coordinate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '坐标',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新人',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '节点跳转关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_skip
-- ----------------------------

-- ----------------------------
-- Table structure for flow_spel
-- ----------------------------
DROP TABLE IF EXISTS `flow_spel`;
CREATE TABLE `flow_spel`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `component_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件名称',
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '方法名',
  `method_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数',
  `view_spel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '预览spel表达式',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程spel表达式定义表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_spel
-- ----------------------------
INSERT INTO `flow_spel` VALUES (1, 'spelRuleComponent', 'selectDeptLeaderById', 'initiatorDeptId', '#{@spelRuleComponent.selectDeptLeaderById(#initiatorDeptId)}', '根据部门id获取部门负责人', '0', '0', 103, 1, '2026-01-13 09:28:53', 1, '2026-01-13 09:28:53');
INSERT INTO `flow_spel` VALUES (2, NULL, NULL, 'initiator', '${initiator}', '流程发起人', '0', '0', 103, 1, '2026-01-13 09:28:53', 1, '2026-01-13 09:28:53');

-- ----------------------------
-- Table structure for flow_task
-- ----------------------------
DROP TABLE IF EXISTS `flow_task`;
CREATE TABLE `flow_task`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `definition_id` bigint NOT NULL COMMENT '对应flow_definition表的id',
  `instance_id` bigint NOT NULL COMMENT '对应flow_instance表的id',
  `node_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '节点编码',
  `node_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '节点名称',
  `node_type` tinyint(1) NOT NULL COMMENT '节点类型（0开始节点 1中间节点 2结束节点 3互斥网关 4并行网关）',
  `flow_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '流程状态（0待提交 1审批中 2审批通过 4终止 5作废 6撤销 8已完成 9已退回 10失效 11拿回）',
  `form_custom` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '审批表单是否自定义（Y是 N否）',
  `form_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批表单路径',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新人',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '待办任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_task
-- ----------------------------

-- ----------------------------
-- Table structure for flow_user
-- ----------------------------
DROP TABLE IF EXISTS `flow_user`;
CREATE TABLE `flow_user`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '人员类型（1待办任务的审批人权限 2待办任务的转办人权限 3待办任务的委托人权限）',
  `processed_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限人',
  `associated` bigint NOT NULL COMMENT '任务表id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建人',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志',
  `tenant_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_processed_type`(`processed_by` ASC, `type` ASC) USING BTREE,
  INDEX `user_associated`(`associated` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '流程用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_user
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL COMMENT '编号',
  `data_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '数据源名称',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (2020756321505050626, 'master', 'dh_chat_message', '对话消息表', NULL, NULL, 'DhChatMessage', 'crud', 'com.flash.human', 'human', 'chatMessage', '对话消息', 'haipeng-lin', '0', '/', '{\"parentMenuId\":\"2020774016992608257\",\"popupComponent\":\"modal\",\"formComponent\":\"useForm\"}', 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:07', NULL);
INSERT INTO `gen_table` VALUES (2020756323388293121, 'master', 'dh_chat_session', '对话会话表', NULL, NULL, 'DhChatSession', 'crud', 'com.flash.human', 'human', 'chatSession', '对话会话', 'haipeng-lin', '0', '/', '{\"parentMenuId\":\"2020774016992608257\",\"popupComponent\":\"modal\",\"formComponent\":\"useForm\"}', 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:00', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (2020756323124051969, 2020756321505050626, 'id', 'ID', 'bigint', 'Long', 'id', '1', '1', '1', '0', '1', '1', '0', 'EQ', 'input', '', 1, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:07');
INSERT INTO `gen_table_column` VALUES (2020756323124051970, 2020756321505050626, 'tenant_id', '租户编号', 'varchar(20)', 'String', 'tenantId', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 2, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:07');
INSERT INTO `gen_table_column` VALUES (2020756323124051971, 2020756321505050626, 'session_id', '会话ID', 'bigint', 'Long', 'sessionId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:07');
INSERT INTO `gen_table_column` VALUES (2020756323124051972, 2020756321505050626, 'role', '角色（user、agent）', 'varchar(10)', 'String', 'role', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:07');
INSERT INTO `gen_table_column` VALUES (2020756323124051973, 2020756321505050626, 'content', '内容', 'text', 'String', 'content', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', '', 5, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:07');
INSERT INTO `gen_table_column` VALUES (2020756323124051974, 2020756321505050626, 'model_name', '模型名称', 'varchar(50)', 'String', 'modelName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 6, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:07');
INSERT INTO `gen_table_column` VALUES (2020756323124051975, 2020756321505050626, 'prompt_token', '输入Token', 'int', 'Long', 'promptToken', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:07');
INSERT INTO `gen_table_column` VALUES (2020756323191160833, 2020756321505050626, 'completion_token', '输出Token', 'int', 'Long', 'completionToken', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:07');
INSERT INTO `gen_table_column` VALUES (2020756323191160834, 2020756321505050626, 'latency_ms', '耗时（毫秒）', 'int', 'Long', 'latencyMs', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:07');
INSERT INTO `gen_table_column` VALUES (2020756323191160835, 2020756321505050626, 'status', '状态（0-成功 1-失败）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 10, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:07');
INSERT INTO `gen_table_column` VALUES (2020756323191160836, 2020756321505050626, 'feedback', '评价（0-未评价 1-赞 2-踩）', 'char(1)', 'String', 'feedback', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:07');
INSERT INTO `gen_table_column` VALUES (2020756323191160837, 2020756321505050626, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 12, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:07');
INSERT INTO `gen_table_column` VALUES (2020756323191160838, 2020756321505050626, 'create_by', '创建者', 'bigint', 'Long', 'createBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 13, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:07');
INSERT INTO `gen_table_column` VALUES (2020756323191160839, 2020756321505050626, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 14, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:07');
INSERT INTO `gen_table_column` VALUES (2020756323191160840, 2020756321505050626, 'update_by', '更新者', 'bigint', 'Long', 'updateBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 15, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:07');
INSERT INTO `gen_table_column` VALUES (2020756323191160841, 2020756321505050626, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 16, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:07');
INSERT INTO `gen_table_column` VALUES (2020756323656728578, 2020756323388293121, 'id', 'ID', 'bigint', 'Long', 'id', '1', '1', '1', '0', '1', '1', '0', 'EQ', 'input', '', 1, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:00');
INSERT INTO `gen_table_column` VALUES (2020756323656728579, 2020756323388293121, 'tenant_id', '租户编号', 'varchar(20)', 'String', 'tenantId', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', NULL, 2, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:00');
INSERT INTO `gen_table_column` VALUES (2020756323656728581, 2020756323388293121, 'title', '标题', 'varchar(50)', 'String', 'title', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:00');
INSERT INTO `gen_table_column` VALUES (2020756323656728582, 2020756323388293121, 'channel', '来源渠道（0-网页 1-APP 2-小程序）', 'char(1)', 'String', 'channel', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:00');
INSERT INTO `gen_table_column` VALUES (2020756323656728583, 2020756323388293121, 'status', '状态（0-AI 1-人工 2-已结束）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:00');
INSERT INTO `gen_table_column` VALUES (2020756323656728584, 2020756323388293121, 'create_dept', '创建部门', 'bigint', 'Long', 'createDept', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', NULL, 7, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:00');
INSERT INTO `gen_table_column` VALUES (2020756323656728585, 2020756323388293121, 'create_by', '创建者', 'bigint', 'Long', 'createBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', NULL, 8, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:00');
INSERT INTO `gen_table_column` VALUES (2020756323656728586, 2020756323388293121, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', NULL, 9, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:00');
INSERT INTO `gen_table_column` VALUES (2020756323656728587, 2020756323388293121, 'update_by', '更新者', 'bigint', 'Long', 'updateBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', NULL, 10, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:00');
INSERT INTO `gen_table_column` VALUES (2020756323656728588, 2020756323388293121, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', NULL, 11, 103, 1, '2026-02-09 15:07:06', 1, '2026-02-10 09:28:00');
INSERT INTO `gen_table_column` VALUES (2020768363800625153, 2020756323388293121, 'user_id', '用户ID', 'bigint', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 103, 1, '2026-02-09 15:54:57', 1, '2026-02-10 09:28:00');

-- ----------------------------
-- Table structure for kb_category
-- ----------------------------
DROP TABLE IF EXISTS `kb_category`;
CREATE TABLE `kb_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名称',
  `order_num` int NULL DEFAULT NULL COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态（0-禁用 1-启用）',
  `create_dept` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2020033554698719234 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kb_category
-- ----------------------------
INSERT INTO `kb_category` VALUES (2018579022277959682, '000000', NULL, '2026年启点赛', 40, '0', '103', '1', '2026-02-03 14:55:17', '1', '2026-02-07 13:59:00');
INSERT INTO `kb_category` VALUES (2018579148060942337, '000000', NULL, '2025年冠军赛', 5, '0', '103', '1', '2026-02-03 14:55:47', '1', '2026-02-07 11:22:06');
INSERT INTO `kb_category` VALUES (2019942925473898497, '000000', NULL, '2025年启点赛', 1, '0', '103', '1', '2026-02-07 09:14:57', '1', '2026-02-07 09:14:57');
INSERT INTO `kb_category` VALUES (2020033554698719233, '000000', NULL, '积光', 1111, '0', '103', '1', '2026-02-07 15:15:05', '1', '2026-02-07 15:15:05');

-- ----------------------------
-- Table structure for kb_document
-- ----------------------------
DROP TABLE IF EXISTS `kb_document`;
CREATE TABLE `kb_document`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `kb_category_id` bigint NULL DEFAULT NULL COMMENT '知识库分类id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态（0-禁用 1-启用）',
  `create_dept` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2021118152572579843 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kb_document
-- ----------------------------
INSERT INTO `kb_document` VALUES (2018935167005954050, '000000', NULL, 2018579148060942337, '赛制', '123', '1', '0', '103', '1', '2026-02-04 14:30:28', '1', '2026-02-04 14:30:28');
INSERT INTO `kb_document` VALUES (2018941989372760065, '000000', NULL, 2019942925473898497, '赛制', '123', '4444444444', '0', '103', '1', '2026-02-04 14:57:35', '1', '2026-02-07 10:06:57');
INSERT INTO `kb_document` VALUES (2019947525295734786, '000000', NULL, 2018579022277959682, '赛制', NULL, NULL, '0', '103', '1', '2026-02-07 09:33:14', '1', '2026-02-07 09:33:14');
INSERT INTO `kb_document` VALUES (2020033635980136450, '000000', NULL, 2020033554698719233, '积光产品系列', '产品系列', '积光产品系列有：\n1.1201系列\n2.灯条系列\n3.防水灯系列\n4.工程灯\n5.UFO系列\n6.X9系列\n7.瓢虫灯（九鼎）\n8.O2', '0', '103', '1', '2026-02-07 15:15:24', '1', '2026-02-10 15:24:17');
INSERT INTO `kb_document` VALUES (2020033796080914433, '000000', NULL, 2020033554698719233, '使用教程', '使用教程', '使用灯的教程如下：\n1. 拆开包装，检查是否缺少零件\n2. 检查外包装的Sn码和灯体的二维码上的Sn码是否一致\n3. 将灯通上电，检查灯是否亮\n3. 打开地平线APP，点击右上角添加设备，添加完，扫码(灯体上的二维码)激活', '0', '103', '1', '2026-02-07 15:16:02', '1', '2026-02-10 15:24:35');
INSERT INTO `kb_document` VALUES (2020046662548828161, '000000', NULL, 2020033554698719233, '积光经销商', '官方', '积光水族灯的经销商有：九一一、景原部落、韵之海', '0', '103', '1', '2026-02-07 16:07:10', '1', '2026-02-10 15:23:43');
INSERT INTO `kb_document` VALUES (2021118152572579842, '000000', NULL, 2020033554698719233, '积光品牌介绍', '公司', 'ZETLIGHT贸易有限公司于2004年在香港成立。同年，Zetlight电子公司在广州成立。Zetlight致力于产品设计与创新，拥有先进的研发能力，并配备先进的生产设施，生产最新的LED照明设备以及其他用于水族馆和其他行业的相关设备。我们强大的开发团队使我们在过去十年中成为行业领先的公司之一。ZETLIGHT商标在欧洲、北美和东南亚得到了广泛认可和高度推荐。Zetlight还一直与海洋公园和公共水族馆合作，为中国大陆、香港以及其他亚洲和欧洲国家提供照明解决方案。\n', '0', '103', '1', '2026-02-10 15:04:53', '1', '2026-02-10 15:23:08');

-- ----------------------------
-- Table structure for sj_distributed_lock
-- ----------------------------
DROP TABLE IF EXISTS `sj_distributed_lock`;
CREATE TABLE `sj_distributed_lock`  (
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '锁名称',
  `lock_until` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '锁定时长',
  `locked_at` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '锁定时间',
  `locked_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '锁定者',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '锁定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_distributed_lock
-- ----------------------------

-- ----------------------------
-- Table structure for sj_group_config
-- ----------------------------
DROP TABLE IF EXISTS `sj_group_config`;
CREATE TABLE `sj_group_config`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '组名称',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '组描述',
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'SJ_cKqBTPzCsWA3VyuCfFoccmuIEGXjr5KT' COMMENT 'token',
  `group_status` tinyint NOT NULL DEFAULT 0 COMMENT '组状态 0、未启用 1、启用',
  `version` int NOT NULL COMMENT '版本号',
  `group_partition` int NOT NULL COMMENT '分区',
  `id_generator_mode` tinyint NOT NULL DEFAULT 1 COMMENT '唯一id生成模式 默认号段模式',
  `init_scene` tinyint NOT NULL DEFAULT 0 COMMENT '是否初始化场景 0:否 1:是',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '组配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_group_config
-- ----------------------------
INSERT INTO `sj_group_config` VALUES (1, 'dev', 'ruoyi_group', '', 'SJ_cKqBTPzCsWA3VyuCfFoccmuIEGXjr5KT', 1, 1, 0, 1, 1, '2026-01-13 09:29:40', '2026-01-13 09:29:40');
INSERT INTO `sj_group_config` VALUES (2, 'prod', 'ruoyi_group', '', 'SJ_cKqBTPzCsWA3VyuCfFoccmuIEGXjr5KT', 1, 1, 0, 1, 1, '2026-01-13 09:29:40', '2026-01-13 09:29:40');

-- ----------------------------
-- Table structure for sj_job
-- ----------------------------
DROP TABLE IF EXISTS `sj_job`;
CREATE TABLE `sj_job`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `args_str` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '执行方法参数',
  `args_type` tinyint NOT NULL DEFAULT 1 COMMENT '参数类型 ',
  `next_trigger_at` bigint NOT NULL COMMENT '下次触发时间',
  `job_status` tinyint NOT NULL DEFAULT 1 COMMENT '任务状态 0、关闭、1、开启',
  `task_type` tinyint NOT NULL DEFAULT 1 COMMENT '任务类型 1、集群 2、广播 3、切片',
  `route_key` tinyint NOT NULL DEFAULT 4 COMMENT '路由策略',
  `executor_type` tinyint NOT NULL DEFAULT 1 COMMENT '执行器类型',
  `executor_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器名称',
  `trigger_type` tinyint NOT NULL COMMENT '触发类型 1.CRON 表达式 2. 固定时间',
  `trigger_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '间隔时长',
  `block_strategy` tinyint NOT NULL DEFAULT 1 COMMENT '阻塞策略 1、丢弃 2、覆盖 3、并行 4、恢复',
  `executor_timeout` int NOT NULL DEFAULT 0 COMMENT '任务执行超时时间，单位秒',
  `max_retry_times` int NOT NULL DEFAULT 0 COMMENT '最大重试次数',
  `parallel_num` int NOT NULL DEFAULT 1 COMMENT '并行数',
  `retry_interval` int NOT NULL DEFAULT 0 COMMENT '重试间隔(s)',
  `bucket_index` int NOT NULL DEFAULT 0 COMMENT 'bucket',
  `resident` tinyint NOT NULL DEFAULT 0 COMMENT '是否是常驻任务',
  `notify_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '通知告警场景配置id列表',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '负责人id',
  `labels` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '标签',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '描述',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE,
  INDEX `idx_job_status_bucket_index`(`job_status` ASC, `bucket_index` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_job
-- ----------------------------
INSERT INTO `sj_job` VALUES (1, 'dev', 'ruoyi_group', 'demo-job', NULL, 1, 1710344035622, 1, 1, 4, 1, 'testJobExecutor', 2, '60', 1, 60, 3, 1, 1, 116, 0, '', 1, '', '', '', 0, '2026-01-13 09:29:47', '2026-01-13 09:29:47');

-- ----------------------------
-- Table structure for sj_job_executor
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_executor`;
CREATE TABLE `sj_job_executor`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `executor_info` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务执行器名称',
  `executor_type` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '1:java 2:python 3:go',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务执行器信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_job_executor
-- ----------------------------

-- ----------------------------
-- Table structure for sj_job_log_message
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_log_message`;
CREATE TABLE `sj_job_log_message`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务信息id',
  `task_batch_id` bigint NOT NULL COMMENT '任务批次id',
  `task_id` bigint NOT NULL COMMENT '调度任务id',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度信息',
  `log_num` int NOT NULL DEFAULT 1 COMMENT '日志数量',
  `real_time` bigint NOT NULL DEFAULT 0 COMMENT '上报时间',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_task_batch_id_task_id`(`task_batch_id` ASC, `task_id` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_job_log_message
-- ----------------------------

-- ----------------------------
-- Table structure for sj_job_summary
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_summary`;
CREATE TABLE `sj_job_summary`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '组名称',
  `business_id` bigint NOT NULL COMMENT '业务id (job_id或workflow_id)',
  `system_task_type` tinyint NOT NULL DEFAULT 3 COMMENT '任务类型 3、JOB任务 4、WORKFLOW任务',
  `trigger_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '统计时间',
  `success_num` int NOT NULL DEFAULT 0 COMMENT '执行成功-日志数量',
  `fail_num` int NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
  `fail_reason` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '失败原因',
  `stop_num` int NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
  `stop_reason` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '失败原因',
  `cancel_num` int NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
  `cancel_reason` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '失败原因',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_trigger_at_system_task_type_business_id`(`trigger_at` ASC, `system_task_type` ASC, `business_id` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name_business_id`(`namespace_id` ASC, `group_name` ASC, `business_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'DashBoard_Job' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_job_summary
-- ----------------------------

-- ----------------------------
-- Table structure for sj_job_task
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_task`;
CREATE TABLE `sj_job_task`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务信息id',
  `task_batch_id` bigint NOT NULL COMMENT '调度任务id',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '父执行器id',
  `task_status` tinyint NOT NULL DEFAULT 0 COMMENT '执行的状态 0、失败 1、成功',
  `retry_count` int NOT NULL DEFAULT 0 COMMENT '重试次数',
  `mr_stage` tinyint NULL DEFAULT NULL COMMENT '动态分片所处阶段 1:map 2:reduce 3:mergeReduce',
  `leaf` tinyint NOT NULL DEFAULT 1 COMMENT '叶子节点',
  `task_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `client_info` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户端地址 clientId#ip:port',
  `wf_context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '工作流全局上下文',
  `result_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行结果',
  `args_str` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '执行方法参数',
  `args_type` tinyint NOT NULL DEFAULT 1 COMMENT '参数类型 ',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_task_batch_id_task_status`(`task_batch_id` ASC, `task_status` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务实例' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_job_task
-- ----------------------------

-- ----------------------------
-- Table structure for sj_job_task_batch
-- ----------------------------
DROP TABLE IF EXISTS `sj_job_task_batch`;
CREATE TABLE `sj_job_task_batch`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务id',
  `workflow_node_id` bigint NOT NULL DEFAULT 0 COMMENT '工作流节点id',
  `parent_workflow_node_id` bigint NOT NULL DEFAULT 0 COMMENT '工作流任务父批次id',
  `workflow_task_batch_id` bigint NOT NULL DEFAULT 0 COMMENT '工作流任务批次id',
  `task_batch_status` tinyint NOT NULL DEFAULT 0 COMMENT '任务批次状态 0、失败 1、成功',
  `operation_reason` tinyint NOT NULL DEFAULT 0 COMMENT '操作原因',
  `execution_at` bigint NOT NULL DEFAULT 0 COMMENT '任务执行时间',
  `system_task_type` tinyint NOT NULL DEFAULT 3 COMMENT '任务类型 3、JOB任务 4、WORKFLOW任务',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '父节点',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_job_id_task_batch_status`(`job_id` ASC, `task_batch_status` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE,
  INDEX `idx_workflow_task_batch_id_workflow_node_id`(`workflow_task_batch_id` ASC, `workflow_node_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务批次' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_job_task_batch
-- ----------------------------

-- ----------------------------
-- Table structure for sj_namespace
-- ----------------------------
DROP TABLE IF EXISTS `sj_namespace`;
CREATE TABLE `sj_namespace`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
  `unique_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '唯一id',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '描述',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_unique_id`(`unique_id` ASC) USING BTREE,
  INDEX `idx_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '命名空间' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_namespace
-- ----------------------------
INSERT INTO `sj_namespace` VALUES (1, 'Development', 'dev', '', 0, '2026-01-13 09:29:39', '2026-01-13 09:29:39');
INSERT INTO `sj_namespace` VALUES (2, 'Production', 'prod', '', 0, '2026-01-13 09:29:39', '2026-01-13 09:29:39');

-- ----------------------------
-- Table structure for sj_notify_config
-- ----------------------------
DROP TABLE IF EXISTS `sj_notify_config`;
CREATE TABLE `sj_notify_config`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `notify_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '通知名称',
  `system_task_type` tinyint NOT NULL DEFAULT 3 COMMENT '任务类型 1. 重试任务 2. 重试回调 3、JOB任务 4、WORKFLOW任务',
  `notify_status` tinyint NOT NULL DEFAULT 0 COMMENT '通知状态 0、未启用 1、启用',
  `recipient_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '接收人id列表',
  `notify_threshold` int NOT NULL DEFAULT 0 COMMENT '通知阈值',
  `notify_scene` tinyint NOT NULL DEFAULT 0 COMMENT '通知场景',
  `rate_limiter_status` tinyint NOT NULL DEFAULT 0 COMMENT '限流状态 0、未启用 1、启用',
  `rate_limiter_threshold` int NOT NULL DEFAULT 0 COMMENT '每秒限流阈值',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '描述',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_namespace_id_group_name_scene_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_notify_config
-- ----------------------------

-- ----------------------------
-- Table structure for sj_notify_recipient
-- ----------------------------
DROP TABLE IF EXISTS `sj_notify_recipient`;
CREATE TABLE `sj_notify_recipient`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `recipient_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '接收人名称',
  `notify_type` tinyint NOT NULL DEFAULT 0 COMMENT '通知类型 1、钉钉 2、邮件 3、企业微信 4 飞书 5 webhook',
  `notify_attribute` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '配置属性',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '描述',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_namespace_id`(`namespace_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '告警通知接收人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_notify_recipient
-- ----------------------------

-- ----------------------------
-- Table structure for sj_retry
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry`;
CREATE TABLE `sj_retry`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `group_id` bigint NOT NULL COMMENT '组Id',
  `scene_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '场景名称',
  `scene_id` bigint NOT NULL COMMENT '场景ID',
  `idempotent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '幂等id',
  `biz_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '业务编号',
  `executor_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '执行器名称',
  `args_str` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行方法参数',
  `ext_attrs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '扩展字段',
  `serializer_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'jackson' COMMENT '执行方法参数序列化器名称',
  `next_trigger_at` bigint NOT NULL COMMENT '下次触发时间',
  `retry_count` int NOT NULL DEFAULT 0 COMMENT '重试次数',
  `retry_status` tinyint NOT NULL DEFAULT 0 COMMENT '重试状态 0、重试中 1、成功 2、最大重试次数',
  `task_type` tinyint NOT NULL DEFAULT 1 COMMENT '任务类型 1、重试数据 2、回调数据',
  `bucket_index` int NOT NULL DEFAULT 0 COMMENT 'bucket',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '父节点id',
  `deleted` bigint NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_scene_tasktype_idempotentid_deleted`(`scene_id` ASC, `task_type` ASC, `idempotent_id` ASC, `deleted` ASC) USING BTREE,
  INDEX `idx_biz_no`(`biz_no` ASC) USING BTREE,
  INDEX `idx_idempotent_id`(`idempotent_id` ASC) USING BTREE,
  INDEX `idx_retry_status_bucket_index`(`retry_status` ASC, `bucket_index` ASC) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '重试信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_retry
-- ----------------------------

-- ----------------------------
-- Table structure for sj_retry_dead_letter
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_dead_letter`;
CREATE TABLE `sj_retry_dead_letter`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `group_id` bigint NOT NULL COMMENT '组Id',
  `scene_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '场景名称',
  `scene_id` bigint NOT NULL COMMENT '场景ID',
  `idempotent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '幂等id',
  `biz_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '业务编号',
  `executor_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '执行器名称',
  `serializer_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'jackson' COMMENT '执行方法参数序列化器名称',
  `args_str` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行方法参数',
  `ext_attrs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '扩展字段',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_namespace_id_group_name_scene_name`(`namespace_id` ASC, `group_name` ASC, `scene_name` ASC) USING BTREE,
  INDEX `idx_idempotent_id`(`idempotent_id` ASC) USING BTREE,
  INDEX `idx_biz_no`(`biz_no` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '死信队列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_retry_dead_letter
-- ----------------------------

-- ----------------------------
-- Table structure for sj_retry_scene_config
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_scene_config`;
CREATE TABLE `sj_retry_scene_config`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `scene_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '场景名称',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `scene_status` tinyint NOT NULL DEFAULT 0 COMMENT '组状态 0、未启用 1、启用',
  `max_retry_count` int NOT NULL DEFAULT 5 COMMENT '最大重试次数',
  `back_off` tinyint NOT NULL DEFAULT 1 COMMENT '1、默认等级 2、固定间隔时间 3、CRON 表达式',
  `trigger_interval` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '间隔时长',
  `notify_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '通知告警场景配置id列表',
  `deadline_request` bigint UNSIGNED NOT NULL DEFAULT 60000 COMMENT 'Deadline Request 调用链超时 单位毫秒',
  `executor_timeout` int UNSIGNED NOT NULL DEFAULT 5 COMMENT '任务执行超时时间，单位秒',
  `route_key` tinyint NOT NULL DEFAULT 4 COMMENT '路由策略',
  `block_strategy` tinyint NOT NULL DEFAULT 1 COMMENT '阻塞策略 1、丢弃 2、覆盖 3、并行',
  `cb_status` tinyint NOT NULL DEFAULT 0 COMMENT '回调状态 0、不开启 1、开启',
  `cb_trigger_type` tinyint NOT NULL DEFAULT 1 COMMENT '1、默认等级 2、固定间隔时间 3、CRON 表达式',
  `cb_max_count` int NOT NULL DEFAULT 16 COMMENT '回调的最大执行次数',
  `cb_trigger_interval` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '回调的最大执行次数',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '负责人id',
  `labels` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '标签',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '描述',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_namespace_id_group_name_scene_name`(`namespace_id` ASC, `group_name` ASC, `scene_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '场景配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_retry_scene_config
-- ----------------------------

-- ----------------------------
-- Table structure for sj_retry_summary
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_summary`;
CREATE TABLE `sj_retry_summary`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '组名称',
  `scene_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '场景名称',
  `trigger_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '统计时间',
  `running_num` int NOT NULL DEFAULT 0 COMMENT '重试中-日志数量',
  `finish_num` int NOT NULL DEFAULT 0 COMMENT '重试完成-日志数量',
  `max_count_num` int NOT NULL DEFAULT 0 COMMENT '重试到达最大次数-日志数量',
  `suspend_num` int NOT NULL DEFAULT 0 COMMENT '暂停重试-日志数量',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_scene_name_trigger_at`(`namespace_id` ASC, `group_name` ASC, `scene_name` ASC, `trigger_at` ASC) USING BTREE,
  INDEX `idx_trigger_at`(`trigger_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'DashBoard_Retry' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_retry_summary
-- ----------------------------

-- ----------------------------
-- Table structure for sj_retry_task
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_task`;
CREATE TABLE `sj_retry_task`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `scene_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '场景名称',
  `retry_id` bigint NOT NULL COMMENT '重试信息Id',
  `ext_attrs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '扩展字段',
  `task_status` tinyint NOT NULL DEFAULT 1 COMMENT '重试状态',
  `task_type` tinyint NOT NULL DEFAULT 1 COMMENT '任务类型 1、重试数据 2、回调数据',
  `operation_reason` tinyint NOT NULL DEFAULT 0 COMMENT '操作原因',
  `client_info` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户端地址 clientId#ip:port',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_group_name_scene_name`(`namespace_id` ASC, `group_name` ASC, `scene_name` ASC) USING BTREE,
  INDEX `task_status`(`task_status` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE,
  INDEX `idx_retry_id`(`retry_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '重试任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_retry_task
-- ----------------------------

-- ----------------------------
-- Table structure for sj_retry_task_log_message
-- ----------------------------
DROP TABLE IF EXISTS `sj_retry_task_log_message`;
CREATE TABLE `sj_retry_task_log_message`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `retry_id` bigint NOT NULL COMMENT '重试信息Id',
  `retry_task_id` bigint NOT NULL COMMENT '重试任务Id',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '异常信息',
  `log_num` int NOT NULL DEFAULT 1 COMMENT '日志数量',
  `real_time` bigint NOT NULL DEFAULT 0 COMMENT '上报时间',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_namespace_id_group_name_retry_task_id`(`namespace_id` ASC, `group_name` ASC, `retry_task_id` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务调度日志信息记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_retry_task_log_message
-- ----------------------------

-- ----------------------------
-- Table structure for sj_server_node
-- ----------------------------
DROP TABLE IF EXISTS `sj_server_node`;
CREATE TABLE `sj_server_node`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `host_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主机id',
  `host_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '机器ip',
  `host_port` int NOT NULL COMMENT '机器端口',
  `expire_at` datetime NOT NULL COMMENT '过期时间',
  `node_type` tinyint NOT NULL COMMENT '节点类型 1、客户端 2、是服务端',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `labels` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '标签',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_host_id_host_ip`(`host_id` ASC, `host_ip` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE,
  INDEX `idx_expire_at_node_type`(`expire_at` ASC, `node_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '服务器节点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_server_node
-- ----------------------------

-- ----------------------------
-- Table structure for sj_system_user
-- ----------------------------
DROP TABLE IF EXISTS `sj_system_user`;
CREATE TABLE `sj_system_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL DEFAULT 0 COMMENT '角色：1-普通用户、2-管理员',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_system_user
-- ----------------------------
INSERT INTO `sj_system_user` VALUES (1, 'admin', '465c194afb65670f38322df087f0a9bb225cc257e43eb4ac5a0c98ef5b3173ac', 2, '2026-01-13 09:29:46', '2026-01-13 09:29:46');

-- ----------------------------
-- Table structure for sj_system_user_permission
-- ----------------------------
DROP TABLE IF EXISTS `sj_system_user_permission`;
CREATE TABLE `sj_system_user_permission`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `system_user_id` bigint NOT NULL COMMENT '系统用户id',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_namespace_id_group_name_system_user_id`(`namespace_id` ASC, `group_name` ASC, `system_user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_system_user_permission
-- ----------------------------

-- ----------------------------
-- Table structure for sj_workflow
-- ----------------------------
DROP TABLE IF EXISTS `sj_workflow`;
CREATE TABLE `sj_workflow`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `workflow_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工作流名称',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `workflow_status` tinyint NOT NULL DEFAULT 1 COMMENT '工作流状态 0、关闭、1、开启',
  `trigger_type` tinyint NOT NULL COMMENT '触发类型 1.CRON 表达式 2. 固定时间',
  `trigger_interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '间隔时长',
  `next_trigger_at` bigint NOT NULL COMMENT '下次触发时间',
  `block_strategy` tinyint NOT NULL DEFAULT 1 COMMENT '阻塞策略 1、丢弃 2、覆盖 3、并行',
  `executor_timeout` int NOT NULL DEFAULT 0 COMMENT '任务执行超时时间，单位秒',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '描述',
  `flow_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '流程信息',
  `wf_context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '上下文',
  `notify_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '通知告警场景配置id列表',
  `bucket_index` int NOT NULL DEFAULT 0 COMMENT 'bucket',
  `version` int NOT NULL COMMENT '版本号',
  `owner_id` bigint NULL DEFAULT NULL COMMENT '负责人id',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工作流' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_workflow
-- ----------------------------

-- ----------------------------
-- Table structure for sj_workflow_node
-- ----------------------------
DROP TABLE IF EXISTS `sj_workflow_node`;
CREATE TABLE `sj_workflow_node`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `node_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '节点名称',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `job_id` bigint NOT NULL COMMENT '任务信息id',
  `workflow_id` bigint NOT NULL COMMENT '工作流ID',
  `node_type` tinyint NOT NULL DEFAULT 1 COMMENT '1、任务节点 2、条件节点',
  `expression_type` tinyint NOT NULL DEFAULT 0 COMMENT '1、SpEl、2、Aviator 3、QL',
  `fail_strategy` tinyint NOT NULL DEFAULT 1 COMMENT '失败策略 1、跳过 2、阻塞',
  `workflow_node_status` tinyint NOT NULL DEFAULT 1 COMMENT '工作流节点状态 0、关闭、1、开启',
  `priority_level` int NOT NULL DEFAULT 1 COMMENT '优先级',
  `node_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '节点信息 ',
  `version` int NOT NULL COMMENT '版本号',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工作流节点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_workflow_node
-- ----------------------------

-- ----------------------------
-- Table structure for sj_workflow_task_batch
-- ----------------------------
DROP TABLE IF EXISTS `sj_workflow_task_batch`;
CREATE TABLE `sj_workflow_task_batch`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `namespace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '764d604ec6fc45f68cd92514c40e9e1a' COMMENT '命名空间id',
  `group_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组名称',
  `workflow_id` bigint NOT NULL COMMENT '工作流任务id',
  `task_batch_status` tinyint NOT NULL DEFAULT 0 COMMENT '任务批次状态 0、失败 1、成功',
  `operation_reason` tinyint NOT NULL DEFAULT 0 COMMENT '操作原因',
  `flow_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '流程信息',
  `wf_context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '全局上下文',
  `execution_at` bigint NOT NULL DEFAULT 0 COMMENT '任务执行时间',
  `ext_attrs` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `version` int NOT NULL DEFAULT 1 COMMENT '版本号',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除 1、删除',
  `create_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_job_id_task_batch_status`(`workflow_id` ASC, `task_batch_status` ASC) USING BTREE,
  INDEX `idx_create_dt`(`create_dt` ASC) USING BTREE,
  INDEX `idx_namespace_id_group_name`(`namespace_id` ASC, `group_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工作流批次' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sj_workflow_task_batch
-- ----------------------------

-- ----------------------------
-- Table structure for sys_app_download_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_download_log`;
CREATE TABLE `sys_app_download_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型（1-国内 2-国外）',
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'User-Agent',
  `brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌',
  `os_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '系统版本',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器',
  `target_platform` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '目标平台',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '扫码IP',
  `create_time` datetime NULL DEFAULT NULL COMMENT '扫码时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_app_download_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_client
-- ----------------------------
DROP TABLE IF EXISTS `sys_client`;
CREATE TABLE `sys_client`  (
  `id` bigint NOT NULL COMMENT 'id',
  `client_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户端id',
  `client_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户端key',
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户端秘钥',
  `grant_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '授权类型',
  `device_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备类型',
  `active_timeout` int NULL DEFAULT 1800 COMMENT 'token活跃超时时间',
  `timeout` int NULL DEFAULT 604800 COMMENT 'token固定超时',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统授权表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_client
-- ----------------------------
INSERT INTO `sys_client` VALUES (1, 'e5cd7e4891bf95d1d19206ce24a7b32e', 'pc', 'pc123', 'password,social', 'pc', 36000, 604800, '0', '0', 103, 1, '2026-01-13 09:28:39', 1, '2026-02-03 15:56:26');
INSERT INTO `sys_client` VALUES (2, '428a8310cd442757ae699df5d894f051', 'app', 'app123', 'password,sms,social', 'android', 1800, 604800, '0', '0', 103, 1, '2026-01-13 09:28:39', 1, '2026-01-13 09:28:39');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` bigint NOT NULL COMMENT '参数主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '000000', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 103, 1, '2026-01-13 09:28:36', NULL, NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '000000', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 103, 1, '2026-01-13 09:28:36', NULL, NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '000000', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 103, 1, '2026-01-13 09:28:36', NULL, NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (5, '000000', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 103, 1, '2026-01-13 09:28:36', NULL, NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (11, '000000', 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'true', 'Y', 103, 1, '2026-01-13 09:28:36', NULL, NULL, 'true:开启, false:关闭');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `dept_category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门类别编码',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` bigint NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, '000000', 0, '0', 'XXX科技', NULL, 0, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2026-01-13 09:28:31', NULL, NULL);
INSERT INTO `sys_dept` VALUES (101, '000000', 100, '0,100', '深圳总公司', NULL, 1, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2026-01-13 09:28:31', NULL, NULL);
INSERT INTO `sys_dept` VALUES (102, '000000', 100, '0,100', '长沙分公司', NULL, 2, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2026-01-13 09:28:31', NULL, NULL);
INSERT INTO `sys_dept` VALUES (103, '000000', 101, '0,100,101', '研发部门', NULL, 1, 1, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2026-01-13 09:28:31', NULL, NULL);
INSERT INTO `sys_dept` VALUES (104, '000000', 101, '0,100,101', '市场部门', NULL, 2, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2026-01-13 09:28:31', NULL, NULL);
INSERT INTO `sys_dept` VALUES (105, '000000', 101, '0,100,101', '测试部门', NULL, 3, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2026-01-13 09:28:31', NULL, NULL);
INSERT INTO `sys_dept` VALUES (106, '000000', 101, '0,100,101', '财务部门', NULL, 4, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2026-01-13 09:28:31', NULL, NULL);
INSERT INTO `sys_dept` VALUES (107, '000000', 101, '0,100,101', '运维部门', NULL, 5, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2026-01-13 09:28:31', NULL, NULL);
INSERT INTO `sys_dept` VALUES (108, '000000', 102, '0,100,102', '市场部门', NULL, 1, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2026-01-13 09:28:31', NULL, NULL);
INSERT INTO `sys_dept` VALUES (109, '000000', 102, '0,100,102', '财务部门', NULL, 2, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2026-01-13 09:28:31', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL COMMENT '字典编码',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, '000000', 1, '男', '0', 'sys_user_sex', '', '', 'Y', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, '000000', 2, '女', '1', 'sys_user_sex', '', '', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, '000000', 3, '未知', '2', 'sys_user_sex', '', '', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, '000000', 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, '000000', 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, '000000', 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, '000000', 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (12, '000000', 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, '000000', 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, '000000', 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, '000000', 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, '000000', 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, '000000', 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, '000000', 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, '000000', 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, '000000', 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, '000000', 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, '000000', 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, '000000', 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, '000000', 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, '000000', 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, '000000', 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, '000000', 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, '000000', 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, '000000', 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (30, '000000', 0, '密码认证', 'password', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '密码认证');
INSERT INTO `sys_dict_data` VALUES (31, '000000', 0, '短信认证', 'sms', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '短信认证');
INSERT INTO `sys_dict_data` VALUES (32, '000000', 0, '邮件认证', 'email', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '邮件认证');
INSERT INTO `sys_dict_data` VALUES (33, '000000', 0, '小程序认证', 'xcx', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '小程序认证');
INSERT INTO `sys_dict_data` VALUES (34, '000000', 0, '三方登录认证', 'social', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '三方登录认证');
INSERT INTO `sys_dict_data` VALUES (35, '000000', 0, 'PC', 'pc', 'sys_device_type', '', 'default', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, 'PC');
INSERT INTO `sys_dict_data` VALUES (36, '000000', 0, '安卓', 'android', 'sys_device_type', '', 'default', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '安卓');
INSERT INTO `sys_dict_data` VALUES (37, '000000', 0, 'iOS', 'ios', 'sys_device_type', '', 'default', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, 'iOS');
INSERT INTO `sys_dict_data` VALUES (38, '000000', 0, '小程序', 'xcx', 'sys_device_type', '', 'default', 'N', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '小程序');
INSERT INTO `sys_dict_data` VALUES (39, '000000', 1, '已撤销', 'cancel', 'wf_business_status', '', 'danger', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '已撤销');
INSERT INTO `sys_dict_data` VALUES (40, '000000', 2, '草稿', 'draft', 'wf_business_status', '', 'info', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '草稿');
INSERT INTO `sys_dict_data` VALUES (41, '000000', 3, '待审核', 'waiting', 'wf_business_status', '', 'primary', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '待审核');
INSERT INTO `sys_dict_data` VALUES (42, '000000', 4, '已完成', 'finish', 'wf_business_status', '', 'success', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '已完成');
INSERT INTO `sys_dict_data` VALUES (43, '000000', 5, '已作废', 'invalid', 'wf_business_status', '', 'danger', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '已作废');
INSERT INTO `sys_dict_data` VALUES (44, '000000', 6, '已退回', 'back', 'wf_business_status', '', 'danger', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '已退回');
INSERT INTO `sys_dict_data` VALUES (45, '000000', 7, '已终止', 'termination', 'wf_business_status', '', 'danger', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '已终止');
INSERT INTO `sys_dict_data` VALUES (46, '000000', 1, '自定义表单', 'static', 'wf_form_type', '', 'success', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '自定义表单');
INSERT INTO `sys_dict_data` VALUES (47, '000000', 2, '动态表单', 'dynamic', 'wf_form_type', '', 'primary', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '动态表单');
INSERT INTO `sys_dict_data` VALUES (48, '000000', 1, '撤销', 'cancel', 'wf_task_status', '', 'danger', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '撤销');
INSERT INTO `sys_dict_data` VALUES (49, '000000', 2, '通过', 'pass', 'wf_task_status', '', 'success', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '通过');
INSERT INTO `sys_dict_data` VALUES (50, '000000', 3, '待审核', 'waiting', 'wf_task_status', '', 'primary', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '待审核');
INSERT INTO `sys_dict_data` VALUES (51, '000000', 4, '作废', 'invalid', 'wf_task_status', '', 'danger', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '作废');
INSERT INTO `sys_dict_data` VALUES (52, '000000', 5, '退回', 'back', 'wf_task_status', '', 'danger', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '退回');
INSERT INTO `sys_dict_data` VALUES (53, '000000', 6, '终止', 'termination', 'wf_task_status', '', 'danger', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '终止');
INSERT INTO `sys_dict_data` VALUES (54, '000000', 7, '转办', 'transfer', 'wf_task_status', '', 'primary', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '转办');
INSERT INTO `sys_dict_data` VALUES (55, '000000', 8, '委托', 'depute', 'wf_task_status', '', 'primary', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '委托');
INSERT INTO `sys_dict_data` VALUES (56, '000000', 9, '抄送', 'copy', 'wf_task_status', '', 'primary', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '抄送');
INSERT INTO `sys_dict_data` VALUES (57, '000000', 10, '加签', 'sign', 'wf_task_status', '', 'primary', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '加签');
INSERT INTO `sys_dict_data` VALUES (58, '000000', 11, '减签', 'sign_off', 'wf_task_status', '', 'danger', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '减签');
INSERT INTO `sys_dict_data` VALUES (59, '000000', 11, '超时', 'timeout', 'wf_task_status', '', 'danger', 'N', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '超时');
INSERT INTO `sys_dict_data` VALUES (2021036111462080514, '000000', 0, '网页', '0', 'dh_chat_channel', NULL, '#1f87e8', 'N', 103, 1, '2026-02-10 09:38:53', 1, '2026-02-10 09:39:44', NULL);
INSERT INTO `sys_dict_data` VALUES (2021036246271205377, '000000', 1, 'APP', '1', 'dh_chat_channel', NULL, '#008781', 'N', 103, 1, '2026-02-10 09:39:25', 1, '2026-02-10 09:39:25', NULL);
INSERT INTO `sys_dict_data` VALUES (2021036407718354946, '000000', 2, '小程序', '2', 'dh_chat_channel', NULL, '#fcc02e', 'N', 103, 1, '2026-02-10 09:40:03', 1, '2026-02-10 09:40:03', NULL);
INSERT INTO `sys_dict_data` VALUES (2021037831529373698, '000000', 0, '未评价', '0', 'dh_chat_evaluate', NULL, 'default', 'N', 103, 1, '2026-02-10 09:45:43', 1, '2026-02-10 09:46:43', NULL);
INSERT INTO `sys_dict_data` VALUES (2021038006532513794, '000000', 1, '👍赞', '1', 'dh_chat_evaluate', NULL, 'green', 'N', 103, 1, '2026-02-10 09:46:24', 1, '2026-02-10 09:46:38', NULL);
INSERT INTO `sys_dict_data` VALUES (2021038151928061954, '000000', 2, '👎踩', '2', 'dh_chat_evaluate', NULL, 'danger', 'N', 103, 1, '2026-02-10 09:46:59', 1, '2026-02-10 11:03:40', NULL);
INSERT INTO `sys_dict_data` VALUES (2021047511974617089, '000000', 0, 'AI', '0', 'dh_chat_status', NULL, '#512da7', 'N', 103, 1, '2026-02-10 10:24:11', 1, '2026-02-10 11:54:29', NULL);
INSERT INTO `sys_dict_data` VALUES (2021047593419612162, '000000', 1, '人工', '1', 'dh_chat_status', NULL, '#8e24aa', 'N', 103, 1, '2026-02-10 10:24:30', 1, '2026-02-10 11:54:43', NULL);
INSERT INTO `sys_dict_data` VALUES (2021047670317981697, '000000', 2, '已结束', '2', 'dh_chat_status', NULL, '#e64a19', 'N', 103, 1, '2026-02-10 10:24:49', 1, '2026-02-10 11:54:50', NULL);
INSERT INTO `sys_dict_data` VALUES (2021070574644559874, '000000', 0, '启用', '0', 'sys_display_status', NULL, '', 'N', 103, 1, '2026-02-10 11:55:49', 1, '2026-02-10 11:56:06', NULL);
INSERT INTO `sys_dict_data` VALUES (2021070617917194242, '000000', 1, '禁用', '1', 'sys_display_status', NULL, '', 'N', 103, 1, '2026-02-10 11:56:00', 1, '2026-02-10 11:56:00', NULL);
INSERT INTO `sys_dict_data` VALUES (2021115117012168705, '000000', 0, '官方', '0', 'sys_common_tag', NULL, 'primary', 'N', 103, 1, '2026-02-10 14:52:49', 1, '2026-02-10 14:53:04', NULL);
INSERT INTO `sys_dict_data` VALUES (2021115236763742209, '000000', 2, '推荐', '1', 'sys_common_tag', NULL, 'green', 'N', 103, 1, '2026-02-10 14:53:18', 1, '2026-02-10 14:53:18', NULL);
INSERT INTO `sys_dict_data` VALUES (2021115286843731969, '000000', 2, '个人', '2', 'sys_common_tag', NULL, 'orange', 'N', 103, 1, '2026-02-10 14:53:30', 1, '2026-02-10 14:53:30', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL COMMENT '字典主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `tenant_id`(`tenant_id` ASC, `dict_type` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '000000', '用户性别', 'sys_user_sex', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '000000', '菜单状态', 'sys_show_hide', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '000000', '系统开关', 'sys_normal_disable', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (6, '000000', '系统是否', 'sys_yes_no', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '000000', '通知类型', 'sys_notice_type', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '000000', '通知状态', 'sys_notice_status', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '000000', '操作类型', 'sys_oper_type', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '000000', '系统状态', 'sys_common_status', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '000000', '授权类型', 'sys_grant_type', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '认证授权类型');
INSERT INTO `sys_dict_type` VALUES (12, '000000', '设备类型', 'sys_device_type', 103, 1, '2026-01-13 09:28:35', NULL, NULL, '客户端设备类型');
INSERT INTO `sys_dict_type` VALUES (13, '000000', '业务状态', 'wf_business_status', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '业务状态列表');
INSERT INTO `sys_dict_type` VALUES (14, '000000', '表单类型', 'wf_form_type', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '表单类型列表');
INSERT INTO `sys_dict_type` VALUES (15, '000000', '任务状态', 'wf_task_status', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '任务状态');
INSERT INTO `sys_dict_type` VALUES (2021035923636953089, '000000', '对话渠道', 'dh_chat_channel', 103, 1, '2026-02-10 09:38:08', 1, '2026-02-10 09:38:08', NULL);
INSERT INTO `sys_dict_type` VALUES (2021037327030099970, '000000', '对话评价', 'dh_chat_evaluate', 103, 1, '2026-02-10 09:43:42', 1, '2026-02-10 09:43:42', NULL);
INSERT INTO `sys_dict_type` VALUES (2021047192028913666, '000000', '对话状态', 'dh_chat_status', 103, 1, '2026-02-10 10:22:54', 1, '2026-02-10 10:22:54', NULL);
INSERT INTO `sys_dict_type` VALUES (2021070514548572162, '000000', '显示状态', 'sys_display_status', 103, 1, '2026-02-10 11:55:35', 1, '2026-02-10 11:55:35', NULL);
INSERT INTO `sys_dict_type` VALUES (2021114789361528834, '000000', '通用标签', 'sys_common_tag', 103, 1, '2026-02-10 14:51:31', 1, '2026-02-10 14:51:31', NULL);

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL COMMENT '访问ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `client_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '客户端',
  `device_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '设备类型',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (2010887175820693505, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-01-13 09:30:38');
INSERT INTO `sys_logininfor` VALUES (2010919077994713090, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-01-13 11:37:24');
INSERT INTO `sys_logininfor` VALUES (2010948884157583362, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-01-13 13:35:50');
INSERT INTO `sys_logininfor` VALUES (2010997064635236354, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-01-13 16:47:17');
INSERT INTO `sys_logininfor` VALUES (2011005260862992385, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-01-13 17:19:52');
INSERT INTO `sys_logininfor` VALUES (2011239037631668226, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-01-14 08:48:48');
INSERT INTO `sys_logininfor` VALUES (2011311380399849474, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-01-14 13:36:16');
INSERT INTO `sys_logininfor` VALUES (2012067646005014529, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-01-16 15:41:24');
INSERT INTO `sys_logininfor` VALUES (2012412435523108865, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-01-17 14:31:28');
INSERT INTO `sys_logininfor` VALUES (2014605888990449666, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-01-23 15:47:28');
INSERT INTO `sys_logininfor` VALUES (2017413303062409218, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-01-31 09:43:08');
INSERT INTO `sys_logininfor` VALUES (2017472530556563458, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-01-31 13:38:29');
INSERT INTO `sys_logininfor` VALUES (2017517835339579393, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-01-31 16:38:30');
INSERT INTO `sys_logininfor` VALUES (2018568632433307650, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2026-02-03 14:13:59');
INSERT INTO `sys_logininfor` VALUES (2018568632433307651, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2026-02-03 14:13:59');
INSERT INTO `sys_logininfor` VALUES (2018574346044227585, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-02-03 14:36:42');
INSERT INTO `sys_logininfor` VALUES (2018850089013809153, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-02-04 08:52:24');
INSERT INTO `sys_logininfor` VALUES (2018956294348558338, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-02-04 15:54:26');
INSERT INTO `sys_logininfor` VALUES (2019209765207363586, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-02-05 08:41:38');
INSERT INTO `sys_logininfor` VALUES (2019704101502185473, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-02-06 17:25:57');
INSERT INTO `sys_logininfor` VALUES (2019935403216203778, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-02-07 08:45:03');
INSERT INTO `sys_logininfor` VALUES (2020676412099198977, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-02-09 09:49:34');
INSERT INTO `sys_logininfor` VALUES (2021026046260748290, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '1', '验证码已失效', '2026-02-10 08:58:53');
INSERT INTO `sys_logininfor` VALUES (2021026059053375489, '000000', 'admin', 'pc', 'pc', '0:0:0:0:0:0:0:1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2026-02-10 08:58:56');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '显示状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', '', '', 1, 0, 'M', '0', '0', '', 'icon-park-outline:system', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 10:04:10', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 3, 'monitor', '', '', 1, 0, 'M', '0', '0', '', 'material-symbols:monitor-outline', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 10:17:07', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 4, 'tool', '', '', 1, 0, 'M', '0', '0', '', 'tabler:tool', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 11:42:10', '系统工具目录');
INSERT INTO `sys_menu` VALUES (5, '测试菜单', 0, 5, 'demo', NULL, '', 1, 0, 'M', '0', '0', '', 'star', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '测试菜单');
INSERT INTO `sys_menu` VALUES (6, '租户管理', 0, 2, 'tenant', '', '', 1, 0, 'M', '0', '0', '', 'carbon:location-company', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 10:13:45', '租户管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'lucide:user-round', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 10:03:59', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'eos-icons:role-binding-outlined', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 10:04:52', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'material-symbols:menu-rounded', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 10:05:43', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'mingcute:department-line', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 10:06:30', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'hugeicons:permanent-job', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 10:12:05', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'streamline:dictionary-language-book-solid', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 13:51:36', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'carbon:parameter', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 13:52:40', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'streamline-plump:announcement-megaphone-solid', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 13:53:29', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'icon-park-solid:log', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 13:53:58', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'mdi:account-online-outline', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 10:17:42', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'octicon:cache-16', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 11:37:38', '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'material-symbols:code', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 11:42:38', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '修改生成配置', 3, 2, 'gen-edit/index/:tableId', 'tool/gen/editTable', '', 1, 1, 'C', '1', '0', 'tool:gen:edit', 'radix-icons:update', 103, 1, '2026-01-13 09:28:33', 1, '2026-02-10 09:27:43', '/tool/gen');
INSERT INTO `sys_menu` VALUES (117, 'Admin监控', 2, 5, 'Admin', 'monitor/admin/index', '', 1, 0, 'C', '0', '0', 'monitor:admin:list', 'pepicons-pop:monitor-loop', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 11:38:42', 'Admin监控菜单');
INSERT INTO `sys_menu` VALUES (118, '文件管理', 1, 10, 'oss', 'system/oss/index', '', 1, 0, 'C', '0', '0', 'system:oss:list', 'mingcute:file-fill', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 13:54:23', '文件管理菜单');
INSERT INTO `sys_menu` VALUES (120, '任务调度中心', 2, 6, 'snailjob', 'monitor/snailjob/index', '', 1, 0, 'C', '0', '0', 'monitor:snailjob:list', 'octicon:focus-center-16', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 11:38:07', 'SnailJob控制台菜单');
INSERT INTO `sys_menu` VALUES (121, '租户管理', 6, 1, 'tenant', 'system/tenant/index', '', 1, 0, 'C', '0', '0', 'system:tenant:list', 'carbon:location-company', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 14:10:43', '租户管理菜单');
INSERT INTO `sys_menu` VALUES (122, '租户套餐管理', 6, 2, 'tenantPackage', 'system/tenantPackage/index', '', 1, 0, 'C', '0', '0', 'system:tenantPackage:list', 'tdesign:chart-combo', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 14:10:34', '租户套餐管理菜单');
INSERT INTO `sys_menu` VALUES (123, '客户端管理', 1, 11, 'client', 'system/client/index', '', 1, 0, 'C', '0', '0', 'system:client:list', 'ix:client-interface', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 14:11:17', '客户端管理菜单');
INSERT INTO `sys_menu` VALUES (130, '分配用户', 1, 2, 'role-auth/user/:roleId', 'system/role/authUser', '', 1, 1, 'C', '1', '0', 'system:role:edit', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '/system/role');
INSERT INTO `sys_menu` VALUES (131, '分配角色', 1, 1, 'user-auth/role/:userId', 'system/user/authRole', '', 1, 1, 'C', '1', '0', 'system:user:edit', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '/system/user');
INSERT INTO `sys_menu` VALUES (132, '字典数据', 1, 6, 'dict-data/index/:dictId', 'system/dict/data', '', 1, 1, 'C', '1', '0', 'system:dict:list', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '/system/dict');
INSERT INTO `sys_menu` VALUES (133, '文件配置管理', 1, 10, 'oss-config/index', 'system/oss/config', '', 1, 1, 'C', '1', '0', 'system:ossConfig:list', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '/system/oss');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'lucide:file-pen', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 14:00:45', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'material-symbols:login', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 13:58:55', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '客户端管理查询', 123, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:query', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1062, '客户端管理新增', 123, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:add', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1063, '客户端管理修改', 123, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:edit', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1064, '客户端管理删除', 123, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:remove', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1065, '客户端管理导出', 123, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:export', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1500, '测试单表', 5, 1, 'demo', 'demo/demo/index', '', 1, 0, 'C', '0', '0', 'demo:demo:list', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '测试单表菜单');
INSERT INTO `sys_menu` VALUES (1501, '测试单表查询', 1500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'demo:demo:query', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1502, '测试单表新增', 1500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'demo:demo:add', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1503, '测试单表修改', 1500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'demo:demo:edit', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1504, '测试单表删除', 1500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'demo:demo:remove', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1505, '测试单表导出', 1500, 5, '#', '', '', 1, 0, 'F', '0', '0', 'demo:demo:export', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1506, '测试树表', 5, 1, 'tree', 'demo/tree/index', '', 1, 0, 'C', '0', '0', 'demo:tree:list', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '测试树表菜单');
INSERT INTO `sys_menu` VALUES (1507, '测试树表查询', 1506, 1, '#', '', '', 1, 0, 'F', '0', '0', 'demo:tree:query', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1508, '测试树表新增', 1506, 2, '#', '', '', 1, 0, 'F', '0', '0', 'demo:tree:add', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1509, '测试树表修改', 1506, 3, '#', '', '', 1, 0, 'F', '0', '0', 'demo:tree:edit', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1510, '测试树表删除', 1506, 4, '#', '', '', 1, 0, 'F', '0', '0', 'demo:tree:remove', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1511, '测试树表导出', 1506, 5, '#', '', '', 1, 0, 'F', '0', '0', 'demo:tree:export', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1600, '文件查询', 118, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:query', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1601, '文件上传', 118, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:upload', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1602, '文件下载', 118, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:download', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1603, '文件删除', 118, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:remove', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1606, '租户查询', 121, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:query', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1607, '租户新增', 121, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:add', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1608, '租户修改', 121, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:edit', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1609, '租户删除', 121, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:remove', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1610, '租户导出', 121, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:export', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1611, '租户套餐查询', 122, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:query', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1612, '租户套餐新增', 122, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:add', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1613, '租户套餐修改', 122, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:edit', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1614, '租户套餐删除', 122, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:remove', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1615, '租户套餐导出', 122, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:export', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1620, '配置列表', 118, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:list', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1621, '配置添加', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:add', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1622, '配置编辑', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:edit', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1623, '配置删除', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:remove', '#', 103, 1, '2026-01-13 09:28:33', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11616, '工作流', 0, 6, 'workflow', '', '', 1, 0, 'M', '0', '0', '', 'streamline-ultimate:human-resources-workflow-bold', 103, 1, '2026-01-13 09:28:53', 1, '2026-01-13 14:04:06', '');
INSERT INTO `sys_menu` VALUES (11618, '我的任务', 0, 7, 'task', '', '', 1, 0, 'M', '0', '0', '', 'fluent:task-list-24-filled', 103, 1, '2026-01-13 09:28:53', 1, '2026-01-17 16:25:56', '');
INSERT INTO `sys_menu` VALUES (11619, '我的待办', 11618, 2, 'taskWaiting', 'workflow/task/taskWaiting', '', 1, 1, 'C', '0', '0', '', 'mingcute:task-2-line', 103, 1, '2026-01-13 09:28:53', 1, '2026-01-17 16:27:09', '');
INSERT INTO `sys_menu` VALUES (11620, '流程定义', 11616, 3, 'processDefinition', 'workflow/processDefinition/index', '', 1, 1, 'C', '0', '0', '', 'streamline:definition-search-book-remix', 103, 1, '2026-01-13 09:28:53', 1, '2026-01-13 14:06:04', '');
INSERT INTO `sys_menu` VALUES (11621, '流程实例', 11630, 1, 'processInstance', 'workflow/processInstance/index', '', 1, 1, 'C', '0', '0', '', 'tree-table', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11622, '流程分类', 11616, 1, 'category', 'workflow/category/index', '', 1, 0, 'C', '0', '0', 'workflow:category:list', 'nrk:category-active', 103, 1, '2026-01-13 09:28:53', 1, '2026-01-13 14:04:31', '');
INSERT INTO `sys_menu` VALUES (11623, '流程分类查询', 11622, 1, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:query', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11624, '流程分类新增', 11622, 2, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:add', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11625, '流程分类修改', 11622, 3, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:edit', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11626, '流程分类删除', 11622, 4, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:remove', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11627, '流程分类导出', 11622, 5, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:export', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11629, '我发起的', 11618, 1, 'myDocument', 'workflow/task/myDocument', '', 1, 1, 'C', '0', '0', '', 'ic:baseline-start', 103, 1, '2026-01-13 09:28:53', 1, '2026-01-17 16:26:31', '');
INSERT INTO `sys_menu` VALUES (11630, '流程监控', 11616, 4, 'monitor', '', '', 1, 0, 'M', '0', '0', '', 'lucide:monitor-up', 103, 1, '2026-01-13 09:28:53', 1, '2026-01-13 14:06:31', '');
INSERT INTO `sys_menu` VALUES (11631, '待办任务', 11630, 2, 'allTaskWaiting', 'workflow/task/allTaskWaiting', '', 1, 1, 'C', '0', '0', '', 'waiting', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11632, '我的已办', 11618, 3, 'taskFinish', 'workflow/task/taskFinish', '', 1, 1, 'C', '0', '0', '', 'material-symbols:task-rounded', 103, 1, '2026-01-13 09:28:53', 1, '2026-01-17 16:27:33', '');
INSERT INTO `sys_menu` VALUES (11633, '我的抄送', 11618, 4, 'taskCopyList', 'workflow/task/taskCopyList', '', 1, 1, 'C', '0', '0', '', 'mingcute:copy-fill', 103, 1, '2026-01-13 09:28:53', 1, '2026-01-17 16:28:17', '');
INSERT INTO `sys_menu` VALUES (11638, '请假申请', 5, 1, 'leave', 'workflow/leave/index', '', 1, 0, 'C', '0', '0', 'workflow:leave:list', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '请假申请菜单');
INSERT INTO `sys_menu` VALUES (11639, '请假申请查询', 11638, 1, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:leave:query', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11640, '请假申请新增', 11638, 2, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:leave:add', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11641, '请假申请修改', 11638, 3, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:leave:edit', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11642, '请假申请删除', 11638, 4, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:leave:remove', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11643, '请假申请导出', 11638, 5, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:leave:export', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11700, '流程设计', 11616, 5, 'design/index', 'workflow/processDefinition/design', '', 1, 1, 'C', '1', '0', 'workflow:leave:edit', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '/workflow/processDefinition');
INSERT INTO `sys_menu` VALUES (11701, '请假申请', 11616, 6, 'leaveEdit/index', 'workflow/leave/leaveEdit', '', 1, 1, 'C', '1', '0', 'workflow:leave:edit', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11801, '流程表达式', 11616, 2, 'spel', 'workflow/spel/index', '', 1, 0, 'C', '0', '0', 'workflow:spel:list', 'material-symbols:regular-expression', 103, 1, '2026-01-13 09:28:53', 1, '2026-01-13 14:05:14', '流程达式定义菜单');
INSERT INTO `sys_menu` VALUES (11802, '流程达式定义查询', 11801, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:query', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11803, '流程达式定义新增', 11801, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:add', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11804, '流程达式定义修改', 11801, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:edit', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11805, '流程达式定义删除', 11801, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:remove', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11806, '流程达式定义导出', 11801, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'workflow:spel:export', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2010949410043613185, '客服知识库', 0, 90, 'knowledge', '', NULL, 1, 0, 'M', '0', '0', NULL, 'carbon:ibm-watson-knowledge-catalog', 103, 1, '2026-01-13 13:37:56', 1, '2026-01-17 16:29:09', '');
INSERT INTO `sys_menu` VALUES (2011011841088495617, '知识库分类', 2010949410043613185, 1, 'kbCategory', 'knowledge/kbCategory/index', NULL, 1, 0, 'C', '0', '0', 'knowledge:kbCategory:list', 'nrk:category-active', 103, 1, '2026-01-13 17:46:08', 1, '2026-01-14 09:56:38', '知识库分类菜单');
INSERT INTO `sys_menu` VALUES (2011011841088495618, '知识库分类查询', 2011011841088495617, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'knowledge:kbCategory:query', '#', 103, 1, '2026-01-13 17:46:08', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2011011841088495619, '知识库分类新增', 2011011841088495617, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'knowledge:kbCategory:add', '#', 103, 1, '2026-01-13 17:46:08', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2011011841088495620, '知识库分类修改', 2011011841088495617, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'knowledge:kbCategory:edit', '#', 103, 1, '2026-01-13 17:46:08', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2011011841088495621, '知识库分类删除', 2011011841088495617, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'knowledge:kbCategory:remove', '#', 103, 1, '2026-01-13 17:46:09', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2011011841088495622, '知识库分类导出', 2011011841088495617, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'knowledge:kbCategory:export', '#', 103, 1, '2026-01-13 17:46:09', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2011011906146344961, '知识库文档', 2010949410043613185, 1, 'kbDocument', 'knowledge/kbDocument/index', NULL, 1, 0, 'C', '0', '0', 'knowledge:kbDocument:list', 'bx:file', 103, 1, '2026-01-13 17:46:21', 1, '2026-01-14 09:56:58', '知识库文档菜单');
INSERT INTO `sys_menu` VALUES (2011011906146344962, '知识库文档查询', 2011011906146344961, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'knowledge:kbDocument:query', '#', 103, 1, '2026-01-13 17:46:21', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2011011906146344963, '知识库文档新增', 2011011906146344961, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'knowledge:kbDocument:add', '#', 103, 1, '2026-01-13 17:46:21', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2011011906146344964, '知识库文档修改', 2011011906146344961, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'knowledge:kbDocument:edit', '#', 103, 1, '2026-01-13 17:46:21', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2011011906146344965, '知识库文档删除', 2011011906146344961, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'knowledge:kbDocument:remove', '#', 103, 1, '2026-01-13 17:46:22', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2011011906146344966, '知识库文档导出', 2011011906146344961, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'knowledge:kbDocument:export', '#', 103, 1, '2026-01-13 17:46:22', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2012415803188551682, '聊天', 0, 51, 'chat-demo', 'ai/chat/index', NULL, 1, 0, 'C', '0', '0', NULL, 'basil:chat-solid', 103, 1, '2026-01-17 14:44:51', 1, '2026-02-10 09:05:01', '');
INSERT INTO `sys_menu` VALUES (2017424741537591297, '人管理', 0, 22, 'human', '', NULL, 1, 0, 'M', '0', '0', NULL, 'mdi:human-greeting', 103, 1, '2026-01-31 10:28:35', 1, '2026-02-07 11:34:40', '');
INSERT INTO `sys_menu` VALUES (2017477965967699970, '形象分类管理', 2017424741537591297, 1, 'avatarCategory', 'human/avatarCategory/index', NULL, 1, 0, 'C', '0', '0', 'human:avatarCategory:list', 'bx:category', 103, 1, '2026-01-31 14:01:15', 1, '2026-01-31 17:07:49', '形象分类菜单');
INSERT INTO `sys_menu` VALUES (2017477965967699971, '形象分类查询', 2017477965967699970, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:avatarCategory:query', '#', 103, 1, '2026-01-31 14:01:15', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2017477965967699972, '形象分类新增', 2017477965967699970, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:avatarCategory:add', '#', 103, 1, '2026-01-31 14:01:15', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2017477965967699973, '形象分类修改', 2017477965967699970, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:avatarCategory:edit', '#', 103, 1, '2026-01-31 14:01:16', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2017477965967699974, '形象分类删除', 2017477965967699970, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:avatarCategory:remove', '#', 103, 1, '2026-01-31 14:01:16', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2017477965967699975, '形象分类导出', 2017477965967699970, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:avatarCategory:export', '#', 103, 1, '2026-01-31 14:01:16', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2017494007435722754, '形象管理', 2017424741537591297, 1, 'avatar', 'human/avatar/index', NULL, 1, 0, 'C', '0', '0', 'human:avatar:list', 'icon-park-outline:avatar', 103, 1, '2026-01-31 15:10:56', 1, '2026-01-31 17:08:36', '形象菜单');
INSERT INTO `sys_menu` VALUES (2017494007435722755, '形象查询', 2017494007435722754, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:avatar:query', '#', 103, 1, '2026-01-31 15:10:57', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2017494007435722756, '形象新增', 2017494007435722754, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:avatar:add', '#', 103, 1, '2026-01-31 15:10:57', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2017494007435722757, '形象修改', 2017494007435722754, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:avatar:edit', '#', 103, 1, '2026-01-31 15:10:57', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2017494007435722758, '形象删除', 2017494007435722754, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:avatar:remove', '#', 103, 1, '2026-01-31 15:10:57', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2017494007435722759, '形象导出', 2017494007435722754, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:avatar:export', '#', 103, 1, '2026-01-31 15:10:57', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2017494007637049345, '贴图管理', 2017424741537591297, 1, 'overlay', 'human/overlay/index', NULL, 1, 0, 'C', '0', '0', 'human:overlay:list', 'fe:smile', 103, 1, '2026-01-31 15:11:18', 1, '2026-01-31 17:11:31', '贴图菜单');
INSERT INTO `sys_menu` VALUES (2017494007637049346, '贴图查询', 2017494007637049345, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:overlay:query', '#', 103, 1, '2026-01-31 15:11:18', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2017494007637049347, '贴图新增', 2017494007637049345, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:overlay:add', '#', 103, 1, '2026-01-31 15:11:18', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2017494007637049348, '贴图修改', 2017494007637049345, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:overlay:edit', '#', 103, 1, '2026-01-31 15:11:18', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2017494007637049349, '贴图删除', 2017494007637049345, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:overlay:remove', '#', 103, 1, '2026-01-31 15:11:19', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2017494007637049350, '贴图导出', 2017494007637049345, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:overlay:export', '#', 103, 1, '2026-01-31 15:11:19', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2017494007792238594, '背景分类管理', 2017424741537591297, 1, 'backgroundCategory', 'human/backgroundCategory/index', NULL, 1, 0, 'C', '0', '0', 'human:backgroundCategory:list', 'bx:category', 103, 1, '2026-01-31 15:11:05', 1, '2026-02-10 12:00:08', '背景分类菜单');
INSERT INTO `sys_menu` VALUES (2017494007792238595, '背景分类查询', 2017494007792238594, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:backgroundCategory:query', '#', 103, 1, '2026-01-31 15:11:05', 1, '2026-02-10 12:00:17', '');
INSERT INTO `sys_menu` VALUES (2017494007792238596, '背景分类新增', 2017494007792238594, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:backgroundCategory:add', '#', 103, 1, '2026-01-31 15:11:05', 1, '2026-02-10 12:00:22', '');
INSERT INTO `sys_menu` VALUES (2017494007792238597, '背景分类修改', 2017494007792238594, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:backgroundCategory:edit', '#', 103, 1, '2026-01-31 15:11:05', 1, '2026-02-10 12:00:26', '');
INSERT INTO `sys_menu` VALUES (2017494007792238598, '背景分类删除', 2017494007792238594, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:backgroundCategory:remove', '#', 103, 1, '2026-01-31 15:11:05', 1, '2026-02-10 12:00:30', '');
INSERT INTO `sys_menu` VALUES (2017494007792238599, '背景分类导出', 2017494007792238594, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:backgroundCategory:export', '#', 103, 1, '2026-01-31 15:11:05', 1, '2026-02-10 13:45:39', '');
INSERT INTO `sys_menu` VALUES (2017494008102617089, '背景管理', 2017424741537591297, 1, 'background', 'human/background/index', NULL, 1, 0, 'C', '0', '0', 'human:background:list', 'lets-icons:img-box-fill', 103, 1, '2026-01-31 15:11:12', 1, '2026-02-10 13:46:01', '背景菜单');
INSERT INTO `sys_menu` VALUES (2017494008102617090, '背景查询', 2017494008102617089, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:background:query', '#', 103, 1, '2026-01-31 15:11:12', 1, '2026-02-10 13:46:27', '');
INSERT INTO `sys_menu` VALUES (2017494008102617091, '背景新增', 2017494008102617089, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:background:add', '#', 103, 1, '2026-01-31 15:11:12', 1, '2026-02-10 13:46:31', '');
INSERT INTO `sys_menu` VALUES (2017494008102617092, '背景修改', 2017494008102617089, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:background:edit', '#', 103, 1, '2026-01-31 15:11:12', 1, '2026-02-10 13:46:36', '');
INSERT INTO `sys_menu` VALUES (2017494008102617093, '背景删除', 2017494008102617089, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:background:remove', '#', 103, 1, '2026-01-31 15:11:12', 1, '2026-02-10 13:46:41', '');
INSERT INTO `sys_menu` VALUES (2017494008102617094, '背景导出', 2017494008102617089, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:background:export', '#', 103, 1, '2026-01-31 15:11:12', 1, '2026-02-10 13:46:46', '');
INSERT INTO `sys_menu` VALUES (2020774016992608257, '聊天管理', 0, 222, 'chat', '', NULL, 1, 0, 'M', '0', '0', NULL, 'basil:chat-solid', 103, 1, '2026-02-09 16:17:24', 1, '2026-02-09 16:17:24', '');
INSERT INTO `sys_menu` VALUES (2021033410162532353, '对话消息', 2020774016992608257, 2, 'chatMessage', 'human/chatMessage/index', NULL, 1, 0, 'C', '0', '0', 'human:chatMessage:list', 'basil:chat-solid', 103, 1, '2026-02-10 09:33:01', 1, '2026-02-10 10:15:11', '对话消息菜单');
INSERT INTO `sys_menu` VALUES (2021033410162532354, '对话消息查询', 2021033410162532353, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:chatMessage:query', '#', 103, 1, '2026-02-10 09:33:02', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2021033410162532355, '对话消息新增', 2021033410162532353, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:chatMessage:add', '#', 103, 1, '2026-02-10 09:33:02', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2021033410162532356, '对话消息修改', 2021033410162532353, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:chatMessage:edit', '#', 103, 1, '2026-02-10 09:33:02', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2021033410162532357, '对话消息删除', 2021033410162532353, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:chatMessage:remove', '#', 103, 1, '2026-02-10 09:33:02', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2021033410162532358, '对话消息导出', 2021033410162532353, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:chatMessage:export', '#', 103, 1, '2026-02-10 09:33:02', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2021034681795813378, '对话会话', 2020774016992608257, 1, 'chatSession', 'human/chatSession/index', NULL, 1, 0, 'C', '0', '0', 'human:chatSession:list', 'bxs:chat', 103, 1, '2026-02-10 09:33:18', 1, '2026-02-10 10:15:02', '对话会话菜单');
INSERT INTO `sys_menu` VALUES (2021034681795813379, '对话会话查询', 2021034681795813378, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:chatSession:query', '#', 103, 1, '2026-02-10 09:33:18', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2021034681795813380, '对话会话新增', 2021034681795813378, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:chatSession:add', '#', 103, 1, '2026-02-10 09:33:18', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2021034681795813381, '对话会话修改', 2021034681795813378, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:chatSession:edit', '#', 103, 1, '2026-02-10 09:33:18', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2021034681795813382, '对话会话删除', 2021034681795813378, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:chatSession:remove', '#', 103, 1, '2026-02-10 09:33:18', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (2021034681795813383, '对话会话导出', 2021034681795813378, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'human:chatSession:export', '#', 103, 1, '2026-02-10 09:33:18', NULL, NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` bigint NOT NULL COMMENT '公告ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '000000', '温馨提醒：2018-07-01 新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 103, 1, '2026-01-13 09:28:37', NULL, NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '000000', '维护通知：2018-07-01 系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 103, 1, '2026-01-13 09:28:37', NULL, NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL COMMENT '日志主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (2018941257328300034, '000000', '操作日志', 9, 'com.flash.system.controller.monitor.SysOperlogController.clean()', 'DELETE', 1, 'admin', '研发部门', '/monitor/operlog/clean', '0:0:0:0:0:0:0:1', '内网IP', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-04 14:54:40', 880);
INSERT INTO `sys_oper_log` VALUES (2018941989628612610, '000000', '知识库文档', 1, 'com.flash.knowledge.controller.KbDocumentController.add()', 'POST', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018941989372760065\",\"kbCategoryId\":\"2018579022277959682\",\"title\":\"赛制\",\"tag\":\"123\",\"content\":\"123\",\"isEnable\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-04 14:57:35', 75);
INSERT INTO `sys_oper_log` VALUES (2018956515031863297, '000000', '字典类型', 2, 'com.flash.system.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":\"2010950638777552898\",\"dictName\":\"状态类型\",\"dictType\":\"sys_status\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-04 15:55:18', 190);
INSERT INTO `sys_oper_log` VALUES (2018956578256801793, '000000', '字典数据', 2, 'com.flash.system.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":\"2010950999349284865\",\"dictSort\":22,\"dictLabel\":\"禁用\",\"dictValue\":\"2\",\"dictType\":\"sys_status\",\"cssClass\":null,\"listClass\":\"#d81b43\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-04 15:55:33', 189);
INSERT INTO `sys_oper_log` VALUES (2018967055129014274, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":\"2025年冠军赛\",\"orderNum\":1,\"status\":1}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-04 16:37:11', 85);
INSERT INTO `sys_oper_log` VALUES (2018980912157380609, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":\"2025年冠军赛\",\"orderNum\":1,\"status\":\"2\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-04 17:32:15', 126);
INSERT INTO `sys_oper_log` VALUES (2018981017048535041, '000000', '字典数据', 2, 'com.flash.system.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":\"2010950999349284865\",\"dictSort\":0,\"dictLabel\":\"禁用\",\"dictValue\":\"0\",\"dictType\":\"sys_status\",\"cssClass\":null,\"listClass\":\"#d81b43\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-04 17:32:40', 124);
INSERT INTO `sys_oper_log` VALUES (2018981091036057602, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":\"2026年启点赛\",\"orderNum\":2,\"status\":\"2\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-04 17:32:58', 59);
INSERT INTO `sys_oper_log` VALUES (2018981106957635586, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":\"2025年冠军赛\",\"orderNum\":1,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-04 17:33:01', 63);
INSERT INTO `sys_oper_log` VALUES (2018981139534794754, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":\"2026年启点赛\",\"orderNum\":2,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-04 17:33:09', 64);
INSERT INTO `sys_oper_log` VALUES (2018981165535285249, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":\"2025年冠军赛\",\"orderNum\":1,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-04 17:33:15', 53);
INSERT INTO `sys_oper_log` VALUES (2018984834104250370, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":\"2025年冠军赛\",\"orderNum\":1,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-04 17:47:50', 62);
INSERT INTO `sys_oper_log` VALUES (2018985872597143554, '000000', '用户管理', 2, 'com.flash.system.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"userId\":3,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"status\":\"1\",\"remark\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"userIds\":null,\"excludeUserIds\":null,\"superAdmin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-04 17:51:58', 61);
INSERT INTO `sys_oper_log` VALUES (2018985877315735554, '000000', '用户管理', 2, 'com.flash.system.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"userId\":3,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"status\":\"0\",\"remark\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"userIds\":null,\"excludeUserIds\":null,\"superAdmin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-04 17:51:59', 56);
INSERT INTO `sys_oper_log` VALUES (2018985885184249857, '000000', '用户管理', 2, 'com.flash.system.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"userId\":4,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"status\":\"0\",\"remark\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"userIds\":null,\"excludeUserIds\":null,\"superAdmin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-04 17:52:01', 57);
INSERT INTO `sys_oper_log` VALUES (2018985887633723393, '000000', '用户管理', 2, 'com.flash.system.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"userId\":4,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"status\":\"1\",\"remark\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"userIds\":null,\"excludeUserIds\":null,\"superAdmin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-04 17:52:01', 61);
INSERT INTO `sys_oper_log` VALUES (2018987695345192961, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null}', 0, '', '2026-02-04 17:59:12', 14);
INSERT INTO `sys_oper_log` VALUES (2018987719772819457, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null}', 0, '', '2026-02-04 17:59:18', 13);
INSERT INTO `sys_oper_log` VALUES (2018987733752434689, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null}', 0, '', '2026-02-04 17:59:21', 14);
INSERT INTO `sys_oper_log` VALUES (2018987794037166081, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":500,\"msg\":\"操作失败\",\"data\":null}', 0, '', '2026-02-04 17:59:36', 14);
INSERT INTO `sys_oper_log` VALUES (2018988093812461569, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-04 18:00:47', 60);
INSERT INTO `sys_oper_log` VALUES (2018988101815193601, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-04 18:00:49', 53);
INSERT INTO `sys_oper_log` VALUES (2019209774967508993, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 08:41:40', 79);
INSERT INTO `sys_oper_log` VALUES (2019209778897571842, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 08:41:41', 100);
INSERT INTO `sys_oper_log` VALUES (2019209955897200641, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 08:42:23', 53);
INSERT INTO `sys_oper_log` VALUES (2019209958522834945, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 08:42:24', 70);
INSERT INTO `sys_oper_log` VALUES (2019209962046050305, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 08:42:25', 48);
INSERT INTO `sys_oper_log` VALUES (2019209968882765826, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 08:42:26', 52);
INSERT INTO `sys_oper_log` VALUES (2019209979435634690, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 08:42:29', 80);
INSERT INTO `sys_oper_log` VALUES (2019209981121744898, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 08:42:29', 109);
INSERT INTO `sys_oper_log` VALUES (2019210044589953026, '000000', '角色管理', 2, 'com.flash.system.controller.system.SysRoleController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/role/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"roleId\":3,\"roleName\":null,\"roleKey\":null,\"roleSort\":null,\"dataScope\":null,\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"1\",\"remark\":null,\"menuIds\":null,\"deptIds\":null,\"superAdmin\":false}', '', 1, '角色已分配，不能禁用!', '2026-02-05 08:42:44', 20);
INSERT INTO `sys_oper_log` VALUES (2019210047861510145, '000000', '角色管理', 2, 'com.flash.system.controller.system.SysRoleController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/role/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"roleId\":3,\"roleName\":null,\"roleKey\":null,\"roleSort\":null,\"dataScope\":null,\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"1\",\"remark\":null,\"menuIds\":null,\"deptIds\":null,\"superAdmin\":false}', '', 1, '角色已分配，不能禁用!', '2026-02-05 08:42:45', 20);
INSERT INTO `sys_oper_log` VALUES (2019210054811471873, '000000', '角色管理', 2, 'com.flash.system.controller.system.SysRoleController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/role/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"roleId\":4,\"roleName\":null,\"roleKey\":null,\"roleSort\":null,\"dataScope\":null,\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"1\",\"remark\":null,\"menuIds\":null,\"deptIds\":null,\"superAdmin\":false}', '', 1, '角色已分配，不能禁用!', '2026-02-05 08:42:47', 18);
INSERT INTO `sys_oper_log` VALUES (2019213561241227265, '000000', '字典数据', 2, 'com.flash.system.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":\"2010950999349284865\",\"dictSort\":0,\"dictLabel\":\"禁用\",\"dictValue\":\"1\",\"dictType\":\"sys_status\",\"cssClass\":null,\"listClass\":\"#d81b43\",\"isDefault\":null,\"remark\":null}', '{\"code\":500,\"msg\":\"修改字典数据\'1\'失败，字典键值已存在\",\"data\":null}', 0, '', '2026-02-05 08:56:43', 18);
INSERT INTO `sys_oper_log` VALUES (2019214023503859714, '000000', '字典数据', 2, 'com.flash.system.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":\"2010950999349284865\",\"dictSort\":0,\"dictLabel\":\"禁用\",\"dictValue\":\"01212\",\"dictType\":\"sys_status\",\"cssClass\":null,\"listClass\":\"#d81b43\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 08:58:33', 86);
INSERT INTO `sys_oper_log` VALUES (2019214053556047873, '000000', '字典数据', 2, 'com.flash.system.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":\"2010950897524166657\",\"dictSort\":11,\"dictLabel\":\"可用\",\"dictValue\":\"0\",\"dictType\":\"sys_status\",\"cssClass\":null,\"listClass\":\"#4cb050\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 08:58:40', 80);
INSERT INTO `sys_oper_log` VALUES (2019216597523058689, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 09:08:47', 57);
INSERT INTO `sys_oper_log` VALUES (2019216764255031297, '000000', '字典类型', 3, 'com.flash.system.controller.system.SysDictTypeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/2010950638777552898', '0:0:0:0:0:0:0:1', '内网IP', '[\"2010950638777552898\"]', '', 1, '状态类型已分配,不能删除', '2026-02-05 09:09:27', 26);
INSERT INTO `sys_oper_log` VALUES (2019216775005032450, '000000', '字典类型', 3, 'com.flash.system.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/data/2010950897524166657', '0:0:0:0:0:0:0:1', '内网IP', '[\"2010950897524166657\"]', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 09:09:29', 93);
INSERT INTO `sys_oper_log` VALUES (2019216780759617537, '000000', '字典类型', 3, 'com.flash.system.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/data/2010950999349284865', '0:0:0:0:0:0:0:1', '内网IP', '[\"2010950999349284865\"]', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 09:09:30', 75);
INSERT INTO `sys_oper_log` VALUES (2019216790876278786, '000000', '字典类型', 3, 'com.flash.system.controller.system.SysDictTypeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/2010950638777552898', '0:0:0:0:0:0:0:1', '内网IP', '[\"2010950638777552898\"]', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 09:09:33', 94);
INSERT INTO `sys_oper_log` VALUES (2019217042668736513, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 09:10:33', 59);
INSERT INTO `sys_oper_log` VALUES (2019223874573389825, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/2010949769604517890', '0:0:0:0:0:0:0:1', '内网IP', '{}', '', 1, '同步数据失败，原表结构不存在', '2026-02-05 09:37:42', 589);
INSERT INTO `sys_oper_log` VALUES (2019232803416096770, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 10:13:11', 64);
INSERT INTO `sys_oper_log` VALUES (2019283754172727298, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018935167005954050\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 13:35:38', 62);
INSERT INTO `sys_oper_log` VALUES (2019343882326564865, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018935167005954050\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 17:34:34', 77);
INSERT INTO `sys_oper_log` VALUES (2019343885300326402, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018935167005954050\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-05 17:34:35', 48);
INSERT INTO `sys_oper_log` VALUES (2019704233417240577, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-06 17:26:28', 89);
INSERT INTO `sys_oper_log` VALUES (2019704239008247809, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-06 17:26:30', 62);
INSERT INTO `sys_oper_log` VALUES (2019707485487624193, '000000', '代码生成', 3, 'com.flash.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/2017420670340608001,2017420677118603265,2017420676736921605,2017420676162301954,2017420676418154497,2010949768560136193,2010949769604517890', '0:0:0:0:0:0:0:1', '内网IP', '[\"2017420670340608001\",\"2017420677118603265\",\"2017420676736921605\",\"2017420676162301954\",\"2017420676418154497\",\"2010949768560136193\",\"2010949769604517890\"]', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-06 17:39:24', 152);
INSERT INTO `sys_oper_log` VALUES (2019707523496407041, '000000', '代码生成', 6, 'com.flash.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '0:0:0:0:0:0:0:1', '内网IP', '{\"tables\":\"dh_background,dh_background_category\",\"dataName\":\"master\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-06 17:39:33', 675);
INSERT INTO `sys_oper_log` VALUES (2019707749854605314, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-06 17:40:26\",\"params\":{\"parentMenuId\":0,\"popupComponent\":\"modal\",\"formComponent\":\"useForm\"},\"tableId\":\"2019707520937881602\",\"dataName\":\"master\",\"tableName\":\"dh_background\",\"tableComment\":\"背景表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"DhBackground\",\"tplCategory\":\"crud\",\"packageName\":\"com.flash.human\",\"moduleName\":\"human\",\"businessName\":\"background\",\"functionName\":\"背景\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-06 17:40:26\",\"columnId\":\"2019707522468802562\",\"tableId\":\"2019707520937881602\",\"columnName\":\"id\",\"columnComment\":\"ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"list\":true,\"required\":true,\"pk\":true,\"superColumn\":false,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"capJavaField\":\"Id\",\"query\":false,\"increment\":true},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-06 17:40:26\",\"columnId\":\"2019707522468802563\",\"tableId\":\"2019707520937881602\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户编号\",\"columnType\":\"varchar(20)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"0\",\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"list\":false,\"required\":false,\"pk\":false,\"superColumn\":false,\"insert\":false,\"edit\":false,\"usableColumn\":false,\"capJavaField\":\"TenantId\",\"query\":false,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-06 17:40:26\",\"columnId\":\"2019707522468802564\",\"tableId\":\"2019707520937881602\",\"columnName\":\"dept_id\",\"columnComment\":\"部门ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"deptId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"list\":true,\"required\":false,\"pk\":false,\"superColumn\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"capJavaField\":\"DeptId\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-06 17:40:26\",\"columnId\":\"2019707522468802565\",\"tableId\":\"2019707520937881602\",\"columnName\":\"user_id\",\"columnComment\":\"用户ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"userId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":4,\"list\":true,\"required\":true,\"pk\":false,\"superColumn\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"capJavaField\":\"UserId\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-06 17:40:26\",\"columnId\":\"2019707522468802566\",\"tableId\":\"2019707520937881602\",\"columnName\":\"backgroud_category\",\"columnComment\":\"分类ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"backgroudCategory\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":5,\"list\":true,\"required\":true,\"pk\":false,\"superColumn\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"capJavaField\":\"BackgroudCategory\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-06 17:40:26\",\"columnId\":\"2019707522510745601\",\"tableId\":\"2019707520937881602\",\"columnName\":\"name\",\"columnComment\":\"背景名称\",\"columnType\":\"varchar', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-06 17:40:27', 97);
INSERT INTO `sys_oper_log` VALUES (2019707967681589249, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-06 17:41:18\",\"params\":{\"parentMenuId\":0,\"popupComponent\":\"modal\",\"formComponent\":\"useForm\"},\"tableId\":\"2019707522905010177\",\"dataName\":\"master\",\"tableName\":\"dh_background_category\",\"tableComment\":\"背景分类表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"DhBackgroundCategory\",\"tplCategory\":\"crud\",\"packageName\":\"com.flash.human\",\"moduleName\":\"human\",\"businessName\":\"backgroundCategory\",\"functionName\":\"背景分类\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-06 17:41:18\",\"columnId\":\"2019707523047616513\",\"tableId\":\"2019707522905010177\",\"columnName\":\"id\",\"columnComment\":\"ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"list\":true,\"required\":true,\"pk\":true,\"superColumn\":false,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"capJavaField\":\"Id\",\"query\":false,\"increment\":true},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-06 17:41:18\",\"columnId\":\"2019707523047616514\",\"tableId\":\"2019707522905010177\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户编号\",\"columnType\":\"varchar(20)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"0\",\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"list\":false,\"required\":false,\"pk\":false,\"superColumn\":false,\"insert\":false,\"edit\":false,\"usableColumn\":false,\"capJavaField\":\"TenantId\",\"query\":false,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-06 17:41:18\",\"columnId\":\"2019707523106336769\",\"tableId\":\"2019707522905010177\",\"columnName\":\"dept_id\",\"columnComment\":\"部门ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"deptId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"list\":true,\"required\":false,\"pk\":false,\"superColumn\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"capJavaField\":\"DeptId\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-06 17:41:18\",\"columnId\":\"2019707523106336770\",\"tableId\":\"2019707522905010177\",\"columnName\":\"name\",\"columnComment\":\"分类名称（会议室、演播厅、自然风光）\",\"columnType\":\"varchar(30)\",\"javaType\":\"String\",\"javaField\":\"name\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":4,\"list\":true,\"required\":true,\"pk\":false,\"superColumn\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"capJavaField\":\"Name\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-06 17:41:18\",\"columnId\":\"2019707523106336771\",\"tableId\":\"2019707522905010177\",\"columnName\":\"status\",\"columnComment\":\"状态（1-可用 2-禁用）\",\"columnType\":\"tinyint\",\"javaType\":\"Long\",\"javaField\":\"status\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"radio\",\"dictType\":\"\",\"sort\":5,\"list\":true,\"required\":false,\"pk\":false,\"superColumn\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"capJavaField\":\"Status\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-06 17:41:18\",\"columnId\":\"2019707523106336772\",\"tableId\":\"2019707522905010177\",\"columnName\":\"remark\",\"columnComment\":\"备注\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-06 17:41:19', 68);
INSERT INTO `sys_oper_log` VALUES (2019707991824003073, '000000', '代码生成', 8, 'com.flash.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '0:0:0:0:0:0:0:1', '内网IP', '{\"tableIdStr\":\"2019707520937881602,2019707522905010177\"}', '', 0, '', '2026-02-06 17:41:24', 90);
INSERT INTO `sys_oper_log` VALUES (2019935477396664321, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 08:45:21', 87);
INSERT INTO `sys_oper_log` VALUES (2019935479611256833, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 08:45:22', 56);
INSERT INTO `sys_oper_log` VALUES (2019935484636033025, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 08:45:23', 63);
INSERT INTO `sys_oper_log` VALUES (2019942884772372482, '000000', '知识库分类', 1, 'com.flash.knowledge.controller.KbCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"name\":\"2026年启点赛\",\"orderNum\":1,\"status\":null}', '', 1, '分类名称已存在', '2026-02-07 09:14:47', 63);
INSERT INTO `sys_oper_log` VALUES (2019942925729751041, '000000', '知识库分类', 1, 'com.flash.knowledge.controller.KbCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019942925473898497\",\"name\":\"2025年启点赛\",\"orderNum\":1,\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 09:14:57', 74);
INSERT INTO `sys_oper_log` VALUES (2019942938178445314, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019942925473898497\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 09:15:00', 64);
INSERT INTO `sys_oper_log` VALUES (2019943955678846978, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 09:19:02', 66);
INSERT INTO `sys_oper_log` VALUES (2019943957838913537, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 09:19:03', 57);
INSERT INTO `sys_oper_log` VALUES (2019945646339874817, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 09:25:46', 64);
INSERT INTO `sys_oper_log` VALUES (2019945652614553601, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 09:25:47', 63);
INSERT INTO `sys_oper_log` VALUES (2019945663469412354, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019942925473898497\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 09:25:50', 81);
INSERT INTO `sys_oper_log` VALUES (2019946443375075329, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":\"2026年启点赛\",\"orderNum\":2,\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 09:28:56', 74);
INSERT INTO `sys_oper_log` VALUES (2019946472563236865, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":\"2025年冠军赛\",\"orderNum\":2,\"status\":null}', '', 1, '分类名称已存在', '2026-02-07 09:29:03', 17);
INSERT INTO `sys_oper_log` VALUES (2019947442600837122, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018941989372760065\",\"kbCategoryId\":\"2018579148060942337\",\"title\":\"赛制\",\"tag\":\"123\",\"content\":\"123\",\"status\":null}', '', 1, '该分类下已存在该标题的文档', '2026-02-07 09:32:54', 34);
INSERT INTO `sys_oper_log` VALUES (2019947456710475778, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018941989372760065\",\"kbCategoryId\":\"2019942925473898497\",\"title\":\"赛制\",\"tag\":\"123\",\"content\":\"123\",\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 09:32:57', 66);
INSERT INTO `sys_oper_log` VALUES (2019947525505449986, '000000', '知识库文档', 1, 'com.flash.knowledge.controller.KbDocumentController.add()', 'POST', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019947525295734786\",\"kbCategoryId\":\"2018579022277959682\",\"title\":\"赛制\",\"tag\":null,\"content\":null,\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 09:33:14', 64);
INSERT INTO `sys_oper_log` VALUES (2019947551350751233, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019947525295734786\",\"kbCategoryId\":\"2018579148060942337\",\"title\":\"赛制\",\"tag\":null,\"content\":null,\"status\":null}', '', 1, '该分类下已存在该标题的文档', '2026-02-07 09:33:20', 22);
INSERT INTO `sys_oper_log` VALUES (2019947561370943489, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019947525295734786\",\"kbCategoryId\":\"2019942925473898497\",\"title\":\"赛制\",\"tag\":null,\"content\":null,\"status\":null}', '', 1, '该分类下已存在该标题的文档', '2026-02-07 09:33:22', 17);
INSERT INTO `sys_oper_log` VALUES (2019947621831835650, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018941989372760065\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 09:33:37', 60);
INSERT INTO `sys_oper_log` VALUES (2019947624910454785, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019947525295734786\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 09:33:37', 60);
INSERT INTO `sys_oper_log` VALUES (2019949697093763074, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 09:41:51', 61);
INSERT INTO `sys_oper_log` VALUES (2019949700830887937, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019942925473898497\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 09:41:52', 62);
INSERT INTO `sys_oper_log` VALUES (2019955973416714242, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018935167005954050\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:06:48', 64);
INSERT INTO `sys_oper_log` VALUES (2019955976163983361, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018941989372760065\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:06:48', 65);
INSERT INTO `sys_oper_log` VALUES (2019955981075513345, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018941989372760065\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:06:50', 65);
INSERT INTO `sys_oper_log` VALUES (2019955984623894530, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018935167005954050\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:06:50', 57);
INSERT INTO `sys_oper_log` VALUES (2019956011463245826, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018941989372760065\",\"kbCategoryId\":\"2019942925473898497\",\"title\":\"赛制\",\"tag\":\"123\",\"content\":\"4444444444\",\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:06:57', 64);
INSERT INTO `sys_oper_log` VALUES (2019964799834529794, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:41:52', 192);
INSERT INTO `sys_oper_log` VALUES (2019964815001133058, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018935167005954050\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:41:56', 66);
INSERT INTO `sys_oper_log` VALUES (2019964817308000258, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018935167005954050\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:41:56', 132);
INSERT INTO `sys_oper_log` VALUES (2019964838019473409, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018935167005954050\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:42:01', 20);
INSERT INTO `sys_oper_log` VALUES (2019964861314637826, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018935167005954050\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:42:07', 19);
INSERT INTO `sys_oper_log` VALUES (2019964891471683586, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018941989372760065\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:42:14', 19);
INSERT INTO `sys_oper_log` VALUES (2019964901068251138, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019947525295734786\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:42:16', 19);
INSERT INTO `sys_oper_log` VALUES (2019965535020564482, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019947525295734786\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:44:47', 77);
INSERT INTO `sys_oper_log` VALUES (2019965539743350785, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018941989372760065\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:44:48', 69);
INSERT INTO `sys_oper_log` VALUES (2019965540003397634, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019947525295734786\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:44:49', 110);
INSERT INTO `sys_oper_log` VALUES (2019965653669036034, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:45:16', 62);
INSERT INTO `sys_oper_log` VALUES (2019965656202395649, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:45:16', 86);
INSERT INTO `sys_oper_log` VALUES (2019965797487525890, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018941989372760065\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:45:50', 59);
INSERT INTO `sys_oper_log` VALUES (2019965878303375362, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:46:09', 65);
INSERT INTO `sys_oper_log` VALUES (2019965882405404674, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:46:10', 83);
INSERT INTO `sys_oper_log` VALUES (2019965885119119362, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019942925473898497\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:46:11', 58);
INSERT INTO `sys_oper_log` VALUES (2019967696110534657, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:53:23', 58);
INSERT INTO `sys_oper_log` VALUES (2019967699931545601, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019942925473898497\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:53:24', 124);
INSERT INTO `sys_oper_log` VALUES (2019968511781027841, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:56:37', 84);
INSERT INTO `sys_oper_log` VALUES (2019968515820142593, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:56:38', 61);
INSERT INTO `sys_oper_log` VALUES (2019968520979136514, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019942925473898497\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:56:39', 75);
INSERT INTO `sys_oper_log` VALUES (2019968526326874113, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019942925473898497\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 10:56:41', 55);
INSERT INTO `sys_oper_log` VALUES (2019971404718313473, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018941989372760065\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:08:07', 93);
INSERT INTO `sys_oper_log` VALUES (2019974806340775937, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:21:38', 70);
INSERT INTO `sys_oper_log` VALUES (2019974810325364738, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019942925473898497\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:21:39', 57);
INSERT INTO `sys_oper_log` VALUES (2019974823621308418, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018935167005954050\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:21:42', 84);
INSERT INTO `sys_oper_log` VALUES (2019974827790446594, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019947525295734786\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:21:43', 131);
INSERT INTO `sys_oper_log` VALUES (2019974924439793666, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":\"2025年冠军赛\",\"orderNum\":5,\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:22:06', 70);
INSERT INTO `sys_oper_log` VALUES (2019976238607544322, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:27:19', 96);
INSERT INTO `sys_oper_log` VALUES (2019976242478886914, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019942925473898497\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:27:20', 54);
INSERT INTO `sys_oper_log` VALUES (2019976246304092162, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:27:21', 58);
INSERT INTO `sys_oper_log` VALUES (2019976249256882177, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:27:22', 59);
INSERT INTO `sys_oper_log` VALUES (2019976514982817794, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018941989372760065\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:28:25', 63);
INSERT INTO `sys_oper_log` VALUES (2019976518824800258, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019947525295734786\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:28:26', 102);
INSERT INTO `sys_oper_log` VALUES (2019977359510200321, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018935167005954050\",\"kbCategoryId\":\"2018579022277959682\",\"title\":\"赛制\",\"tag\":\"123\",\"content\":\"1\",\"status\":null}', '', 1, '该分类下已存在该标题的文档', '2026-02-07 11:31:47', 29);
INSERT INTO `sys_oper_log` VALUES (2019977378145492994, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018935167005954050\",\"kbCategoryId\":\"2018579022277959682\",\"title\":\"赛制\",\"tag\":\"123\",\"content\":\"1231231\",\"status\":null}', '', 1, '该分类下已存在该标题的文档', '2026-02-07 11:31:51', 20);
INSERT INTO `sys_oper_log` VALUES (2019977414367502338, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:32:00', 88);
INSERT INTO `sys_oper_log` VALUES (2019977418029129730, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:32:00', 66);
INSERT INTO `sys_oper_log` VALUES (2019977435699732481, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018935167005954050\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:32:05', 65);
INSERT INTO `sys_oper_log` VALUES (2019978088828362753, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2017424741537591297\",\"parentId\":0,\"menuName\":\"人管理\",\"orderNum\":22,\"path\":\"human\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"mdi:human-greeting\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:34:40', 81);
INSERT INTO `sys_oper_log` VALUES (2019980776358010881, '000000', '形象分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":\"温柔\",\"status\":null,\"remark\":\"234\",\"orderNum\":0}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:45:21', 62);
INSERT INTO `sys_oper_log` VALUES (2019982839892664322, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"0\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:53:33', 694);
INSERT INTO `sys_oper_log` VALUES (2019982905470607361, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"0\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 11:53:49', 14);
INSERT INTO `sys_oper_log` VALUES (2020008363222360065, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"0\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 13:34:58', 16);
INSERT INTO `sys_oper_log` VALUES (2020008393928859649, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"0\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 13:35:06', 19);
INSERT INTO `sys_oper_log` VALUES (2020008472542699522, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"0\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 13:35:24', 16);
INSERT INTO `sys_oper_log` VALUES (2020008901427060738, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"0\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 13:37:07', 240);
INSERT INTO `sys_oper_log` VALUES (2020009401128050689, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"0\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 13:39:06', 16);
INSERT INTO `sys_oper_log` VALUES (2020009435965939714, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"0\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 13:39:14', 14);
INSERT INTO `sys_oper_log` VALUES (2020011306096930817, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"0\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 13:46:40', 131);
INSERT INTO `sys_oper_log` VALUES (2020011355413557249, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"1\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 13:46:52', 76);
INSERT INTO `sys_oper_log` VALUES (2020014410230124545, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":\"2026年启点赛\",\"orderNum\":40,\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 13:59:00', 102);
INSERT INTO `sys_oper_log` VALUES (2020014637515264001, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"0\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 13:59:54', 56);
INSERT INTO `sys_oper_log` VALUES (2020016267023302657, '000000', '代码生成', 8, 'com.flash.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '0:0:0:0:0:0:0:1', '内网IP', '{\"tableIdStr\":\"2019707522905010177,2019707520937881602\"}', '', 0, '', '2026-02-07 14:06:23', 717);
INSERT INTO `sys_oper_log` VALUES (2020016336120266754, '000000', '代码生成', 8, 'com.flash.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '0:0:0:0:0:0:0:1', '内网IP', '{\"tableIdStr\":\"2019707520937881602\"}', '', 0, '', '2026-02-07 14:06:39', 42);
INSERT INTO `sys_oper_log` VALUES (2020016630254223362, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/2019707520937881602', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 14:07:49', 806);
INSERT INTO `sys_oper_log` VALUES (2020033555562745858, '000000', '知识库分类', 1, 'com.flash.knowledge.controller.KbCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033554698719233\",\"name\":\"积光\",\"orderNum\":1111,\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 15:15:05', 223);
INSERT INTO `sys_oper_log` VALUES (2020033639566266369, '000000', '知识库文档', 1, 'com.flash.knowledge.controller.KbDocumentController.add()', 'POST', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033635980136450\",\"kbCategoryId\":\"2020033554698719233\",\"title\":\"产品\",\"tag\":null,\"content\":\"积光产品系列有：\\n\\n- 1201系列\\n- 灯条系列\\n- 防水灯系列\\n- 工程灯\\n- UFO系列\\n- X9系列\\n- 瓢虫灯（九鼎）\\n- O2\",\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 15:15:25', 867);
INSERT INTO `sys_oper_log` VALUES (2020033797934796802, '000000', '知识库文档', 1, 'com.flash.knowledge.controller.KbDocumentController.add()', 'POST', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033796080914433\",\"kbCategoryId\":\"2020033554698719233\",\"title\":\"使用教程\",\"tag\":null,\"content\":\"使用灯的教程如下：\\n\\n1. 拆开包装，检查是否缺少零件\\n2. 检查外包装的Sn码和灯体的二维码上的Sn码是否一致\\n3. 将灯通上电，检查灯是否亮\\n3. 打开地平线APP，点击右上角添加设备，添加完，扫码(灯体上的二维码)激活\",\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 15:16:03', 460);
INSERT INTO `sys_oper_log` VALUES (2020035465044733954, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033554698719233\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 15:22:40', 180);
INSERT INTO `sys_oper_log` VALUES (2020035474892959746, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033554698719233\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 15:22:42', 62);
INSERT INTO `sys_oper_log` VALUES (2020035500977336321, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033554698719233\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 15:22:49', 61);
INSERT INTO `sys_oper_log` VALUES (2020040715617087489, '000000', '知识库文档', 1, 'com.flash.knowledge.controller.KbDocumentController.add()', 'POST', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020040713113088001\",\"kbCategoryId\":\"2020033554698719233\",\"title\":\"积光的供应商\",\"tag\":null,\"content\":\"九一一、景原部落、韵之海、京渔科技、南湾水族、百度水族、享海客、嘉翔水族、博云天、久哥玩南美、金华、正林水族、阿刘说南美、静风听海、天一阁水族\",\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 15:43:32', 631);
INSERT INTO `sys_oper_log` VALUES (2020041224251944961, '000000', '知识库文档', 1, 'com.flash.knowledge.controller.KbDocumentController.add()', 'POST', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020041222549057538\",\"kbCategoryId\":\"2020033554698719233\",\"title\":\"积光经销商\",\"tag\":null,\"content\":\"积光水族灯的经销商有：九一一、景原部落、韵之海、京渔科技、南湾水族、百度水族、享海客、嘉翔水族、博云天、久哥玩南美、金华、正林水族、阿刘说南美、静风听海、天一阁水族\",\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 15:45:33', 413);
INSERT INTO `sys_oper_log` VALUES (2020042943576899585, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033796080914433\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 15:52:23', 168);
INSERT INTO `sys_oper_log` VALUES (2020042947163029505, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020041222549057538\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 15:52:24', 60);
INSERT INTO `sys_oper_log` VALUES (2020042953680977922, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033635980136450\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 15:52:25', 70);
INSERT INTO `sys_oper_log` VALUES (2020042999839293441, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019947525295734786\",\"kbCategoryId\":\"2018579148060942337\",\"title\":\"赛制\",\"tag\":null,\"content\":null,\"status\":null}', '', 1, '该分类下已存在该标题的文档', '2026-02-07 15:52:36', 20);
INSERT INTO `sys_oper_log` VALUES (2020043736858198017, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020041222549057538\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 15:55:32', 59);
INSERT INTO `sys_oper_log` VALUES (2020043741987831810, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020041222549057538\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 15:55:33', 71);
INSERT INTO `sys_oper_log` VALUES (2020046665971380225, '000000', '知识库文档', 1, 'com.flash.knowledge.controller.KbDocumentController.add()', 'POST', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020046662548828161\",\"kbCategoryId\":\"2020033554698719233\",\"title\":\"经销商\",\"tag\":null,\"content\":\"积光水族灯的经销商有：九一一、景原部落、韵之海、京渔科技、南湾水族、百度水族、享海客、嘉翔水族、博云天、久哥玩南美、金华、正林水族、阿刘说南美、静风听海、天一阁水族\",\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 16:07:10', 834);
INSERT INTO `sys_oper_log` VALUES (2020046802034601986, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020046662548828161\",\"kbCategoryId\":\"2020033554698719233\",\"title\":\"经销商\",\"tag\":null,\"content\":\"积光水族灯的经销商有：九一一、景原部落、韵之海\",\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 16:07:43', 577);
INSERT INTO `sys_oper_log` VALUES (2020046855633612801, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019947525295734786\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 16:07:56', 268);
INSERT INTO `sys_oper_log` VALUES (2020046858158583809, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033635980136450\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 16:07:56', 72);
INSERT INTO `sys_oper_log` VALUES (2020047789734473729, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033796080914433\",\"kbCategoryId\":\"2020033554698719233\",\"title\":\"使用教程\",\"tag\":null,\"content\":\"使用灯的教程如下：\\n1. 拆开包装，检查是否缺少零件\\n2. 检查外包装的Sn码和灯体的二维码上的Sn码是否一致\\n3. 将灯通上电，检查灯是否亮\\n3. 打开地平线APP，点击右上角添加设备，添加完，扫码(灯体上的二维码)激活\",\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 16:11:38', 646);
INSERT INTO `sys_oper_log` VALUES (2020048017355157506, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033635980136450\",\"kbCategoryId\":\"2020033554698719233\",\"title\":\"产品\",\"tag\":null,\"content\":\"积光产品系列有：\\n1.1201系列\\n2.灯条系列\\n3.防水灯系列\\n4.工程灯\\n5.UFO系列\\n6.X9系列\\n7.瓢虫灯（九鼎）\\n8.O2\",\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 16:12:33', 541);
INSERT INTO `sys_oper_log` VALUES (2020049994520702978, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"1\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 16:20:24', 93);
INSERT INTO `sys_oper_log` VALUES (2020049997381218305, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"0\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 16:20:25', 56);
INSERT INTO `sys_oper_log` VALUES (2020050435274944513, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019942925473898497\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 16:22:09', 59);
INSERT INTO `sys_oper_log` VALUES (2020050437762166786, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019942925473898497\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-07 16:22:10', 58);
INSERT INTO `sys_oper_log` VALUES (2020676622632288258, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019947525295734786\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 09:50:24', 88);
INSERT INTO `sys_oper_log` VALUES (2020676625341808642, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033635980136450\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 09:50:24', 66);
INSERT INTO `sys_oper_log` VALUES (2020676632732172290, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020046662548828161\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 09:50:26', 128);
INSERT INTO `sys_oper_log` VALUES (2020676999217872897, '000000', '部门管理', 3, 'com.flash.system.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/108', '0:0:0:0:0:0:0:1', '内网IP', '108', '{\"code\":601,\"msg\":\"部门存在用户,不允许删除\",\"data\":null}', 0, '', '2026-02-09 09:51:54', 33);
INSERT INTO `sys_oper_log` VALUES (2020677079236804609, '000000', '用户管理', 3, 'com.flash.system.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/3', '0:0:0:0:0:0:0:1', '内网IP', '[3]', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 09:52:13', 108);
INSERT INTO `sys_oper_log` VALUES (2020684060328656897, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"1\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 10:19:57', 68);
INSERT INTO `sys_oper_log` VALUES (2020684063084314626, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"0\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 10:19:58', 149);
INSERT INTO `sys_oper_log` VALUES (2020740152752537602, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019942925473898497\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 14:02:51', 80);
INSERT INTO `sys_oper_log` VALUES (2020740157911531522, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 14:02:52', 60);
INSERT INTO `sys_oper_log` VALUES (2020740160205815809, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 14:02:52', 61);
INSERT INTO `sys_oper_log` VALUES (2020740171836620801, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 14:02:55', 62);
INSERT INTO `sys_oper_log` VALUES (2020740176026730497, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019942925473898497\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 14:02:56', 57);
INSERT INTO `sys_oper_log` VALUES (2020740179042435073, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 14:02:57', 82);
INSERT INTO `sys_oper_log` VALUES (2020740195760930818, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 14:03:01', 55);
INSERT INTO `sys_oper_log` VALUES (2020740202933190657, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 14:03:03', 67);
INSERT INTO `sys_oper_log` VALUES (2020741415506477058, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019942925473898497\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 14:07:52', 455);
INSERT INTO `sys_oper_log` VALUES (2020741420128600065, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019942925473898497\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 14:07:53', 248);
INSERT INTO `sys_oper_log` VALUES (2020745365588738049, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019942925473898497\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 14:23:33', 78);
INSERT INTO `sys_oper_log` VALUES (2020745368168235009, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 14:23:34', 58);
INSERT INTO `sys_oper_log` VALUES (2020745370663845889, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 14:23:35', 59);
INSERT INTO `sys_oper_log` VALUES (2020745373536944130, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2019942925473898497\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 14:23:35', 62);
INSERT INTO `sys_oper_log` VALUES (2020756296284700673, '000000', '代码生成', 3, 'com.flash.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/2019707522905010177,2019707520937881602', '0:0:0:0:0:0:0:1', '内网IP', '[\"2019707522905010177\",\"2019707520937881602\"]', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 15:07:00', 199);
INSERT INTO `sys_oper_log` VALUES (2020756324248125442, '000000', '代码生成', 6, 'com.flash.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '0:0:0:0:0:0:0:1', '内网IP', '{\"tables\":\"dh_chat_message,dh_chat_session\",\"dataName\":\"master\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 15:07:06', 720);
INSERT INTO `sys_oper_log` VALUES (2020756491747655681, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/2020756323388293121', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 15:07:46', 149);
INSERT INTO `sys_oper_log` VALUES (2020756802004516865, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 15:08:59\",\"params\":{\"parentMenuId\":0,\"popupComponent\":\"modal\",\"formComponent\":\"useForm\"},\"tableId\":\"2020756323388293121\",\"dataName\":\"master\",\"tableName\":\"dh_chat_session\",\"tableComment\":\"对话会话表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"DhChatSession\",\"tplCategory\":\"crud\",\"packageName\":\"com.flash.human\",\"moduleName\":\"human\",\"businessName\":\"chatSession\",\"functionName\":\"对话会话\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 15:08:59\",\"columnId\":\"2020756323656728578\",\"tableId\":\"2020756323388293121\",\"columnName\":\"id\",\"columnComment\":\"ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"usableColumn\":false,\"superColumn\":false,\"insert\":false,\"edit\":true,\"capJavaField\":\"Id\",\"query\":false,\"increment\":true},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 15:08:59\",\"columnId\":\"2020756323656728579\",\"tableId\":\"2020756323388293121\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户编号\",\"columnType\":\"varchar(20)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"0\",\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":null,\"sort\":2,\"required\":false,\"list\":false,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"insert\":false,\"edit\":false,\"capJavaField\":\"TenantId\",\"query\":false,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 15:09:00\",\"columnId\":\"2020756323656728581\",\"tableId\":\"2020756323388293121\",\"columnName\":\"title\",\"columnComment\":\"标题\",\"columnType\":\"varchar(50)\",\"javaType\":\"String\",\"javaField\":\"title\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"insert\":true,\"edit\":true,\"capJavaField\":\"Title\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 15:09:00\",\"columnId\":\"2020756323656728582\",\"tableId\":\"2020756323388293121\",\"columnName\":\"channel\",\"columnComment\":\"来源渠道（0-网页 1-APP 2-小程序）\",\"columnType\":\"char(1)\",\"javaType\":\"String\",\"javaField\":\"channel\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":4,\"required\":false,\"list\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"insert\":true,\"edit\":true,\"capJavaField\":\"Channel\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 15:09:00\",\"columnId\":\"2020756323656728583\",\"tableId\":\"2020756323388293121\",\"columnName\":\"status\",\"columnComment\":\"状态（0-AI 1-人工 2-已结束）\",\"columnType\":\"char(1)\",\"javaType\":\"String\",\"javaField\":\"status\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"radio\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"insert\":true,\"edit\":true,\"capJavaField\":\"Status\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 15:09:00\",\"columnId\":\"2020756323656728584\",\"tableId\":\"2020756323388293121\",\"columnName\":\"create_dept\",\"columnComment\":\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 15:09:00', 121);
INSERT INTO `sys_oper_log` VALUES (2020756996494393346, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 15:09:46\",\"params\":{\"parentMenuId\":0,\"popupComponent\":\"modal\",\"formComponent\":\"useForm\"},\"tableId\":\"2020756321505050626\",\"dataName\":\"master\",\"tableName\":\"dh_chat_message\",\"tableComment\":\"对话消息表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"DhChatMessage\",\"tplCategory\":\"crud\",\"packageName\":\"com.flash.human\",\"moduleName\":\"human\",\"businessName\":\"chatMessage\",\"functionName\":\"对话消息\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 15:09:46\",\"columnId\":\"2020756323124051969\",\"tableId\":\"2020756321505050626\",\"columnName\":\"id\",\"columnComment\":\"ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"usableColumn\":false,\"superColumn\":false,\"insert\":false,\"edit\":true,\"capJavaField\":\"Id\",\"query\":false,\"increment\":true},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 15:09:46\",\"columnId\":\"2020756323124051970\",\"tableId\":\"2020756321505050626\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户编号\",\"columnType\":\"varchar(20)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"0\",\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":false,\"list\":false,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"insert\":false,\"edit\":false,\"capJavaField\":\"TenantId\",\"query\":false,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 15:09:46\",\"columnId\":\"2020756323124051971\",\"tableId\":\"2020756321505050626\",\"columnName\":\"session_id\",\"columnComment\":\"会话ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"sessionId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":true,\"list\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"insert\":true,\"edit\":true,\"capJavaField\":\"SessionId\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 15:09:46\",\"columnId\":\"2020756323124051972\",\"tableId\":\"2020756321505050626\",\"columnName\":\"role\",\"columnComment\":\"角色（user、agent）\",\"columnType\":\"varchar(10)\",\"javaType\":\"String\",\"javaField\":\"role\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":4,\"required\":true,\"list\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"insert\":true,\"edit\":true,\"capJavaField\":\"Role\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 15:09:46\",\"columnId\":\"2020756323124051973\",\"tableId\":\"2020756321505050626\",\"columnName\":\"content\",\"columnComment\":\"内容\",\"columnType\":\"text\",\"javaType\":\"String\",\"javaField\":\"content\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"editor\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"insert\":true,\"edit\":true,\"capJavaField\":\"Content\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 15:09:46\",\"columnId\":\"2020756323124051974\",\"tableId\":\"2020756321505050626\",\"columnName\":\"model_name\",\"columnComment\":\"模型名称\",\"columnType\":\"varcha', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 15:09:46', 98);
INSERT INTO `sys_oper_log` VALUES (2020768364123586562, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/2020756323388293121', '0:0:0:0:0:0:0:1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 15:54:57', 429);
INSERT INTO `sys_oper_log` VALUES (2020768416904708098, '000000', '代码生成', 8, 'com.flash.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '0:0:0:0:0:0:0:1', '内网IP', '{\"tableIdStr\":\"2020756321505050626,2020756323388293121\"}', '', 0, '', '2026-02-09 15:55:09', 85);
INSERT INTO `sys_oper_log` VALUES (2020773724083388418, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033554698719233\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 16:16:15', 66);
INSERT INTO `sys_oper_log` VALUES (2020773732425859073, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033554698719233\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 16:16:17', 168);
INSERT INTO `sys_oper_log` VALUES (2020774017273626626, '000000', '菜单管理', 1, 'com.flash.system.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":null,\"parentId\":0,\"menuName\":\"聊天管理\",\"orderNum\":222,\"path\":\"chat\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"basil:chat-solid\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 16:17:25', 340);
INSERT INTO `sys_oper_log` VALUES (2020774101704966146, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2012415803188551682\",\"parentId\":0,\"menuName\":\"聊天\",\"orderNum\":51,\"path\":\"chat\",\"component\":\"ai/chat/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"basil:chat-solid\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 16:17:45', 60);
INSERT INTO `sys_oper_log` VALUES (2020774264666259457, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 16:18:23\",\"params\":{\"parentMenuId\":\"2020774016992608257\",\"popupComponent\":\"modal\",\"formComponent\":\"useForm\"},\"tableId\":\"2020756321505050626\",\"dataName\":\"master\",\"tableName\":\"dh_chat_message\",\"tableComment\":\"对话消息表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"DhChatMessage\",\"tplCategory\":\"crud\",\"packageName\":\"com.flash.human\",\"moduleName\":\"human\",\"businessName\":\"chatMessage\",\"functionName\":\"对话消息\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 16:18:23\",\"columnId\":\"2020756323124051969\",\"tableId\":\"2020756321505050626\",\"columnName\":\"id\",\"columnComment\":\"ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"usableColumn\":false,\"superColumn\":false,\"insert\":false,\"edit\":true,\"capJavaField\":\"Id\",\"query\":false,\"increment\":true},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 16:18:23\",\"columnId\":\"2020756323124051970\",\"tableId\":\"2020756321505050626\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户编号\",\"columnType\":\"varchar(20)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"0\",\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":false,\"list\":false,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"insert\":false,\"edit\":false,\"capJavaField\":\"TenantId\",\"query\":false,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 16:18:23\",\"columnId\":\"2020756323124051971\",\"tableId\":\"2020756321505050626\",\"columnName\":\"session_id\",\"columnComment\":\"会话ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"sessionId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":true,\"list\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"insert\":true,\"edit\":true,\"capJavaField\":\"SessionId\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 16:18:23\",\"columnId\":\"2020756323124051972\",\"tableId\":\"2020756321505050626\",\"columnName\":\"role\",\"columnComment\":\"角色（user、agent）\",\"columnType\":\"varchar(10)\",\"javaType\":\"String\",\"javaField\":\"role\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":4,\"required\":true,\"list\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"insert\":true,\"edit\":true,\"capJavaField\":\"Role\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 16:18:23\",\"columnId\":\"2020756323124051973\",\"tableId\":\"2020756321505050626\",\"columnName\":\"content\",\"columnComment\":\"内容\",\"columnType\":\"text\",\"javaType\":\"String\",\"javaField\":\"content\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"editor\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"insert\":true,\"edit\":true,\"capJavaField\":\"Content\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 16:18:23\",\"columnId\":\"2020756323124051974\",\"tableId\":\"2020756321505050626\",\"columnName\":\"model_name\",\"columnComment\":\"模型名称\",', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 16:18:24', 298);
INSERT INTO `sys_oper_log` VALUES (2020774337324187649, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 16:18:40\",\"params\":{\"parentMenuId\":\"2020774016992608257\",\"popupComponent\":\"modal\",\"formComponent\":\"useForm\"},\"tableId\":\"2020756323388293121\",\"dataName\":\"master\",\"tableName\":\"dh_chat_session\",\"tableComment\":\"对话会话表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"DhChatSession\",\"tplCategory\":\"crud\",\"packageName\":\"com.flash.human\",\"moduleName\":\"human\",\"businessName\":\"chatSession\",\"functionName\":\"对话会话\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 16:18:40\",\"columnId\":\"2020756323656728578\",\"tableId\":\"2020756323388293121\",\"columnName\":\"id\",\"columnComment\":\"ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"usableColumn\":false,\"superColumn\":false,\"insert\":false,\"edit\":true,\"capJavaField\":\"Id\",\"query\":false,\"increment\":true},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 16:18:40\",\"columnId\":\"2020756323656728579\",\"tableId\":\"2020756323388293121\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户编号\",\"columnType\":\"varchar(20)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"0\",\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":null,\"sort\":2,\"required\":false,\"list\":false,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"insert\":false,\"edit\":false,\"capJavaField\":\"TenantId\",\"query\":false,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 16:18:40\",\"columnId\":\"2020768363800625153\",\"tableId\":\"2020756323388293121\",\"columnName\":\"user_id\",\"columnComment\":\"用户ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"userId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"insert\":true,\"edit\":true,\"capJavaField\":\"UserId\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 16:18:40\",\"columnId\":\"2020756323656728581\",\"tableId\":\"2020756323388293121\",\"columnName\":\"title\",\"columnComment\":\"标题\",\"columnType\":\"varchar(50)\",\"javaType\":\"String\",\"javaField\":\"title\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":4,\"required\":false,\"list\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"insert\":true,\"edit\":true,\"capJavaField\":\"Title\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 16:18:40\",\"columnId\":\"2020756323656728582\",\"tableId\":\"2020756323388293121\",\"columnName\":\"channel\",\"columnComment\":\"来源渠道（0-网页 1-APP 2-小程序）\",\"columnType\":\"char(1)\",\"javaType\":\"String\",\"javaField\":\"channel\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"insert\":true,\"edit\":true,\"capJavaField\":\"Channel\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-09 16:18:40\",\"columnId\":\"2020756323656728583\",\"tableId\":\"2020756323388293121\",\"columnName\":\"status\",\"columnComment\":\"状态', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-09 16:18:41', 83);
INSERT INTO `sys_oper_log` VALUES (2021027588514717697, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2012415803188551682\",\"parentId\":0,\"menuName\":\"聊天\",\"orderNum\":51,\"path\":\"chat-demo\",\"component\":\"ai/chat/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"basil:chat-solid\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:05:01', 103);
INSERT INTO `sys_oper_log` VALUES (2021030678739492866, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":116,\"parentId\":3,\"menuName\":\"修改生成配置\",\"orderNum\":2,\"path\":\"gen-edit/index/tableId\",\"component\":\"tool/gen/editTable\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"tool:gen:edit\",\"icon\":\"radix-icons:update\",\"remark\":\"/tool/gen\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:17:17', 66);
INSERT INTO `sys_oper_log` VALUES (2021030810952343554, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":116,\"parentId\":3,\"menuName\":\"修改生成配置\",\"orderNum\":2,\"path\":\"gen-edit/index/:tableId\",\"component\":\"tool/gen/editTable\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"tool:gen:edit\",\"icon\":\"radix-icons:update\",\"remark\":\"/tool/gen\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:17:49', 83);
INSERT INTO `sys_oper_log` VALUES (2021033302138232833, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":116,\"parentId\":3,\"menuName\":\"修改生成配置\",\"orderNum\":2,\"path\":\"gen-edit/index/:tableId\",\"component\":\"tool/gen/editTable\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"tool:gen:edit\",\"icon\":\"radix-icons:update\",\"remark\":\"/tool/gen\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:27:43', 65);
INSERT INTO `sys_oper_log` VALUES (2021033373969883138, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-10 09:27:59\",\"params\":{\"parentMenuId\":\"2020774016992608257\",\"popupComponent\":\"modal\",\"formComponent\":\"useForm\"},\"tableId\":\"2020756323388293121\",\"dataName\":\"master\",\"tableName\":\"dh_chat_session\",\"tableComment\":\"对话会话表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"DhChatSession\",\"tplCategory\":\"crud\",\"packageName\":\"com.flash.human\",\"moduleName\":\"human\",\"businessName\":\"chatSession\",\"functionName\":\"对话会话\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-10 09:27:59\",\"columnId\":\"2020756323656728578\",\"tableId\":\"2020756323388293121\",\"columnName\":\"id\",\"columnComment\":\"ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"usableColumn\":false,\"superColumn\":false,\"edit\":true,\"insert\":false,\"pk\":true,\"capJavaField\":\"Id\",\"query\":false,\"increment\":true},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-10 09:27:59\",\"columnId\":\"2020756323656728579\",\"tableId\":\"2020756323388293121\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户编号\",\"columnType\":\"varchar(20)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"0\",\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":null,\"sort\":2,\"required\":false,\"list\":false,\"usableColumn\":false,\"superColumn\":false,\"edit\":false,\"insert\":false,\"pk\":false,\"capJavaField\":\"TenantId\",\"query\":false,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-10 09:27:59\",\"columnId\":\"2020768363800625153\",\"tableId\":\"2020756323388293121\",\"columnName\":\"user_id\",\"columnComment\":\"用户ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"userId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"usableColumn\":false,\"superColumn\":false,\"edit\":true,\"insert\":true,\"pk\":false,\"capJavaField\":\"UserId\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-10 09:27:59\",\"columnId\":\"2020756323656728581\",\"tableId\":\"2020756323388293121\",\"columnName\":\"title\",\"columnComment\":\"标题\",\"columnType\":\"varchar(50)\",\"javaType\":\"String\",\"javaField\":\"title\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":4,\"required\":false,\"list\":true,\"usableColumn\":false,\"superColumn\":false,\"edit\":true,\"insert\":true,\"pk\":false,\"capJavaField\":\"Title\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-10 09:27:59\",\"columnId\":\"2020756323656728582\",\"tableId\":\"2020756323388293121\",\"columnName\":\"channel\",\"columnComment\":\"来源渠道（0-网页 1-APP 2-小程序）\",\"columnType\":\"char(1)\",\"javaType\":\"String\",\"javaField\":\"channel\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":true,\"usableColumn\":false,\"superColumn\":false,\"edit\":true,\"insert\":true,\"pk\":false,\"capJavaField\":\"Channel\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-10 09:27:59\",\"columnId\":\"2020756323656728583\",\"tableId\":\"2020756323388293121\",\"columnName\":\"status\",\"columnComment\":\"状态', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:28:00', 159);
INSERT INTO `sys_oper_log` VALUES (2021033403061575681, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-10 09:28:06\",\"params\":{\"parentMenuId\":\"2020774016992608257\",\"popupComponent\":\"modal\",\"formComponent\":\"useForm\"},\"tableId\":\"2020756321505050626\",\"dataName\":\"master\",\"tableName\":\"dh_chat_message\",\"tableComment\":\"对话消息表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"DhChatMessage\",\"tplCategory\":\"crud\",\"packageName\":\"com.flash.human\",\"moduleName\":\"human\",\"businessName\":\"chatMessage\",\"functionName\":\"对话消息\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-10 09:28:06\",\"columnId\":\"2020756323124051969\",\"tableId\":\"2020756321505050626\",\"columnName\":\"id\",\"columnComment\":\"ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"usableColumn\":false,\"superColumn\":false,\"edit\":true,\"insert\":false,\"pk\":true,\"capJavaField\":\"Id\",\"query\":false,\"increment\":true},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-10 09:28:06\",\"columnId\":\"2020756323124051970\",\"tableId\":\"2020756321505050626\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户编号\",\"columnType\":\"varchar(20)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"0\",\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":false,\"list\":false,\"usableColumn\":false,\"superColumn\":false,\"edit\":false,\"insert\":false,\"pk\":false,\"capJavaField\":\"TenantId\",\"query\":false,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-10 09:28:06\",\"columnId\":\"2020756323124051971\",\"tableId\":\"2020756321505050626\",\"columnName\":\"session_id\",\"columnComment\":\"会话ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"sessionId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":true,\"list\":true,\"usableColumn\":false,\"superColumn\":false,\"edit\":true,\"insert\":true,\"pk\":false,\"capJavaField\":\"SessionId\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-10 09:28:06\",\"columnId\":\"2020756323124051972\",\"tableId\":\"2020756321505050626\",\"columnName\":\"role\",\"columnComment\":\"角色（user、agent）\",\"columnType\":\"varchar(10)\",\"javaType\":\"String\",\"javaField\":\"role\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":4,\"required\":true,\"list\":true,\"usableColumn\":false,\"superColumn\":false,\"edit\":true,\"insert\":true,\"pk\":false,\"capJavaField\":\"Role\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-10 09:28:06\",\"columnId\":\"2020756323124051973\",\"tableId\":\"2020756321505050626\",\"columnName\":\"content\",\"columnComment\":\"内容\",\"columnType\":\"text\",\"javaType\":\"String\",\"javaField\":\"content\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"editor\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":true,\"usableColumn\":false,\"superColumn\":false,\"edit\":true,\"insert\":true,\"pk\":false,\"capJavaField\":\"Content\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-02-10 09:28:06\",\"columnId\":\"2020756323124051974\",\"tableId\":\"2020756321505050626\",\"columnName\":\"model_name\",\"columnComment\":\"模型名称\",', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:28:07', 104);
INSERT INTO `sys_oper_log` VALUES (2021035924358373377, '000000', '字典类型', 1, 'com.flash.system.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"对话渠道\",\"dictType\":\"dh_chat_channel\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:38:08', 198);
INSERT INTO `sys_oper_log` VALUES (2021036111726321666, '000000', '字典数据', 1, 'com.flash.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"网页\",\"dictValue\":\"0\",\"dictType\":\"dh_chat_channel\",\"cssClass\":null,\"listClass\":\"#d81b43\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:38:53', 92);
INSERT INTO `sys_oper_log` VALUES (2021036141879173122, '000000', '字典数据', 2, 'com.flash.system.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":\"2021036111462080514\",\"dictSort\":0,\"dictLabel\":\"网页\",\"dictValue\":\"0\",\"dictType\":\"dh_chat_channel\",\"cssClass\":null,\"listClass\":\"#8e24aa\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:39:00', 86);
INSERT INTO `sys_oper_log` VALUES (2021036246531252225, '000000', '字典数据', 1, 'com.flash.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":1,\"dictLabel\":\"APP\",\"dictValue\":\"1\",\"dictType\":\"dh_chat_channel\",\"cssClass\":null,\"listClass\":\"#008781\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:39:25', 85);
INSERT INTO `sys_oper_log` VALUES (2021036326667624449, '000000', '字典数据', 2, 'com.flash.system.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":\"2021036111462080514\",\"dictSort\":0,\"dictLabel\":\"网页\",\"dictValue\":\"0\",\"dictType\":\"dh_chat_channel\",\"cssClass\":null,\"listClass\":\"#1f87e8\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:39:44', 85);
INSERT INTO `sys_oper_log` VALUES (2021036408230060034, '000000', '字典数据', 1, 'com.flash.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":2,\"dictLabel\":\"小程序\",\"dictValue\":\"2\",\"dictType\":\"dh_chat_channel\",\"cssClass\":null,\"listClass\":\"#fcc02e\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:40:03', 134);
INSERT INTO `sys_oper_log` VALUES (2021037327361449986, '000000', '字典类型', 1, 'com.flash.system.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"对话评价\",\"dictType\":\"dh_chat_evaluate\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:43:43', 111);
INSERT INTO `sys_oper_log` VALUES (2021037831785226242, '000000', '字典数据', 1, 'com.flash.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"0\",\"dictValue\":\"未评价\",\"dictType\":\"dh_chat_evaluate\",\"cssClass\":null,\"listClass\":\"primary\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:45:43', 81);
INSERT INTO `sys_oper_log` VALUES (2021037893269528578, '000000', '字典数据', 2, 'com.flash.system.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":\"2021037831529373698\",\"dictSort\":0,\"dictLabel\":\"未评价\",\"dictValue\":\"0\",\"dictType\":\"dh_chat_evaluate\",\"cssClass\":null,\"listClass\":\"primary\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:45:57', 83);
INSERT INTO `sys_oper_log` VALUES (2021038006868058114, '000000', '字典数据', 1, 'com.flash.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":1,\"dictLabel\":\"👍赞\",\"dictValue\":\"1\",\"dictType\":\"dh_chat_evaluate\",\"cssClass\":null,\"listClass\":\"\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:46:25', 103);
INSERT INTO `sys_oper_log` VALUES (2021038063071731714, '000000', '字典数据', 2, 'com.flash.system.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":\"2021038006532513794\",\"dictSort\":1,\"dictLabel\":\"👍赞\",\"dictValue\":\"1\",\"dictType\":\"dh_chat_evaluate\",\"cssClass\":null,\"listClass\":\"green\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:46:38', 89);
INSERT INTO `sys_oper_log` VALUES (2021038086308175873, '000000', '字典数据', 2, 'com.flash.system.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":\"2021037831529373698\",\"dictSort\":0,\"dictLabel\":\"未评价\",\"dictValue\":\"0\",\"dictType\":\"dh_chat_evaluate\",\"cssClass\":null,\"listClass\":\"default\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:46:44', 88);
INSERT INTO `sys_oper_log` VALUES (2021038152251023361, '000000', '字典数据', 1, 'com.flash.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":2,\"dictLabel\":\"踩👎\",\"dictValue\":\"2\",\"dictType\":\"dh_chat_evaluate\",\"cssClass\":null,\"listClass\":\"\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:46:59', 90);
INSERT INTO `sys_oper_log` VALUES (2021038183121100802, '000000', '字典数据', 2, 'com.flash.system.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":\"2021038151928061954\",\"dictSort\":2,\"dictLabel\":\"踩👎\",\"dictValue\":\"2\",\"dictType\":\"dh_chat_evaluate\",\"cssClass\":null,\"listClass\":\"danger\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 09:47:07', 89);
INSERT INTO `sys_oper_log` VALUES (2021045069270687746, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2021033410162532353\",\"parentId\":\"2020774016992608257\",\"menuName\":\"对话消息\",\"orderNum\":2,\"path\":\"chatMessage\",\"component\":\"human/chatMessage/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"human:chatMessage:list\",\"icon\":\"#\",\"remark\":\"对话消息菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 10:14:28', 66);
INSERT INTO `sys_oper_log` VALUES (2021045211998658561, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2021034681795813378\",\"parentId\":\"2020774016992608257\",\"menuName\":\"对话会话\",\"orderNum\":1,\"path\":\"chatSession\",\"component\":\"human/chatSession/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"human:chatSession:list\",\"icon\":\"bxs:chat\",\"remark\":\"对话会话菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 10:15:02', 68);
INSERT INTO `sys_oper_log` VALUES (2021045249902583809, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2021033410162532353\",\"parentId\":\"2020774016992608257\",\"menuName\":\"对话消息\",\"orderNum\":2,\"path\":\"chatMessage\",\"component\":\"human/chatMessage/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"human:chatMessage:list\",\"icon\":\"basil:chat-solid\",\"remark\":\"对话消息菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 10:15:11', 63);
INSERT INTO `sys_oper_log` VALUES (2021047192486092802, '000000', '字典类型', 1, 'com.flash.system.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"对话状态\",\"dictType\":\"dh_chat_status\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 10:22:55', 112);
INSERT INTO `sys_oper_log` VALUES (2021047512238858242, '000000', '字典数据', 1, 'com.flash.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"AI\",\"dictValue\":\"0\",\"dictType\":\"dh_chat_status\",\"cssClass\":null,\"listClass\":\"\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 10:24:11', 88);
INSERT INTO `sys_oper_log` VALUES (2021047593872596994, '000000', '字典数据', 1, 'com.flash.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":1,\"dictLabel\":\"人工\",\"dictValue\":\"1\",\"dictType\":\"dh_chat_status\",\"cssClass\":null,\"listClass\":\"\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 10:24:30', 126);
INSERT INTO `sys_oper_log` VALUES (2021047670708051970, '000000', '字典数据', 1, 'com.flash.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":2,\"dictLabel\":\"已结束\",\"dictValue\":\"2\",\"dictType\":\"dh_chat_status\",\"cssClass\":null,\"listClass\":\"\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 10:24:49', 106);
INSERT INTO `sys_oper_log` VALUES (2021048552807931905, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033554698719233\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 10:28:19', 105);
INSERT INTO `sys_oper_log` VALUES (2021048554636648449, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033554698719233\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 10:28:19', 77);
INSERT INTO `sys_oper_log` VALUES (2021051316510334977, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033554698719233\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 10:39:18', 51);
INSERT INTO `sys_oper_log` VALUES (2021051318448103426, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 10:39:18', 49);
INSERT INTO `sys_oper_log` VALUES (2021051322998923265, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 10:39:19', 114);
INSERT INTO `sys_oper_log` VALUES (2021051927704313857, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579148060942337\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 10:41:44', 53);
INSERT INTO `sys_oper_log` VALUES (2021054034096365570, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020046662548828161\",\"kbCategoryId\":\"2020033554698719233\",\"title\":\"经销商\",\"tag\":\"官方,经销商\",\"content\":\"积光水族灯的经销商有：九一一、景原部落、韵之海\",\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 10:50:06', 1102);
INSERT INTO `sys_oper_log` VALUES (2021054791973543937, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020046662548828161\",\"kbCategoryId\":\"2020033554698719233\",\"title\":\"经销商\",\"tag\":\"官方,经销商,333\",\"content\":\"积光水族灯的经销商有：九一一、景原部落、韵之海\",\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 10:53:06', 884);
INSERT INTO `sys_oper_log` VALUES (2021054828229107714, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020046662548828161\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 10:53:15', 51);
INSERT INTO `sys_oper_log` VALUES (2021054832264028162, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033796080914433\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 10:53:16', 53);
INSERT INTO `sys_oper_log` VALUES (2021057448800886786, '000000', '字典数据', 2, 'com.flash.system.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":\"2021038151928061954\",\"dictSort\":2,\"dictLabel\":\"👎踩\",\"dictValue\":\"2\",\"dictType\":\"dh_chat_evaluate\",\"cssClass\":null,\"listClass\":\"danger\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:03:40', 101);
INSERT INTO `sys_oper_log` VALUES (2021061508484505602, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2018579022277959682\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:19:48', 58);
INSERT INTO `sys_oper_log` VALUES (2021061511617650690, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033554698719233\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:19:49', 126);
INSERT INTO `sys_oper_log` VALUES (2021061543808933890, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033796080914433\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:19:56', 58);
INSERT INTO `sys_oper_log` VALUES (2021061546027720706, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020046662548828161\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:19:57', 55);
INSERT INTO `sys_oper_log` VALUES (2021063707251908609, '000000', '对话会话', 1, 'com.flash.human.controller.DhChatSessionController.add()', 'POST', 1, 'admin', '研发部门', '/human/chatSession', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2021063706719232001\",\"userId\":123,\"title\":\"123\",\"channel\":\"0\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:28:32', 115);
INSERT INTO `sys_oper_log` VALUES (2021067013328142337, '000000', '对话会话', 2, 'com.flash.human.controller.DhChatSessionController.edit()', 'PUT', 1, 'admin', '研发部门', '/human/chatSession', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2021063706719232001\",\"userId\":1,\"title\":\"123\",\"channel\":\"0\",\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:41:40', 78);
INSERT INTO `sys_oper_log` VALUES (2021067197592305666, '000000', '对话会话', 2, 'com.flash.human.controller.DhChatSessionController.edit()', 'PUT', 1, 'admin', '研发部门', '/human/chatSession', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2021063706719232001\",\"userId\":null,\"title\":\"123\",\"channel\":\"0\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:42:24', 86);
INSERT INTO `sys_oper_log` VALUES (2021068124525101057, '000000', '对话会话', 2, 'com.flash.human.controller.DhChatSessionController.edit()', 'PUT', 1, 'admin', '研发部门', '/human/chatSession', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2021063706719232001\",\"userId\":null,\"title\":\"2026-2-10 11:45:00 / 用户admin\",\"channel\":\"2\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:46:05', 62);
INSERT INTO `sys_oper_log` VALUES (2021068926719295489, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"1\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:49:16', 66);
INSERT INTO `sys_oper_log` VALUES (2021068929403650050, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"0\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:49:17', 56);
INSERT INTO `sys_oper_log` VALUES (2021069010257248258, '000000', '形象分类', 1, 'com.flash.human.controller.DhAvatarCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/human/avatarCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2021069009938481154\",\"deptId\":null,\"name\":\"文雅\",\"status\":null,\"remark\":\"1\",\"orderNum\":1}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:49:36', 78);
INSERT INTO `sys_oper_log` VALUES (2021069018289340418, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2021069009938481154\",\"deptId\":null,\"name\":null,\"status\":\"0\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:49:38', 145);
INSERT INTO `sys_oper_log` VALUES (2021069663692062721, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033554698719233\",\"name\":null,\"orderNum\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:52:12', 60);
INSERT INTO `sys_oper_log` VALUES (2021069666485469186, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033554698719233\",\"name\":null,\"orderNum\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:52:13', 53);
INSERT INTO `sys_oper_log` VALUES (2021069901613957122, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"1\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:53:09', 55);
INSERT INTO `sys_oper_log` VALUES (2021069904654827521, '000000', '知识库分类', 2, 'com.flash.human.controller.DhAvatarCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/avatarCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2017522206806786049\",\"deptId\":null,\"name\":null,\"status\":\"0\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:53:10', 52);
INSERT INTO `sys_oper_log` VALUES (2021070239993626626, '000000', '字典数据', 2, 'com.flash.system.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":\"2021047511974617089\",\"dictSort\":0,\"dictLabel\":\"AI\",\"dictValue\":\"0\",\"dictType\":\"dh_chat_status\",\"cssClass\":null,\"listClass\":\"#512da7\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:54:30', 155);
INSERT INTO `sys_oper_log` VALUES (2021070295383605249, '000000', '字典数据', 2, 'com.flash.system.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":\"2021047593419612162\",\"dictSort\":1,\"dictLabel\":\"人工\",\"dictValue\":\"1\",\"dictType\":\"dh_chat_status\",\"cssClass\":null,\"listClass\":\"#8e24aa\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:54:43', 83);
INSERT INTO `sys_oper_log` VALUES (2021070325146386433, '000000', '字典数据', 2, 'com.flash.system.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":\"2021047670317981697\",\"dictSort\":2,\"dictLabel\":\"已结束\",\"dictValue\":\"2\",\"dictType\":\"dh_chat_status\",\"cssClass\":null,\"listClass\":\"#e64a19\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:54:50', 79);
INSERT INTO `sys_oper_log` VALUES (2021070514846367745, '000000', '字典类型', 1, 'com.flash.system.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"显示状态\",\"dictType\":\"sys_display_status\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:55:35', 84);
INSERT INTO `sys_oper_log` VALUES (2021070574879440897, '000000', '字典数据', 1, 'com.flash.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"0\",\"dictValue\":\"启用\",\"dictType\":\"sys_display_status\",\"cssClass\":null,\"listClass\":\"\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:55:49', 80);
INSERT INTO `sys_oper_log` VALUES (2021070618181435394, '000000', '字典数据', 1, 'com.flash.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":1,\"dictLabel\":\"禁用\",\"dictValue\":\"1\",\"dictType\":\"sys_display_status\",\"cssClass\":null,\"listClass\":\"\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:56:00', 88);
INSERT INTO `sys_oper_log` VALUES (2021070644823654402, '000000', '字典数据', 2, 'com.flash.system.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":\"2021070574644559874\",\"dictSort\":0,\"dictLabel\":\"启用\",\"dictValue\":\"0\",\"dictType\":\"sys_display_status\",\"cssClass\":null,\"listClass\":\"\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 11:56:06', 86);
INSERT INTO `sys_oper_log` VALUES (2021071661514555393, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2017494007792238594\",\"parentId\":\"2017424741537591297\",\"menuName\":\"背景分类管理\",\"orderNum\":1,\"path\":\"backgroundCategory\",\"component\":\"human/backgroundCategory/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"human:backgroundCategory:list\",\"icon\":\"bx:category\",\"remark\":\"背景分类菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 12:00:08', 65);
INSERT INTO `sys_oper_log` VALUES (2021071698810306561, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2017494007792238595\",\"parentId\":\"2017494007792238594\",\"menuName\":\"背景分类查询\",\"orderNum\":1,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"human:backgroundCategory:query\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 12:00:17', 75);
INSERT INTO `sys_oper_log` VALUES (2021071717286215682, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2017494007792238596\",\"parentId\":\"2017494007792238594\",\"menuName\":\"背景分类新增\",\"orderNum\":2,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"human:backgroundCategory:add\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 12:00:22', 60);
INSERT INTO `sys_oper_log` VALUES (2021071736005394433, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2017494007792238597\",\"parentId\":\"2017494007792238594\",\"menuName\":\"背景分类修改\",\"orderNum\":3,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"human:backgroundCategory:edit\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 12:00:26', 63);
INSERT INTO `sys_oper_log` VALUES (2021071753462087682, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2017494007792238598\",\"parentId\":\"2017494007792238594\",\"menuName\":\"背景分类删除\",\"orderNum\":4,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"human:backgroundCategory:remove\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 12:00:30', 63);
INSERT INTO `sys_oper_log` VALUES (2021071777445117954, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2017494007792238599\",\"parentId\":\"2017494007792238594\",\"menuName\":\"背景分类导出\",\"orderNum\":5,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"human:backgroundCategory:export\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 12:00:36', 59);
INSERT INTO `sys_oper_log` VALUES (2021098212218044418, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2017494007792238599\",\"parentId\":\"2017494007792238594\",\"menuName\":\"背景分类导出\",\"orderNum\":5,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"human:backgroundCategory:export\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 13:45:39', 87);
INSERT INTO `sys_oper_log` VALUES (2021098307651043330, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2017494008102617089\",\"parentId\":\"2017424741537591297\",\"menuName\":\"背景管理\",\"orderNum\":1,\"path\":\"background\",\"component\":\"human/background/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"human:background:list\",\"icon\":\"lets-icons:img-box-fill\",\"remark\":\"背景菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 13:46:01', 61);
INSERT INTO `sys_oper_log` VALUES (2021098413590773761, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2017494008102617090\",\"parentId\":\"2017494008102617089\",\"menuName\":\"背景查询\",\"orderNum\":1,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"human:background:query\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 13:46:27', 83);
INSERT INTO `sys_oper_log` VALUES (2021098433144619010, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2017494008102617091\",\"parentId\":\"2017494008102617089\",\"menuName\":\"背景新增\",\"orderNum\":2,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"human:background:add\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 13:46:31', 59);
INSERT INTO `sys_oper_log` VALUES (2021098453864480769, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2017494008102617092\",\"parentId\":\"2017494008102617089\",\"menuName\":\"背景修改\",\"orderNum\":3,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"human:background:edit\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 13:46:36', 90);
INSERT INTO `sys_oper_log` VALUES (2021098474743726081, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2017494008102617093\",\"parentId\":\"2017494008102617089\",\"menuName\":\"背景删除\",\"orderNum\":4,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"human:background:remove\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 13:46:41', 78);
INSERT INTO `sys_oper_log` VALUES (2021098493601316865, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2017494008102617094\",\"parentId\":\"2017494008102617089\",\"menuName\":\"背景导出\",\"orderNum\":5,\"path\":\"#\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"F\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"human:background:export\",\"icon\":\"#\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 13:46:46', 55);
INSERT INTO `sys_oper_log` VALUES (2021107292030566402, '000000', '背景分类', 1, 'com.flash.human.controller.DhBackgroundCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/human/backgroundCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2021107291711799297\",\"deptId\":null,\"name\":\"会议室\",\"status\":null,\"remark\":null,\"orderNum\":1}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 14:21:43', 77);
INSERT INTO `sys_oper_log` VALUES (2021110019355770882, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033796080914433\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 14:32:34', 335);
INSERT INTO `sys_oper_log` VALUES (2021110032655908866, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033796080914433\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 14:32:37', 222);
INSERT INTO `sys_oper_log` VALUES (2021110040276959233, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033796080914433\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 14:32:39', 107);
INSERT INTO `sys_oper_log` VALUES (2021110061584023553, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033796080914433\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 14:32:44', 63);
INSERT INTO `sys_oper_log` VALUES (2021110438249299970, '000000', '背景分类', 1, 'com.flash.human.controller.DhBackgroundCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/human/backgroundCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2021110437989253121\",\"deptId\":null,\"name\":\"演播厅\",\"status\":null,\"remark\":\"演播厅\",\"orderNum\":2}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 14:34:14', 72);
INSERT INTO `sys_oper_log` VALUES (2021113238391795714, '000000', '背景分类', 2, 'com.flash.human.controller.DhBackgroundCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/backgroundCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2021107291711799297\",\"deptId\":null,\"name\":null,\"status\":\"1\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 14:45:21', 80);
INSERT INTO `sys_oper_log` VALUES (2021113314472275970, '000000', '背景分类', 2, 'com.flash.human.controller.DhBackgroundCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/backgroundCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2021107291711799297\",\"deptId\":null,\"name\":null,\"status\":\"0\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 14:45:39', 67);
INSERT INTO `sys_oper_log` VALUES (2021113345908584449, '000000', '背景分类', 2, 'com.flash.human.controller.DhBackgroundCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/human/backgroundCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2021110437989253121\",\"deptId\":null,\"name\":\"演播厅\",\"status\":null,\"remark\":\"\",\"orderNum\":2}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 14:45:47', 66);
INSERT INTO `sys_oper_log` VALUES (2021114432023605249, '000000', '背景分类', 2, 'com.flash.human.controller.DhBackgroundCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/backgroundCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2021110437989253121\",\"deptId\":null,\"name\":null,\"status\":\"1\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 14:50:06', 144);
INSERT INTO `sys_oper_log` VALUES (2021114433843933185, '000000', '背景分类', 2, 'com.flash.human.controller.DhBackgroundCategoryController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/human/backgroundCategory/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2021107291711799297\",\"deptId\":null,\"name\":null,\"status\":\"1\",\"remark\":null,\"orderNum\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 14:50:06', 141);
INSERT INTO `sys_oper_log` VALUES (2021114789697073154, '000000', '字典类型', 1, 'com.flash.system.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"通用标签\",\"dictType\":\"sys_common_tag\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 14:51:31', 91);
INSERT INTO `sys_oper_log` VALUES (2021115117402238978, '000000', '字典数据', 1, 'com.flash.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":0,\"dictLabel\":\"官方\",\"dictValue\":\"0\",\"dictType\":\"sys_common_tag\",\"cssClass\":null,\"listClass\":\"\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 14:52:49', 106);
INSERT INTO `sys_oper_log` VALUES (2021115182514614274, '000000', '字典数据', 2, 'com.flash.system.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":\"2021115117012168705\",\"dictSort\":0,\"dictLabel\":\"官方\",\"dictValue\":\"0\",\"dictType\":\"sys_common_tag\",\"cssClass\":null,\"listClass\":\"primary\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 14:53:05', 239);
INSERT INTO `sys_oper_log` VALUES (2021115237095092225, '000000', '字典数据', 1, 'com.flash.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":2,\"dictLabel\":\"推荐\",\"dictValue\":\"1\",\"dictType\":\"sys_common_tag\",\"cssClass\":null,\"listClass\":\"green\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 14:53:18', 85);
INSERT INTO `sys_oper_log` VALUES (2021115287095390209, '000000', '字典数据', 1, 'com.flash.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":2,\"dictLabel\":\"个人\",\"dictValue\":\"2\",\"dictType\":\"sys_common_tag\",\"cssClass\":null,\"listClass\":\"orange\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 14:53:30', 80);
INSERT INTO `sys_oper_log` VALUES (2021118154334187522, '000000', '知识库文档', 1, 'com.flash.knowledge.controller.KbDocumentController.add()', 'POST', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2021118152572579842\",\"kbCategoryId\":\"2020033554698719233\",\"title\":\"公司简介\",\"tag\":\"公司\",\"content\":\"ZETLIGHT贸易有限公司于2004年在香港成立。同年，Zetlight电子公司在广州成立。Zetlight致力于产品设计与创新，拥有先进的研发能力，并配备先进的生产设施，生产最新的LED照明设备以及其他用于水族馆和其他行业的相关设备。我们强大的开发团队使我们在过去十年中成为行业领先的公司之一。ZETLIGHT商标在欧洲、北美和东南亚得到了广泛认可和高度推荐。Zetlight还一直与海洋公园和公共水族馆合作，为中国大陆、香港以及其他亚洲和欧洲国家提供照明解决方案。\\n\",\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 15:04:53', 434);
INSERT INTO `sys_oper_log` VALUES (2021118164044001282, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2021118152572579842\",\"kbCategoryId\":null,\"title\":null,\"tag\":null,\"content\":null,\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 15:04:56', 74);
INSERT INTO `sys_oper_log` VALUES (2021122749982781442, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2021118152572579842\",\"kbCategoryId\":\"2020033554698719233\",\"title\":\"积光品牌介绍\",\"tag\":\"公司\",\"content\":\"ZETLIGHT贸易有限公司于2004年在香港成立。同年，Zetlight电子公司在广州成立。Zetlight致力于产品设计与创新，拥有先进的研发能力，并配备先进的生产设施，生产最新的LED照明设备以及其他用于水族馆和其他行业的相关设备。我们强大的开发团队使我们在过去十年中成为行业领先的公司之一。ZETLIGHT商标在欧洲、北美和东南亚得到了广泛认可和高度推荐。Zetlight还一直与海洋公园和公共水族馆合作，为中国大陆、香港以及其他亚洲和欧洲国家提供照明解决方案。\\n\",\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 15:23:09', 900);
INSERT INTO `sys_oper_log` VALUES (2021122897517424641, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020046662548828161\",\"kbCategoryId\":\"2020033554698719233\",\"title\":\"积光经销商\",\"tag\":\"官方\",\"content\":\"积光水族灯的经销商有：九一一、景原部落、韵之海\",\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 15:23:44', 611);
INSERT INTO `sys_oper_log` VALUES (2021123038131466242, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033635980136450\",\"kbCategoryId\":\"2020033554698719233\",\"title\":\"积光产品系列\",\"tag\":\"产品系列\",\"content\":\"积光产品系列有：\\n1.1201系列\\n2.灯条系列\\n3.防水灯系列\\n4.工程灯\\n5.UFO系列\\n6.X9系列\\n7.瓢虫灯（九鼎）\\n8.O2\",\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 15:24:18', 654);
INSERT INTO `sys_oper_log` VALUES (2021123111879913473, '000000', '知识库文档', 2, 'com.flash.knowledge.controller.KbDocumentController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbDocument', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2020033796080914433\",\"kbCategoryId\":\"2020033554698719233\",\"title\":\"使用教程\",\"tag\":\"使用教程\",\"content\":\"使用灯的教程如下：\\n1. 拆开包装，检查是否缺少零件\\n2. 检查外包装的Sn码和灯体的二维码上的Sn码是否一致\\n3. 将灯通上电，检查灯是否亮\\n3. 打开地平线APP，点击右上角添加设备，添加完，扫码(灯体上的二维码)激活\",\"status\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-02-10 15:24:35', 564);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `oss_id` bigint NOT NULL COMMENT '对象存储主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'URL地址',
  `ext1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '扩展字段',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '上传人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `service` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'OSS对象存储表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss_config`;
CREATE TABLE `sys_oss_config`  (
  `oss_config_id` bigint NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `config_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '域',
  `access_policy` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否默认（0=是,1=否）',
  `ext1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '对象存储配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss_config
-- ----------------------------
INSERT INTO `sys_oss_config` VALUES (1, '000000', 'minio', 'ruoyi', 'ruoyi123', 'ruoyi', '', '127.0.0.1:9000', '', 'N', '', '1', '0', '', 103, 1, '2026-01-13 09:28:38', 1, '2026-01-13 09:28:38', NULL);
INSERT INTO `sys_oss_config` VALUES (2, '000000', 'qiniu', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 's3-cn-north-1.qiniucs.com', '', 'N', '', '1', '1', '', 103, 1, '2026-01-13 09:28:38', 1, '2026-01-13 09:28:38', NULL);
INSERT INTO `sys_oss_config` VALUES (3, '000000', 'aliyun', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 'oss-cn-beijing.aliyuncs.com', '', 'N', '', '1', '1', '', 103, 1, '2026-01-13 09:28:38', 1, '2026-01-13 09:28:38', NULL);
INSERT INTO `sys_oss_config` VALUES (4, '000000', 'qcloud', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi-1240000000', '', 'cos.ap-beijing.myqcloud.com', '', 'N', 'ap-beijing', '1', '1', '', 103, 1, '2026-01-13 09:28:38', 1, '2026-01-13 09:28:38', NULL);
INSERT INTO `sys_oss_config` VALUES (5, '000000', 'image', 'ruoyi', 'ruoyi123', 'ruoyi', 'image', '127.0.0.1:9000', '', 'N', '', '1', '1', '', 103, 1, '2026-01-13 09:28:38', 1, '2026-01-13 09:28:38', NULL);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '岗位类别编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, '000000', 103, 'ceo', NULL, '董事长', 1, '0', 103, 1, '2026-01-13 09:28:32', NULL, NULL, '');
INSERT INTO `sys_post` VALUES (2, '000000', 100, 'se', NULL, '项目经理', 2, '0', 103, 1, '2026-01-13 09:28:32', NULL, NULL, '');
INSERT INTO `sys_post` VALUES (3, '000000', 100, 'hr', NULL, '人力资源', 3, '0', 103, 1, '2026-01-13 09:28:32', NULL, NULL, '');
INSERT INTO `sys_post` VALUES (4, '000000', 100, 'user', NULL, '普通员工', 4, '0', 103, 1, '2026-01-13 09:28:32', NULL, NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限 5：仅本人数据权限 6：部门及以下或本人数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '000000', '超级管理员', 'superadmin', 1, '1', 1, 1, '0', '0', 103, 1, '2026-01-13 09:28:32', NULL, NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (3, '000000', '本部门及以下', 'test1', 3, '4', 1, 1, '0', '0', 103, 1, '2026-01-13 09:28:32', NULL, NULL, '');
INSERT INTO `sys_role` VALUES (4, '000000', '仅本人', 'test2', 4, '5', 1, 1, '0', '0', 103, 1, '2026-01-13 09:28:32', NULL, NULL, '');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 5);
INSERT INTO `sys_role_menu` VALUES (3, 100);
INSERT INTO `sys_role_menu` VALUES (3, 101);
INSERT INTO `sys_role_menu` VALUES (3, 102);
INSERT INTO `sys_role_menu` VALUES (3, 103);
INSERT INTO `sys_role_menu` VALUES (3, 104);
INSERT INTO `sys_role_menu` VALUES (3, 105);
INSERT INTO `sys_role_menu` VALUES (3, 106);
INSERT INTO `sys_role_menu` VALUES (3, 107);
INSERT INTO `sys_role_menu` VALUES (3, 108);
INSERT INTO `sys_role_menu` VALUES (3, 118);
INSERT INTO `sys_role_menu` VALUES (3, 123);
INSERT INTO `sys_role_menu` VALUES (3, 130);
INSERT INTO `sys_role_menu` VALUES (3, 131);
INSERT INTO `sys_role_menu` VALUES (3, 132);
INSERT INTO `sys_role_menu` VALUES (3, 133);
INSERT INTO `sys_role_menu` VALUES (3, 500);
INSERT INTO `sys_role_menu` VALUES (3, 501);
INSERT INTO `sys_role_menu` VALUES (3, 1001);
INSERT INTO `sys_role_menu` VALUES (3, 1002);
INSERT INTO `sys_role_menu` VALUES (3, 1003);
INSERT INTO `sys_role_menu` VALUES (3, 1004);
INSERT INTO `sys_role_menu` VALUES (3, 1005);
INSERT INTO `sys_role_menu` VALUES (3, 1006);
INSERT INTO `sys_role_menu` VALUES (3, 1007);
INSERT INTO `sys_role_menu` VALUES (3, 1008);
INSERT INTO `sys_role_menu` VALUES (3, 1009);
INSERT INTO `sys_role_menu` VALUES (3, 1010);
INSERT INTO `sys_role_menu` VALUES (3, 1011);
INSERT INTO `sys_role_menu` VALUES (3, 1012);
INSERT INTO `sys_role_menu` VALUES (3, 1013);
INSERT INTO `sys_role_menu` VALUES (3, 1014);
INSERT INTO `sys_role_menu` VALUES (3, 1015);
INSERT INTO `sys_role_menu` VALUES (3, 1016);
INSERT INTO `sys_role_menu` VALUES (3, 1017);
INSERT INTO `sys_role_menu` VALUES (3, 1018);
INSERT INTO `sys_role_menu` VALUES (3, 1019);
INSERT INTO `sys_role_menu` VALUES (3, 1020);
INSERT INTO `sys_role_menu` VALUES (3, 1021);
INSERT INTO `sys_role_menu` VALUES (3, 1022);
INSERT INTO `sys_role_menu` VALUES (3, 1023);
INSERT INTO `sys_role_menu` VALUES (3, 1024);
INSERT INTO `sys_role_menu` VALUES (3, 1025);
INSERT INTO `sys_role_menu` VALUES (3, 1026);
INSERT INTO `sys_role_menu` VALUES (3, 1027);
INSERT INTO `sys_role_menu` VALUES (3, 1028);
INSERT INTO `sys_role_menu` VALUES (3, 1029);
INSERT INTO `sys_role_menu` VALUES (3, 1030);
INSERT INTO `sys_role_menu` VALUES (3, 1031);
INSERT INTO `sys_role_menu` VALUES (3, 1032);
INSERT INTO `sys_role_menu` VALUES (3, 1033);
INSERT INTO `sys_role_menu` VALUES (3, 1034);
INSERT INTO `sys_role_menu` VALUES (3, 1035);
INSERT INTO `sys_role_menu` VALUES (3, 1036);
INSERT INTO `sys_role_menu` VALUES (3, 1037);
INSERT INTO `sys_role_menu` VALUES (3, 1038);
INSERT INTO `sys_role_menu` VALUES (3, 1039);
INSERT INTO `sys_role_menu` VALUES (3, 1040);
INSERT INTO `sys_role_menu` VALUES (3, 1041);
INSERT INTO `sys_role_menu` VALUES (3, 1042);
INSERT INTO `sys_role_menu` VALUES (3, 1043);
INSERT INTO `sys_role_menu` VALUES (3, 1044);
INSERT INTO `sys_role_menu` VALUES (3, 1045);
INSERT INTO `sys_role_menu` VALUES (3, 1050);
INSERT INTO `sys_role_menu` VALUES (3, 1061);
INSERT INTO `sys_role_menu` VALUES (3, 1062);
INSERT INTO `sys_role_menu` VALUES (3, 1063);
INSERT INTO `sys_role_menu` VALUES (3, 1064);
INSERT INTO `sys_role_menu` VALUES (3, 1065);
INSERT INTO `sys_role_menu` VALUES (3, 1500);
INSERT INTO `sys_role_menu` VALUES (3, 1501);
INSERT INTO `sys_role_menu` VALUES (3, 1502);
INSERT INTO `sys_role_menu` VALUES (3, 1503);
INSERT INTO `sys_role_menu` VALUES (3, 1504);
INSERT INTO `sys_role_menu` VALUES (3, 1505);
INSERT INTO `sys_role_menu` VALUES (3, 1506);
INSERT INTO `sys_role_menu` VALUES (3, 1507);
INSERT INTO `sys_role_menu` VALUES (3, 1508);
INSERT INTO `sys_role_menu` VALUES (3, 1509);
INSERT INTO `sys_role_menu` VALUES (3, 1510);
INSERT INTO `sys_role_menu` VALUES (3, 1511);
INSERT INTO `sys_role_menu` VALUES (3, 1600);
INSERT INTO `sys_role_menu` VALUES (3, 1601);
INSERT INTO `sys_role_menu` VALUES (3, 1602);
INSERT INTO `sys_role_menu` VALUES (3, 1603);
INSERT INTO `sys_role_menu` VALUES (3, 1620);
INSERT INTO `sys_role_menu` VALUES (3, 1621);
INSERT INTO `sys_role_menu` VALUES (3, 1622);
INSERT INTO `sys_role_menu` VALUES (3, 1623);
INSERT INTO `sys_role_menu` VALUES (3, 11616);
INSERT INTO `sys_role_menu` VALUES (3, 11618);
INSERT INTO `sys_role_menu` VALUES (3, 11619);
INSERT INTO `sys_role_menu` VALUES (3, 11622);
INSERT INTO `sys_role_menu` VALUES (3, 11623);
INSERT INTO `sys_role_menu` VALUES (3, 11629);
INSERT INTO `sys_role_menu` VALUES (3, 11632);
INSERT INTO `sys_role_menu` VALUES (3, 11633);
INSERT INTO `sys_role_menu` VALUES (3, 11638);
INSERT INTO `sys_role_menu` VALUES (3, 11639);
INSERT INTO `sys_role_menu` VALUES (3, 11640);
INSERT INTO `sys_role_menu` VALUES (3, 11641);
INSERT INTO `sys_role_menu` VALUES (3, 11642);
INSERT INTO `sys_role_menu` VALUES (3, 11643);
INSERT INTO `sys_role_menu` VALUES (3, 11701);
INSERT INTO `sys_role_menu` VALUES (4, 5);
INSERT INTO `sys_role_menu` VALUES (4, 1500);
INSERT INTO `sys_role_menu` VALUES (4, 1501);
INSERT INTO `sys_role_menu` VALUES (4, 1502);
INSERT INTO `sys_role_menu` VALUES (4, 1503);
INSERT INTO `sys_role_menu` VALUES (4, 1504);
INSERT INTO `sys_role_menu` VALUES (4, 1505);
INSERT INTO `sys_role_menu` VALUES (4, 1506);
INSERT INTO `sys_role_menu` VALUES (4, 1507);
INSERT INTO `sys_role_menu` VALUES (4, 1508);
INSERT INTO `sys_role_menu` VALUES (4, 1509);
INSERT INTO `sys_role_menu` VALUES (4, 1510);
INSERT INTO `sys_role_menu` VALUES (4, 1511);

-- ----------------------------
-- Table structure for sys_social
-- ----------------------------
DROP TABLE IF EXISTS `sys_social`;
CREATE TABLE `sys_social`  (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户id',
  `auth_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '平台+平台唯一id',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户来源',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '平台编号唯一id',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户昵称',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `access_token` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户的授权令牌',
  `expire_in` int NULL DEFAULT NULL COMMENT '用户的授权令牌的有效期，部分平台可能没有',
  `refresh_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '刷新令牌，部分平台可能没有',
  `access_code` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '平台的授权信息，部分平台可能没有',
  `union_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户的 unionid',
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '授予的权限，部分平台可能没有',
  `token_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个别平台的授权信息，部分平台可能没有',
  `id_token` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'id token，部分平台可能没有',
  `mac_algorithm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '小米平台用户的附带属性，部分平台可能没有',
  `mac_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '小米平台用户的附带属性，部分平台可能没有',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户的授权code，部分平台可能没有',
  `oauth_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Twitter平台用户的附带属性，部分平台可能没有',
  `oauth_token_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Twitter平台用户的附带属性，部分平台可能没有',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '社会化关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_social
-- ----------------------------

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`  (
  `id` bigint NOT NULL COMMENT 'id',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户编号',
  `contact_user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `company_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业名称',
  `license_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '统一社会信用代码',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `intro` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业简介',
  `domain` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '域名',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `package_id` bigint NULL DEFAULT NULL COMMENT '租户套餐编号',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `account_count` int NULL DEFAULT -1 COMMENT '用户数量（-1不限制）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '租户状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '租户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES (1, '000000', '管理组', '15888888888', 'XXX有限公司', NULL, NULL, '多租户通用后台管理管理系统', NULL, NULL, NULL, NULL, -1, '0', '0', 103, 1, '2026-01-13 09:28:31', NULL, NULL);

-- ----------------------------
-- Table structure for sys_tenant_package
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant_package`;
CREATE TABLE `sys_tenant_package`  (
  `package_id` bigint NOT NULL COMMENT '租户套餐id',
  `package_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `menu_ids` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联菜单id',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`package_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '租户套餐表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tenant_package
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` bigint NULL DEFAULT NULL COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '000000', 103, 'admin', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@163.com', '15888888888', '1', NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '0:0:0:0:0:0:0:1', '2026-02-10 08:58:56', 103, 1, '2026-01-13 09:28:32', -1, '2026-02-10 08:58:56', '管理员');
INSERT INTO `sys_user` VALUES (3, '000000', 108, 'test', '本部门及以下 密码666666', 'sys_user', '', '', '0', NULL, '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '0', '1', '127.0.0.1', '2026-01-13 09:28:32', 103, 1, '2026-01-13 09:28:32', 1, '2026-02-09 09:52:13', NULL);
INSERT INTO `sys_user` VALUES (4, '000000', 102, 'test1', '仅本人 密码666666', 'sys_user', '', '', '0', NULL, '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '1', '0', '127.0.0.1', '2026-01-13 09:28:32', 103, 1, '2026-01-13 09:28:32', 4, '2026-01-13 09:28:32', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (4, 4);

-- ----------------------------
-- Table structure for test_demo
-- ----------------------------
DROP TABLE IF EXISTS `test_demo`;
CREATE TABLE `test_demo`  (
  `id` bigint NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `order_num` int NULL DEFAULT 0 COMMENT '排序号',
  `test_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key键',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '值',
  `version` int NULL DEFAULT 0 COMMENT '版本',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` int NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '测试单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_demo
-- ----------------------------
INSERT INTO `test_demo` VALUES (1, '000000', 102, 4, 1, '测试数据权限', '测试', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (2, '000000', 102, 3, 2, '子节点1', '111', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (3, '000000', 102, 3, 3, '子节点2', '222', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (4, '000000', 108, 4, 4, '测试数据', 'demo', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (5, '000000', 108, 3, 13, '子节点11', '1111', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (6, '000000', 108, 3, 12, '子节点22', '2222', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (7, '000000', 108, 3, 11, '子节点33', '3333', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (8, '000000', 108, 3, 10, '子节点44', '4444', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (9, '000000', 108, 3, 9, '子节点55', '5555', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (10, '000000', 108, 3, 8, '子节点66', '6666', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (11, '000000', 108, 3, 7, '子节点77', '7777', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (12, '000000', 108, 3, 6, '子节点88', '8888', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (13, '000000', 108, 3, 5, '子节点99', '9999', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);

-- ----------------------------
-- Table structure for test_leave
-- ----------------------------
DROP TABLE IF EXISTS `test_leave`;
CREATE TABLE `test_leave`  (
  `id` bigint NOT NULL COMMENT 'id',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `apply_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '申请编号',
  `leave_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请假类型',
  `start_date` datetime NOT NULL COMMENT '开始时间',
  `end_date` datetime NOT NULL COMMENT '结束时间',
  `leave_days` int NOT NULL COMMENT '请假天数',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请假原因',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '状态',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '请假申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_leave
-- ----------------------------

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree`  (
  `id` bigint NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父id',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `tree_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '值',
  `version` int NULL DEFAULT 0 COMMENT '版本',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` int NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '测试树表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_tree
-- ----------------------------
INSERT INTO `test_tree` VALUES (1, '000000', 0, 102, 4, '测试数据权限', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (2, '000000', 1, 102, 3, '子节点1', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (3, '000000', 2, 102, 3, '子节点2', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (4, '000000', 0, 108, 4, '测试树1', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (5, '000000', 4, 108, 3, '子节点11', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (6, '000000', 4, 108, 3, '子节点22', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (7, '000000', 4, 108, 3, '子节点33', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (8, '000000', 5, 108, 3, '子节点44', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (9, '000000', 6, 108, 3, '子节点55', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (10, '000000', 7, 108, 3, '子节点66', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (11, '000000', 7, 108, 3, '子节点77', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (12, '000000', 10, 108, 3, '子节点88', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (13, '000000', 10, 108, 3, '子节点99', 0, 103, '2026-01-13 09:28:40', 1, NULL, NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
