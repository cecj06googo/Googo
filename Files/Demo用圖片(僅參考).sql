USE GGDB
GO

--�[�ӫ~�Ϥ�

--���T125
UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\125-1.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���T125';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\125-2.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���T125';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\125-3.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���T125';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\125-4.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���T125';

UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\125-1.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���T125';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\125-2.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���T125';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\125-3.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���T125';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\125-4.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���T125';

--�}��
UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\1.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\2.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\3.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\4.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';

UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\1.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\2.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\3.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\4.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';

UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\1.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\2.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\3.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\4.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';

UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\1.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\2.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\3.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\4.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';

UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\1.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\2.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\3.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\poducts\4.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���w�SGreatJourney';

-- ���h
UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\BENZ_M320_01.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���hE-320';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\BENZ_M320_02.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���hE-320';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\BENZ_M320_03.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���hE-320';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\BENZ_M320_04.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '���hE-320';

-- �k�ԧQ
UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\FERRARI_458_01.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '�k�ԧQ458';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\FERRARI_458_02.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '�k�ԧQ458';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\FERRARI_458_03.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '�k�ԧQ458';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\FERRARI_458_04.jpg',SINGLE_BLOB) AS x) WHERE prod_name = '�k�ԧQ458';

-- Mini-Cooper
UPDATE Product set prod_pic = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\MINI_COOPER_01.jpg',SINGLE_BLOB) AS x) WHERE prod_name = 'Mini-Cooper-2014';
UPDATE Product set prod_subPic1 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\MINI_COOPER_02.jpg',SINGLE_BLOB) AS x) WHERE prod_name = 'Mini-Cooper-2014';
UPDATE Product set prod_subPic2 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\MINI_COOPER_03.jpg',SINGLE_BLOB) AS x) WHERE prod_name = 'Mini-Cooper-2014';
UPDATE Product set prod_subPic3 = (SELECT BulkColumn FROM OPENROWSET(BULK 'C:\GoogoPics\cars\MINI_COOPER_04.jpg',SINGLE_BLOB) AS x) WHERE prod_name = 'Mini-Cooper-2014';
GO

