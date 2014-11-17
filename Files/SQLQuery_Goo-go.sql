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
--IF EXISTS (SELECT name FROM GGDB.sys.tables WHERE name = N'Question_temp')
--BEGIN
--drop table Member;
--drop table Company;
--drop table Product;
--drop table Accessory;
--drop table Ord_status;
--drop table Orders;
--drop table Ord_item;
--drop table Question_temp;
--drop table Answer;
--drop table Ord_temp;
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
			 

insert into Member values ('aaa@abc.com.tw','aaa123','張君雅',0,'2000-11-17','A223456789','0312345678','0912365478','台中市西屯區河南路二段280號12樓',1,'123');
insert into Member values ('bbb@abc.com.tw','aaa123','王小明',1,'1992-6-30','A187654321','0287654321','0987654321','台北市大安區羅斯福路二段280號',1,'123');
insert into Member values ('cccccccccc@abc.com.tw','aaa123','陳阿華',1,'1988-5-17','A158459845','0225556987','0932666888','台北市中正區和平東路一段56號',1,'123');
insert into Member values ('ddd@abc.com.tw','aaa123','林小美',0,'1975-9-5','A256842951','0233587964','0910258666','台北市大安區復興南路一段390號',1,'123');
insert into Member values ('eee@abc.com.tw','aaa123','馬小九',1,'1977-12-1','A123666999','0233657777','0910222333','台北市信義區松壽路20號',1,'123');




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
INSERT INTO Company VALUES ('kitty123@google.com', 'kitty123', '長榮租車', '林俊宏', '高雄市前鎮區凱旋三路115號', '0788303030', '0756157892', 22843188, NULL, 0, NULL);
INSERT INTO Company VALUES ('snoppy123@google.com', 'snoppy123', '台灣大哥大租車', '孫銘澤', '臺北市士林區忠誠路1段125號2樓', '0275012300', null, 22843574, NULL, 0, NULL);
INSERT INTO Company VALUES ('micky123@pchome.com', 'micky123', '台灣租車', '徐范煦敏', '臺北市內湖區新湖三路196號3樓', '0200422939', '0200422939', 12144164, NULL, 0, NULL);
INSERT INTO Company VALUES ('monkey123@pchome.com', 'monkey123', '竹青蜓租車', '林素芬', '桃園縣桃園市中埔二街208號5樓', '25429778', null, 22529771, NULL, 0, NULL);
INSERT INTO Company VALUES ('kelly123@yahoo.com', 'kelly123', '冠亞租車', '謝志航', '新北市新莊區福壽街99巷11弄4之2號(3樓)', '86610100', null, 22825576, NULL, 0, NULL);
INSERT INTO Company VALUES ('cindy123@pchome.com', 'cindy123', '全家租車', '裴淳吉', '新北市永和區中正路609巷4號', '23581727', null, 23270841, NULL, 0, NULL);
INSERT INTO Company VALUES ('chilly123@google.com', 'chilly123', '商寶國際租車', '李偉娜', '臺北市松山區慶城街23-2號3樓', '0215123456', '0255896123', 23164551,NULL, 0, NULL);
INSERT INTO Company VALUES ('batman123@google.com', 'batman123', '玩美離島租車', '林山良', '臺中市北區健行路779號1樓', '07001234', '0415006879', 22971937,NULL, 0, NULL);
INSERT INTO Company VALUES ('super123@yahoo.com.tw', 'super123', '遠信租車', '沈文斌', '臺北市中正區衡陽路51號6樓之4', '022114566', '0287563547', 25053931,NULL, 0, NULL);
INSERT INTO Company VALUES ('joke123@hotmail.net', 'joke123', '非常租車租車', '楊長庚', '新北市土城區中央路2段386號(1樓)', '092156546', null, 29169462,NULL, 0, NULL);
INSERT INTO Company VALUES ('antai123@pchome.com', 'antai123', '安泰租車', '李小泰', '臺北市內湖區新湖二路196號1樓', '0200422940', '02004229340', 12144165,NULL, 0, NULL);
INSERT INTO Company VALUES ('antai124@pchome.com', 'antai124', '安泰1租車', '李小泰1', '臺北市內湖區新湖二路197號1樓', '0200422941', '02004229341', 12144166,NULL, 0, NULL);
INSERT INTO Company VALUES ('antai125@pchome.com', 'antai125', '安泰2租車', '李小泰2', '臺北市內湖區新湖二路198號1樓', '0200422942', '02004229342', 12144167,NULL, 0, NULL);
INSERT INTO Company VALUES ('antai126@pchome.com', 'antai126', '安泰3租車', '李小泰3', '臺北市內湖區新湖二路199號1樓', '0200422943', '02004229343', 12144168,NULL, 0, NULL);
INSERT INTO Company VALUES ('antai127@pchome.com', 'antai127', '安泰4租車', '李小泰4', '臺北市內湖區新湖二路200號1樓', '0200422944', '02004229344', 12144169,NULL, 0, NULL);
INSERT INTO Company VALUES ('antai128@pchome.com', 'antai128', '只有機車租車', '李小泰5', '臺北市內湖區新湖二路201號1樓', '0200422945', '02004229345', 12144170,NULL, 0, NULL);
INSERT INTO Company VALUES ('antai129@pchome.com', 'antai129', '只有汽車租車', '李小泰6', '臺北市內湖區新湖二路202號1樓', '0200422946', '02004229346', 12144171,NULL, 0, NULL);
INSERT INTO Company VALUES ('eee@abc.com.tw', 'aaa123', '馬小九只有機車', '馬小九', '臺北市內湖區新湖二路202號1樓', '0233657777', '0910222333', 12144172,NULL, 0, NULL);

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
insert into Product values (2,'野狼125',2,3000,0.93,0x00,'ss',null,null,null,1,null,null,null,5,1);
insert into Product values (2,'競戰150',2,4000,0.77,0x00,'ss',null,null,null,1,null,null,null,6,1);
insert into Product values (3,'法拉利211',1,5000,0.67,0x00,'ss',null,null,null,1,null,null,null,7,1);
insert into Product values (3,'保時捷-T1',1,6000,0.89,0x00,'ss',null,null,null,1,null,null,null,8,1);
insert into Product values (3,'Fighter150',2,7000,0.95,0x00,'ss',null,null,null,1,null,null,null,9,1);
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



Create Table Accessory(
            acc_id          int NOT NULL IDENTITY(1,1) Primary Key ,
			com_id          int NOT NULL ,
			acc_detail      varchar(max) NOT NULL,
			acc_price       decimal NOT NULL,

			CONSTRAINT Accessory_com_id_fk FOREIGN KEY (com_id) REFERENCES company (com_id),
);

insert into Accessory values (1,'g',1000);
insert into Accessory values (1,'g',1000);
insert into Accessory values (1,'g',1000);
insert into Accessory values (1,'g',1000);
insert into Accessory values (1,'g',1000);


Create Table Ord_status(
		    ord_status          int NOT NULL IDENTITY(1,1) Primary Key ,
			status_char         varchar(20) NOT NULL
);

insert into Ord_status values ('未處理');
insert into Ord_status values ('已接受');
insert into Ord_status values ('已出車');
insert into Ord_status values ('結單');
insert into Ord_status values ('會員取消');
insert into Ord_status values ('商家取消');
insert into Ord_status values ('會員逾時');
insert into Ord_status values ('商家逾時');
insert into Ord_status values ('異常未還');

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


insert into Orders values (6,3,3,'2014-06-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00','2014-11-12 20:44:39',3000);
insert into Orders values (2,3,3,'2014-07-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00','2000-01-01 00:00:01',3000);
insert into Orders values (3,3,3,'2014-08-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00','2000-01-01 00:00:01',3000);
insert into Orders values (4,3,3,'2014-09-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00','2000-01-01 00:00:01',3000);
insert into Orders values (1,3,3,'2014-10-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00',null,3000);

insert into Orders values (1,5,3,'2014-06-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00',null,3000);
insert into Orders values (2,3,3,'2014-07-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00','2000-01-01 00:00:01',3000);
insert into Orders values (3,3,3,'2014-08-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00','2000-01-01 00:00:01',3000);
insert into Orders values (4,3,3,'2014-09-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00','2000-01-01 00:00:01',3000);
insert into Orders values (1,3,3,'2014-10-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00',null,3000);

insert into Orders values (1,3,3,'2014-06-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00',null,3000);
insert into Orders values (2,3,3,'2014-07-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00','2000-01-01 00:00:01',3000);
insert into Orders values (3,3,3,'2014-08-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00','2000-01-01 00:00:01',3000);
insert into Orders values (4,3,3,'2014-09-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00','2000-01-01 00:00:01',3000);
insert into Orders values (1,3,3,'2014-10-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00',null,3000);

insert into Orders values (1,3,3,'2014-06-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00',null,3000);
insert into Orders values (2,3,3,'2014-07-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00','2000-01-01 00:00:01',3000);
insert into Orders values (3,3,3,'2014-08-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00','2000-01-01 00:00:01',3000);
insert into Orders values (4,3,3,'2014-09-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00','2000-01-01 00:00:01',3000);
insert into Orders values (1,3,3,'2014-10-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00',null,3000);

insert into Orders values (1,3,3,'2014-06-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00',null,3000);
insert into Orders values (2,3,3,'2014-07-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00','2000-01-01 00:00:01',3000);
insert into Orders values (3,3,3,'2014-08-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00','2000-01-01 00:00:01',3000);
insert into Orders values (4,3,3,'2014-09-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00','2000-01-01 00:00:01',3000);
insert into Orders values (1,3,3,'2014-10-28 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00',null,3000);

insert into Orders values (2,3,3,'2014-07-11 13:50:44','2014-01-03 13:20:00','2014-01-08 15:20:00','2000-01-01 00:00:01',4000);
insert into Orders values (3,3,3,'2014-08-11 13:23:55','2014-01-11 13:20:00','2014-01-22 16:20:00','2000-01-01 00:00:01',5000);
insert into Orders values (4,3,3,'2014-09-11 13:20:44','2014-01-06 13:20:00','2014-01-10 17:20:00','2000-01-01 00:00:01',6000);
insert into Orders values (1,3,3,'2014-10-11 13:30:21','2014-01-22 13:20:00','2014-01-23 18:20:00',null,7000);
insert into Orders values (1,3,3,'2014-06-11 13:40:20','2014-01-01 13:20:00','2014-01-05 14:20:00',null,3000);
insert into Orders values (2,3,3,'2014-07-11 13:50:44','2014-01-03 13:20:00','2014-01-08 15:20:00','2000-01-01 00:00:01',4000);
insert into Orders values (9,3,3,'2014-08-11 13:23:55','2014-01-11 13:20:00','2014-01-22 16:20:00','2000-01-01 00:00:01',5000);
insert into Orders values (8,3,3,'2014-09-11 13:20:44','2014-01-06 13:20:00','2014-01-10 17:20:00','2000-01-01 00:00:01',6000);
insert into Orders values (7,3,3,'2014-10-11 13:30:21','2014-01-22 13:20:00','2014-01-23 18:20:00','2000-01-01 00:00:01',7000);
insert into Orders values (5,3,3,'2014-10-30 13:30:21','2014-01-22 13:20:00','2014-01-23 18:20:00','2014-11-12 22:42:39',7000);


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
			CONSTRAINT Ord_item_acc_id_fk FOREIGN KEY (acc_id) REFERENCES Accessory (acc_id),

);


insert into Ord_item values (1,1,1,'租車苦主1','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (2,1,1,'租車苦主2','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (3,1,1,'租車苦主3','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (4,1,1,'租車苦主4','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (5,1,1,'租車苦主5','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (6,1,1,'租車苦主1','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (7,1,1,'租車苦主2','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (8,1,1,'租車苦主3','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (9,1,1,'租車苦主4','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (10,1,1,'租車苦主5','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (11,1,1,'租車苦主1','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (12,1,1,'租車苦主2','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (13,1,1,'租車苦主3','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (14,1,1,'租車苦主4','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (15,1,1,'租車苦主5','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (16,1,1,'租車苦主1','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (17,1,1,'租車苦主2','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (18,1,1,'租車苦主3','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (19,1,1,'租車苦主4','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (20,1,1,'租車苦主5','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (21,1,1,'租車苦主1','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (22,1,1,'租車苦主2','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (23,1,1,'租車苦主3','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (24,1,1,'租車苦主4','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (25,1,1,'租車苦主5','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (26,1,1,'租車苦主1','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (27,1,1,'租車苦主2','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (28,1,1,'租車苦主3','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (29,1,1,'租車苦主4','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (30,1,1,'租車苦主5','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (31,1,1,'租車苦主1','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (32,1,1,'租車苦主2','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (33,1,1,'租車苦主3','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (34,1,1,'租車苦主4','0987654321','0234567890','gg@ya.123',null,null);
insert into Ord_item values (35,1,1,'租車苦主5','0987654321','0234567890','gg@ya.123',null,null);


Create Table Question_temp(
             que_ver       int NOT NULL IDENTITY(1,1) Primary Key ,
			 que_content   varchar(max) NOT NULL ,
			 com_id        int NOT NULL ,

			 CONSTRAINT Question_temp_com_id_fk FOREIGN KEY (com_id) REFERENCES company (com_id),
);

Create Table Answer(
			ans_ver        int NOT NULL IDENTITY(1,1) Primary Key ,
			ans_content    varchar(max) NOT NULL,
			ans_status     int NOT NULL,
			ord_id         int NOT NULL,
			mem_id         int NOT NULL,

			CONSTRAINT Answer_com_id_fk FOREIGN KEY (ord_id) REFERENCES Orders (ord_id),
			CONSTRAINT Answer_mem_id_fk FOREIGN KEY (mem_id) REFERENCES Member (mem_id),

); 

Create Table Ord_temp(
			ordt_id        int NOT NULL IDENTITY(1,1) Primary Key ,
			ordt_content   varchar(max) NOT NULL ,
			com_id         int NOT NULL,

			CONSTRAINT Ord_temp_com_id_fk FOREIGN KEY (com_id) REFERENCES company (com_id),
);