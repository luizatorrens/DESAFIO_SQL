--a)

SELECT P.NMPRODUCT, S.NMSUPPLIER, P.VLPRICE, P.VLPRICE - (P.VLPRICE * 0.1) AS PRICEWITH10, 
P.VLPRICE - (P.VLPRICE * 0.2) AS PRICEWITH20, 
P.VLPRICE - (P.VLPRICE * 0.3) AS PRICEWITH30

FROM PRODUCT P INNER JOIN SUPPLIER S ON P.CDSUPPLIER = S.CDSUPPLIER

WHERE  P.VLPRICE - (P.VLPRICE * 0.1) > 15

ORDER BY p.VLPRICE

--b)

SELECT
    P.NMPRODUCT,
    S.NMSUPPLIER,
    P.VLPRICE,
    P.VLPRICE * P.QTSTOCK AS TOTALSTOCK,
    P.VLPRICE * P.QTSTOCK * 2 AS TOTALDBSTOCK

FROM PRODUCT P INNER JOIN
    SUPPLIER S ON P.CDSUPPLIER = S.CDSUPPLIER
WHERE P.VLPRICE * P.QTSTOCK > 12000
ORDER BY S.NMSUPPLIER, P.NMPRODUCT;


--c)

SELECT * FROM CUSTOMER 
WHERE IDFONE IS NOT NULL AND
NMCUSTOMER LIKE 'J%'
ORDER BY NMCUSTOMER

--d)

SELECT P.NMPRODUCT, P.VLPRICE, S.NMSUPPLIER

FROM PRODUCT P INNER JOIN SUPPLIER S ON P.CDSUPPLIER = S.CDSUPPLIER

WHERE S.NMSUPPLIER LIKE '%ica%'

ORDER BY S.NMSUPPLIER, P.VLPRICE

--e)

SELECT S.NMSUPPLIER, S.IDFONE, P.NMPRODUCT, P.VLPRICE, P.VLPRICE * P.QTSTOCK AS PRICESTOCK

FROM PRODUCT P INNER JOIN SUPPLIER S ON P.CDSUPPLIER = S.CDSUPPLIER

WHERE P.NMPRODUCT LIKE 'S%' AND P.VLPRICE > 50

ORDER BY S.NMSUPPLIER, P.VLPRICE 

--f)

SELECT C.NMCUSTOMER, P.NMPRODUCT, R.DTREQUEST, R.DTDELIVER, PR.QTAMOUNT, PR.VLUNITARY, R.VLTOTAL
FROM REQUEST R

INNER JOIN CUSTOMER C ON R.CDCUSTOMER = C.CDCUSTOMER
INNER JOIN PRODUCTREQUEST PR ON R.CDREQUEST = PR.CDREQUEST
INNER JOIN PRODUCT P ON PR.CDPRODUCT = P.CDPRODUCT

WHERE PR.QTAMOUNT < 600 AND R.DTREQUEST BETWEEN '2003-08-01' AND '2003-08-31' AND P.NMPRODUCT LIKE 'M%' 

--g)

SELECT C.NMCUSTOMER, P.NMPRODUCT, S.NMSUPPLIER, R.DTREQUEST, R.DTDELIVER, P.VLPRICE
FROM REQUEST R

INNER JOIN CUSTOMER C ON R.CDCUSTOMER = C.CDCUSTOMER
INNER JOIN PRODUCTREQUEST PR ON R.CDREQUEST = PR.CDREQUEST
INNER JOIN PRODUCT P ON PR.CDPRODUCT = P.CDPRODUCT
INNER JOIN SUPPLIER S ON P.CDSUPPLIER = S.CDSUPPLIER

WHERE S.IDFONE LIKE '(011)%' AND P.VLPRICE > 20
