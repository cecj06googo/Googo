USE master
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'GGDB')
DROP DATABASE GGDB
GO

create database GGDB
go

use GGDB
go

--drop table 決定此程式設計順序
--IF EXISTS (SELECT name FROM GGDB.sys.tables WHERE name = N'Ord_item')
--BEGIN
--drop table Ord_item;
--drop table Product;
--drop table Product_Type;
--drop table Product_Kind;
--drop table Question_temp;
--drop table Accessory;
--drop table Ord_temp;
--drop table Answer;
--drop table Orders;
--drop table Ord_status;
--drop table Member;
--drop table Company;
--END

--注意! 
-- CONSTRAINT 合約名稱 FOREIGN KEY (此表格欄位名稱) REFERENCES 對應表格名稱 (對應表格欄位名稱),
-- 合約名稱可亂取，兩個表格只需要有一個合約就好
-- EX : CONSTRAINT Product_com_id_fk FOREIGN KEY (com_id) REFERENCES company (com_id),

--建表格規格
--金額型態使用money
--多型態使用int

--表格建立者請自行加入假資料

Create Table Member(
			mem_id           int NOT NULL IDENTITY(1,1) PRIMARY KEY, 
            mem_account		 varchar(64) UNIQUE NOT NULL, 
            mem_pwd	         varchar(32) NOT NULL, 
            mem_name		 varchar(32) NOT NULL, 
            mem_gender 	     int NOT NULL, 
            mem_bdate 		 Date NOT NULL, 
            mem_idnumber     varchar(32),
			mem_tel		     varchar(15) NOT NULL, 
            mem_phone		 varchar(15) NOT NULL, 
            mem_address      varchar(64) NOT NULL, 
            mem_status       int,
			mem_qq           varchar(32),
 );
			 

insert into Member values ('aaa@abc.com.tw','77ee51fc4289f81e57fb6c0524179318','張君雅',0,'2000-11-17','A223456789','0312345678','0912365478','台中市西屯區河南路二段280號12樓',1,'123');
insert into Member values ('bbb@abc.com.tw','77ee51fc4289f81e57fb6c0524179318','王小明',1,'1992-6-30','A187654321','0287654321','0987654321','台北市大安區羅斯福路二段280號',1,'123');
insert into Member values ('cccccccccc@abc.com.tw','77ee51fc4289f81e57fb6c0524179318','陳阿華',1,'1988-5-17','A158459845','0225556987','0932666888','台北市中正區和平東路一段56號',1,'123');
insert into Member values ('ddd@abc.com.tw','77ee51fc4289f81e57fb6c0524179318','林小美',0,'1975-9-5','A256842951','0233587964','0910258666','台北市大安區復興南路一段390號',1,'123');
insert into Member values ('eee@abc.com.tw','77ee51fc4289f81e57fb6c0524179318','馬小九',1,'1977-12-1','A123666999','0233657777','0910222333','台北市信義區松壽路20號',1,'123');




Create Table Company(
		    com_id         int NOT NULL IDENTITY(1,1) Primary Key ,
			com_account    varchar(64) UNIQUE NOT NULL,
			com_pwd        varchar(32) NOT NULL,
			com_name       varchar(32) NOT NULL,
			com_owner      varchar(32) NOT NULL,
			com_address    varchar(64) NOT NULL,
			com_tel        varchar(15) NOT NULL,
			com_fax        varchar(15) NULL,
			com_vat        varchar(8) UNIQUE NOT NULL,
			com_pic        varbinary(max) NULL,
			com_status      int NOT NULL DEFAULT((0)),
			com_hashURL    varchar(32),
			

);

-- 新增資料 ( 目前10筆假資料 )
INSERT INTO Company VALUES ('kitty123@pchome.com', '236b65a58d0e273b41bbde85ca61cc51', '長榮租車', '林俊宏', '高雄市前鎮區凱旋三路115號', '0788303030', '0756157892', 22843188, NULL, 1, NULL);
INSERT INTO Company VALUES ('snoopy123@pchome.com', 'bf541761fa28953188fafb7b2a0b7e18', '台灣大哥大租車', '孫銘澤', '臺北市士林區忠誠路1段125號2樓', '0275012300', null, 22843574, NULL, 1, NULL);
INSERT INTO Company VALUES ('micky123@pchome.com', '40991c500440e9d31cd471b481def59f', '趴趴夠租車', '丁丁', '宜蘭市校舍路159號1樓', '039381316', '039381316', 39976491, NULL, 1, NULL);
INSERT INTO Company VALUES ('monkey123@pchome.com', '08ce0d43583bf621f2a1baba236e5845', '竹青蜓租車', '林素芬', '桃園縣桃園市中埔二街208號5樓', '25429778', null, 22529771, NULL, 1, NULL);
INSERT INTO Company VALUES ('kelly123@pchome.com', '21f3f30bed9e4b37c7c4e7daf3251fb1', '冠亞租車', '謝志航', '新北市新莊區福壽街99巷11弄4之2號(3樓)', '86610100', null, 22825576, NULL, 1, NULL);
INSERT INTO Company VALUES ('cindy123@pchome.com', '28051cf32e9e10f1ced9a43c55593f31', '全家租車', '裴淳吉', '新北市永和區中正路609巷4號', '23581727', null, 23270841, NULL, 1, NULL);
INSERT INTO Company VALUES ('chilly123@pchome.com', '5b076e507d09d15f1e1e761e77956edc', '商寶國際租車', '李偉娜', '臺北市松山區慶城街23-2號3樓', '0215123456', '0255896123', 23164551, NULL, 1, NULL);
INSERT INTO Company VALUES ('batman123@pchome.com', 'e6fd8eea6946cf20007bcb6d01fee684', '玩美離島租車', '林山良', '臺中市北區健行路779號1樓', '07001234', '0415006879', 22971937, NULL, 1, NULL);
INSERT INTO Company VALUES ('super123@pchome.com', '78e69e7c6a00e34d8947209cc0f6e1b5', '遠信租車', '沈文斌', '臺北市中正區衡陽路51號6樓之4', '022114566', '0287563547', 25053931, NULL, 1, NULL);
INSERT INTO Company VALUES ('joke123@pchome.com', 'f77e0995a48ff48d7d8be57e7398f15b', '非常租車租車', '楊長庚', '新北市土城區中央路2段386號(1樓)', '092156546', null, 29169462, NULL, 1, NULL);
INSERT INTO Company VALUES ('antai123@pchome.com', 'e2b90587f0eefc4302dcfc61f2a794d2', '安泰租車', '李小泰', '臺北市內湖區新湖二路196號1樓', '0200422940', '02004229340', 12144165, NULL, 1, NULL);
INSERT INTO Company VALUES ('antai124@pchome.com', 'dc286fac940d127a39856167c7e796bf', '和運租車中壢門市', '黃國輝', '桃園縣中壢市中園路167號', '034523030', '034523030', 21576206, NULL, 1, NULL);
INSERT INTO Company VALUES ('antai125@pchome.com', '3e8b50b00d060ec11ba172cb92f123e9', '艾維士租車台北門市', '蕭世煌', '臺北市承德路三段276號', '0225995036', '0225995036', 28937839,NULL, 1, NULL);
INSERT INTO Company VALUES ('antai126@pchome.com', '4d205432c03e8d205cb355c9de1c6d7d', '和運租車桃園高鐵門市', '黃國輝', '桃園縣中壢市青埔里高鐵北路1段6號', '034523031', '0345230301', 31408952, NULL, 1, NULL);
INSERT INTO Company VALUES ('antai127@pchome.com', '283e11ac3cf66e052b2d92bb033b67b6', '艾維士租車高雄門市', '蕭世煌', '高雄市左營區菜公里重信路623號', '02422944', '024229344', 17859977, NULL, 1, NULL);
INSERT INTO Company VALUES ('antai128@pchome.com', '7b3aed8c6365e6d78ba146bc1de59cb8', '只有機車租車', '李小泰5', '臺北市內湖區新湖二路201號1樓', '02422945', '024229345', 12144170, NULL, 1, NULL);
INSERT INTO Company VALUES ('antai129@pchome.com', 'b000355537f24698975682ce870a53fd', '只有汽車租車', '李小泰6', '臺北市內湖區新湖二路202號1樓', '02422946', '024229346', 12144171, NULL, 1, NULL);
INSERT INTO Company VALUES ('eee@abc.com.tw', '77ee51fc4289f81e57fb6c0524179318', '直航租車', '林麗純', '宜蘭縣羅東鎮勝利街20號1樓', '076250808', '076250808', 02968701, NULL, 1, NULL);
INSERT INTO Company VALUES ('antai130@pchome.com', '77ee51fc4289f81e57fb6c0524179318', '金城租車行', '魏淑芬', '宜蘭縣羅東鎮大新里站前北路1號', '039533306', '039533306', 02424454, NULL, 1, NULL);
INSERT INTO Company VALUES ('antai131@pchome.com', '77ee51fc4289f81e57fb6c0524179318', '達伯聯合租車', '謝俊哲', '宜蘭縣羅東鎮大新里公正路30號1樓', '039550513', '039550513', 10043128, NULL, 1, NULL);
INSERT INTO Company VALUES ('antai132@pchome.com', '77ee51fc4289f81e57fb6c0524179318', '趴趴夠租車', '席博芷', '屏東縣恆春鎮墾丁路596號', '08861321', '08862047', 10043130, NULL, 1, NULL);
GO

Create Table Product_Type(
            prodtype_id int   NOT NULL Primary Key,
			prodtype_name varchar(32) NOT NULL,
); 
insert into Product_Type values (1,'汽車');
insert into Product_Type values (2,'機車');
insert into Product_Type values (3,'腳踏車');


Create Table Product_Kind(
		    prodkind_id       int NOT NULL Primary Key ,
			prodkind_name         varchar(32) NOT NULL,
);


insert into Product_Kind values (1,'轎車');
insert into Product_Kind values (2,'休旅車');
insert into Product_Kind values (3,'大型重型機車');
insert into Product_Kind values (4,'普通重型機車');
insert into Product_Kind values (5,'普通輕型機車');
insert into Product_Kind values (6,'越野腳踏車');
insert into Product_Kind values (7,'摺疊腳踏車');
insert into Product_Kind values (8,'電動腳踏車');
insert into Product_Kind values (9,'一般腳踏車');

Create Table Product(
		    prod_id         int NOT NULL IDENTITY(1,1) Primary Key ,
			com_id          int NOT NULL,
			prod_name       varchar(32) NOT NULL,
			prod_type       int NOT NULL ,
			prod_price      money  NOT NULL,
			prod_disc       money NOT NULL,
			prod_pic        varbinary(max)  NOT NULL,
			prod_article    varchar(max) NOT NULL,
			prod_subPic1    varbinary(max),
			prod_subPic2    varbinary(max),
			prod_subPic3    varbinary(max),
			prod_kind       int NOT NULL,
			prod_cc         int,
			prod_carrier    int,
			prod_control    int,
			prod_plate		varchar(32) UNIQUE NOT NULL,
			prod_status    int NOT NULL,
			
			CONSTRAINT Product_com_id_fk FOREIGN KEY (com_id) REFERENCES company (com_id),
			CONSTRAINT Product_com_type_fk FOREIGN KEY (prod_type) REFERENCES Product_Type (prodtype_id),
			CONSTRAINT Product_prod_kind_fk FOREIGN KEY (prod_kind) REFERENCES Product_Kind (prodkind_id),
);



                        
insert into Product values (1,'賓士320',1,1000,0.78,0x00,'ss',null,null,null,1,null,null,null,1,1);
insert into Product values (1,'福特123',1,2000,0.85,0x00,'ss',null,null,null,1,null,null,null,2,1);
insert into Product values (1,'汽車1',1,3000,0.85,0x00,'ss',null,null,null,1,null,null,null,3,1);
insert into Product values (1,'汽車2',1,4000,0.45,0x00,'ss',null,null,null,1,null,null,null,4,1);
insert into Product values (1,'一樣汽車名稱',1,4000,0.45,0x00,'ss',null,null,null,1,null,null,null,55,1);
insert into Product values (1,'一樣汽車名稱',1,4000,0.45,0x00,'ss',null,null,null,1,null,null,null,56,1);
insert into Product values (2,'野狼125',2,3000,0.93,0x00,'ss',null,null,null,1,null,null,null,5,1);
insert into Product values (2,'競戰150',2,4000,0.77,0x00,'ss',null,null,null,1,null,null,null,6,1);
insert into Product values (4,'法拉利211',1,5000,0.67,0x00,'ss',null,null,null,1,null,null,null,7,1);
insert into Product values (4,'保時捷-T1',1,6000,0.89,0x00,'ss',null,null,null,1,null,null,null,8,1);
insert into Product values (4,'Fighter150',2,7000,0.95,0x00,'ss',null,null,null,1,null,null,null,9,1);
insert into Product values (4,'法拉利211',1,5000,0.67,0x00,'ss',null,null,null,1,null,null,null,10,1);
insert into Product values (4,'保時捷-T1',1,6000,0.89,0x00,'ss',null,null,null,1,null,null,null,11,1);
insert into Product values (4,'Fighter150',2,7000,0.95,0x00,'ss',null,null,null,1,null,null,null,12,1);
insert into Product values (5,'法拉利211',1,5000,0.67,0x00,'ss',null,null,null,1,null,null,null,13,1);
insert into Product values (5,'保時捷-T1',1,6000,0.89,0x00,'ss',null,null,null,1,null,null,null,14,1);
insert into Product values (5,'Fighter150',2,7000,0.95,0x00,'ss',null,null,null,1,null,null,null,15,1);
insert into Product values (6,'法拉利211',1,5000,0.67,0x00,'ss',null,null,null,1,null,null,null,16,1);
insert into Product values (6,'保時捷-T1',1,6000,0.89,0x00,'ss',null,null,null,1,null,null,null,17,1);
insert into Product values (6,'Fighter150',2,7000,0.95,0x00,'ss',null,null,null,1,null,null,null,18,1);
insert into Product values (7,'法拉利211',1,5000,0.67,0x00,'ss',null,null,null,1,null,null,null,19,1);
insert into Product values (7,'保時捷-T1',1,6000,0.89,0x00,'ss',null,null,null,1,null,null,null,20,1);
insert into Product values (7,'Fighter150',2,7000,0.95,0x00,'ss',null,null,null,1,null,null,null,21,1);
insert into Product values (8,'法拉利211',1,5000,0.67,0x00,'ss',null,null,null,1,null,null,null,22,1);
insert into Product values (8,'保時捷-T1',1,6000,0.89,0x00,'ss',null,null,null,1,null,null,null,23,1);
insert into Product values (8,'Fighter150',2,7000,0.95,0x00,'ss',null,null,null,1,null,null,null,24,1);
insert into Product values (9,'法拉利211',1,5000,0.67,0x00,'ss',null,null,null,1,null,null,null,25,1);
insert into Product values (9,'保時捷-T1',1,6000,0.89,0x00,'ss',null,null,null,1,null,null,null,26,1);
insert into Product values (9,'Fighter150',2,7000,0.95,0x00,'ss',null,null,null,1,null,null,null,27,1);
insert into Product values (10,'法拉利211',1,5000,0.67,0x00,'ss',null,null,null,1,null,null,null,28,1);
insert into Product values (10,'保時捷-T1',1,6000,0.89,0x00,'ss',null,null,null,1,null,null,null,29,1);
insert into Product values (10,'Fighter150',2,7000,0.95,0x00,'ss',null,null,null,1,null,null,null,30,1);
insert into Product values (11,'法拉利211',1,5000,0.67,0x00,'ss',null,null,null,1,null,null,null,31,1);
insert into Product values (11,'保時捷-T1',1,6000,0.89,0x00,'ss',null,null,null,1,null,null,null,32,1);
insert into Product values (11,'Fighter150',2,7000,0.95,0x00,'ss',null,null,null,1,null,null,null,33,1);
insert into Product values (12,'法拉利211',1,5000,0.67,0x00,'ss',null,null,null,1,null,null,null,34,1);
insert into Product values (12,'保時捷-T1',1,6000,0.89,0x00,'ss',null,null,null,1,null,null,null,35,1);
insert into Product values (12,'Fighter150',2,7000,0.95,0x00,'ss',null,null,null,1,null,null,null,36,1);
insert into Product values (13,'法拉利211',1,5000,0.67,0x00,'ss',null,null,null,1,null,null,null,37,1);
insert into Product values (13,'保時捷-T1',1,6000,0.89,0x00,'ss',null,null,null,1,null,null,null,38,1);
insert into Product values (13,'Fighter150',2,7000,0.95,0x00,'ss',null,null,null,1,null,null,null,39,1);
insert into Product values (14,'法拉利211',1,5000,0.67,0x00,'ss',null,null,null,1,null,null,null,40,1);
insert into Product values (14,'保時捷-T1',1,6000,0.89,0x00,'ss',null,null,null,1,null,null,null,41,1);
insert into Product values (14,'Fighter150',2,7000,0.95,0x00,'ss',null,null,null,1,null,null,null,42,1);
insert into Product values (15,'法拉利211',1,5000,0.67,0x00,'ss',null,null,null,1,null,null,null,43,1);
insert into Product values (15,'保時捷-T1',1,6000,0.89,0x00,'ss',null,null,null,1,null,null,null,44,1);
insert into Product values (15,'Fighter150',2,7000,0.95,0x00,'ss',null,null,null,1,null,null,null,45,1);
insert into Product values (16,'Fighter148',2,5000,0.67,0x00,'ss',null,null,null,1,null,null,null,46,1);
insert into Product values (16,'Fighter149',2,6000,0.89,0x00,'ss',null,null,null,1,null,null,null,47,1);
insert into Product values (16,'Fighter150',2,7000,0.95,0x00,'ss',null,null,null,1,null,null,null,48,1);
insert into Product values (17,'法拉利211',1,5000,0.67,0x00,'ss',null,null,null,1,null,null,null,49,1);
insert into Product values (17,'保時捷-T1',1,6000,0.89,0x00,'ss',null,null,null,1,null,null,null,50,1);
insert into Product values (17,'保時捷-T2',1,7000,0.95,0x00,'ss',null,null,null,1,null,null,null,51,1);
insert into Product values (18,'法拉利211',1,5000,0.67,0x00,'ss',null,null,null,1,1600,8,null,52,1);
insert into Product values (18,'保時捷-T1',2,6000,0.89,0x00,'ss',null,null,null,1,250,2,null,53,1);
insert into Product values (18,'保時捷-T2',3,7000,0.95,0x00,'ss',null,null,null,1,10,1,null,54,1);
insert into Product values (3,'Benz-E-320',1,3500,0.95,0x00,'1997年出廠絕版經典好車，內裝質感優，空間舒適大方。歐洲底盤操控一流，動力輸出流暢，是喜愛賓士車的好選擇。',null,null,null,1,3199,4,2,'AF-9876',1);
insert into Product values (3,'Benz-E-320',1,3500,0.95,0x00,'1997年出廠絕版經典好車，內裝質感優，空間舒適大方。歐洲底盤操控一流，動力輸出流暢，是喜愛賓士車的好選擇。',null,null,null,1,3199,4,2,'HL-6666',1);
insert into Product values (3,'Benz-E-320',1,3500,0.95,0x00,'1997年出廠絕版經典好車，內裝質感優，空間舒適大方。歐洲底盤操控一流，動力輸出流暢，是喜愛賓士車的好選擇。',null,null,null,1,3199,4,2,'QQ-1983',1);
insert into Product values (3,'Ferrari-458',1,8000,0.95,0x00,'結合多種頂級鋁合金材質與優異焊接技術，開發全新鋁合金高剛性底盤，造形顛覆瞭過去法拉利跑車給人的既有印象，充滿瞭未來感。',null,null,null,1,4497,2,2,'FS-9999',1);
insert into Product values (3,'Ferrari-458',1,8000,0.95,0x00,'結合多種頂級鋁合金材質與優異焊接技術，開發全新鋁合金高剛性底盤，造形顛覆瞭過去法拉利跑車給人的既有印象，充滿瞭未來感。',null,null,null,1,4497,2,2,'RZ-3875',1);
insert into Product values (3,'Ferrari-458',1,8000,0.95,0x00,'結合多種頂級鋁合金材質與優異焊接技術，開發全新鋁合金高剛性底盤，造形顛覆瞭過去法拉利跑車給人的既有印象，充滿瞭未來感。',null,null,null,1,4497,2,2,'AA-2452',1);
insert into Product values (3,'Mini-Cooper-2014',1,5000,0.95,0x00,'保留了傳統設計元素，轉向力度清晰，路感豐富，懸架支撐性堅韌，最大限度的平衡了傳統與需求，兼顧舒適與樂趣。',null,null,null,1,1071,4,null,'MS-8789',1);
insert into Product values (3,'Mini-Cooper-2014',1,5000,0.95,0x00,'保留了傳統設計元素，轉向力度清晰，路感豐富，懸架支撐性堅韌，最大限度的平衡了傳統與需求，兼顧舒適與樂趣。',null,null,null,1,1071,4,null,'AO-3765',1);
insert into Product values (3,'Mini-Cooper-2014',1,5000,0.95,0x00,'保留了傳統設計元素，轉向力度清晰，路感豐富，懸架支撐性堅韌，最大限度的平衡了傳統與需求，兼顧舒適與樂趣。',null,null,null,1,1071,4,null,'XO-6675',1);
insert into Product values (3,'馬自達-3',1,3000,0.95,0x00,'動力採用MZR直列四缸引擎，有五速手排與四速自排兩種變速系統，前輪採麥花臣懸吊，後輪則採福特設計的E-link多連桿式懸吊系統。',null,null,null,1,1088,4,null,'AX-4892',1);
insert into Product values (3,'馬自達-3',1,3000,0.95,0x00,'動力採用MZR直列四缸引擎，有五速手排與四速自排兩種變速系統，前輪採麥花臣懸吊，後輪則採福特設計的E-link多連桿式懸吊系統。',null,null,null,1,1088,4,null,'XG-3794',1);
insert into Product values (3,'馬自達-3',1,3000,0.95,0x00,'動力採用MZR直列四缸引擎，有五速手排與四速自排兩種變速系統，前輪採麥花臣懸吊，後輪則採福特設計的E-link多連桿式懸吊系統。',null,null,null,1,1088,4,null,'HJ-9378',1);
insert into Product values (3,'豐田-Yaris',1,2800,0.95,0x00,'Yaris擁有更為時尚動感的外觀設計、超乎想像的寬闊車室及行李廂空間，全新底盤及懸吊系統也帶來了進步的舒適性與操控性。',null,null,null,1,2021,4,null,'KD-8279',1);
insert into Product values (3,'豐田-Yaris',1,2800,0.95,0x00,'Yaris擁有更為時尚動感的外觀設計、超乎想像的寬闊車室及行李廂空間，全新底盤及懸吊系統也帶來了進步的舒適性與操控性。',null,null,null,1,2021,4,null,'WP-7156',1);
insert into Product values (3,'豐田-Yaris',1,2800,0.95,0x00,'Yaris擁有更為時尚動感的外觀設計、超乎想像的寬闊車室及行李廂空間，全新底盤及懸吊系統也帶來了進步的舒適性與操控性。',null,null,null,1,2021,4,null,'IS-2781',1);
insert into Product values (3,'保時捷-911',1,6000,0.95,0x00,'保時捷911是國際二十世紀最有影響力的汽車排行榜中的第五名，因其獨特的風格與極佳的耐用性享譽國際。',null,null,null,1,3290,4,null,'WI-2749',1);
insert into Product values (3,'保時捷-911',1,6000,0.95,0x00,'保時捷911是國際二十世紀最有影響力的汽車排行榜中的第五名，因其獨特的風格與極佳的耐用性享譽國際。',null,null,null,1,3290,4,null,'EU-1035',1);
insert into Product values (3,'保時捷-911',1,6000,0.95,0x00,'保時捷911是國際二十世紀最有影響力的汽車排行榜中的第五名，因其獨特的風格與極佳的耐用性享譽國際。',null,null,null,1,3290,4,null,'KE-0273',1);

insert into Product values (3,'野狼125',2,600,0.6,0x00,'經典的鋼絲框輪圈，配備高亮度尾燈，襯托出眾不同的個性，循環五速檔位，加上超大型避震器經典砲，彈圓身金屬質感，展現傳統跑車風情。',null,null,null,4,125,2,null, 'KBG8745',1);
insert into Product values (3,'野狼125',2,600,0.6,0x00,'經典的鋼絲框輪圈，配備高亮度尾燈，襯托出眾不同的個性，循環五速檔位，加上超大型避震器經典砲，彈圓身金屬質感，展現傳統跑車風情。',null,null,null,4,125,2,null, 'CHH4545',1);
insert into Product values (3,'Yamaha-CUXI',2,250,0.65,0x00,'搭載日本原裝元件的次世代 Fi 引擎、YMJET-Fi 系統及 TPS(油門感知器)，不但讓扭力提升12%，也大大提升引擎燃燒速率並獲得更大馬力，同時可自動調整引擎點火角度及噴油量更省油、更環保！',null,null,null,8,null,null,null, 'GBA2553',1);
insert into Product values (3,'Yamaha BWS',2,250,0.65,0x00,'BW`S的引擎搭載有以YAMAHA獨創G.E.N.I.C.H.電子控制技術為基礎開發的高信賴性 F.I系統。可以利用TPS將情報回傳給ECU、由ECU配合油門的開度提供最適的燃料量。所以可以維持靈敏的油門反應的同時,利用稀薄燃燒來達到省油的效果並且利用傳動的最佳化設定使得低～中速域的扭力及馬力得以大幅提昇。',null,null,null,8,null,null,null, 'LPG3364',1);

insert into Product values (3,'捷安特GreatJourney',3,300,0.75,0x00,'運動風格塗裝，全新輕量化鋁合金車架，三段變速附有避震功能，後照明警示燈，附加感光元件，具有自動/手動二種模式，自動模式可在天黑時自動起動警示燈，適合騎車旅行環島。',null,null,null,6,null,null,null, '捷安特GJ1',1);
insert into Product values (3,'捷安特GreatJourney',3,300,0.75,0x00,'運動風格塗裝，全新輕量化鋁合金車架，三段變速附有避震功能，後照明警示燈，附加感光元件，具有自動/手動二種模式，自動模式可在天黑時自動起動警示燈，適合騎車旅行環島。',null,null,null,6,null,null,null, '捷安特GJ2',1);
insert into Product values (3,'捷安特GreatJourney',3,300,0.75,0x00,'運動風格塗裝，全新輕量化鋁合金車架，三段變速附有避震功能，後照明警示燈，附加感光元件，具有自動/手動二種模式，自動模式可在天黑時自動起動警示燈，適合騎車旅行環島。',null,null,null,6,null,null,null, '捷安特GJ3',1);
insert into Product values (3,'捷安特GreatJourney',3,300,0.75,0x00,'運動風格塗裝，全新輕量化鋁合金車架，三段變速附有避震功能，後照明警示燈，附加感光元件，具有自動/手動二種模式，自動模式可在天黑時自動起動警示燈，適合騎車旅行環島。',null,null,null,6,null,null,null, '捷安特GJ4',1);
insert into Product values (3,'MERIDA-FB-106',3,250,0.65,0x00,'造型優美，白色的外觀配上圓弧白色，除非常漂亮，構造樸實簡單，調整非常的容易，簡單輕巧的設計，只要利用一個卡準就可以把車子折起來帶走，十分的方便攜帶!',null,null,null,7,null,null,null, 'ERIDAM1',1);
insert into Product values (3,'Audi電動腳踏車',3,250,0.65,0x00,'不同於傳統笨重的電動腳踏車，以大量CFRP碳纖維複合材料打造而成的Audi e-bike，擁有了輕量而堅固的特點，時速80公里的最高速度，還能夠展現出各式的單車特技。',null,null,null,8,null,null,null, 'Audi1',1);



Create Table Accessory(
            acc_id          int NOT NULL IDENTITY(1,1) Primary Key,
			acc_name        varchar(32) NOT NULL,
			com_id          int NOT NULL ,
			acc_detail      varchar(max) NOT NULL,
			acc_pic         varbinary(max)  NOT NULL,
			acc_price       decimal NOT NULL,
			acc_status      int NOT NULL,

			CONSTRAINT Accessory_com_id_fk FOREIGN KEY (com_id) REFERENCES company (com_id),
);
insert into Accessory values ('高粱酒1',1,'wine', 0x00, 1000, 1);
insert into Accessory values ('高粱酒2',1,'wine', 0x00, 1000, 1);
insert into Accessory values ('高粱酒3',1,'wine', 0x00, 1000, 1);
insert into Accessory values ('高粱酒4',1,'wine', 0x00, 1000, 1);
insert into Accessory values ('高粱酒5',1,'wine', 0x00, 1000, 1);
insert into Accessory values ('啤酒1',2,'wine', 0x00, 1000, 1);
insert into Accessory values ('安全座椅',2,'安全座椅',0x00,2000,1);
insert into Accessory values ('Garmin導航機',2,'Garmin導航機',0x00,700,1);
insert into Accessory values ('野炊卡式爐',2,'野炊卡式爐',0x00,350,1);
insert into Accessory values ('烤肉用具組',2,'烤肉用具組',0x00,300,1);
insert into Accessory values ('冰桶 - 6L',2,'冰桶 - 6L',0x00,100,1);
insert into Accessory values ('冰桶 - 15L',2,'冰桶 - 15L',0x00,200,1);
insert into Accessory values ('地墊',2,'地墊',0x00,800,1);
insert into Accessory values ('營帳 - 2P',2,'營帳 - 2P',0x00,800,1);
insert into Accessory values ('營帳 - 4P',2,'營帳 - 4P',0x00,1200,1);
insert into Accessory values ('睡袋 - 超保暖羽絨',2,'睡袋 - 超保暖羽絨',0x00,600,1);
insert into Accessory values ('睡袋 - 輕合成纖維',2,'睡袋 - 輕合成纖維',0x00,400,1);
insert into Accessory values ('對講機全罩安全帽2頂',3,'對講機全罩安全帽2頂',0x00,300,1);
insert into Accessory values ('清靜農場哞哞午餐卷2張',3,'清靜農場哞哞午餐卷2張',0x00,400,1);
insert into Accessory values ('小人國遊樂園入場卷2張',3,'小人國遊樂園入場卷2張',0x00,600,1);
insert into Accessory values ('尾掛置物箱',3,'尾掛置物箱',0x00,500,1);
insert into Accessory values ('黃色小鴨游泳圈', 3, '黃色小鴨游泳圈', 0x00, 200, 1);
insert into Accessory values ('很普通游泳圈', 3, '很普通游泳圈', 0x00, 100, 1);
insert into Accessory values ('童玩節單日暢遊卷2張', 3, '童玩節單日暢遊卷2張', 0x00, 500, 1);
insert into Accessory values ('童玩節好吃餐卷2張', 3, '童玩節好吃餐卷2張', 0x00, 200, 1);
GO


Create Table Ord_status(
		    ord_status          int NOT NULL IDENTITY(1,1) Primary Key ,
			status_char         varchar(20) NOT NULL
);

insert into Ord_status values ('未處理');
insert into Ord_status values ('已接受');
insert into Ord_status values ('已出車');
insert into Ord_status values ('已完成');
insert into Ord_status values ('會員取消');
insert into Ord_status values ('商家取消');
insert into Ord_status values ('會員逾時');
insert into Ord_status values ('商家逾時');
insert into Ord_status values ('異常未還');
GO

Create Table Orders(
		    ord_id          int NOT NULL IDENTITY(1,1) Primary Key ,
			ord_status      int NOT NULL,
			com_id          int NOT NULL ,
			mem_id          int NOT NULL ,
			ord_time        datetime  NOT NULL,
			ord_getday      datetime  NOT NULL,
			ord_reday       datetime  NOT NULL,
			ord_lastuptime  datetime,
			item_total      int NOT NULL,

			CONSTRAINT Orders_com_id_fk FOREIGN KEY (com_id) REFERENCES company (com_id),
			CONSTRAINT Orders_mem_id_fk FOREIGN KEY (mem_id) REFERENCES Member (mem_id),
			CONSTRAINT Orders_ord_status_fk FOREIGN KEY (ord_status) REFERENCES Ord_status (ord_status),
);


--insert into Orders values (6,3,3,'2014-06-28 13:40:20','2014-07-28 13:20:00','2014-07-31 14:20:00','2014-07-11 20:44:39',3000);
--insert into Orders values (2,3,3,'2014-07-28 13:40:20','2014-08-11 13:20:00','2014-08-13 14:20:00','2014-08-01 00:00:01',3000);
--insert into Orders values (3,3,3,'2014-08-28 13:40:20','2014-09-11 13:20:00','2014-09-13 14:20:00','2014-09-12 00:00:01',3000);
--insert into Orders values (1,3,3,'2014-09-28 13:40:20','2014-10-01 13:20:00','2014-10-05 14:20:00','2014-10-06 00:00:01',3000);
--insert into Orders values (1,3,3,'2014-10-28 13:40:20','2015-01-06 13:20:00','2015-01-08 14:20:00',null,3000);
--6
--insert into Orders values (1,3,3,'2014-10-28 13:40:20','2015-01-06 13:20:00','2015-01-08 14:20:00',null,3000);
--insert into Orders values (2,3,3,'2014-07-28 13:40:20','2014-08-11 13:20:00','2014-08-13 14:20:00','2014-08-01 00:00:01',3000);
--insert into Orders values (3,3,3,'2014-08-28 13:40:20','2014-09-11 13:20:00','2014-09-13 14:20:00','2014-09-12 00:00:01',3000);
--insert into Orders values (1,3,3,'2014-09-28 13:40:20','2014-10-01 13:20:00','2014-10-05 14:20:00','2014-10-06 00:00:01',3000);
--insert into Orders values (1,3,3,'2014-10-28 13:40:20','2015-01-06 13:20:00','2015-01-08 14:20:00',null,3000);
--11
--insert into Orders values (1,3,3,'2014-10-28 13:40:20','2015-01-06 13:20:00','2015-01-08 14:20:00',null,3000);
--insert into Orders values (2,3,3,'2014-07-28 13:40:20','2014-08-11 13:20:00','2014-08-13 14:20:00','2014-08-01 00:00:01',3000);
--insert into Orders values (3,3,3,'2014-08-28 13:40:20','2014-09-11 13:20:00','2014-09-13 14:20:00','2014-09-12 00:00:01',3000);
--insert into Orders values (1,3,3,'2014-09-28 13:40:20','2014-10-01 13:20:00','2014-10-05 14:20:00','2014-10-06 00:00:01',3000);
--insert into Orders values (1,3,3,'2014-10-28 13:40:20','2015-01-06 13:20:00','2015-01-08 14:20:00',null,3000);
--16
--insert into Orders values (1,3,3,'2014-10-28 13:40:20','2015-01-06 13:20:00','2015-01-08 14:20:00',null,3000);
--insert into Orders values (2,3,3,'2014-07-28 13:40:20','2014-08-11 13:20:00','2014-08-13 14:20:00','2014-08-01 00:00:01',3000);
--insert into Orders values (3,3,3,'2014-08-28 13:40:20','2014-09-11 13:20:00','2014-09-13 14:20:00','2014-09-12 00:00:01',3000);
--insert into Orders values (4,3,3,'2014-09-28 13:40:20','2014-10-01 13:20:00','2014-10-05 14:20:00','2014-10-06 00:00:01',3000);
--insert into Orders values (1,3,3,'2014-10-28 13:40:20','2015-01-06 13:20:00','2015-01-08 14:20:00',null,3000);
--21
--insert into Orders values (1,3,3,'2014-10-28 13:40:20','2015-01-06 13:20:00','2015-01-08 14:20:00',null,3000);
--insert into Orders values (2,3,3,'2014-07-28 13:40:20','2014-08-11 13:20:00','2014-08-13 14:20:00','2014-08-01 00:00:01',3000);
--insert into Orders values (3,3,3,'2014-08-28 13:40:20','2014-09-11 13:20:00','2014-09-13 14:20:00','2014-09-12 00:00:01',3000);
--insert into Orders values (4,3,3,'2014-09-28 13:40:20','2014-10-01 13:20:00','2014-10-05 14:20:00','2014-10-06 00:00:01',3000);
--insert into Orders values (1,3,3,'2014-10-28 13:40:20','2015-01-06 13:20:00','2015-01-08 14:20:00',null,3000);
--26
--insert into Orders values (2,3,3,'2014-07-28 13:40:20','2014-08-11 13:20:00','2014-08-13 14:20:00','2014-08-01 00:00:01',4000);
--insert into Orders values (3,3,3,'2014-08-28 13:40:20','2014-09-11 13:20:00','2014-09-13 14:20:00','2014-09-12 00:00:01',5000);
--insert into Orders values (4,3,3,'2014-09-28 13:40:20','2014-10-01 13:20:00','2014-10-05 14:20:00','2014-10-06 00:00:01',6000);
--insert into Orders values (1,3,3,'2014-10-28 13:40:20','2015-01-06 13:20:00','2015-01-08 14:20:00',null,7000);
--insert into Orders values (1,3,3,'2014-10-28 13:40:20','2015-01-06 13:20:00','2015-01-08 14:20:00',null,4000);
--insert into Orders values (2,3,3,'2014-07-28 13:40:20','2014-08-11 13:20:00','2014-08-13 14:20:00','2014-08-01 00:00:01',4000);
--異常未還
insert into Orders values (9,3,3,'2014-11-30 13:23:55','2014-12-08 13:20:00','2014-12-09 16:20:00','2014-12-09 12:00:01',8200);
--
--insert into Orders values (8,3,3,'2014-09-11 13:20:44','2014-09-22 13:20:00','2014-09-25 17:20:00','2014-09-24 13:30:21',6000);
--insert into Orders values (7,3,3,'2014-10-11 13:30:21','2014-01-22 13:20:00','2014-01-23 18:20:00','2014-10-12 13:30:21',7000);
--insert into Orders values (5,3,3,'2014-10-30 13:30:21','2014-01-22 13:20:00','2014-01-23 18:20:00','2014-11-12 22:42:39',7000);
--36
--insert into Orders values (2,3,3,'2015-10-28 13:40:20','2015-12-22 13:20:00','2015-12-25 14:20:00','2000-01-01 00:00:01',3000);
--insert into Orders values (3,3,3,'2015-10-28 13:40:20','2015-12-22 13:20:00','2015-12-25 14:20:00','2000-01-01 00:00:01',3000);
--insert into Orders values (1,3,3,'2014-10-28 13:40:20','2015-12-22 13:20:00','2015-12-25 14:20:00',null,3000);
--insert into Orders values (1,3,3,'2014-11-18 05:40:20','2014-11-19 13:20:00','2014-12-20 14:20:00',null,0);
--insert into Orders values (1,3,3,'2014-10-28 13:40:20','2014-10-30 13:20:00','2014-11-02 14:20:00',null,3000);
--41
--賓士
insert into Orders values (1,3,3,'2014-11-12 10:00:00','2014-12-09 01:20:00','2014-12-09 21:20:00',null,6100);
insert into Orders values (2,3,3,'2014-11-12 10:00:00','2014-12-08 08:20:00','2014-12-08 14:20:00','2014-08-01 00:00:01',5600);
insert into Orders values (3,3,3,'2014-11-12 10:00:00','2014-11-28 08:20:00','2014-11-29 20:20:00','2014-09-12 00:00:01',5000);
insert into Orders values (4,3,3,'2014-11-12 10:00:00','2014-12-06 00:20:00','2014-12-06 15:20:00','2014-10-06 00:00:01',6800);
insert into Orders values (1,3,3,'2014-11-12 10:00:00','2014-12-09 23:20:00','2014-12-10 14:20:00',null,6000);
--法拉利
insert into Orders values (6,3,3,'2014-11-13 11:00:00','2014-12-10 03:20:00','2014-12-10 21:20:00','2014-11-25 10:00:00',7000);
insert into Orders values (2,3,3,'2014-11-25 10:00:00','2014-12-08 10:20:00','2014-12-09 1:20:00','2014-11-25 10:00:00',4500);
insert into Orders values (3,3,3,'2014-11-26 10:00:00','2014-12-01 13:20:00','2014-12-02 13:20:00','2014-11-12 10:00:00',7000);
insert into Orders values (1,3,3,'2014-11-27 09:00:00','2014-12-08 13:20:00','2014-12-09 20:20:00','2014-11-12 10:00:00',3200);
insert into Orders values (1,3,3,'2014-11-28 10:00:00','2014-12-06 20:20:00','2014-12-07 14:20:00',null,10400);
--miniCooper
insert into Orders values (1,3,3,'2014-11-30 14:33:00','2014-12-08 09:20:00','2014-12-08 21:20:00',null,7000);
insert into Orders values (1,3,3,'2014-12-01 16:00:00','2014-12-08 06:20:00','2014-12-10 08:20:00','2014-08-01 00:00:01',5600);
insert into Orders values (3,3,3,'2014-11-12 10:00:00','2014-12-10 20:20:00','2014-12-11 09:20:00','2014-09-12 00:00:01',6600);
insert into Orders values (2,3,3,'2014-11-12 10:00:00','2014-12-10 10:20:00','2014-12-11 15:20:00','2014-10-06 00:00:01',6800);
insert into Orders values (5,3,3,'2014-11-12 10:00:00','2014-12-02 20:20:00','2014-12-03 14:20:00',null,13000);
--野狼125
insert into Orders values (2,3,3,'2014-11-12 10:00:00','2014-12-09 09:20:00','2014-12-10 21:20:00',null,7000);
insert into Orders values (6,3,3,'2014-11-12 10:00:00','2014-12-09 13:20:00','2014-12-10 14:20:00','2014-08-01 00:00:01',5600);
insert into Orders values (7,3,3,'2014-11-12 10:00:00','2014-12-10 08:20:00','2014-12-11 20:20:00','2014-09-12 00:00:01',2600);
insert into Orders values (2,3,3,'2014-11-12 10:00:00','2014-12-11 00:20:00','2014-12-12 15:20:00','2014-10-06 00:00:01',6800);
insert into Orders values (8,3,3,'2014-11-12 10:00:00','2014-11-28 20:20:00','2014-11-29 14:20:00',null,6000);
--捷安特
insert into Orders values (1,3,3,'2014-12-03 19:23:42','2014-12-10 18:20:00','2014-12-11 09:20:00',null,3000);
insert into Orders values (4,3,3,'2014-11-12 10:00:00','2014-11-27 10:20:00','2014-11-28 1:20:00','2014-08-01 00:00:01',5600);
insert into Orders values (3,3,3,'2014-11-12 10:00:00','2014-12-09 08:20:00','2014-12-10 20:20:00','2014-09-12 00:00:01',6600);
insert into Orders values (2,3,3,'2014-11-12 10:00:00','2014-12-09 10:20:00','2014-12-10 15:20:00','2014-10-06 00:00:01',2800);
insert into Orders values (1,3,3,'2014-12-04 22:32:41','2014-12-11 20:20:00','2014-12-12 14:20:00',null,4000);
--報表資料
insert into Orders values (4,3,3,'2014-11-12 10:00:00','2014-11-19 01:20:00','2014-11-15 15:20:00',null,1000);
insert into Orders values (4,3,3,'2014-11-12 10:00:00','2014-11-22 08:20:00','2014-11-16 14:20:00','2014-08-01 00:00:01',2500);
insert into Orders values (2,3,3,'2014-11-12 10:00:00','2014-11-24 08:20:00','2014-11-19 20:20:00','2014-09-12 00:00:01',3000);
insert into Orders values (5,3,3,'2014-11-12 10:00:00','2014-11-26 00:20:00','2014-11-20 15:20:00','2014-10-06 00:00:01',4600);
insert into Orders values (5,3,3,'2014-11-12 10:00:00','2014-11-27 10:20:00','2014-11-27 14:20:00',null,5100);
insert into Orders values (6,3,3,'2014-11-12 10:00:00','2014-11-19 01:20:00','2014-11-15 15:20:00',null,900);
insert into Orders values (6,3,3,'2014-11-12 10:00:00','2014-11-22 08:20:00','2014-11-16 14:20:00','2014-08-01 00:00:01',1200);
insert into Orders values (2,3,3,'2014-11-12 10:00:00','2014-11-24 08:20:00','2014-11-19 20:20:00','2014-09-12 00:00:01',2200);
insert into Orders values (2,3,3,'2014-11-12 10:00:00','2014-11-26 00:20:00','2014-11-20 15:20:00','2014-10-06 00:00:01',4500);
insert into Orders values (3,3,3,'2014-11-12 10:00:00','2014-11-27 10:20:00','2014-11-23 14:20:00',null,4200);
insert into Orders values (4,3,3,'2014-11-12 10:00:00','2014-11-19 01:20:00','2014-11-15 15:20:00',null,1000);
insert into Orders values (4,3,3,'2014-11-12 10:00:00','2014-11-22 08:20:00','2014-11-16 14:20:00','2014-08-01 00:00:01',1200);
insert into Orders values (4,3,3,'2014-11-12 10:00:00','2014-11-24 08:20:00','2014-11-19 20:20:00','2014-09-12 00:00:01',1300);
insert into Orders values (4,3,3,'2014-11-12 10:00:00','2014-11-26 00:20:00','2014-11-20 15:20:00','2014-10-06 00:00:01',1100);
insert into Orders values (4,3,3,'2014-11-12 10:00:00','2014-11-28 10:20:00','2014-11-29 14:20:00',null,1500);
insert into Orders values (4,3,3,'2014-11-12 10:00:00','2014-12-01 00:20:00','2014-12-01 15:20:00','2014-10-06 00:00:01',1100);
insert into Orders values (4,3,3,'2014-11-12 10:00:00','2014-12-01 10:20:00','2014-12-01 14:20:00',null,1500);
insert into Orders values (3,3,3,'2014-11-12 10:00:00','2014-12-01 10:20:00','2014-12-01 14:20:00',null,12000);
insert into Orders values (4,3,3,'2014-11-12 10:00:00','2014-12-02 10:20:00','2014-12-02 14:20:00',null,0);
insert into Orders values (2,3,3,'2014-11-12 10:00:00','2014-12-02 10:20:00','2014-12-06 14:20:00',null,8900);
insert into Orders values (2,3,3,'2014-11-12 10:00:00','2014-12-06 10:20:00','2014-12-06 14:20:00',null,8000);
--insert into Orders values (2,3,3,'2014-11-12 10:00:00','2014-12-10 10:20:00','2014-12-10 14:20:00',null,5300);
GO


Create Table Ord_item(
		    item_id         int NOT NULL IDENTITY(1,1) Primary Key ,
			ord_id          int,
			prod_id      	int,
			acc_id          int,
			item_name       varchar(20) NOT NULL ,
			item_tel        varchar(20) NULL ,
			item_phone      varchar(20) NULL ,
			item_email      varchar(50) NOT NULL,
			pritem_acc      varchar(max) NULL,
			item_all        varchar(max) NULL,

			CONSTRAINT Ord_item_com_id_fk FOREIGN KEY (ord_id) REFERENCES Orders (ord_id),
			CONSTRAINT Ord_item_prod_id_fk FOREIGN KEY (prod_id) REFERENCES Product (prod_id),

);


--insert into Ord_item values (1,1,1,'租車苦主1','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (2,1,1,'租車苦主2','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (3,1,1,'租車苦主3','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (4,1,1,'租車苦主4','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (5,1,1,'租車苦主5','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (6,1,1,'租車苦主1','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (7,1,1,'租車苦主2','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (8,1,1,'租車苦主3','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (9,1,1,'租車苦主4','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (10,1,1,'租車苦主5','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (11,1,1,'租車苦主1','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (12,1,1,'租車苦主2','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (13,1,1,'租車苦主3','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (14,1,1,'租車苦主4','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (15,1,1,'租車苦主5','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (16,1,1,'租車苦主1','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (17,1,1,'租車苦主2','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (18,1,1,'租車苦主3','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (19,1,1,'租車苦主4','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (20,1,1,'租車苦主5','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (21,1,1,'租車苦主1','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (22,1,1,'租車苦主2','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (23,1,1,'租車苦主3','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (24,1,1,'租車苦主4','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (25,1,1,'租車苦主5','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (26,1,1,'租車苦主1','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (27,1,1,'租車苦主2','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (28,1,1,'租車苦主3','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (29,1,1,'租車苦主4','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (30,1,1,'租車苦主5','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (31,1,1,'租車苦主1','0987654321','0234567890','gg@ya.123',null,null);
--異常未還明細
insert into Ord_item values (1,61,1,'馬小九','0987654321','0234567890','gg@ya.123',null,null);
--
--insert into Ord_item values (33,1,1,'租車苦主3','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (34,1,1,'租車苦主4','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (35,1,1,'租車苦主5','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (36,1,1,'測試逾期未取功能','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (37,1,1,'測試逾期未還功能','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (38,1,1,'測試取消功能條件1','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (39,1,1,'測試取消功能條件2','0987654321','0234567890','gg@ya.123',null,null);
--insert into Ord_item values (40,1,1,'測試取消功能3','0987654321','0234567890','gg@ya.123',null,null);
--車子 for 12/10號
insert into Ord_item values (2,58,1,'柯小哲','0234567890','0987654321','gg@ya.123','{"custFields":[{"id":"custField_1_PreBox","type":"PreBox","label":"小人國優惠套餐","value":"600","valueDescription":"小人國遊樂園入場卷2張"},{"id":"custField_2_textarea","type":"textarea","label":"特殊需求","value":"老闆~可以殺價嗎?","valueDescription":""}]}',null);
insert into Ord_item values (3,59,1,'歐陽妮妮','0234567890','0987654321','gg@ya.123',null,null);
insert into Ord_item values (4,60,1,'黃詩芸','0234567890','0987654321','gg@ya.123',null,null);
insert into Ord_item values (5,58,1,'李安泰','0234567890','0987654321','gg@ya.123',null,null);
insert into Ord_item values (6,58,1,'周如','0234567890','0987654321','gg@ya.123','{"custFields":[{"id":"custField_1_PreBox","type":"PreBox","label":"清靜農場超清靜午餐","value":"400","valueDescription":"清靜農場哞哞午餐卷2張"},{"id":"custField_2_textarea","type":"textarea","label":"特殊需求","value":"無","valueDescription":""}]}',null);

insert into Ord_item values (7,55,1,'馬小九','0234567890','0987654321','gg@ya.123',null,null);
insert into Ord_item values (8,55,1,'來來哥','0234567890','0987654321','gg@ya.123',null,null);
insert into Ord_item values (9,55,1,'曹蘭','0234567890','0987654321','gg@ya.123',null,null);
insert into Ord_item values (10,56,1,'王月','0234567890','0987654321','gg@ya.123','{"custFields":[{"id":"custField_2_PreBox","type":"PreBox","label":"機車愜意配件","value":"300","valueDescription":"對講機全罩安全帽2頂"},{"id":"custField_2_textarea","type":"textarea","label":"特殊需求","value":"無","valueDescription":""}]}',null);
insert into Ord_item values (11,57,1,'小S','0234567890','0987654321','gg@ya.123','{"custFields":[{"id":"custField_2_PreBox","type":"PreBox","label":"機車愜意配件","value":"300","valueDescription":"對講機全罩安全帽2頂"},{"id":"custField_2_textarea","type":"textarea","label":"特殊需求","value":"無","valueDescription":""}]}',null);

insert into Ord_item values (12,61,1,'租戚戚','0987654321','0234567890','gg@ya.123','{"custFields":[{"id":"custField_2_PreBox","type":"PreBox","label":"機車愜意配件","value":"300","valueDescription":"對講機全罩安全帽2頂"},{"id":"custField_2_textarea","type":"textarea","label":"特殊需求","value":"無","valueDescription":""}]}',null);
insert into Ord_item values (13,62,1,'方文山','0987654321','0234567890','gg@ya.123','{"custFields":[{"id":"custField_2_PreBox","type":"PreBox","label":"機車愜意配件","value":"300","valueDescription":"對講機全罩安全帽2頂"},{"id":"custField_2_textarea","type":"textarea","label":"特殊需求","value":"無","valueDescription":""}]}',null);
insert into Ord_item values (14,63,1,'方小三','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (15,61,1,'七七','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (16,61,1,'MAC','0987654321','0234567890','gg@ya.123',null,null);

insert into Ord_item values (17,64,1,'高P','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (18,65,1,'天天','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (19,66,1,'張輛','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (20,64,1,'老爸','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (21,64,1,'狗哥','0987654321','0234567890','gg@ya.123',null,null);

insert into Ord_item values (22,67,1,'高P','0987654321','0234567890','gg@ya.123','{"custFields":[{"id":"custField_1_PreBox","type":"PreBox","label":"清靜農場超清靜午餐","value":"400","valueDescription":"清靜農場哞哞午餐卷2張"},{"id":"custField_2_textarea","type":"textarea","label":"特殊需求","value":"我要紐約客牛排","valueDescription":""}]}',null);
insert into Ord_item values (23,68,1,'天天','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (24,69,1,'張輛','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (25,67,1,'老爸','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (26,67,1,'狗哥','0987654321','0234567890','gg@ya.123','{"custFields":[{"id":"custField_1_PreBox","type":"PreBox","label":"清靜農場超清靜午餐","value":"400","valueDescription":"清靜農場哞哞午餐卷2張"},{"id":"custField_2_textarea","type":"textarea","label":"特殊需求","value":"無","valueDescription":""}]}',null);
--報表
insert into Ord_item values (27,57,1,'柯小哲','0234567890','0987654321','gg@ya.123',null,null);
insert into Ord_item values (28,57,1,'歐陽妮妮','0234567890','0987654321','gg@ya.123',null,null);
insert into Ord_item values (29,57,1,'黃詩芸','0234567890','0987654321','gg@ya.123',null,null);
insert into Ord_item values (30,57,1,'李安泰','0234567890','0987654321','gg@ya.123',null,null);
insert into Ord_item values (31,57,1,'周如','0234567890','0987654321','gg@ya.123',null,null);
insert into Ord_item values (32,66,1,'高P','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (33,66,1,'天天','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (34,66,1,'張輛','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (35,66,1,'老爸','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (36,66,1,'狗哥','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (37,68,1,'高P','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (38,69,1,'天天','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (39,68,1,'張輛','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (40,69,1,'老爸','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (41,68,1,'狗哥','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (42,66,1,'老爸','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (43,68,1,'狗哥','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (44,61,1,'狗哥','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (45,66,1,'狗哥','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (46,66,1,'狗哥','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (47,66,1,'狗哥','0987654321','0234567890','gg@ya.123',null,null);
GO

Create Table Question_temp(
             que_ver       int NOT NULL IDENTITY(1,1) Primary Key ,
			 que_content   varchar(max) NOT NULL ,
			 com_id        int NOT NULL ,

			 CONSTRAINT Question_temp_com_id_fk FOREIGN KEY (com_id) REFERENCES company (com_id),
);
GO

Create Table Answer(
			ans_ver        int NOT NULL IDENTITY(1,1) Primary Key ,
			ans_content    varchar(max) NOT NULL,
			ans_status     int NOT NULL,
			ord_id         int NOT NULL,
			mem_id         int NOT NULL,

			CONSTRAINT Answer_com_id_fk FOREIGN KEY (ord_id) REFERENCES Orders (ord_id),
			CONSTRAINT Answer_mem_id_fk FOREIGN KEY (mem_id) REFERENCES Member (mem_id),

); 
GO

Create Table Ord_temp(
			ordt_id        int NOT NULL IDENTITY(1,1) Primary Key ,
			ordt_content   varchar(max) NOT NULL ,
			com_id         int NOT NULL,

			CONSTRAINT Ord_temp_com_id_fk FOREIGN KEY (com_id) REFERENCES company (com_id),
);
GO