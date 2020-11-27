-- 1. TB_KARYAWAN : (NO_PEG, NAMA, JK, ALAMAT, KOTA) 
-- 2. TB_GAJI :  (NO_PEG, NAMA, GOL, GAJI). 
--    Natural Join : tampilkan nopeg, nama, jenis kelamin, golongan dan gaji
-- 3. Inner Join & Outer join : nama, jenis kelamin, gol, dan gaji 
-- 4. SELECT : Tampilkan nama dan jenis kelamin dari seluruh record Tampilkan nama dan jenis kelamin tetapi hanya jenis kemanin perempuan saja
-- 5. TB_KARYAWAN > TB_PEGAWAI

CREATE SEQUENCE NO_PEG_INC START WITH 1720201 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE NO_GAJI_INC START WITH 1 INCREMENT BY 1 NOCACHE;
# -------------------------------------------------------------------
CREATE table "TBL_KARYAWAN" (
    "NO_PEG"    NUMBER(10) DEFAULT NO_PEG_INC.nextval NOT NULL,
    "NAMA"  	VARCHAR2(35) NOT NULL,
    "JK"        CHAR(1) NOT NULL,
    "ALAMAT"    VARCHAR2(40) NOT NULL,
    "KOTA"      VARCHAR2(15) NOT NULL,
    constraint "TBL_KARYAWAN_PK" primary key ("NO_PEG")
);

CREATE TABLE "TBL_GAJI" (
	"NO_GAJI"	NUMBER(3) DEFAULT NO_GAJI_INC.nextval NOT NULL,
	"NO_PEG"	NUMBER(10) NOT NULL,
	"GOL"		CHAR(1) NOT NULL,
	"GAJI"		NUMBER(8,2) NOT NULL,
	constraint "TBL_GAJI_PK" primary keY ("NO_GAJI", "NO_PEG"),
    constraint "FK_NO_PEG" FOREIGN KEY (NO_PEG) REFERENCES TBL_KARYAWAN(NO_PEG)
);
# -------------------------------------------------------------------
RENAME TB_KARYAWAN TO TB_EMPLOYEE;
# -------------------------------------------------------------------
ALTER TABLE TBL_KARYAWAN ADD CONSTRAINT 
CHECK_JK CHECK (JK IN ('L','P'));
ALTER TABLE TBL_GAJI ADD CONSTRAINT 
CHECK_GOL CHECK (GOL IN ('A','B','C','D'));
DROP TABLE TBL_GAJI;
UPDATE TABLE TB_KARYAWAN SET JK='L' WHERE NO_PEG=172010;
# -------------------------------------------------------------------
INSERT INTO TBL_KARYAWAN VALUES (NO_PEG_INC.nextval,'Nursyamsu Indra','L','29627 Melissa Underpass','Thomastown');
INSERT INTO TBL_KARYAWAN VALUES (NO_PEG_INC.nextval,'Ahmad Subarjo A.','L','49544 Jason Forge Suite 140','Lake Latown');
INSERT INTO TBL_KARYAWAN VALUES (NO_PEG_INC.nextval,'Lintang Orienta','L','6584 Richard Divide Apt. 437','Margaretstad');
INSERT INTO TBL_KARYAWAN VALUES (NO_PEG_INC.nextval,'Fawaz Nafasii','P','745 Chelsea Locks','East Michael');
INSERT INTO TBL_KARYAWAN VALUES (NO_PEG_INC.nextval,'Anisa Nur Alifah','P','69354 Mclaughlin Corner Apt. 627','New Christ');
INSERT INTO TBL_KARYAWAN VALUES (NO_PEG_INC.nextval,'Irsyad Al-Komari','L','8477 Melissa Glen Suite 146','Port Rach');
INSERT INTO TBL_KARYAWAN VALUES (NO_PEG_INC.nextval,'Nurwulan Kusuma D','P','5982 Sullivan Way Suite 770','Charlesside');
INSERT INTO TBL_KARYAWAN VALUES (NO_PEG_INC.nextval,'Ester Miya','L','16342 Murphy Throughway Apt. 875','Nortdfort');
INSERT INTO TBL_KARYAWAN VALUES (NO_PEG_INC.nextval,'Nursyamsu Kusuma Jr.','L','3463 Shannon Locks Suite 711','Lake Vero');
INSERT INTO TBL_KARYAWAN VALUES (NO_PEG_INC.nextval,'Abbbas Muhammad','P','84087 Reynolds Mountain','Adamtown');

INSERT INTO TBL_GAJI VALUES (NO_GAJI_INC.nextval,'1720201','A',135000.00);
INSERT INTO TBL_GAJI VALUES (NO_GAJI_INC.nextval,'1720202','A',250000.00);
INSERT INTO TBL_GAJI VALUES (NO_GAJI_INC.nextval,'1720203','A',305000.00);
INSERT INTO TBL_GAJI VALUES (NO_GAJI_INC.nextval,'1720204','A',435000.00);
INSERT INTO TBL_GAJI VALUES (NO_GAJI_INC.nextval,'1720205','A',135000.00);
INSERT INTO TBL_GAJI VALUES (NO_GAJI_INC.nextval,'1720206','A',235000.00);
INSERT INTO TBL_GAJI VALUES (NO_GAJI_INC.nextval,'1720207','A',335000.00);
# -------------------------------------------------------------------
SELECT * 
FROM TBL_KARYAWAN 
ORDER BY NO_PEG;
--
SELECT * 
FROM TBL_GAJI 
ORDER BY NO_GAJI;
--
SELECT * FROM TBL_KARYAWAN 
NATURAL JOIN TBL_GAJI 
ORDER BY NO_PEG; 
--
SELECT KR.NAMA, KR.JK, GJ.GOL, GJ.GAJI 
FROM TBL_KARYAWAN KR
INNER JOIN TBL_GAJI GJ ON KR.NO_PEG = GJ.NO_PEG;
--
SELECT KR.NAMA, KR.JK, GJ.GOL, GJ.GAJI 
FROM TBL_KARYAWAN KR
FULL OUTER JOIN TBL_GAJI GJ ON KR.NO_PEG = GJ.NO_PEG;
--
SELECT NAMA, JK
FROM TBL_KARYAWAN 
ORDER BY NAMA;
--
SELECT NAMA, JK
FROM TBL_KARYAWAN 
WHERE JK = 'P'
ORDER BY NAMA;
--
RENAME TBL_KARYAWAN TO TBL_PEGAWAI;
SELECT * FROM TBL_PEGAWAI ORDER BY NO_PEG;

