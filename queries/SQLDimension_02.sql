select
    top 10
    p.ProductID,
    p.ProductNumber,
    p.Color,
    p.ProductCategoryID,
    c.Name as 'ProductCategoryName'
from SalesLT.Product p
    join SalesLT.ProductCategory c
    on p.ProductCategoryID = c.ProductCategoryID
where p.Color is not null
;