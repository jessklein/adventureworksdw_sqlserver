USE [AdventureWorksDW]
GO

WITH random
as
(
SELECT TOP 1000000
      c1.[FirstName],
	  c2.[LastName],CAST(RAND(CHECKSUM(NEWID()))*3 as int) randomemail
 
  FROM [dbo].[DimCustomer] c1
CROSS JOIN
DimCustomer c2
)
select  
Firstname, 
Lastname,
email=
CASE
	when randomemail =0 then 
	lower(left(FirstName,3)+'_'+[LastName])+'@hotmail.com'
	when randomemail =1 then 
	lower(left(FirstName,3)+'_'+[LastName])+'@gmail.com'
	else
	lower(left(FirstName,3)+'_'+[LastName])+'@yahoo.com'
END
from random
