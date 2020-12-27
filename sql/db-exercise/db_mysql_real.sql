use db_oracle_lat1;
#-----------------------------------------------
CREATE TABLE TB_KARYAWAN (
	NIP INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	NAMA VARCHAR(35) NOT NULL,
	KAR_TETAP BOOLEAN NOT NULL,	
	JK ENUM('P','W') NOT NULL,	
	TTL DATE NOT NULL,	
	ALAMAT VARCHAR(35) NOT NULL,
	KOTA VARCHAR(25) NOT NULL,
	GAJI INT NOT NULL,
	NO_HP VARCHAR(13) NOT NULL,
	EMAIL VARCHAR(40) NULL
);
#-----------------------------------------------
ALTER TABLE TB_KARYAWAN
MODIFY NIP INT NOT NULL AUTO_INCREMENT;
ALTER TABLE TB_KARYAWAN;
MODIFY KOTA VARCHAR(25) NOT NULL;
ALTER TABLE TB_KARYAWAN;
MODIFY EMAIL VARCHAR(40) NOT NULL;
ALTER TABLE TB_KARYAWAN
AUTO_INCREMENT = 1807422001;
#-----------------------------------------------
INSERT INTO TB_KARYAWAN (NIP,NAMA,KAR_TETAP,JK,TTL,ALAMAT,KOTA,GAJI,NO_HP,EMAIL) VALUES
(NULL,'Muhammad Santo Neiken',TRUE,'P','1999-11-19','1966 Henry Center Apt. 410','Brianbury',500000,'082125337746','currykimberly@hotmail.com'),
(NULL,'Alfonso Diamro.',FALSE,'P','2000-03-23','423 Christopher Pass Apt. 087','South Matthew',350000,'081406200537','wdawson@yahoo.com'),
(NULL,'Grand Cartina S.',TRUE,'W','1994-10-30','71361 Kevin Springs Apt. 515','Reginashire',750000,'0813878441827','gcarter@castillo.com'),
(NULL,'Nina Parker Jr.',FALSE,'W','1995-01-04','0404 Wagner Key','South Yolanda',350000,'08314863225','nparker@yahoo.com'),
(NULL,'Brian Elliot Hansen',FALSE,'P','2001-03-12','27461 Page Extension','New Tiffanymouth',350000,'02131249391','brian25@hansen-shea.info'),
(NULL,'Lamelo Brett Elisabel',TRUE,'w','1998-03-23','079 Huffman Ramp','Benjaminmouth',750000,'08223192133','lambertisabel@williams.org'),
(NULL,'Schroder JoeHakiem',TRUE,'P','1996-11-19','7588 Barbara Gateway','Port Jamesfurt',650000,'021193852213','schroedersherry@bell-morgan.net'),
(NULL,'Laurie Van Bowen',TRUE,'W','1994-12-30','0642 Smith Drives Suite 139','Lake James',500000,'083413124311','bowenlaura@valencia.org'),
(NULL,'Cortezia Green Alexander',FALSE,'P','2000-05-30','02644 Horn Rest Apt. 956','Lake Thomasburgh',350000,'087812391314','alexandercortez@bean-kim.com'),
(NULL,'Vanessa Heagune Douglascin',FALSE,'W','1998-02-12','07859 William Junctions Suite 922','Port Kristen',350000,'084219381523','vanessa37@webb-douglas.com');
#-----------------------------------------------
DELETE FROM TB_KARYAWAN WHERE 1;
#-----------------------------------------------
# ORACLE: Select ke Table (AND, OR, NOT , ORDER BY, masing 3
SELECT * FROM TB_KARYAWAN;
# AND 
SELECT * FROM TB_KARYAWAN
WHERE KAR_TETAP = TRUE AND JK = 'P';
SELECT * FROM TB_KARYAWAN
WHERE TTL < '2000-01-01' AND EMAIL LIKE '%.com';
SELECT * FROM TB_KARYAWAN
WHERE GAJI >= 500000 AND YEAR(TTL) < '1999';
# OR
SELECT * FROM TB_KARYAWAN 
WHERE MONTH(TTL) < '6' OR KAR_TETAP = FALSE;
SELECT * FROM TB_KARYAWAN 
WHERE GAJI = 500000 OR NO_HP LIKE '0821%';
SELECT * FROM TB_KARYAWAN
WHERE EMAIL LIKE '%hotmail%' OR EMAIL LIKE '%yahoo%'
# NOT
SELECT * FROM TB_KARYAWAN
WHERE GAJI NOT IN (500000,350000) AND JK != 'P';
SELECT * FROM TB_KARYAWAN
WHERE MONTH(TTL) NOT IN ('03','10','11','12') AND NIP > 1807422030;
SELECT * FROM TB_KARYAWAN
WHERE YEAR(TTL) NOT IN ('1999','2000') AND EMAIL LIKE '%.org';
# ORDER BY
SELECT * FROM TB_KARYAWAN
WHERE YEAR(TTL) < '1999'
ORDER BY GAJI ASC;
SELECT * FROM TB_KARYAWAN
WHERE GAJI < 750000
ORDER BY YEAR(TTL) DESC, MONTH(TTL) DESC;
SELECT * FROM TB_KARYAWAN
WHERE KOTA LIKE 'Port%' OR KOTA LIKE 'Lake%'
ORDER BY JK ASC, TTL DESC;
