USE GGDB
GO

--加商品圖片

--野狼125
UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\125-1.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '野狼125';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\125-2.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '野狼125';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\125-3.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '野狼125';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\125-4.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '野狼125';

UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\125-1.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '野狼125';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\125-2.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '野狼125';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\125-3.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '野狼125';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\125-4.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '野狼125';

--腳踏車
UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\1.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\2.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\3.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\4.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';

UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\1.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\2.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\3.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\4.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';

UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\1.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\2.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\3.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\4.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';

UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\1.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\2.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\3.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\4.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';

UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\1.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\2.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\3.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\4.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '捷安特GreatJourney';

-- 賓士
UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\BENZ_M320_01.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '賓士E-320';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\BENZ_M320_02.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '賓士E-320';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\BENZ_M320_03.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '賓士E-320';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\BENZ_M320_04.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '賓士E-320';

-- 法拉利
UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\FERRARI_458_01.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '法拉利458';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\FERRARI_458_02.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '法拉利458';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\FERRARI_458_03.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '法拉利458';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\FERRARI_458_04.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '法拉利458';

-- Mini-Cooper
UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\MINI_COOPER_01.jpg',SINGLE_BLOB) AS x) WHERE prod_name = 'Mini-Cooper-2014';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\MINI_COOPER_02.jpg',SINGLE_BLOB) AS x) WHERE prod_name = 'Mini-Cooper-2014';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\MINI_COOPER_03.jpg',SINGLE_BLOB) AS x) WHERE prod_name = 'Mini-Cooper-2014';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\MINI_COOPER_04.jpg',SINGLE_BLOB) AS x) WHERE prod_name = 'Mini-Cooper-2014';
GO

