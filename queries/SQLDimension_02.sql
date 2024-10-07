create table DWH.DimProduct
(
    ProductID int not null,
    ProductNumber varchar(100) not null,
    Color varchar(20) not null,
    ProductCategoryID int not null,
    ProductCategoryName varchar(200) not null
);

-- select
--     top 10
--     p.ProductID,
--     p.ProductNumber,
--     p.Color,
--     p.ProductCategoryID,
--     c.Name as 'ProductCategoryName'
-- from SalesLT.Product p
--     join SalesLT.ProductCategory c
--     on p.ProductCategoryID = c.ProductCategoryID
-- where p.Color is not null
-- ;