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

 Date: 16/01/2026 17:57:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dig_kb_category
-- ----------------------------
DROP TABLE IF EXISTS `dig_kb_category`;
CREATE TABLE `dig_kb_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名称',
  `order_num` int NULL DEFAULT NULL COMMENT '排序',
  `is_enable` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否可用（1-是 0-否）',
  `create_dept` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2011338468829863939 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dig_kb_category
-- ----------------------------
INSERT INTO `dig_kb_category` VALUES (2011333047457144834, '000000', NULL, '售前', 1, '1', '103', '1', '2026-01-14 15:02:22', '1', '2026-01-14 15:02:22');
INSERT INTO `dig_kb_category` VALUES (2011338468829863938, '000000', NULL, '售后', 0, '0', '103', '1', '2026-01-14 15:23:54', '1', '2026-01-16 16:09:00');

-- ----------------------------
-- Table structure for dig_kb_document
-- ----------------------------
DROP TABLE IF EXISTS `dig_kb_document`;
CREATE TABLE `dig_kb_document`  (
  `id` int NOT NULL COMMENT 'id',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `kb_category_id` int NULL DEFAULT NULL COMMENT '知识库分类id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `is_enable` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否可用（1-是 0否）',
  `create_dept` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dig_kb_document
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
INSERT INTO `gen_table` VALUES (2010949768560136193, 'master', 'dig_kb_category', '知识库分类表', NULL, NULL, 'KbCategory', 'crud', 'com.flash.knowledge', 'knowledge', 'kbCategory', '知识库分类', 'haipeng-lin', '0', '/', '{\"parentMenuId\":\"2010949410043613185\",\"popupComponent\":\"modal\",\"formComponent\":\"useForm\"}', 103, 1, '2026-01-13 13:39:21', 1, '2026-01-14 08:56:03', NULL);
INSERT INTO `gen_table` VALUES (2010949769604517890, 'master', 'dig_kb_document', '知识库文档表', NULL, NULL, 'KbDocument', 'crud', 'com.flash.knowledge', 'knowledge', 'kbDocument', '知识库文档', 'haipeng-lin', '0', '/', '{\"parentMenuId\":\"2010949410043613185\",\"popupComponent\":\"drawer\",\"formComponent\":\"useForm\"}', 103, 1, '2026-01-13 13:39:21', 1, '2026-01-13 17:45:52', NULL);

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
INSERT INTO `gen_table_column` VALUES (2010949769411579905, 2010949768560136193, 'id', 'id', 'bigint', 'Long', 'id', '1', '1', '1', '0', '1', '1', '0', 'EQ', 'input', '', 1, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-14 08:56:03');
INSERT INTO `gen_table_column` VALUES (2010949769411579906, 2010949768560136193, 'name', '分类名称', 'varchar(30)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-14 08:56:03');
INSERT INTO `gen_table_column` VALUES (2010949769411579907, 2010949768560136193, 'order_num', '排序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-14 08:56:03');
INSERT INTO `gen_table_column` VALUES (2010949769411579908, 2010949768560136193, 'is_enable', '是否可用（1-是 0-否）', 'tinyint', 'Long', 'isEnable', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'sys_enable', 4, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-14 08:56:03');
INSERT INTO `gen_table_column` VALUES (2010949769411579909, 2010949768560136193, 'tenant_id', '租户id', 'varchar(64)', 'String', 'tenantId', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 5, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-14 08:56:03');
INSERT INTO `gen_table_column` VALUES (2010949769411579910, 2010949768560136193, 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 6, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-14 08:56:03');
INSERT INTO `gen_table_column` VALUES (2010949769411579911, 2010949768560136193, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 7, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-14 08:56:03');
INSERT INTO `gen_table_column` VALUES (2010949769411579912, 2010949768560136193, 'update_by', '修改人', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 8, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-14 08:56:03');
INSERT INTO `gen_table_column` VALUES (2010949769411579913, 2010949768560136193, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 9, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-14 08:56:03');
INSERT INTO `gen_table_column` VALUES (2010949769805844481, 2010949769604517890, 'id', 'id', 'int', 'Long', 'id', '1', '0', '1', '0', '1', '1', '0', 'EQ', 'input', '', 1, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-13 17:45:52');
INSERT INTO `gen_table_column` VALUES (2010949769805844482, 2010949769604517890, 'kb_category_id', '知识库分类id', 'int', 'Long', 'kbCategoryId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-13 17:45:52');
INSERT INTO `gen_table_column` VALUES (2010949769805844483, 2010949769604517890, 'title', '标题', 'varchar(255)', 'String', 'title', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-13 17:45:52');
INSERT INTO `gen_table_column` VALUES (2010949769805844484, 2010949769604517890, 'tag', '标签', 'varchar(255)', 'String', 'tag', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-13 17:45:52');
INSERT INTO `gen_table_column` VALUES (2010949769805844485, 2010949769604517890, 'content', '内容', 'varchar(255)', 'String', 'content', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', '', 5, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-13 17:45:52');
INSERT INTO `gen_table_column` VALUES (2010949769805844486, 2010949769604517890, 'is_enable', '是否可用（1-是 0否）', 'varchar(255)', 'String', 'isEnable', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-13 17:45:52');
INSERT INTO `gen_table_column` VALUES (2010949769805844487, 2010949769604517890, 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 7, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-13 17:45:52');
INSERT INTO `gen_table_column` VALUES (2010949769805844488, 2010949769604517890, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 8, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-13 17:45:52');
INSERT INTO `gen_table_column` VALUES (2010949769805844489, 2010949769604517890, 'update_by', '修改人', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', '', 9, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-13 17:45:52');
INSERT INTO `gen_table_column` VALUES (2010949769805844490, 2010949769604517890, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', '', 10, 103, 1, '2026-01-13 13:39:21', 1, '2026-01-13 17:45:52');

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
INSERT INTO `sys_client` VALUES (1, 'e5cd7e4891bf95d1d19206ce24a7b32e', 'pc', 'pc123', 'password,social', 'pc', 1800, 604800, '0', '0', 103, 1, '2026-01-13 09:28:39', 1, '2026-01-13 09:28:39');
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
INSERT INTO `sys_dict_data` VALUES (2010950897524166657, '000000', 11, '可用', '1', 'sys_enable', NULL, '#4cb050', 'N', 103, 1, '2026-01-13 13:43:50', 1, '2026-01-13 13:43:50', NULL);
INSERT INTO `sys_dict_data` VALUES (2010950999349284865, '000000', 22, '禁用', '0', 'sys_enable', NULL, '#d81b43', 'N', 103, 1, '2026-01-13 13:44:15', 1, '2026-01-13 13:44:15', NULL);

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
INSERT INTO `sys_dict_type` VALUES (2010950638777552898, '000000', '可用类型', 'sys_enable', 103, 1, '2026-01-13 13:42:49', 1, '2026-01-13 13:42:49', NULL);

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
INSERT INTO `sys_menu` VALUES (116, '修改生成配置', 3, 2, 'gen-edit/index/:tableId', 'tool/gen/editTable', '', 1, 1, 'C', '0', '0', 'tool:gen:edit', 'radix-icons:update', 103, 1, '2026-01-13 09:28:33', 1, '2026-01-13 11:46:14', '/tool/gen');
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
INSERT INTO `sys_menu` VALUES (11618, '我的任务', 0, 7, 'task', '', '', 1, 0, 'M', '0', '0', '', 'my-task', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11619, '我的待办', 11618, 2, 'taskWaiting', 'workflow/task/taskWaiting', '', 1, 1, 'C', '0', '0', '', 'waiting', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11620, '流程定义', 11616, 3, 'processDefinition', 'workflow/processDefinition/index', '', 1, 1, 'C', '0', '0', '', 'streamline:definition-search-book-remix', 103, 1, '2026-01-13 09:28:53', 1, '2026-01-13 14:06:04', '');
INSERT INTO `sys_menu` VALUES (11621, '流程实例', 11630, 1, 'processInstance', 'workflow/processInstance/index', '', 1, 1, 'C', '0', '0', '', 'tree-table', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11622, '流程分类', 11616, 1, 'category', 'workflow/category/index', '', 1, 0, 'C', '0', '0', 'workflow:category:list', 'nrk:category-active', 103, 1, '2026-01-13 09:28:53', 1, '2026-01-13 14:04:31', '');
INSERT INTO `sys_menu` VALUES (11623, '流程分类查询', 11622, 1, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:query', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11624, '流程分类新增', 11622, 2, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:add', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11625, '流程分类修改', 11622, 3, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:edit', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11626, '流程分类删除', 11622, 4, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:remove', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11627, '流程分类导出', 11622, 5, '#', '', '', 1, 0, 'F', '0', '0', 'workflow:category:export', '#', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11629, '我发起的', 11618, 1, 'myDocument', 'workflow/task/myDocument', '', 1, 1, 'C', '0', '0', '', 'guide', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11630, '流程监控', 11616, 4, 'monitor', '', '', 1, 0, 'M', '0', '0', '', 'lucide:monitor-up', 103, 1, '2026-01-13 09:28:53', 1, '2026-01-13 14:06:31', '');
INSERT INTO `sys_menu` VALUES (11631, '待办任务', 11630, 2, 'allTaskWaiting', 'workflow/task/allTaskWaiting', '', 1, 1, 'C', '0', '0', '', 'waiting', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11632, '我的已办', 11618, 3, 'taskFinish', 'workflow/task/taskFinish', '', 1, 1, 'C', '0', '0', '', 'finish', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (11633, '我的抄送', 11618, 4, 'taskCopyList', 'workflow/task/taskCopyList', '', 1, 1, 'C', '0', '0', '', 'my-copy', 103, 1, '2026-01-13 09:28:53', NULL, NULL, '');
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
INSERT INTO `sys_menu` VALUES (2010949410043613185, '客服知识库', 0, 0, 'knowledge', '', NULL, 1, 0, 'M', '0', '0', NULL, 'carbon:ibm-watson-knowledge-catalog', 103, 1, '2026-01-13 13:37:56', 1, '2026-01-13 13:37:56', '');
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
INSERT INTO `sys_oper_log` VALUES (2010888055588540417, '000000', '用户管理', 2, 'org.dromara.system.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"userId\":3,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"status\":\"1\",\"remark\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"userIds\":null,\"excludeUserIds\":null,\"superAdmin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 09:34:08', 160);
INSERT INTO `sys_oper_log` VALUES (2010888060143554561, '000000', '用户管理', 2, 'org.dromara.system.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"userId\":3,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"status\":\"0\",\"remark\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"userIds\":null,\"excludeUserIds\":null,\"superAdmin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 09:34:09', 78);
INSERT INTO `sys_oper_log` VALUES (2010888064941838337, '000000', '用户管理', 2, 'org.dromara.system.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"userId\":4,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"status\":\"1\",\"remark\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"userIds\":null,\"excludeUserIds\":null,\"superAdmin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 09:34:10', 77);
INSERT INTO `sys_oper_log` VALUES (2010889796589604865, '000000', '菜单管理', 3, 'org.dromara.system.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '0:0:0:0:0:0:0:1', '内网IP', '4', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 09:41:03', 96);
INSERT INTO `sys_oper_log` VALUES (2010894181067542530, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":1,\"parentId\":0,\"menuName\":\"系统管理\",\"orderNum\":1,\"path\":\"system\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"lucide:user-round\",\"remark\":\"系统管理目录\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 09:58:28', 88);
INSERT INTO `sys_oper_log` VALUES (2010894378757672961, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":100,\"parentId\":1,\"menuName\":\"用户管理\",\"orderNum\":1,\"path\":\"user\",\"component\":\"system/user/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:user:list\",\"icon\":\"lucide:user-round\",\"remark\":\"用户管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 09:59:15', 65);
INSERT INTO `sys_oper_log` VALUES (2010895570195861506, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":100,\"parentId\":1,\"menuName\":\"用户管理\",\"orderNum\":1,\"path\":\"user\",\"component\":\"system/user/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:user:list\",\"icon\":\"lucide:user-round\",\"remark\":\"用户管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 10:03:59', 121);
INSERT INTO `sys_oper_log` VALUES (2010895615238492162, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":1,\"parentId\":0,\"menuName\":\"系统管理\",\"orderNum\":1,\"path\":\"system\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"icon-park-outline:system\",\"remark\":\"系统管理目录\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 10:04:10', 69);
INSERT INTO `sys_oper_log` VALUES (2010895790375849985, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":101,\"parentId\":1,\"menuName\":\"角色管理\",\"orderNum\":2,\"path\":\"role\",\"component\":\"system/role/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:role:list\",\"icon\":\"eos-icons:role-binding-outlined\",\"remark\":\"角色管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 10:04:52', 71);
INSERT INTO `sys_oper_log` VALUES (2010896005610754049, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":102,\"parentId\":1,\"menuName\":\"菜单管理\",\"orderNum\":3,\"path\":\"menu\",\"component\":\"system/menu/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:menu:list\",\"icon\":\"material-symbols:menu-rounded\",\"remark\":\"菜单管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 10:05:43', 79);
INSERT INTO `sys_oper_log` VALUES (2010896201618968578, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":103,\"parentId\":1,\"menuName\":\"部门管理\",\"orderNum\":4,\"path\":\"dept\",\"component\":\"system/dept/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:dept:list\",\"icon\":\"mingcute:department-line\",\"remark\":\"部门管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 10:06:30', 69);
INSERT INTO `sys_oper_log` VALUES (2010897607386091521, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":104,\"parentId\":1,\"menuName\":\"岗位管理\",\"orderNum\":5,\"path\":\"post\",\"component\":\"system/post/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:post:list\",\"icon\":\"hugeicons:permanent-job\",\"remark\":\"岗位管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 10:12:05', 57);
INSERT INTO `sys_oper_log` VALUES (2010898025335902210, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":6,\"parentId\":0,\"menuName\":\"租户管理\",\"orderNum\":2,\"path\":\"tenant\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"carbon:location-company\",\"remark\":\"租户管理目录\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 10:13:45', 54);
INSERT INTO `sys_oper_log` VALUES (2010898874493718530, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":2,\"parentId\":0,\"menuName\":\"系统监控\",\"orderNum\":3,\"path\":\"monitor\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"material-symbols:monitor-outline\",\"remark\":\"系统监控目录\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 10:17:07', 128);
INSERT INTO `sys_oper_log` VALUES (2010899020988174338, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":109,\"parentId\":2,\"menuName\":\"在线用户\",\"orderNum\":1,\"path\":\"online\",\"component\":\"monitor/online/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:online:list\",\"icon\":\"mdi:account-online-outline\",\"remark\":\"在线用户菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 10:17:42', 118);
INSERT INTO `sys_oper_log` VALUES (2010919139663564801, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":113,\"parentId\":2,\"menuName\":\"缓存监控\",\"orderNum\":5,\"path\":\"cache\",\"component\":\"monitor/cache/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:cache:list\",\"icon\":\"octicon:cache-16\",\"remark\":\"缓存监控菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 11:37:39', 209);
INSERT INTO `sys_oper_log` VALUES (2010919258379145218, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":120,\"parentId\":2,\"menuName\":\"任务调度中心\",\"orderNum\":6,\"path\":\"snailjob\",\"component\":\"monitor/snailjob/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:snailjob:list\",\"icon\":\"octicon:focus-center-16\",\"remark\":\"SnailJob控制台菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 11:38:07', 55);
INSERT INTO `sys_oper_log` VALUES (2010919405976702978, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":117,\"parentId\":2,\"menuName\":\"Admin监控\",\"orderNum\":5,\"path\":\"Admin\",\"component\":\"monitor/admin/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:admin:list\",\"icon\":\"pepicons-pop:monitor-loop\",\"remark\":\"Admin监控菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 11:38:42', 71);
INSERT INTO `sys_oper_log` VALUES (2010920277892812802, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":3,\"parentId\":0,\"menuName\":\"系统工具\",\"orderNum\":4,\"path\":\"tool\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"tabler:tool\",\"remark\":\"系统工具目录\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 11:42:10', 54);
INSERT INTO `sys_oper_log` VALUES (2010920396188962817, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":115,\"parentId\":3,\"menuName\":\"代码生成\",\"orderNum\":2,\"path\":\"gen\",\"component\":\"tool/gen/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"tool:gen:list\",\"icon\":\"material-symbols:code\",\"remark\":\"代码生成菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 11:42:38', 57);
INSERT INTO `sys_oper_log` VALUES (2010921302968127490, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":116,\"parentId\":3,\"menuName\":\"修改生成配置\",\"orderNum\":2,\"path\":\"gen-edit/index/:tableId\",\"component\":\"tool/gen/editTable\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"tool:gen:edit\",\"icon\":\"radix-icons:update\",\"remark\":\"/tool/gen\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 11:46:14', 66);
INSERT INTO `sys_oper_log` VALUES (2010949410358185986, '000000', '菜单管理', 1, 'org.dromara.system.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":null,\"parentId\":0,\"menuName\":\"客服知识库\",\"orderNum\":0,\"path\":\"knowledge\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"carbon:ibm-watson-knowledge-catalog\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 13:37:56', 90);
INSERT INTO `sys_oper_log` VALUES (2010949770128805889, '000000', '代码生成', 6, 'org.dromara.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '0:0:0:0:0:0:0:1', '内网IP', '{\"tables\":\"dig_kb_document,dig_kb_category\",\"dataName\":\"master\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 13:39:21', 393);
INSERT INTO `sys_oper_log` VALUES (2010950639339589634, '000000', '字典类型', 1, 'org.dromara.system.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictId\":null,\"dictName\":\"可用类型\",\"dictType\":\"sys_enable\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 13:42:49', 146);
INSERT INTO `sys_oper_log` VALUES (2010950897893265410, '000000', '字典数据', 1, 'org.dromara.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":11,\"dictLabel\":\"可用\",\"dictValue\":\"1\",\"dictType\":\"sys_enable\",\"cssClass\":null,\"listClass\":\"#4cb050\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 13:43:50', 105);
INSERT INTO `sys_oper_log` VALUES (2010950999739355137, '000000', '字典数据', 1, 'org.dromara.system.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"dictCode\":null,\"dictSort\":22,\"dictLabel\":\"禁用\",\"dictValue\":\"0\",\"dictType\":\"sys_enable\",\"cssClass\":null,\"listClass\":\"#d81b43\",\"isDefault\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 13:44:15', 101);
INSERT INTO `sys_oper_log` VALUES (2010951123253219329, '000000', '代码生成', 2, 'org.dromara.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 13:44:44\",\"params\":{\"parentMenuId\":0,\"popupComponent\":\"drawer\",\"formComponent\":\"useForm\"},\"tableId\":\"2010949768560136193\",\"dataName\":\"master\",\"tableName\":\"dig_kb_category\",\"tableComment\":\"知识库分类表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"KbCategory\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.knowledge\",\"moduleName\":\"knowledge\",\"businessName\":\"kbCategory\",\"functionName\":\"知识库分类\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 13:44:44\",\"columnId\":\"2010949769411579905\",\"tableId\":\"2010949768560136193\",\"columnName\":\"id\",\"columnComment\":\"id\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"insert\":false,\"edit\":true,\"pk\":true,\"usableColumn\":false,\"superColumn\":false,\"increment\":true,\"query\":false,\"capJavaField\":\"Id\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 13:44:44\",\"columnId\":\"2010949769411579906\",\"tableId\":\"2010949768560136193\",\"columnName\":\"name\",\"columnComment\":\"分类名称\",\"columnType\":\"varchar(30)\",\"javaType\":\"String\",\"javaField\":\"name\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"Name\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 13:44:44\",\"columnId\":\"2010949769411579907\",\"tableId\":\"2010949768560136193\",\"columnName\":\"order_num\",\"columnComment\":\"排序\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"orderNum\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"pk\":false,\"usableColumn\":true,\"superColumn\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"OrderNum\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 13:44:44\",\"columnId\":\"2010949769411579908\",\"tableId\":\"2010949768560136193\",\"columnName\":\"is_enable\",\"columnComment\":\"是否可用（1-是 0-否）\",\"columnType\":\"tinyint\",\"javaType\":\"Long\",\"javaField\":\"isEnable\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"select\",\"dictType\":\"\",\"sort\":4,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"IsEnable\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 13:44:44\",\"columnId\":\"2010949769411579909\",\"tableId\":\"2010949768560136193\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户id\",\"columnType\":\"varchar(64)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"0\",\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":false,\"insert\":false,\"edit\":false,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"increment\":false,\"query\":false,\"capJavaField\":\"TenantId\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 13:44:44\",\"columnId\":\"2010949769411579910\",\"tableId\":\"2010949768560136193\",\"columnName\":\"create_by\",\"columnComment\":\"创建人\",\"columnType\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 13:44:44', 66);
INSERT INTO `sys_oper_log` VALUES (2010951184838184961, '000000', '代码生成', 2, 'org.dromara.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 13:44:58\",\"params\":{\"parentMenuId\":0,\"popupComponent\":\"drawer\",\"formComponent\":\"useForm\"},\"tableId\":\"2010949768560136193\",\"dataName\":\"master\",\"tableName\":\"dig_kb_category\",\"tableComment\":\"知识库分类表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"KbCategory\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.knowledge\",\"moduleName\":\"knowledge\",\"businessName\":\"kbCategory\",\"functionName\":\"知识库分类\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 13:44:58\",\"columnId\":\"2010949769411579905\",\"tableId\":\"2010949768560136193\",\"columnName\":\"id\",\"columnComment\":\"id\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"insert\":false,\"edit\":true,\"pk\":true,\"usableColumn\":false,\"superColumn\":false,\"increment\":true,\"query\":false,\"capJavaField\":\"Id\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 13:44:58\",\"columnId\":\"2010949769411579906\",\"tableId\":\"2010949768560136193\",\"columnName\":\"name\",\"columnComment\":\"分类名称\",\"columnType\":\"varchar(30)\",\"javaType\":\"String\",\"javaField\":\"name\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"Name\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 13:44:58\",\"columnId\":\"2010949769411579907\",\"tableId\":\"2010949768560136193\",\"columnName\":\"order_num\",\"columnComment\":\"排序\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"orderNum\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"pk\":false,\"usableColumn\":true,\"superColumn\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"OrderNum\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 13:44:58\",\"columnId\":\"2010949769411579908\",\"tableId\":\"2010949768560136193\",\"columnName\":\"is_enable\",\"columnComment\":\"是否可用（1-是 0-否）\",\"columnType\":\"tinyint\",\"javaType\":\"Long\",\"javaField\":\"isEnable\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"select\",\"dictType\":\"sys_enable\",\"sort\":4,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"IsEnable\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 13:44:58\",\"columnId\":\"2010949769411579909\",\"tableId\":\"2010949768560136193\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户id\",\"columnType\":\"varchar(64)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"0\",\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":false,\"insert\":false,\"edit\":false,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"increment\":false,\"query\":false,\"capJavaField\":\"TenantId\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 13:44:58\",\"columnId\":\"2010949769411579910\",\"tableId\":\"2010949768560136193\",\"columnName\":\"create_by\",\"columnComment\":\"创建人\",\"c', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 13:44:59', 56);
INSERT INTO `sys_oper_log` VALUES (2010952852698976257, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":105,\"parentId\":1,\"menuName\":\"字典管理\",\"orderNum\":6,\"path\":\"dict\",\"component\":\"system/dict/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:dict:list\",\"icon\":\"streamline:dictionary-language-book-solid\",\"remark\":\"字典管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 13:51:36', 106);
INSERT INTO `sys_oper_log` VALUES (2010953117485387778, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":106,\"parentId\":1,\"menuName\":\"参数设置\",\"orderNum\":7,\"path\":\"config\",\"component\":\"system/config/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:config:list\",\"icon\":\"carbon:parameter\",\"remark\":\"参数设置菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 13:52:40', 58);
INSERT INTO `sys_oper_log` VALUES (2010953324214243329, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":107,\"parentId\":1,\"menuName\":\"通知公告\",\"orderNum\":8,\"path\":\"notice\",\"component\":\"system/notice/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:notice:list\",\"icon\":\"streamline-plump:announcement-megaphone-solid\",\"remark\":\"通知公告菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 13:53:29', 64);
INSERT INTO `sys_oper_log` VALUES (2010953446759223298, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":108,\"parentId\":1,\"menuName\":\"日志管理\",\"orderNum\":9,\"path\":\"log\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"icon-park-solid:log\",\"remark\":\"日志管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 13:53:58', 70);
INSERT INTO `sys_oper_log` VALUES (2010953550341754882, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":118,\"parentId\":1,\"menuName\":\"文件管理\",\"orderNum\":10,\"path\":\"oss\",\"component\":\"system/oss/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:oss:list\",\"icon\":\"mingcute:file-fill\",\"remark\":\"文件管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 13:54:23', 56);
INSERT INTO `sys_oper_log` VALUES (2010954693046325249, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":501,\"parentId\":108,\"menuName\":\"登录日志\",\"orderNum\":2,\"path\":\"logininfor\",\"component\":\"monitor/logininfor/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:logininfor:list\",\"icon\":\"material-symbols:login\",\"remark\":\"登录日志菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 13:58:55', 95);
INSERT INTO `sys_oper_log` VALUES (2010955154679812098, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":500,\"parentId\":108,\"menuName\":\"操作日志\",\"orderNum\":1,\"path\":\"operlog\",\"component\":\"monitor/operlog/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:operlog:list\",\"icon\":\"lucide:file-pen\",\"remark\":\"操作日志菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 14:00:45', 63);
INSERT INTO `sys_oper_log` VALUES (2010955995251888129, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":11616,\"parentId\":0,\"menuName\":\"工作流\",\"orderNum\":6,\"path\":\"workflow\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"streamline-ultimate:human-resources-workflow-bold\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 14:04:06', 54);
INSERT INTO `sys_oper_log` VALUES (2010956101992730626, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":11622,\"parentId\":11616,\"menuName\":\"流程分类\",\"orderNum\":1,\"path\":\"category\",\"component\":\"workflow/category/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:category:list\",\"icon\":\"nrk:category-active\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 14:04:31', 71);
INSERT INTO `sys_oper_log` VALUES (2010956281504747522, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":11801,\"parentId\":11616,\"menuName\":\"流程表达式\",\"orderNum\":2,\"path\":\"spel\",\"component\":\"workflow/spel/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"workflow:spel:list\",\"icon\":\"material-symbols:regular-expression\",\"remark\":\"流程达式定义菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 14:05:14', 56);
INSERT INTO `sys_oper_log` VALUES (2010956490288812034, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":11620,\"parentId\":11616,\"menuName\":\"流程定义\",\"orderNum\":3,\"path\":\"processDefinition\",\"component\":\"workflow/processDefinition/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"1\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"streamline:definition-search-book-remix\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 14:06:04', 56);
INSERT INTO `sys_oper_log` VALUES (2010956606378758145, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":11630,\"parentId\":11616,\"menuName\":\"流程监控\",\"orderNum\":4,\"path\":\"monitor\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"lucide:monitor-up\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 14:06:31', 57);
INSERT INTO `sys_oper_log` VALUES (2010957625372332033, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":122,\"parentId\":6,\"menuName\":\"租户套餐管理\",\"orderNum\":2,\"path\":\"tenantPackage\",\"component\":\"system/tenantPackage/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:tenantPackage:list\",\"icon\":\"tdesign:chart-combo\",\"remark\":\"租户套餐管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 14:10:34', 93);
INSERT INTO `sys_oper_log` VALUES (2010957662412230657, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":121,\"parentId\":6,\"menuName\":\"租户管理\",\"orderNum\":1,\"path\":\"tenant\",\"component\":\"system/tenant/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:tenant:list\",\"icon\":\"carbon:location-company\",\"remark\":\"租户管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 14:10:43', 59);
INSERT INTO `sys_oper_log` VALUES (2010957804490084353, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":123,\"parentId\":1,\"menuName\":\"客户端管理\",\"orderNum\":11,\"path\":\"client\",\"component\":\"system/client/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:client:list\",\"icon\":\"ix:client-interface\",\"remark\":\"客户端管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 14:11:17', 57);
INSERT INTO `sys_oper_log` VALUES (2010959955652136961, '000000', '代码生成', 2, 'org.dromara.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 14:19:49\",\"params\":{\"parentMenuId\":\"2010949410043613185\",\"popupComponent\":\"drawer\",\"formComponent\":\"useForm\"},\"tableId\":\"2010949769604517890\",\"dataName\":\"master\",\"tableName\":\"dig_kb_document\",\"tableComment\":\"haipeng-lin\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"KbDocument\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.knowledge\",\"moduleName\":\"knowledge\",\"businessName\":\"kbDocument\",\"functionName\":\"知识库文档\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 14:19:49\",\"columnId\":\"2010949769805844481\",\"tableId\":\"2010949769604517890\",\"columnName\":\"id\",\"columnComment\":\"id\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"insert\":false,\"edit\":true,\"pk\":true,\"usableColumn\":false,\"superColumn\":false,\"increment\":false,\"query\":false,\"capJavaField\":\"Id\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 14:19:49\",\"columnId\":\"2010949769805844482\",\"tableId\":\"2010949769604517890\",\"columnName\":\"kb_category_id\",\"columnComment\":\"知识库分类id\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"kbCategoryId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"KbCategoryId\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 14:19:49\",\"columnId\":\"2010949769805844483\",\"tableId\":\"2010949769604517890\",\"columnName\":\"title\",\"columnComment\":\"标题\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"title\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"Title\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 14:19:49\",\"columnId\":\"2010949769805844484\",\"tableId\":\"2010949769604517890\",\"columnName\":\"tag\",\"columnComment\":\"标签\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"tag\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":4,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"Tag\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 14:19:49\",\"columnId\":\"2010949769805844485\",\"tableId\":\"2010949769604517890\",\"columnName\":\"content\",\"columnComment\":\"内容\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"content\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"editor\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"Content\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 14:19:49\",\"columnId\":\"2010949769805844486\",\"tableId\":\"2010949769604517890\",\"columnName\":\"is_enable\",\"columnComment\":\"是否可用', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 14:19:50', 55);
INSERT INTO `sys_oper_log` VALUES (2010960003161018370, '000000', '代码生成', 2, 'org.dromara.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 14:20:01\",\"params\":{\"parentMenuId\":0,\"popupComponent\":\"drawer\",\"formComponent\":\"useForm\"},\"tableId\":\"2010949768560136193\",\"dataName\":\"master\",\"tableName\":\"dig_kb_category\",\"tableComment\":\"知识库分类表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"KbCategory\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.knowledge\",\"moduleName\":\"knowledge\",\"businessName\":\"kbCategory\",\"functionName\":\"知识库分类\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 14:20:01\",\"columnId\":\"2010949769411579905\",\"tableId\":\"2010949768560136193\",\"columnName\":\"id\",\"columnComment\":\"id\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"insert\":false,\"edit\":true,\"pk\":true,\"usableColumn\":false,\"superColumn\":false,\"increment\":true,\"query\":false,\"capJavaField\":\"Id\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 14:20:01\",\"columnId\":\"2010949769411579906\",\"tableId\":\"2010949768560136193\",\"columnName\":\"name\",\"columnComment\":\"分类名称\",\"columnType\":\"varchar(30)\",\"javaType\":\"String\",\"javaField\":\"name\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"Name\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 14:20:01\",\"columnId\":\"2010949769411579907\",\"tableId\":\"2010949768560136193\",\"columnName\":\"order_num\",\"columnComment\":\"排序\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"orderNum\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"pk\":false,\"usableColumn\":true,\"superColumn\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"OrderNum\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 14:20:01\",\"columnId\":\"2010949769411579908\",\"tableId\":\"2010949768560136193\",\"columnName\":\"is_enable\",\"columnComment\":\"是否可用（1-是 0-否）\",\"columnType\":\"tinyint\",\"javaType\":\"Long\",\"javaField\":\"isEnable\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"select\",\"dictType\":\"sys_enable\",\"sort\":4,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"increment\":false,\"query\":true,\"capJavaField\":\"IsEnable\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 14:20:01\",\"columnId\":\"2010949769411579909\",\"tableId\":\"2010949768560136193\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户id\",\"columnType\":\"varchar(64)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"0\",\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":false,\"insert\":false,\"edit\":false,\"pk\":false,\"usableColumn\":false,\"superColumn\":false,\"increment\":false,\"query\":false,\"capJavaField\":\"TenantId\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 14:20:01\",\"columnId\":\"2010949769411579910\",\"tableId\":\"2010949768560136193\",\"columnName\":\"create_by\",\"columnComment\":\"创建人\",\"c', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 14:20:01', 231);
INSERT INTO `sys_oper_log` VALUES (2010960017815916545, '000000', '代码生成', 8, 'org.dromara.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '0:0:0:0:0:0:0:1', '内网IP', '{\"tableIdStr\":\"2010949769604517890,2010949768560136193\"}', '', 0, '', '2026-01-13 14:20:05', 78);
INSERT INTO `sys_oper_log` VALUES (2011005985064103938, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:44\",\"params\":{\"parentMenuId\":0,\"popupComponent\":\"drawer\",\"formComponent\":\"useForm\"},\"tableId\":\"2010949768560136193\",\"dataName\":\"master\",\"tableName\":\"dig_kb_category\",\"tableComment\":\"知识库分类表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"KbCategory\",\"tplCategory\":\"crud\",\"packageName\":\"com.flash.knowledge\",\"moduleName\":\"knowledge\",\"businessName\":\"kbCategory\",\"functionName\":\"知识库分类\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:44\",\"columnId\":\"2010949769411579905\",\"tableId\":\"2010949768560136193\",\"columnName\":\"id\",\"columnComment\":\"id\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"insert\":false,\"edit\":true,\"superColumn\":false,\"usableColumn\":false,\"pk\":true,\"capJavaField\":\"Id\",\"query\":false,\"increment\":true},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:44\",\"columnId\":\"2010949769411579906\",\"tableId\":\"2010949768560136193\",\"columnName\":\"name\",\"columnComment\":\"分类名称\",\"columnType\":\"varchar(30)\",\"javaType\":\"String\",\"javaField\":\"name\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"superColumn\":false,\"usableColumn\":false,\"pk\":false,\"capJavaField\":\"Name\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:44\",\"columnId\":\"2010949769411579907\",\"tableId\":\"2010949768560136193\",\"columnName\":\"order_num\",\"columnComment\":\"排序\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"orderNum\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"superColumn\":false,\"usableColumn\":true,\"pk\":false,\"capJavaField\":\"OrderNum\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:44\",\"columnId\":\"2010949769411579908\",\"tableId\":\"2010949768560136193\",\"columnName\":\"is_enable\",\"columnComment\":\"是否可用（1-是 0-否）\",\"columnType\":\"tinyint\",\"javaType\":\"Long\",\"javaField\":\"isEnable\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"select\",\"dictType\":\"sys_enable\",\"sort\":4,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"superColumn\":false,\"usableColumn\":false,\"pk\":false,\"capJavaField\":\"IsEnable\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:44\",\"columnId\":\"2010949769411579909\",\"tableId\":\"2010949768560136193\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户id\",\"columnType\":\"varchar(64)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"0\",\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":false,\"insert\":false,\"edit\":false,\"superColumn\":false,\"usableColumn\":false,\"pk\":false,\"capJavaField\":\"TenantId\",\"query\":false,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:44\",\"columnId\":\"2010949769411579910\",\"tableId\":\"2010949768560136193\",\"columnName\":\"create_by\",\"columnComment\":\"创建人\",\"col', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 17:22:44', 121);
INSERT INTO `sys_oper_log` VALUES (2011006006731878401, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:49\",\"params\":{\"parentMenuId\":0,\"popupComponent\":\"drawer\",\"formComponent\":\"useForm\"},\"tableId\":\"2010949768560136193\",\"dataName\":\"master\",\"tableName\":\"dig_kb_category\",\"tableComment\":\"知识库分类表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"KbCategory\",\"tplCategory\":\"crud\",\"packageName\":\"com.flash.knowledge\",\"moduleName\":\"knowledge\",\"businessName\":\"kbCategory\",\"functionName\":\"知识库分类\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:49\",\"columnId\":\"2010949769411579905\",\"tableId\":\"2010949768560136193\",\"columnName\":\"id\",\"columnComment\":\"id\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"insert\":false,\"edit\":true,\"superColumn\":false,\"usableColumn\":false,\"pk\":true,\"capJavaField\":\"Id\",\"query\":false,\"increment\":true},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:49\",\"columnId\":\"2010949769411579906\",\"tableId\":\"2010949768560136193\",\"columnName\":\"name\",\"columnComment\":\"分类名称\",\"columnType\":\"varchar(30)\",\"javaType\":\"String\",\"javaField\":\"name\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"superColumn\":false,\"usableColumn\":false,\"pk\":false,\"capJavaField\":\"Name\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:49\",\"columnId\":\"2010949769411579907\",\"tableId\":\"2010949768560136193\",\"columnName\":\"order_num\",\"columnComment\":\"排序\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"orderNum\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"superColumn\":false,\"usableColumn\":true,\"pk\":false,\"capJavaField\":\"OrderNum\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:49\",\"columnId\":\"2010949769411579908\",\"tableId\":\"2010949768560136193\",\"columnName\":\"is_enable\",\"columnComment\":\"是否可用（1-是 0-否）\",\"columnType\":\"tinyint\",\"javaType\":\"Long\",\"javaField\":\"isEnable\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"select\",\"dictType\":\"sys_enable\",\"sort\":4,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"superColumn\":false,\"usableColumn\":false,\"pk\":false,\"capJavaField\":\"IsEnable\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:49\",\"columnId\":\"2010949769411579909\",\"tableId\":\"2010949768560136193\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户id\",\"columnType\":\"varchar(64)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"0\",\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":false,\"insert\":false,\"edit\":false,\"superColumn\":false,\"usableColumn\":false,\"pk\":false,\"capJavaField\":\"TenantId\",\"query\":false,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:49\",\"columnId\":\"2010949769411579910\",\"tableId\":\"2010949768560136193\",\"columnName\":\"create_by\",\"columnComment\":\"创建人\",\"col', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 17:22:49', 64);
INSERT INTO `sys_oper_log` VALUES (2011006046862979073, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:58\",\"params\":{\"parentMenuId\":\"2010949410043613185\",\"popupComponent\":\"drawer\",\"formComponent\":\"useForm\"},\"tableId\":\"2010949769604517890\",\"dataName\":\"master\",\"tableName\":\"dig_kb_document\",\"tableComment\":\"haipeng-lin\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"KbDocument\",\"tplCategory\":\"crud\",\"packageName\":\"com.flash.knowledge\",\"moduleName\":\"knowledge\",\"businessName\":\"kbDocument\",\"functionName\":\"知识库文档\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:58\",\"columnId\":\"2010949769805844481\",\"tableId\":\"2010949769604517890\",\"columnName\":\"id\",\"columnComment\":\"id\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"insert\":false,\"edit\":true,\"superColumn\":false,\"usableColumn\":false,\"pk\":true,\"capJavaField\":\"Id\",\"query\":false,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:58\",\"columnId\":\"2010949769805844482\",\"tableId\":\"2010949769604517890\",\"columnName\":\"kb_category_id\",\"columnComment\":\"知识库分类id\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"kbCategoryId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"superColumn\":false,\"usableColumn\":false,\"pk\":false,\"capJavaField\":\"KbCategoryId\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:58\",\"columnId\":\"2010949769805844483\",\"tableId\":\"2010949769604517890\",\"columnName\":\"title\",\"columnComment\":\"标题\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"title\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"superColumn\":false,\"usableColumn\":false,\"pk\":false,\"capJavaField\":\"Title\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:58\",\"columnId\":\"2010949769805844484\",\"tableId\":\"2010949769604517890\",\"columnName\":\"tag\",\"columnComment\":\"标签\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"tag\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":4,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"superColumn\":false,\"usableColumn\":false,\"pk\":false,\"capJavaField\":\"Tag\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:58\",\"columnId\":\"2010949769805844485\",\"tableId\":\"2010949769604517890\",\"columnName\":\"content\",\"columnComment\":\"内容\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"content\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"editor\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":true,\"insert\":true,\"edit\":true,\"superColumn\":false,\"usableColumn\":false,\"pk\":false,\"capJavaField\":\"Content\",\"query\":true,\"increment\":false},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:22:58\",\"columnId\":\"2010949769805844486\",\"tableId\":\"2010949769604517890\",\"columnName\":\"is_enable\",\"columnComment\":\"是否可用（1', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 17:22:59', 114);
INSERT INTO `sys_oper_log` VALUES (2011006436543180801, '000000', '代码生成', 8, 'com.flash.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '0:0:0:0:0:0:0:1', '内网IP', '{\"tableIdStr\":\"2010949768560136193,2010949769604517890\"}', '', 0, '', '2026-01-13 17:24:32', 450);
INSERT INTO `sys_oper_log` VALUES (2011011300115554306, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:43:51\",\"params\":{\"parentMenuId\":\"2010949410043613185\",\"popupComponent\":\"drawer\",\"formComponent\":\"useForm\"},\"tableId\":\"2010949769604517890\",\"dataName\":\"master\",\"tableName\":\"dig_kb_document\",\"tableComment\":\"haipeng-lin\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"KbDocument\",\"tplCategory\":\"crud\",\"packageName\":\"com.flash.knowledge\",\"moduleName\":\"knowledge\",\"businessName\":\"kbDocument\",\"functionName\":\"知识库文档\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:43:51\",\"columnId\":\"2010949769805844481\",\"tableId\":\"2010949769604517890\",\"columnName\":\"id\",\"columnComment\":\"id\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":false,\"increment\":false,\"capJavaField\":\"Id\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:43:51\",\"columnId\":\"2010949769805844482\",\"tableId\":\"2010949769604517890\",\"columnName\":\"kb_category_id\",\"columnComment\":\"知识库分类id\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"kbCategoryId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"KbCategoryId\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:43:51\",\"columnId\":\"2010949769805844483\",\"tableId\":\"2010949769604517890\",\"columnName\":\"title\",\"columnComment\":\"标题\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"title\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Title\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:43:51\",\"columnId\":\"2010949769805844484\",\"tableId\":\"2010949769604517890\",\"columnName\":\"tag\",\"columnComment\":\"标签\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"tag\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":4,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Tag\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:43:51\",\"columnId\":\"2010949769805844485\",\"tableId\":\"2010949769604517890\",\"columnName\":\"content\",\"columnComment\":\"内容\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"content\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"editor\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Content\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:43:51\",\"columnId\":\"2010949769805844486\",\"tableId\":\"2010949769604517890\",\"columnName\":\"is_enable\",\"columnComment\":\"是否可用（1', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 17:43:51', 210);
INSERT INTO `sys_oper_log` VALUES (2011011339089027074, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:44:00\",\"params\":{\"parentMenuId\":\"2010949410043613185\",\"popupComponent\":\"drawer\",\"formComponent\":\"useForm\"},\"tableId\":\"2010949768560136193\",\"dataName\":\"master\",\"tableName\":\"dig_kb_category\",\"tableComment\":\"知识库分类表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"KbCategory\",\"tplCategory\":\"crud\",\"packageName\":\"com.flash.knowledge\",\"moduleName\":\"knowledge\",\"businessName\":\"kbCategory\",\"functionName\":\"知识库分类\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:44:00\",\"columnId\":\"2010949769411579905\",\"tableId\":\"2010949768560136193\",\"columnName\":\"id\",\"columnComment\":\"id\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":false,\"increment\":true,\"capJavaField\":\"Id\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:44:00\",\"columnId\":\"2010949769411579906\",\"tableId\":\"2010949768560136193\",\"columnName\":\"name\",\"columnComment\":\"分类名称\",\"columnType\":\"varchar(30)\",\"javaType\":\"String\",\"javaField\":\"name\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Name\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:44:00\",\"columnId\":\"2010949769411579907\",\"tableId\":\"2010949768560136193\",\"columnName\":\"order_num\",\"columnComment\":\"排序\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"orderNum\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":true,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"OrderNum\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:44:00\",\"columnId\":\"2010949769411579908\",\"tableId\":\"2010949768560136193\",\"columnName\":\"is_enable\",\"columnComment\":\"是否可用（1-是 0-否）\",\"columnType\":\"tinyint\",\"javaType\":\"Long\",\"javaField\":\"isEnable\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"select\",\"dictType\":\"sys_enable\",\"sort\":4,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"IsEnable\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:44:00\",\"columnId\":\"2010949769411579909\",\"tableId\":\"2010949768560136193\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户id\",\"columnType\":\"varchar(64)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"0\",\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":false,\"pk\":false,\"insert\":false,\"edit\":false,\"usableColumn\":false,\"superColumn\":false,\"query\":false,\"increment\":false,\"capJavaField\":\"TenantId\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:44:00\",\"columnId\":\"2010949769411579910\",\"tableId\":\"2010949768560136193\",\"columnName\":\"create_by\",\"colum', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 17:44:01', 125);
INSERT INTO `sys_oper_log` VALUES (2011011561605242882, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:44:53\",\"params\":{\"parentMenuId\":\"2010949410043613185\",\"popupComponent\":\"drawer\",\"formComponent\":\"useForm\"},\"tableId\":\"2010949769604517890\",\"dataName\":\"master\",\"tableName\":\"dig_kb_document\",\"tableComment\":\"知识库文档\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"KbDocument\",\"tplCategory\":\"crud\",\"packageName\":\"com.flash.knowledge\",\"moduleName\":\"knowledge\",\"businessName\":\"kbDocument\",\"functionName\":\"知识库文档\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:44:53\",\"columnId\":\"2010949769805844481\",\"tableId\":\"2010949769604517890\",\"columnName\":\"id\",\"columnComment\":\"id\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":false,\"increment\":false,\"capJavaField\":\"Id\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:44:53\",\"columnId\":\"2010949769805844482\",\"tableId\":\"2010949769604517890\",\"columnName\":\"kb_category_id\",\"columnComment\":\"知识库分类id\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"kbCategoryId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"KbCategoryId\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:44:53\",\"columnId\":\"2010949769805844483\",\"tableId\":\"2010949769604517890\",\"columnName\":\"title\",\"columnComment\":\"标题\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"title\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Title\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:44:53\",\"columnId\":\"2010949769805844484\",\"tableId\":\"2010949769604517890\",\"columnName\":\"tag\",\"columnComment\":\"标签\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"tag\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":4,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Tag\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:44:53\",\"columnId\":\"2010949769805844485\",\"tableId\":\"2010949769604517890\",\"columnName\":\"content\",\"columnComment\":\"内容\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"content\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"editor\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Content\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:44:53\",\"columnId\":\"2010949769805844486\",\"tableId\":\"2010949769604517890\",\"columnName\":\"is_enable\",\"columnComment\":\"是否可用（1-是 0否）', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 17:44:54', 81);
INSERT INTO `sys_oper_log` VALUES (2011011760184565762, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:45:41\",\"params\":{\"parentMenuId\":\"2010949410043613185\",\"popupComponent\":\"drawer\",\"formComponent\":\"useForm\"},\"tableId\":\"2010949768560136193\",\"dataName\":\"master\",\"tableName\":\"dig_kb_category\",\"tableComment\":\"知识库分类表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"KbCategory\",\"tplCategory\":\"crud\",\"packageName\":\"com.flash.knowledge\",\"moduleName\":\"knowledge\",\"businessName\":\"kbCategory\",\"functionName\":\"知识库分类\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:45:41\",\"columnId\":\"2010949769411579905\",\"tableId\":\"2010949768560136193\",\"columnName\":\"id\",\"columnComment\":\"id\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":false,\"increment\":true,\"capJavaField\":\"Id\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:45:41\",\"columnId\":\"2010949769411579906\",\"tableId\":\"2010949768560136193\",\"columnName\":\"name\",\"columnComment\":\"分类名称\",\"columnType\":\"varchar(30)\",\"javaType\":\"String\",\"javaField\":\"name\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Name\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:45:41\",\"columnId\":\"2010949769411579907\",\"tableId\":\"2010949768560136193\",\"columnName\":\"order_num\",\"columnComment\":\"排序\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"orderNum\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":true,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"OrderNum\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:45:41\",\"columnId\":\"2010949769411579908\",\"tableId\":\"2010949768560136193\",\"columnName\":\"is_enable\",\"columnComment\":\"是否可用（1-是 0-否）\",\"columnType\":\"tinyint\",\"javaType\":\"Long\",\"javaField\":\"isEnable\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"select\",\"dictType\":\"sys_enable\",\"sort\":4,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"IsEnable\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:45:41\",\"columnId\":\"2010949769411579909\",\"tableId\":\"2010949768560136193\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户id\",\"columnType\":\"varchar(64)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"0\",\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":false,\"pk\":false,\"insert\":false,\"edit\":false,\"usableColumn\":false,\"superColumn\":false,\"query\":false,\"increment\":false,\"capJavaField\":\"TenantId\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:45:41\",\"columnId\":\"2010949769411579910\",\"tableId\":\"2010949768560136193\",\"columnName\":\"create_by\",\"colum', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 17:45:41', 75);
INSERT INTO `sys_oper_log` VALUES (2011011808159014914, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:45:52\",\"params\":{\"parentMenuId\":\"2010949410043613185\",\"popupComponent\":\"drawer\",\"formComponent\":\"useForm\"},\"tableId\":\"2010949769604517890\",\"dataName\":\"master\",\"tableName\":\"dig_kb_document\",\"tableComment\":\"知识库文档表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"KbDocument\",\"tplCategory\":\"crud\",\"packageName\":\"com.flash.knowledge\",\"moduleName\":\"knowledge\",\"businessName\":\"kbDocument\",\"functionName\":\"知识库文档\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:45:52\",\"columnId\":\"2010949769805844481\",\"tableId\":\"2010949769604517890\",\"columnName\":\"id\",\"columnComment\":\"id\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":false,\"increment\":false,\"capJavaField\":\"Id\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:45:52\",\"columnId\":\"2010949769805844482\",\"tableId\":\"2010949769604517890\",\"columnName\":\"kb_category_id\",\"columnComment\":\"知识库分类id\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"kbCategoryId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"KbCategoryId\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:45:52\",\"columnId\":\"2010949769805844483\",\"tableId\":\"2010949769604517890\",\"columnName\":\"title\",\"columnComment\":\"标题\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"title\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Title\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:45:52\",\"columnId\":\"2010949769805844484\",\"tableId\":\"2010949769604517890\",\"columnName\":\"tag\",\"columnComment\":\"标签\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"tag\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":4,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Tag\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:45:52\",\"columnId\":\"2010949769805844485\",\"tableId\":\"2010949769604517890\",\"columnName\":\"content\",\"columnComment\":\"内容\",\"columnType\":\"varchar(255)\",\"javaType\":\"String\",\"javaField\":\"content\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"editor\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Content\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-13 17:45:52\",\"columnId\":\"2010949769805844486\",\"tableId\":\"2010949769604517890\",\"columnName\":\"is_enable\",\"columnComment\":\"是否可用（1-是 0否', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-13 17:45:53', 78);
INSERT INTO `sys_oper_log` VALUES (2011239628902703106, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-14 08:51:09\",\"params\":{\"parentMenuId\":\"2010949410043613185\",\"popupComponent\":\"modal\",\"formComponent\":\"native\"},\"tableId\":\"2010949768560136193\",\"dataName\":\"master\",\"tableName\":\"dig_kb_category\",\"tableComment\":\"知识库分类表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"KbCategory\",\"tplCategory\":\"crud\",\"packageName\":\"com.flash.knowledge\",\"moduleName\":\"knowledge\",\"businessName\":\"kbCategory\",\"functionName\":\"知识库分类\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-14 08:51:09\",\"columnId\":\"2010949769411579905\",\"tableId\":\"2010949768560136193\",\"columnName\":\"id\",\"columnComment\":\"id\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":false,\"increment\":true,\"capJavaField\":\"Id\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-14 08:51:09\",\"columnId\":\"2010949769411579906\",\"tableId\":\"2010949768560136193\",\"columnName\":\"name\",\"columnComment\":\"分类名称\",\"columnType\":\"varchar(30)\",\"javaType\":\"String\",\"javaField\":\"name\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Name\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-14 08:51:09\",\"columnId\":\"2010949769411579907\",\"tableId\":\"2010949768560136193\",\"columnName\":\"order_num\",\"columnComment\":\"排序\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"orderNum\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":true,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"OrderNum\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-14 08:51:09\",\"columnId\":\"2010949769411579908\",\"tableId\":\"2010949768560136193\",\"columnName\":\"is_enable\",\"columnComment\":\"是否可用（1-是 0-否）\",\"columnType\":\"tinyint\",\"javaType\":\"Long\",\"javaField\":\"isEnable\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"select\",\"dictType\":\"sys_enable\",\"sort\":4,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"IsEnable\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-14 08:51:09\",\"columnId\":\"2010949769411579909\",\"tableId\":\"2010949768560136193\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户id\",\"columnType\":\"varchar(64)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"0\",\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":false,\"pk\":false,\"insert\":false,\"edit\":false,\"usableColumn\":false,\"superColumn\":false,\"query\":false,\"increment\":false,\"capJavaField\":\"TenantId\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-14 08:51:09\",\"columnId\":\"2010949769411579910\",\"tableId\":\"2010949768560136193\",\"columnName\":\"create_by\",\"columnC', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-14 08:51:09', 87);
INSERT INTO `sys_oper_log` VALUES (2011240859893178369, '000000', '代码生成', 2, 'com.flash.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-14 08:56:02\",\"params\":{\"parentMenuId\":\"2010949410043613185\",\"popupComponent\":\"modal\",\"formComponent\":\"useForm\"},\"tableId\":\"2010949768560136193\",\"dataName\":\"master\",\"tableName\":\"dig_kb_category\",\"tableComment\":\"知识库分类表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"KbCategory\",\"tplCategory\":\"crud\",\"packageName\":\"com.flash.knowledge\",\"moduleName\":\"knowledge\",\"businessName\":\"kbCategory\",\"functionName\":\"知识库分类\",\"functionAuthor\":\"haipeng-lin\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-14 08:56:02\",\"columnId\":\"2010949769411579905\",\"tableId\":\"2010949768560136193\",\"columnName\":\"id\",\"columnComment\":\"id\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"id\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":\"0\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"insert\":false,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":false,\"increment\":true,\"capJavaField\":\"Id\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-14 08:56:02\",\"columnId\":\"2010949769411579906\",\"tableId\":\"2010949768560136193\",\"columnName\":\"name\",\"columnComment\":\"分类名称\",\"columnType\":\"varchar(30)\",\"javaType\":\"String\",\"javaField\":\"name\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"LIKE\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"Name\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-14 08:56:02\",\"columnId\":\"2010949769411579907\",\"tableId\":\"2010949768560136193\",\"columnName\":\"order_num\",\"columnComment\":\"排序\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"orderNum\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":3,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":true,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"OrderNum\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-14 08:56:02\",\"columnId\":\"2010949769411579908\",\"tableId\":\"2010949768560136193\",\"columnName\":\"is_enable\",\"columnComment\":\"是否可用（1-是 0-否）\",\"columnType\":\"tinyint\",\"javaType\":\"Long\",\"javaField\":\"isEnable\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"select\",\"dictType\":\"sys_enable\",\"sort\":4,\"required\":false,\"list\":true,\"pk\":false,\"insert\":true,\"edit\":true,\"usableColumn\":false,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"IsEnable\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-14 08:56:02\",\"columnId\":\"2010949769411579909\",\"tableId\":\"2010949768560136193\",\"columnName\":\"tenant_id\",\"columnComment\":\"租户id\",\"columnType\":\"varchar(64)\",\"javaType\":\"String\",\"javaField\":\"tenantId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"0\",\"isInsert\":\"0\",\"isEdit\":\"0\",\"isList\":\"0\",\"isQuery\":\"0\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":5,\"required\":false,\"list\":false,\"pk\":false,\"insert\":false,\"edit\":false,\"usableColumn\":false,\"superColumn\":false,\"query\":false,\"increment\":false,\"capJavaField\":\"TenantId\"},{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2026-01-14 08:56:02\",\"columnId\":\"2010949769411579910\",\"tableId\":\"2010949768560136193\",\"columnName\":\"create_by\",\"column', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-14 08:56:03', 56);
INSERT INTO `sys_oper_log` VALUES (2011246977310728194, '000000', '知识库分类', 1, 'com.flash.knowledge.controller.KbCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"name\":\"售前\",\"orderNum\":1,\"isEnable\":1}', '', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_dept\' in \'field list\'\r\n### The error may exist in com/flash/knowledge/mapper/KbCategoryMapper.java (best guess)\r\n### The error may involve com.flash.knowledge.mapper.KbCategoryMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO dig_kb_category (id, name, order_num, is_enable, create_dept, create_by, create_time, update_by, update_time, tenant_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, \'000000\')\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_dept\' in \'field list\'\n; bad SQL grammar []', '2026-01-14 09:20:21', 560);
INSERT INTO `sys_oper_log` VALUES (2011247540823859201, '000000', '知识库分类', 1, 'com.flash.knowledge.controller.KbCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":null,\"name\":\"售前\",\"orderNum\":1,\"isEnable\":1}', '', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_dept\' in \'field list\'\r\n### The error may exist in com/flash/knowledge/mapper/KbCategoryMapper.java (best guess)\r\n### The error may involve com.flash.knowledge.mapper.KbCategoryMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO dig_kb_category (id, name, order_num, is_enable, create_dept, create_by, create_time, update_by, update_time, tenant_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, \'000000\')\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_dept\' in \'field list\'\n; bad SQL grammar []', '2026-01-14 09:22:36', 16);
INSERT INTO `sys_oper_log` VALUES (2011250339112493057, '000000', '知识库分类', 1, 'com.flash.knowledge.controller.KbCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2011250337938087938\",\"name\":\"售前\",\"orderNum\":1,\"isEnable\":1}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-14 09:33:43', 289);
INSERT INTO `sys_oper_log` VALUES (2011256109686267906, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2011011841088495617\",\"parentId\":\"2010949410043613185\",\"menuName\":\"知识库分类\",\"orderNum\":1,\"path\":\"kbCategory\",\"component\":\"knowledge/kbCategory/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"knowledge:kbCategory:list\",\"icon\":\"nrk:category-active\",\"remark\":\"知识库分类菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-14 09:56:39', 363);
INSERT INTO `sys_oper_log` VALUES (2011256192800595969, '000000', '菜单管理', 2, 'com.flash.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":\"2011011906146344961\",\"parentId\":\"2010949410043613185\",\"menuName\":\"知识库文档\",\"orderNum\":1,\"path\":\"kbDocument\",\"component\":\"knowledge/kbDocument/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"knowledge:kbDocument:list\",\"icon\":\"bx:file\",\"remark\":\"知识库文档菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-14 09:56:58', 72);
INSERT INTO `sys_oper_log` VALUES (2011256494316527617, '000000', '知识库分类', 1, 'com.flash.knowledge.controller.KbCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2011256494052286466\",\"name\":\"售后\",\"orderNum\":2,\"isEnable\":1}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-14 09:58:10', 72);
INSERT INTO `sys_oper_log` VALUES (2011332954058383361, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2011250337938087938\",\"name\":\"售前\",\"orderNum\":1,\"isEnable\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-14 15:02:00', 93);
INSERT INTO `sys_oper_log` VALUES (2011332976736985089, '000000', '知识库分类', 3, 'com.flash.knowledge.controller.KbCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/knowledge/kbCategory/2011250337938087938', '0:0:0:0:0:0:0:1', '内网IP', '[\"2011250337938087938\"]', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-14 15:02:05', 81);
INSERT INTO `sys_oper_log` VALUES (2011332984358035458, '000000', '知识库分类', 3, 'com.flash.knowledge.controller.KbCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/knowledge/kbCategory/2011256494052286466', '0:0:0:0:0:0:0:1', '内网IP', '[\"2011256494052286466\"]', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-14 15:02:07', 134);
INSERT INTO `sys_oper_log` VALUES (2011333047654277121, '000000', '知识库分类', 1, 'com.flash.knowledge.controller.KbCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2011333047457144834\",\"name\":\"售前\",\"orderNum\":1,\"isEnable\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-14 15:02:22', 56);
INSERT INTO `sys_oper_log` VALUES (2011338469194768386, '000000', '知识库分类', 1, 'com.flash.knowledge.controller.KbCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2011338468829863938\",\"name\":\"售后\",\"orderNum\":0,\"isEnable\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-14 15:23:55', 85);
INSERT INTO `sys_oper_log` VALUES (2012074591008989186, '000000', '知识库分类', 2, 'com.flash.knowledge.controller.KbCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/knowledge/kbCategory', '0:0:0:0:0:0:0:1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"id\":\"2011338468829863938\",\"name\":\"售后\",\"orderNum\":0,\"isEnable\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2026-01-16 16:09:00', 141);

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
INSERT INTO `sys_user` VALUES (1, '000000', 103, 'admin', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@163.com', '15888888888', '1', NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '0:0:0:0:0:0:0:1', '2026-01-16 15:41:24', 103, 1, '2026-01-13 09:28:32', -1, '2026-01-16 15:41:24', '管理员');
INSERT INTO `sys_user` VALUES (3, '000000', 108, 'test', '本部门及以下 密码666666', 'sys_user', '', '', '0', NULL, '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '0', '0', '127.0.0.1', '2026-01-13 09:28:32', 103, 1, '2026-01-13 09:28:32', 3, '2026-01-13 09:28:32', NULL);
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
INSERT INTO `sys_user_role` VALUES (3, 3);
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
