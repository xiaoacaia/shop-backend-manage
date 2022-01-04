/*
Navicat MySQL Data Transfer

Source Server         : zy
Source Server Version : 80018
Source Host           : localhost:3306
Source Database       : goods_manage

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2022-01-04 14:37:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_level` int(11) NOT NULL DEFAULT '1',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_category
-- ----------------------------
INSERT INTO `goods_category` VALUES ('1', '1', '0', '零食');
INSERT INTO `goods_category` VALUES ('2', '1', '0', '家具日用');
INSERT INTO `goods_category` VALUES ('5', '2', '43', '显示器');
INSERT INTO `goods_category` VALUES ('9', '2', '1', '巧克力');
INSERT INTO `goods_category` VALUES ('11', '2', '1', '曲奇');
INSERT INTO `goods_category` VALUES ('13', '2', '3', '男士T恤');
INSERT INTO `goods_category` VALUES ('14', '2', '3', '男士卫衣');
INSERT INTO `goods_category` VALUES ('15', '2', '3', '男士衬衫');
INSERT INTO `goods_category` VALUES ('30', '2', '0', '撒大大');
INSERT INTO `goods_category` VALUES ('33', '2', '3', '男鞋');
INSERT INTO `goods_category` VALUES ('34', '2', '2', '桌子');
INSERT INTO `goods_category` VALUES ('35', '2', '2', '椅子');
INSERT INTO `goods_category` VALUES ('36', '2', '2', '镜子');
INSERT INTO `goods_category` VALUES ('40', '2', '5', '键盘');
INSERT INTO `goods_category` VALUES ('41', '2', '1', '饼干');
INSERT INTO `goods_category` VALUES ('42', '2', '1', '牛奶');
INSERT INTO `goods_category` VALUES ('43', '1', '0', '电子数码');
INSERT INTO `goods_category` VALUES ('46', '2', '44', '3');

-- ----------------------------
-- Table structure for goods_list
-- ----------------------------
DROP TABLE IF EXISTS `goods_list`;
CREATE TABLE `goods_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `goods_type` int(10) NOT NULL,
  `goods_price` int(255) DEFAULT NULL,
  `goods_stock` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=754 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_list
-- ----------------------------
INSERT INTO `goods_list` VALUES ('1', '100011', 'T恤123', '13', '60', '11');
INSERT INTO `goods_list` VALUES ('2', '100012', '衬衫', '15', '120', '23');
INSERT INTO `goods_list` VALUES ('3', '100014', '奥利奥', '41', '6', '100');
INSERT INTO `goods_list` VALUES ('5', '100016', '桌子', '34', '12', '30');
INSERT INTO `goods_list` VALUES ('20', '100013', '显示器', '39', '1000', '20');
INSERT INTO `goods_list` VALUES ('21', '100015', '奥利奥', '9', '12', '123');
INSERT INTO `goods_list` VALUES ('22', '100018', '好时', '9', '13', '111');
INSERT INTO `goods_list` VALUES ('23', '100052', '德芙', '9', '32', '123');
INSERT INTO `goods_list` VALUES ('24', '100026', '瑞士莲', '9', '41', '123');
INSERT INTO `goods_list` VALUES ('25', '200052', '吉利莲', '9', '22', '12');
INSERT INTO `goods_list` VALUES ('63', '2252316', 'b0fdf4c831', '5', '918', '60');
INSERT INTO `goods_list` VALUES ('548', '21321321', 'sdqwdawd212', '5', '2123', '123');
INSERT INTO `goods_list` VALUES ('550', '370700', 'cb427c5955', '5', '8134', '91');
INSERT INTO `goods_list` VALUES ('551', '1215657', '914c0eee11', '5', '9889', '33');
INSERT INTO `goods_list` VALUES ('552', '6943682', '3e1fd2659e', '5', '2932', '4');
INSERT INTO `goods_list` VALUES ('553', '3215097', '537cf581a2', '5', '4699', '89');
INSERT INTO `goods_list` VALUES ('554', '340005', '70528b3659', '5', '4172', '57');
INSERT INTO `goods_list` VALUES ('555', '6198899', '96892ea585', '5', '235', '99');
INSERT INTO `goods_list` VALUES ('556', '8682166', '469bea66c7', '5', '2843', '29');
INSERT INTO `goods_list` VALUES ('557', '5872544', 'ecf0e7233f', '5', '5994', '78');
INSERT INTO `goods_list` VALUES ('558', '1027227', '1913e13a2c', '5', '5574', '27');
INSERT INTO `goods_list` VALUES ('559', '6662928', '148631c776', '5', '6429', '63');
INSERT INTO `goods_list` VALUES ('560', '2179345', 'ef16a8900a', '5', '3549', '17');
INSERT INTO `goods_list` VALUES ('561', '7818172', 'b1bf361c13', '5', '6604', '10');
INSERT INTO `goods_list` VALUES ('562', '5106385', '0539397dd7', '5', '7588', '2');
INSERT INTO `goods_list` VALUES ('563', '8218257', '3d10cc4eca', '5', '7853', '78');
INSERT INTO `goods_list` VALUES ('564', '5245334', '5fad19771f', '5', '8983', '61');
INSERT INTO `goods_list` VALUES ('565', '3470833', '8240a87660', '5', '5098', '82');
INSERT INTO `goods_list` VALUES ('566', '5623852', 'c5aba56498', '5', '972', '42');
INSERT INTO `goods_list` VALUES ('567', '7844020', 'a29038b60c', '5', '293', '12');
INSERT INTO `goods_list` VALUES ('568', '4967318', '6ccde34490', '5', '1744', '47');
INSERT INTO `goods_list` VALUES ('569', '8424601', 'e000aea245', '5', '4374', '81');
INSERT INTO `goods_list` VALUES ('570', '7285572', '297410ef3a', '5', '9059', '87');
INSERT INTO `goods_list` VALUES ('571', '6558946', '782419f8a6', '5', '3085', '58');
INSERT INTO `goods_list` VALUES ('572', '9587286', '7efa473837', '5', '4392', '1');
INSERT INTO `goods_list` VALUES ('573', '7164769', '38ccbfee5a', '5', '6602', '62');
INSERT INTO `goods_list` VALUES ('574', '945833', '6661bf01db', '5', '8557', '39');
INSERT INTO `goods_list` VALUES ('575', '4074482', '1161d3b699', '5', '400', '64');
INSERT INTO `goods_list` VALUES ('576', '935167', '6ff98e6617', '5', '4166', '46');
INSERT INTO `goods_list` VALUES ('577', '729381', '2656feb620', '5', '6368', '27');
INSERT INTO `goods_list` VALUES ('578', '4429229', 'e4ca9de70c', '5', '6843', '21');
INSERT INTO `goods_list` VALUES ('579', '145812', '59b49336de', '5', '1187', '30');
INSERT INTO `goods_list` VALUES ('580', '1246066', '2c86613d8a', '5', '2990', '29');
INSERT INTO `goods_list` VALUES ('581', '5590041', '847218248d', '5', '9303', '89');
INSERT INTO `goods_list` VALUES ('582', '6452979', '189cbd1e82', '5', '8877', '74');
INSERT INTO `goods_list` VALUES ('583', '578618', '54c02c79d5', '5', '1104', '38');
INSERT INTO `goods_list` VALUES ('584', '5774596', '3fa7b3e2d6', '5', '9778', '66');
INSERT INTO `goods_list` VALUES ('585', '3818575', 'e55cdac5b0', '5', '4547', '51');
INSERT INTO `goods_list` VALUES ('586', '2029172', '9342c78599', '5', '7630', '39');
INSERT INTO `goods_list` VALUES ('587', '6701665', '49ecb234d2', '5', '8664', '81');
INSERT INTO `goods_list` VALUES ('588', '4308462', '431c441909', '5', '3881', '73');
INSERT INTO `goods_list` VALUES ('589', '4967652', 'a29262be3f', '5', '9454', '87');
INSERT INTO `goods_list` VALUES ('590', '4919492', 'f50a35517e', '5', '8383', '60');
INSERT INTO `goods_list` VALUES ('591', '5006071', 'c4e5d75a54', '5', '9666', '75');
INSERT INTO `goods_list` VALUES ('592', '8603864', '13716a3d6c', '5', '6477', '10');
INSERT INTO `goods_list` VALUES ('593', '5633817', 'ae46dc08cb', '5', '8747', '83');
INSERT INTO `goods_list` VALUES ('594', '5486541', '3963ac1618', '5', '5522', '4');
INSERT INTO `goods_list` VALUES ('595', '5544440', '92760090b0', '5', '5644', '89');
INSERT INTO `goods_list` VALUES ('596', '7333408', '908a5cd75a', '5', '8540', '24');
INSERT INTO `goods_list` VALUES ('597', '6259722', 'ea07856f06', '5', '2075', '79');
INSERT INTO `goods_list` VALUES ('598', '3078747', '2f072fb883', '5', '9825', '37');
INSERT INTO `goods_list` VALUES ('599', '8972912', '6695317ead', '5', '2057', '89');
INSERT INTO `goods_list` VALUES ('600', '8330706', 'dabc3a3fb4', '5', '9769', '40');
INSERT INTO `goods_list` VALUES ('601', '626518', '31365ad3e3', '5', '3987', '64');
INSERT INTO `goods_list` VALUES ('602', '108488', '75ea0169c0', '5', '6181', '70');
INSERT INTO `goods_list` VALUES ('603', '6463361', '4356b9f3d9', '5', '7175', '19');
INSERT INTO `goods_list` VALUES ('604', '8145460', '3a2455548c', '5', '193', '62');
INSERT INTO `goods_list` VALUES ('605', '360981', '2f1acb4aef', '5', '5120', '59');
INSERT INTO `goods_list` VALUES ('606', '4034299', '3b5a4db12b', '5', '570', '52');
INSERT INTO `goods_list` VALUES ('607', '4525133', '35adb895d3', '5', '846', '36');
INSERT INTO `goods_list` VALUES ('608', '5342528', 'd4f20a340d', '5', '3897', '15');
INSERT INTO `goods_list` VALUES ('609', '5951495', '99cd8ca53e', '5', '8010', '45');
INSERT INTO `goods_list` VALUES ('610', '8618304', '99ae683d8c', '5', '1662', '98');
INSERT INTO `goods_list` VALUES ('611', '4007414', 'fb187f1efd', '5', '1186', '40');
INSERT INTO `goods_list` VALUES ('612', '6460544', '72c9900e53', '5', '2080', '95');
INSERT INTO `goods_list` VALUES ('613', '1366246', '73a92e8fe5', '5', '7243', '14');
INSERT INTO `goods_list` VALUES ('614', '5318341', '2475d8835b', '5', '5863', '22');
INSERT INTO `goods_list` VALUES ('615', '3525393', '4a953cf28a', '5', '4219', '82');
INSERT INTO `goods_list` VALUES ('616', '8424230', 'ffaf3484e5', '5', '2093', '80');
INSERT INTO `goods_list` VALUES ('617', '3954254', '9f9c2b0ed4', '5', '6291', '46');
INSERT INTO `goods_list` VALUES ('618', '3946549', 'd7e0ba9a60', '5', '8363', '37');
INSERT INTO `goods_list` VALUES ('619', '3371968', '1a82ea5627', '5', '8803', '67');
INSERT INTO `goods_list` VALUES ('620', '6914879', '439d7813fb', '5', '2153', '70');
INSERT INTO `goods_list` VALUES ('621', '8674452', '8b0b7dd55b', '5', '5437', '3');
INSERT INTO `goods_list` VALUES ('622', '5232168', '0a0e528c35', '5', '479', '67');
INSERT INTO `goods_list` VALUES ('623', '2003225', '7a0e48e415', '5', '3754', '89');
INSERT INTO `goods_list` VALUES ('624', '3300679', '3d9a630ccd', '5', '8925', '53');
INSERT INTO `goods_list` VALUES ('625', '9871781', '858be8ee9e', '5', '7237', '61');
INSERT INTO `goods_list` VALUES ('626', '8666247', 'ea5532aac3', '5', '9521', '23');
INSERT INTO `goods_list` VALUES ('627', '2908617', '2a82730af9', '5', '9572', '49');
INSERT INTO `goods_list` VALUES ('628', '5689599', '225afaec02', '5', '1955', '84');
INSERT INTO `goods_list` VALUES ('629', '5934719', '07873a7e11', '5', '5167', '21');
INSERT INTO `goods_list` VALUES ('630', '4751416', '6946aa0a29', '5', '3778', '61');
INSERT INTO `goods_list` VALUES ('631', '9023669', 'c38546fb98', '5', '7446', '65');
INSERT INTO `goods_list` VALUES ('632', '254192', 'bd00b86d77', '5', '7819', '39');
INSERT INTO `goods_list` VALUES ('633', '6270578', '885892910b', '5', '8771', '53');
INSERT INTO `goods_list` VALUES ('634', '218873', '2927ac6408', '5', '5217', '6');
INSERT INTO `goods_list` VALUES ('635', '7156666', 'a8d3268b1a', '5', '9022', '28');
INSERT INTO `goods_list` VALUES ('636', '7008094', '3ee33b7944', '5', '1956', '100');
INSERT INTO `goods_list` VALUES ('637', '4086450', 'a47d6225c7', '5', '41', '88');
INSERT INTO `goods_list` VALUES ('638', '3996884', 'e27d484257', '5', '5574', '73');
INSERT INTO `goods_list` VALUES ('639', '9928890', '656a7acd33', '5', '8485', '95');
INSERT INTO `goods_list` VALUES ('640', '1862055', '8f1713e6ac', '5', '9011', '23');
INSERT INTO `goods_list` VALUES ('641', '4444851', 'aba1eb3dcb', '5', '3356', '8');
INSERT INTO `goods_list` VALUES ('642', '3757703', '248ad72a04', '5', '1194', '65');
INSERT INTO `goods_list` VALUES ('643', '8859402', 'd6fdb234c4', '5', '7586', '34');
INSERT INTO `goods_list` VALUES ('644', '4401332', '31c3d31fed', '5', '5350', '16');
INSERT INTO `goods_list` VALUES ('645', '2045482', '87d77211d5', '5', '711', '74');
INSERT INTO `goods_list` VALUES ('646', '5092594', '49d45ee35a', '5', '364', '24');
INSERT INTO `goods_list` VALUES ('647', '1076012', '00a7bd711d', '5', '7171', '16');
INSERT INTO `goods_list` VALUES ('648', '6571986', 'cf6d15ba9f', '5', '325', '76');
INSERT INTO `goods_list` VALUES ('649', '7034573', '1983fa19ad', '5', '728', '65');
INSERT INTO `goods_list` VALUES ('650', '527869', '8bf615cb2a', '5', '3474', '83');
INSERT INTO `goods_list` VALUES ('651', '1258564', '15f1a49263', '5', '2645', '94');
INSERT INTO `goods_list` VALUES ('652', '8930162', '4dbc01c4f1', '5', '5867', '97');
INSERT INTO `goods_list` VALUES ('653', '1102238', '88e4f382ff', '5', '8139', '18');
INSERT INTO `goods_list` VALUES ('654', '4724425', 'c574712d0e', '5', '6511', '81');
INSERT INTO `goods_list` VALUES ('655', '1196840', 'ebed901e79', '5', '4137', '60');
INSERT INTO `goods_list` VALUES ('656', '7837794', '40232abd7e', '5', '1682', '53');
INSERT INTO `goods_list` VALUES ('657', '1419489', '4487bd622a', '5', '1832', '55');
INSERT INTO `goods_list` VALUES ('658', '2023682', 'f96f9acf4b', '5', '1966', '90');
INSERT INTO `goods_list` VALUES ('659', '9144326', '4803de6695', '5', '6047', '41');
INSERT INTO `goods_list` VALUES ('660', '2585846', '5c0a391002', '5', '4712', '21');
INSERT INTO `goods_list` VALUES ('661', '6254882', 'd3720c8a53', '5', '6435', '71');
INSERT INTO `goods_list` VALUES ('662', '5971237', 'e44d13369d', '5', '5538', '16');
INSERT INTO `goods_list` VALUES ('663', '1489226', '4fbd2574a5', '5', '8449', '45');
INSERT INTO `goods_list` VALUES ('664', '7134257', '2cbf509f9c', '5', '9507', '10');
INSERT INTO `goods_list` VALUES ('665', '6423104', '21a23fa984', '5', '6477', '49');
INSERT INTO `goods_list` VALUES ('666', '5249967', 'f1cb75847b', '5', '1459', '30');
INSERT INTO `goods_list` VALUES ('667', '467436', '4e4b1ec9a4', '5', '5752', '85');
INSERT INTO `goods_list` VALUES ('668', '5083397', 'fecb8b4c2b', '5', '4815', '40');
INSERT INTO `goods_list` VALUES ('669', '5743093', 'df5a6c5e59', '5', '5780', '91');
INSERT INTO `goods_list` VALUES ('670', '8126085', '5805876b3d', '5', '2379', '18');
INSERT INTO `goods_list` VALUES ('671', '2056737', '91d2a70cd8', '5', '7672', '41');
INSERT INTO `goods_list` VALUES ('672', '7248185', '2436a58c1b', '5', '8672', '11');
INSERT INTO `goods_list` VALUES ('673', '9532006', 'cd4e9f2f88', '5', '3061', '23');
INSERT INTO `goods_list` VALUES ('674', '2375443', '3fae38ccaf', '5', '7582', '31');
INSERT INTO `goods_list` VALUES ('675', '2684409', '24ee7ee628', '5', '2763', '13');
INSERT INTO `goods_list` VALUES ('676', '8341501', '01e67b355f', '5', '3620', '49');
INSERT INTO `goods_list` VALUES ('677', '3698189', '3832519c23', '5', '7690', '72');
INSERT INTO `goods_list` VALUES ('678', '2817223', 'fc5adf3375', '5', '4322', '39');
INSERT INTO `goods_list` VALUES ('679', '6754447', 'cf981539fa', '5', '9441', '14');
INSERT INTO `goods_list` VALUES ('680', '8580538', 'f138e11e00', '5', '8065', '40');
INSERT INTO `goods_list` VALUES ('681', '6014616', 'c537ff09e3', '5', '1691', '46');
INSERT INTO `goods_list` VALUES ('682', '7989874', '60a3f27c5b', '5', '6592', '46');
INSERT INTO `goods_list` VALUES ('683', '3343141', '7d23477f07', '5', '4190', '24');
INSERT INTO `goods_list` VALUES ('684', '9517550', '0798a0dc70', '5', '3125', '46');
INSERT INTO `goods_list` VALUES ('685', '3725743', '9fa66f8582', '5', '2660', '90');
INSERT INTO `goods_list` VALUES ('686', '7008326', 'cfbbfe450a', '5', '9218', '19');
INSERT INTO `goods_list` VALUES ('687', '2071079', '543e2b853a', '5', '6387', '84');
INSERT INTO `goods_list` VALUES ('688', '2705743', '98b1b86755', '5', '3930', '44');
INSERT INTO `goods_list` VALUES ('689', '312506', 'baa96539ab', '5', '570', '79');
INSERT INTO `goods_list` VALUES ('690', '8024434', 'a269569769', '5', '7331', '78');
INSERT INTO `goods_list` VALUES ('691', '7068146', '56cda390d1', '5', '8316', '59');
INSERT INTO `goods_list` VALUES ('692', '4395094', 'e713bfe2a1', '5', '8661', '2');
INSERT INTO `goods_list` VALUES ('693', '4997584', 'aa0896fbaf', '5', '7008', '18');
INSERT INTO `goods_list` VALUES ('694', '8169022', '0474890661', '5', '2142', '47');
INSERT INTO `goods_list` VALUES ('695', '7170613', '28144bb28f', '5', '6967', '97');
INSERT INTO `goods_list` VALUES ('696', '7829838', '378f238bbc', '5', '6068', '6');
INSERT INTO `goods_list` VALUES ('697', '4815094', 'f9179c9ed6', '5', '6879', '76');
INSERT INTO `goods_list` VALUES ('698', '7360684', '7aa5e0c960', '5', '7944', '77');
INSERT INTO `goods_list` VALUES ('699', '4692359', '0e27a7ae1d', '5', '7658', '72');
INSERT INTO `goods_list` VALUES ('700', '3263775', '5429cb665c', '5', '3093', '17');
INSERT INTO `goods_list` VALUES ('701', '9393802', '912b84e530', '5', '645', '79');
INSERT INTO `goods_list` VALUES ('702', '7708791', 'dcd14b60ca', '5', '663', '90');
INSERT INTO `goods_list` VALUES ('703', '3217685', '6c8b170753', '5', '5169', '90');
INSERT INTO `goods_list` VALUES ('704', '9253872', '6ed66d8296', '5', '9302', '83');
INSERT INTO `goods_list` VALUES ('705', '3446117', '50601fca70', '5', '1762', '15');
INSERT INTO `goods_list` VALUES ('706', '2454760', 'fc71da741c', '5', '786', '10');
INSERT INTO `goods_list` VALUES ('707', '2847259', 'eae30675ec', '5', '7021', '18');
INSERT INTO `goods_list` VALUES ('708', '7774404', 'd4b03834c1', '5', '4524', '19');
INSERT INTO `goods_list` VALUES ('709', '5992990', 'b27f740606', '5', '3148', '31');
INSERT INTO `goods_list` VALUES ('710', '5869059', '8b24ee175a', '5', '3183', '54');
INSERT INTO `goods_list` VALUES ('711', '7655271', 'fcef0009c7', '5', '6803', '82');
INSERT INTO `goods_list` VALUES ('712', '364598', 'c793b90803', '5', '5698', '64');
INSERT INTO `goods_list` VALUES ('713', '4980221', '81b626affe', '5', '3342', '97');
INSERT INTO `goods_list` VALUES ('714', '8683432', 'be1ab52527', '5', '4904', '19');
INSERT INTO `goods_list` VALUES ('715', '5019815', '6cd17fdc5e', '5', '1243', '84');
INSERT INTO `goods_list` VALUES ('716', '8438706', '5dedb8d408', '5', '9148', '51');
INSERT INTO `goods_list` VALUES ('717', '7871379', '9ceedfc342', '5', '7221', '36');
INSERT INTO `goods_list` VALUES ('718', '6348209', 'ab9093b355', '5', '5631', '53');
INSERT INTO `goods_list` VALUES ('719', '9854028', '7d9b545554', '5', '6548', '31');
INSERT INTO `goods_list` VALUES ('720', '5726910', 'dab548ba86', '5', '9879', '12');
INSERT INTO `goods_list` VALUES ('721', '6154173', '26c207a750', '5', '8020', '82');
INSERT INTO `goods_list` VALUES ('722', '7001739', '80cca34b6c', '5', '849', '31');
INSERT INTO `goods_list` VALUES ('723', '3108609', '9b863d412c', '5', '1426', '87');
INSERT INTO `goods_list` VALUES ('724', '9112060', '52dff33d72', '5', '297', '29');
INSERT INTO `goods_list` VALUES ('725', '3639562', 'f1f79bc4b2', '5', '6476', '39');
INSERT INTO `goods_list` VALUES ('726', '293135', 'abba327bee', '5', '7283', '75');
INSERT INTO `goods_list` VALUES ('727', '5740936', '40b58a8497', '5', '3530', '92');
INSERT INTO `goods_list` VALUES ('728', '5397529', '5a2fa5ed25', '5', '785', '57');
INSERT INTO `goods_list` VALUES ('729', '6336906', 'adc08b7288', '5', '3336', '33');
INSERT INTO `goods_list` VALUES ('730', '6359142', '1db3735580', '5', '796', '81');
INSERT INTO `goods_list` VALUES ('731', '7896659', 'e5711c8351', '5', '2870', '84');
INSERT INTO `goods_list` VALUES ('732', '3463902', 'a670075ae0', '5', '9982', '37');
INSERT INTO `goods_list` VALUES ('733', '8489158', '2cbda47efa', '5', '1453', '31');
INSERT INTO `goods_list` VALUES ('734', '1205553', '8c3d797991', '5', '9828', '91');
INSERT INTO `goods_list` VALUES ('735', '5882914', '094487f45b', '5', '3323', '0');
INSERT INTO `goods_list` VALUES ('736', '190043', 'bd1d501388', '5', '3704', '60');
INSERT INTO `goods_list` VALUES ('737', '8668838', 'cb82bb020f', '5', '1370', '4');
INSERT INTO `goods_list` VALUES ('738', '8018386', 'ff60082a1c', '5', '16', '36');
INSERT INTO `goods_list` VALUES ('739', '8130880', 'e8426b4e1f', '5', '4346', '25');
INSERT INTO `goods_list` VALUES ('740', '9402715', '50f7d25b6f', '5', '9534', '90');
INSERT INTO `goods_list` VALUES ('741', '6530257', '66c6e1b4bb', '5', '8265', '46');
INSERT INTO `goods_list` VALUES ('742', '8258440', '5e616fa7e8', '5', '2527', '3');
INSERT INTO `goods_list` VALUES ('743', '3694545', '06073ca9e1', '5', '7450', '41');
INSERT INTO `goods_list` VALUES ('744', '8295402', 'f426da581c', '5', '564', '56');
INSERT INTO `goods_list` VALUES ('745', '6065115', '55d252d3d2', '5', '158', '98');
INSERT INTO `goods_list` VALUES ('746', '8407219', '3795365a86', '5', '8319', '35');
INSERT INTO `goods_list` VALUES ('747', '2402134', 'd8bbff2a01', '5', '767', '90');
INSERT INTO `goods_list` VALUES ('748', '2947228', 'c8302adb21', '5', '9097', '27');

-- ----------------------------
-- Procedure structure for test
-- ----------------------------
DROP PROCEDURE IF EXISTS `test`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test`()
begin
		declare i int;                      #申明变量
		set i = 0;                          #变量赋值
		while i < 200 do                     #结束循环的条件: 当i大于10时跳出while循环
				insert into goods_list (goods_id, goods_name, goods_type, goods_price, goods_stock)
values (rand()*9999999, substring(md5(rand()), 1, 10), 5, rand()*10000, rand()*100);    #往test表添加数据
				set i = i + 1;                  #循环一次,i加一
		end while;                          #结束while循环
		select * from test;                 #查看test表数据
end
;;
DELIMITER ;
