-- a)

USE lista1
 
CREATE TABLE SUPPLIER(
CDSUPPLIER INT IDENTITY(1,1),
NMSUPPLIER VARCHAR(50),
NRFONE NUMERIC(12),
)
 
CREATE TABLE PRODUCT(
CDPRODUCT INT IDENTITY(1,1),
NMPRODUCT VARCHAR(50),
CDSUPPLIER INT,
VLPRICE MONEY,
QTSTOCK INT,
)
 
CREATE TABLE PRODUCTREQUEST(
CDREQUEST INT,
CDPRODUCT INT,
QTAMOUNT INT,
VLUNITARY MONEY,
)
 
CREATE TABLE REQUEST(
CDREQUEST INT IDENTITY(1,1),
DTREQUEST DATE,
CDCUSTUMER INT,
DTDELIVER DATE,
VLTOTAL MONEY,
)
 
CREATE TABLE CUSTUMER(
CDCUSTUMER INT IDENTITY(1,1),
NMCUSTUMER VARCHAR(50),
NRFONE NUMERIC(12),
DSADRESS VARCHAR(255)
)

-------


ALTER TABLE SUPPLIER alter column CDSUPPLIER int NOT NULL;
ALTER TABLE SUPPLIER alter column NMSUPPLIER VARCHAR(50) NOT NULL;
ALTER TABLE SUPPLIER alter column NRFONE NUMERIC(12) NOT NULL;

ALTER TABLE PRODUCT alter column CDPRODUCT int NOT NULL;
ALTER TABLE PRODUCT alter column NMPRODUCT VARCHAR(50) NOT NULL;
ALTER TABLE PRODUCT alter column CDSUPPLIER int NOT NULL;
ALTER TABLE PRODUCT alter column VLPRICE MONEY NOT NULL;
ALTER TABLE PRODUCT alter column QTSTOCK int NOT NULL;

ALTER TABLE PRODUCTREQUEST alter column CDREQUEST int NOT NULL;
ALTER TABLE PRODUCTREQUEST alter column CDPRODUCT int NOT NULL;
ALTER TABLE PRODUCTREQUEST alter column QTAMOUNT int NOT NULL;
ALTER TABLE PRODUCTREQUEST alter column VLUNITARY MONEY NOT NULL;

ALTER TABLE REQUEST alter column CDREQUEST int NOT NULL;
ALTER TABLE REQUEST alter column DTREQUEST DATE NOT NULL;
ALTER TABLE REQUEST alter column CDCUSTUMER int NOT NULL;
ALTER TABLE REQUEST alter column DTDELIVER DATE NOT NULL;
ALTER TABLE REQUEST alter column VLTOTAL MONEY NOT NULL;

ALTER TABLE CUSTUMER alter column CDCUSTUMER int NOT NULL;
ALTER TABLE CUSTUMER alter column NMCUSTUMER VARCHAR(50) NOT NULL;
ALTER TABLE CUSTUMER alter column NRFONE NUMERIC(12) NOT NULL;
ALTER TABLE CUSTUMER alter column DSADRESS VARCHAR(255) NOT NULL;

-- b)

 
ALTER TABLE SUPPLIER
ADD PRIMARY KEY (CDSUPPLIER);
 
ALTER TABLE PRODUCT
ADD PRIMARY KEY (CDPRODUCT);

ALTER TABLE REQUEST
ADD PRIMARY KEY (CDREQUEST);

ALTER TABLE CUSTUMER
ADD PRIMARY KEY (CDCUSTUMER);

ALTER TABLE PRODUCTREQUEST
ADD PRIMARY KEY (CDREQUEST, CDPRODUCT);

-- c)


ALTER TABLE PRODUCT 
ADD CONSTRAINT FK_SUPPLIER FOREIGN KEY (CDSUPPLIER) REFERENCES SUPPLIER(CDSUPPLIER)

ALTER TABLE PRODUCTREQUEST 
ADD CONSTRAINT FK_REQUEST FOREIGN KEY (CDREQUEST) REFERENCES REQUEST(CDREQUEST)

ALTER TABLE PRODUCTREQUEST 
ADD CONSTRAINT FK_PRODUCT FOREIGN KEY (CDPRODUCT) REFERENCES PRODUCT(CDPRODUCT)

ALTER TABLE REQUEST 
ADD CONSTRAINT FK_COSTUMER FOREIGN KEY (CDCUSTUMER) REFERENCES CUSTUMER(CDCUSTUMER) 

-- d)



CREATE INDEX IDXSUPPLIER ON PRODUCT(CDSUPPLIER);


-- e)



CREATE INDEX IDXCOSTUMER ON REQUEST(CDCUSTUMER);

-- f)



ALTER TABLE SUPPLIER 
ADD ADRESS VARCHAR(255);

-- g)



INSERT INTO CUSTUMER (NMCUSTUMER, NRFONE, DSADRESS) 
VALUES ('Fabiano', 99879375, 'Rua Tijucas, 110, Centro, Joinville - S.C'); 

-- h)



INSERT INTO REQUEST(DTREQUEST, CDCUSTUMER, DTDELIVER, VLTOTAL)
VALUES ('2008/01/31', 1, '2008/02/05', 54.00)

SELECT

R.CDREQUEST,
R.DTREQUEST,
R.CDCUSTUMER,
R.DTDELIVER,
R.VLTOTAL,
C.NMCUSTUMER

FROM REQUEST R
	INNER JOIN CUSTUMER C ON R.CDCUSTUMER = C.CDCUSTUMER
;

-- i)



 UPDATE CUSTUMER
 SET NRFONE = 99012567
 WHERE CDCUSTUMER = 1;  
 

-- j)




DELETE FROM REQUEST
WHERE CDREQUEST = 1

DELETE FROM CUSTUMER
WHERE CDCUSTUMER = 1

-- k)



DROP TABLE dbo.PRODUCTREQUEST;  
DROP TABLE dbo.PRODUCT;  
DROP TABLE dbo.REQUEST;  
DROP TABLE dbo.CUSTUMER;  
DROP TABLE dbo.SUPPLIER;  