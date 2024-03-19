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
CDCUSTOMER INT,
DTDELIVER DATE,
VLTOTAL MONEY,
)
 
CREATE TABLE CUSTOMER(
CDCUSTOMER INT IDENTITY(1,1),
NMCUSTOMER VARCHAR(50),
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
ALTER TABLE REQUEST alter column CDCUSTOMER int NOT NULL;
ALTER TABLE REQUEST alter column DTDELIVER DATE NOT NULL;
ALTER TABLE REQUEST alter column VLTOTAL MONEY NOT NULL;

ALTER TABLE CUSTOMER alter column CDCUSTOMER int NOT NULL;
ALTER TABLE CUSTOMER alter column NMCUSTOMER VARCHAR(50) NOT NULL;
ALTER TABLE CUSTOMER alter column NRFONE NUMERIC(12) NOT NULL;
ALTER TABLE CUSTOMER alter column DSADRESS VARCHAR(255) NOT NULL;

-- b)

 
ALTER TABLE SUPPLIER
ADD PRIMARY KEY (CDSUPPLIER);
 
ALTER TABLE PRODUCT
ADD PRIMARY KEY (CDPRODUCT);

ALTER TABLE REQUEST
ADD PRIMARY KEY (CDREQUEST);

ALTER TABLE CUSTOMER
ADD PRIMARY KEY (CDCUSTOMER);

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
ADD CONSTRAINT FK_COSTUMER FOREIGN KEY (CDCUSTOMER) REFERENCES CUSTOMER(CDCUSTOMER) 

-- d)



CREATE INDEX IDXSUPPLIER ON PRODUCT(CDSUPPLIER);


-- e)



CREATE INDEX IDXCOSTUMER ON REQUEST(CDCUSTOMER);

-- f)



ALTER TABLE SUPPLIER 
ADD ADRESS VARCHAR(255);

-- g)



INSERT INTO CUSTOMER (NMCUSTOMER, NRFONE, DSADRESS) 
VALUES ('Fabiano', 99879375, 'Rua Tijucas, 110, Centro, Joinville - S.C'); 

-- h)



INSERT INTO REQUEST(DTREQUEST, CDCUSTOMER, DTDELIVER, VLTOTAL)
VALUES ('2008/01/31', 1, '2008/02/05', 54.00)

SELECT

R.CDREQUEST,
R.DTREQUEST,
R.CDCUSTOMER,
R.DTDELIVER,
R.VLTOTAL,;
C.NMCUSTOMER

FROM REQUEST R
	INNER JOIN CUSTOMER C ON R.CDCUSTOMER = C.CDCUSTOMER
;

-- i)



 UPDATE CUSTOMER
 SET NRFONE = 99012567
 WHERE CDCUSTOMER = 1;  
 

-- j)




DELETE FROM REQUEST
WHERE CDREQUEST = 1

DELETE FROM CUSTOMER
WHERE CDCUSTOMER = 1

-- k)



DROP TABLE dbo.PRODUCTREQUEST;  
DROP TABLE dbo.PRODUCT;  
DROP TABLE dbo.REQUEST;  
DROP TABLE dbo.CUSTOMER;  
DROP TABLE dbo.SUPPLIER;  




SELECT C.NMCUSTOMER,
       P.NMPRODUCT,
       R.DTREQUEST,
       PR.QTAMOUNT,
       PR.VLUNITARY,
       (PR.QTAMOUNT * PR.VLUNITARY) AS VLTOTALPEDIDO
FROM REQUEST R
INNER JOIN CUSTOMER C ON R.CDCUSTOMER = C.CDCUSTOMER
INNER JOIN PRODUCTREQUEST PR ON R.CDREQUEST = PR.CDREQUEST
INNER JOIN PRODUCT P ON PR.CDPRODUCT = P.CDPRODUCT
WHERE PR.QTAMOUNT > 500;