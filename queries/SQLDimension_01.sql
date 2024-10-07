create table DWH.DimCustomer
(
    CustomerID int not null,
    CompanyName varchar(500) not null
);

-- select
--     top 10
--     c.CustomerID,
--     c.CompanyName
-- from SalesLT.Customer c
-- ;