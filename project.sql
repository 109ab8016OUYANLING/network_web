/*
Navicat MySQL Data Transfer

Source Server         : project
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : project

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-06-17 11:06:31
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `No` int(200) NOT NULL AUTO_INCREMENT,
  `ID` varchar(200) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `price` varchar(200) DEFAULT NULL,
  `num` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`No`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO book VALUES ('1', 'wuchi', '../../img/2.png', '天然酵母酒釀麵包', '125', '1');
INSERT INTO book VALUES ('2', 'wuchi', '../../img/1.png', '核風起士堡', '100', '5');
INSERT INTO book VALUES ('3', 'wuchi', '../../img/3.png', '法國蒜香', '100', '1');
INSERT INTO book VALUES ('13', '1', '../../img/4.png', '法國魔杖', '60', '1');
INSERT INTO book VALUES ('14', '1', '../../img/5.png', '加州核桃', '55', '4');
INSERT INTO book VALUES ('16', 'www', '../../img/3.png', '蒜香法國', '45', '13');
INSERT INTO book VALUES ('17', 'www', '../../img/11.png', '法國青醬麵包', '55', '5');
INSERT INTO book VALUES ('19', 'www', '../../img/4.png', '法國魔杖', '60', '1');
INSERT INTO book VALUES ('20', 'www', '../../img/5.png', '加州核桃', '55', '1');
INSERT INTO book VALUES ('21', 'www', '../../img/4.png', '法國魔杖', '60', '1');
INSERT INTO book VALUES ('23', 'www', '../../img/3.png', '蒜香法國', '45', '1');
INSERT INTO book VALUES ('24', 'www', '../../img/3.png', '蒜香法國', '45', '3');
INSERT INTO book VALUES ('25', 'www', '../../img/4.png', '法國魔杖', '60', '4');
INSERT INTO book VALUES ('27', 'www', '../../img/4.png', '法國魔杖', '60', '1');
INSERT INTO book VALUES ('28', 'ann', '../../img/2.png', '天然酵母酒釀麵包', '125', '1');
INSERT INTO book VALUES ('29', 'ann', '../../img/4.png', '法國魔杖', '60', '1');
INSERT INTO book VALUES ('31', 'ann', '../../img/3.png', '蒜香法國', '45', '1');
INSERT INTO book VALUES ('32', 'www', '../../img/4.png', '法國魔杖', '60', '1');
INSERT INTO book VALUES ('33', 'www', '../../img/3.png', '蒜香法國', '45', '1');
INSERT INTO book VALUES ('34', 'www', '../../img/11.png', '法國青醬麵包', '55', '1');
INSERT INTO book VALUES ('35', 'ann', '../../img/7.png', '拖鞋麵包', '45', '7');
INSERT INTO book VALUES ('36', 'ann', '../../img/4.png', '法國魔杖', '60', '0');
INSERT INTO book VALUES ('37', 'ann', '../../img/5.png', '加州核桃', '55', '3');
INSERT INTO book VALUES ('38', 'ann', '../../img/4.png', '法國魔杖', '60', '5');
INSERT INTO book VALUES ('39', 'ann', '../../img/3.png', '蒜香法國', '45', '1');
INSERT INTO book VALUES ('40', '1', '../../img/3.png', '蒜香法國', '45', '1');
INSERT INTO book VALUES ('41', '1', '../../img/4.png', '法國魔杖', '60', '1');
INSERT INTO book VALUES ('43', 'ann', '../../img/3.png', '蒜香法國', '45', '1');
INSERT INTO book VALUES ('44', '1', '../../img/3.png', '蒜香法國', '45', '1');
INSERT INTO book VALUES ('45', '1', '../../img/4.png', '法國魔杖', '60', '1');
INSERT INTO book VALUES ('47', 'ann', '../../img/3.png', '蒜香法國', '45', '1');
INSERT INTO book VALUES ('48', 'ann', '../../img/4.png', '法國魔杖', '60', '1');
INSERT INTO book VALUES ('49', '1', '../../img/3.png', '蒜香法國', '45', '6');
INSERT INTO book VALUES ('50', '1', '../../img/11.png', '法國青醬麵包', '55', '3');
INSERT INTO book VALUES ('52', '1', '../../img/3.png', '蒜香法國', '45', '1');
INSERT INTO book VALUES ('53', '1', '../../img/4.png', '法國魔杖', '60', '1');
INSERT INTO book VALUES ('55', '1', '../../img/3.png', '蒜香法國', '45', '1');
INSERT INTO book VALUES ('56', '1', '../../img/4.png', '法國魔杖', '60', '1');
INSERT INTO book VALUES ('58', '1', '../../img/4.png', '法國魔杖', '60', '3');
INSERT INTO book VALUES ('59', '1', '../../img/5.png', '加州核桃', '55', '1');
INSERT INTO book VALUES ('61', 'sdf', 'sdf', 'sdf', 'sdf', 'sdf');
INSERT INTO book VALUES ('62', 'sdf', 'sdf', 'sdf', 'sdf', 'sdf');
INSERT INTO book VALUES ('63', 'ann', '../../img/11.png', '法國青醬麵包', '55', '56');
INSERT INTO book VALUES ('64', 'ann', '../../img/3.png', '蒜香法國', '45', '77');
INSERT INTO book VALUES ('65', 'ann', '../../img/4.png', '法國魔杖', '60', '83');
INSERT INTO book VALUES ('66', 'ann', '../../img/5.png', '加州核桃', '55', '64');
INSERT INTO book VALUES ('67', 'ann', '../../img/7.png', '拖鞋麵包', '45', '22');
INSERT INTO book VALUES ('68', 'ann', '../../img/12.png', '蜂蜜果香土耳其', '55', '58');
INSERT INTO book VALUES ('77', 'wuchi', '../../img/2.png', '天然酵母酒釀麵包', '125', '10');
INSERT INTO book VALUES ('78', 'wuchi', '../../img/8.png', '好吃麵包', '99', '14');
INSERT INTO book VALUES ('80', 'www', '../../img/6.png', '黑麥胚芽麵包', '55', '15');
INSERT INTO book VALUES ('81', 'www', '../../img/2.png', '天然酵母酒釀麵包', '125', '10');
INSERT INTO book VALUES ('82', 'www', '../../img/3.png', '蒜香法國', '45', '10');
INSERT INTO book VALUES ('83', 'www', '../../img/3.png', '蒜香法國', '45', '');
INSERT INTO book VALUES ('84', 'www', '../../img/1.png', '和風起司堡', '45', '');
INSERT INTO book VALUES ('85', '888', '../../img/1.png', '和風起司堡', '45', '9');

-- ----------------------------
-- Table structure for `counter`
-- ----------------------------
DROP TABLE IF EXISTS `counter`;
CREATE TABLE `counter` (
  `count` int(11) NOT NULL,
  PRIMARY KEY (`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of counter
-- ----------------------------
INSERT INTO counter VALUES ('28');

-- ----------------------------
-- Table structure for `guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `guestbook`;
CREATE TABLE `guestbook` (
  `no` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `subject` varchar(30) DEFAULT NULL,
  `content` text,
  `putdate` date DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guestbook
-- ----------------------------
INSERT INTO guestbook VALUES ('79', 'wuchi', '黑派胚芽麵包', 'asd', '2017-06-15', '27.246.234.76');
INSERT INTO guestbook VALUES ('80', 'ann', '蒜香法國', '', '2017-06-16', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('81', 'ann', '法國魔杖', '', '2017-06-16', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('82', 'wuchi', '蒜香法國', 'yummy', '2017-06-16', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('83', '1', '蒜香法國', '11', '2017-06-16', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('84', 'ann', '蒜香法國', 'hi', '2017-06-17', '140.135.113.249');
INSERT INTO guestbook VALUES ('85', 'www', '蒜香法國', '好吃嗎', '2017-06-17', '140.135.113.249');
INSERT INTO guestbook VALUES ('86', 'www', '加州核桃', '6666', '2017-06-17', '140.135.113.249');
INSERT INTO guestbook VALUES ('87', 'www', '蒜香法國', '不要家鄉算', '2017-06-17', '140.135.113.249');
INSERT INTO guestbook VALUES ('88', 'ann', '蜂蜜果香土耳其', '00', '2017-06-17', '140.135.113.249');
INSERT INTO guestbook VALUES ('89', 'ann', '蜂蜜果香土耳其', '00', '2017-06-17', '140.135.113.249');
INSERT INTO guestbook VALUES ('90', 'ann', '加州核桃', '00', '2017-06-17', '140.135.113.249');
INSERT INTO guestbook VALUES ('91', 'pipi88', '拖鞋麵包', '好吃><', '2017-06-17', '223.136.77.243');
INSERT INTO guestbook VALUES ('92', 'wuchi', '天然酵母酒釀麵包', '好吃唷', '2017-06-17', '0:0:0:0:0:0:0:1');
INSERT INTO guestbook VALUES ('93', 'www', '天然酵母酒釀麵包', 'wwww', '2017-06-17', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `No` int(200) NOT NULL,
  `ID` varchar(200) NOT NULL,
  `pwd` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `birth` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `e_mail` varchar(200) NOT NULL,
  `tel` varchar(20) NOT NULL,
  PRIMARY KEY (`No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO member VALUES ('1', 'wuchi', 'wuchi', 'wuchi', '男', '2017-06-06', 'sdf', 'dfsom', '0912345678');
INSERT INTO member VALUES ('2', '4qewr', 'qwer', '4', '4', '2017-06-14', '4', '4', '4');
INSERT INTO member VALUES ('3', '7', '7', '7', '7', '2017-06-06', '7', '7', '7');
INSERT INTO member VALUES ('4', 'qwfgh', 'qw', 'd', '男', '2017-01-01', 'qw', 'qw', 'qw');
INSERT INTO member VALUES ('5', 'qtwertrewt', 'qwfhgfgh', 'd', '男', '2017-01-01', 'qw', 'qw', 'qw');
INSERT INTO member VALUES ('6', 'dytyrtrt', 'qwfhgfgh', 'd', '男', '2017-01-01', 'qw', 'qw', 'qw');
INSERT INTO member VALUES ('7', 'ytoiuygf', 'qwfhgfgh', 'd', '男', '2017-01-01', 'qw', 'qw', 'qw');
INSERT INTO member VALUES ('8', 'dfgdcrert', 'qwfhgfgh', 'd', '男', '2017-01-01', 'qw', 'qw', 'qw');
INSERT INTO member VALUES ('9', 'wetdfgcytrty', 'qwfhgfgh', 'd', '男', '2017-01-01', 'qw', 'qw', 'qw');
INSERT INTO member VALUES ('10', 'wertfgdfgr', 'qwfhgfgh', 'd', '男', '2017-01-01', 'adsfadsf', 'qw', 'qw');
INSERT INTO member VALUES ('11', 'wqexaqwd', 'asdsad', 'sad', '男', '2017-01-01', 'qwd', 'asd@asasdsad', 'ghgf');
INSERT INTO member VALUES ('12', '1', '123', 'Ms.R', '女', '2017-01-01', 'asddd', 's@s', 'ddddd');
INSERT INTO member VALUES ('13', 'yasuogod666', '12321', '肥狗熊', '男', '2017-01-01', '高雄市她媽區', 'dsadsadas@dfa', 'sadsad');
INSERT INTO member VALUES ('14', '545', '53453', '秋遠全', '男', '2017-01-01', '453453', 'ff@fff', '45656');
INSERT INTO member VALUES ('15', 'ann', 'ann', 'ann', '男', '2017-01-01', 'ann', 'ann@ann', 'ann');
INSERT INTO member VALUES ('16', 'wwww', 'wwww', 'wwww', '男', '2017-01-01', 'wwww', 'www@www', 'ww');
INSERT INTO member VALUES ('17', 'asdsa', 'asdasd', 'asd', '男', '2017-01-11', 'asdsad', 'asd@asd', 'asdsad');
INSERT INTO member VALUES ('18', '10444131', '10444131', 'sen77', '男', '2017-01-03', 'asdss', 'a@a', 'a');
INSERT INTO member VALUES ('19', 'www', 'www', 'www', '男', '2017-01-01', 'www', 'w@w', '123');
INSERT INTO member VALUES ('20', '111111', '111111', '嫩', '男', '2017-01-01', '1111', '1@1', '123');
INSERT INTO member VALUES ('21', '888', '999', 'rrr', '女', '2017-01-01', 'aaaa', 'aef@roto.ooo', '777');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `No` int(200) NOT NULL,
  `img` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` varchar(200) NOT NULL,
  `num` varchar(200) NOT NULL,
  `intro` varchar(1000) DEFAULT NULL,
  `YN` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO product VALUES ('1', '../../img/1.png', '和風起司堡', '45', '991', '軟的歐式麵包 渾圓蓬鬆的麵體、包入大量的高達起士塊及核桃， 軟中帶Q的口感，是喜歡軟式歐式麵包的首選， 濃濃的Cheese 香更讓人愛不釋口。  由於內含起士塊，建議您收到後盡快食用完畢， 才能品嚐到新鮮風味。', 'Y');
INSERT INTO product VALUES ('2', '../../img/2.png', '天然酵母酒釀麵包', '125', '630', 'Pasadena 烘焙坊超高人氣的經典暢銷款！ 以優質加州葡萄乾培養的天然酵母菌進行發酵， 再加入紅酒，增加麵糰的濃醇風味， 搭配核桃散發出的甘果清香， 口感層次豐富，讓人回味無窮。', 'Y');
INSERT INTO product VALUES ('3', '../../img/3.png', '蒜香法國', '45', '790', '法國麵包和大蒜奶油醬，絕佳拍檔!! Pasadena 以外層金黃香脆、內部鬆軟可口的法國麵包， 抹上自製的大蒜香草奶油醬下去烘烤， 充滿蒜香以及各式香草香氣，最後灑上匈牙利紅椒粉， 溫和僅帶微微辣味，更添加了鮮麗色澤。', 'Y');
INSERT INTO product VALUES ('4', '../../img/4.png', '法國魔杖', '60', '600', '選用天然酵母魯邦菌，可增加風味、防止老化，散發天然麥香  麵糰新配方，選用Q軟風格的日本麵粉，口感外脆內軟 因烤得較乾，顏色偏深褐，吃起來不會胃酸  世界盃麵包大賽競賽麵包 榮獲歐式麵包 Baguatte 個人特別榮譽獎！ 堪稱法國國民麵包的『法國長條麵包』Baguette， 是巴黎人不可或缺的一款麵包。 拿著裝 Baguette 的牛皮紙袋，在街頭匆匆走過的人群， 是許多經典電影和海明威的小說中， 經常出現、令人熟悉不已的巴黎街景。  在法國，Baguette 有其嚴格的規定； 製作時，唯有恰到好處的手勁， 才能讓麵包組織均勻綿密， 不規則的氣孔粗大完美，表皮更是金黃酥脆， 散發著淡淡的麥香味。  您可以搭配各式抹醬品嚐，也非常適合做成三明治， 切片後加上燻鮭魚風味絕佳。 回烤後單吃，品嘗最純粹的法式麵包原味， 是我們最推薦的吃法！', 'Y');
INSERT INTO product VALUES ('5', '../../img/5.png', '加州核桃', '55', '800', '帕莎蒂娜烘焙坊超人氣商品！ 製造過程中，堅持只採用天然酵母，並加入核桃乾果， 充滿來自大自然的、麵糰的自然香氣，風味獨特，外硬內軟、 吃起來更是彈性十足! 越嚼越香!!', 'Y');
INSERT INTO product VALUES ('6', '../../img/6.png', '黑麥胚芽麵包', '55', '985', '以最健康的黑麥胚芽粉，富含纖維，麵包更結實鬆軟， 製作過程中加入牛奶及奶油，口感濕潤、香氣濃郁； 建議回烤後塗上奶油食用最為搭配。   您可以將它作為餐前麵包，與西餐是絕對完美的搭配； 或依照所需份量輕鬆取用，是早餐或宵夜的輕食新選擇。', 'Y');
INSERT INTO product VALUES ('7', '../../img/7.png', '拖鞋麵包', '45', '1000', '因為外型非常像義大利人穿的拖鞋 義大利拖鞋麵包也稱為Ciabatta (義大利文拖鞋之意)  道地的Ciabatta是由非常濕粘的麵糰做成 需要非常好的揉捏技巧 由於發酵時間長，麵糰中含有大量液體 所以麵包結構鬆散多洞 為了不把麵糰中珍貴的氣泡擠壓出來 發酵過後的麵糰必須小心翼翼地對待   義大利人用【就像對待嬰兒一樣】 很具體的形容Ciabatta麵糰 製作過程的耗時和費工   不需要豐富的內餡及花俏外表 長相樸實卻有著越嚼越香的口感 只要搭配橄欖油或陳年酒醋 就能感受到的幸福滋味   若喜歡更豐富的味道 可以選擇蘭姆葡萄、煙燻鮭魚乳酪抹醬 或是羅勒松子醬…更添美味。', 'Y');
INSERT INTO product VALUES ('8', '../../img/9.png', '紅酒莓果蜜釀麵包', '75', '1000', '歐式麵包中加入核桃、浸泡紅酒的葡萄乾與蔓越莓果乾， 拌入100%天然蜂蜜及藍莓果乾、桔子丁， 入口盡是滿滿的果香氣息與自然麥香，交織出完美口感。', 'N');
INSERT INTO product VALUES ('9', '../../img/10.png', '軟法戀奶', '45', '1000', '外皮香酥、內層柔軟略帶嚼勁的軟式法國麵包， 抹上一層奶油煉乳餡，清香奶香與麵包搭配出絕佳口感， 喜愛法式麵包的你絕不能錯過!  **因麵包本體為帶有咬勁的法國麵包.冷藏過後口感更明顯.    建議您食用前，先放置室溫回軟或稍微回烤後口感較佳.       (烤箱以150度 烘烤2-3分鐘)    回烤時間過久煉乳夾餡會有融化的可能.', 'N');
INSERT INTO product VALUES ('10', '../../img/11.png', '法國青醬麵包', '55', '1000', '當法國麵包遇上羅勒松子醬 譜出法國與義大利的美食風味  法國麵包切半後塗上義大利羅勒青醬 並在麵包上放上新鮮洋蔥及乳酪絲 經過烤箱再次加熱 青醬及洋蔥的香氣整個融入麵包中 媽媽咪啊!  這麵包太好吃了!!', 'Y');
INSERT INTO product VALUES ('11', '../../img/12.png', '蜂蜜果香土耳其', '55', '1000', '新鮮酵母和魯邦種攜手發酵出Q潤帶彈性的麵包體， 拌入100%天然蜂蜜， 以及蘭姆酒漬蔓越莓和柑橘果乾， 入口盡是滿滿蜂蜜和果香氣息。', 'Y');
INSERT INTO product VALUES ('12', '../../img/8.png', '好吃麵包', '99', '86', '不好吃!', 'Y');

-- ----------------------------
-- Table structure for `randad`
-- ----------------------------
DROP TABLE IF EXISTS `randad`;
CREATE TABLE `randad` (
  `ADID` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `ad_title` varchar(20) DEFAULT NULL,
  `link` varchar(30) NOT NULL,
  PRIMARY KEY (`ADID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of randad
-- ----------------------------
INSERT INTO randad VALUES ('1', '蒜香法國目前優惠中', 'totalproduce.jsp');
INSERT INTO randad VALUES ('2', '拖鞋麵包目前優惠中', 'totalproduce.jsp');
INSERT INTO randad VALUES ('3', '蜂蜜果香土耳其目前優惠中', 'totalproduce.jsp');

-- ----------------------------
-- Table structure for `shopcar`
-- ----------------------------
DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar` (
  `No` int(200) NOT NULL,
  `ID` varchar(200) NOT NULL,
  `img` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` varchar(200) NOT NULL,
  `num` varchar(200) NOT NULL,
  PRIMARY KEY (`No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcar
-- ----------------------------
INSERT INTO shopcar VALUES ('1', '1', '../../img/1.png', '和風起司堡', '45', '10');
INSERT INTO shopcar VALUES ('2', 'www', '../../img/1.png', '和風起司堡', '45', '1');
