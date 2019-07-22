SQL Note
=======

join multiple SQL tables using the IDs?
----------

```
ex:
TableA - aID | nameA | dID
TableB - bID | nameB | cID | aID
TableC - cID | nameC | date
TableD - dID | nameD



SELECT 
    a.nameA, /* TableA.nameA */
    d.nameD /* TableD.nameD */
FROM TableA a 
    INNER JOIN TableB b on b.aID = a.aID 
    INNER JOIN TableC c on c.cID = b.cID 
    INNER JOIN TableD d on d.dID = a.dID 
WHERE DATE(c.`date`) = CURDATE()

SELECT TableA.*, TableB.*, TableC.*, TableD.*
FROM TableA
    JOIN TableB
        ON TableB.aID = TableA.aID
    JOIN TableC
        ON TableC.cID = TableB.cID
    JOIN TableD
        ON TableD.dID = TableA.dID
WHERE DATE(TableC.date)=date(now()) 

```
[How can I join multiple SQL tables using the IDs?](https://stackoverflow.com/questions/9853586/how-can-i-join-multiple-sql-tables-using-the-ids)
