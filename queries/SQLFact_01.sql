create table DWH.FactSales
(
    SalesOrderID int not null,
    OrderDate datetime not null,
    CustomerID int not null,
    SubTotal money not null,
    TaxAmt money not null,
    Freight money not null,
    OrderQty int not null,
    ProductID int not null,
    UnitPrice money not null,
    UnitPriceDiscount money not null,
    LineTotal decimal not null
);

select
    -- top 10
    h.SalesOrderID,
    h.OrderDate,
    h.CustomerID,
    h.SubTotal,
    h.TaxAmt,
    h.Freight,
    d.OrderQty,
    d.ProductID,
    d.UnitPrice,
    d.UnitPriceDiscount,
    d.LineTotal
from SalesLT.SalesOrderHeader h
    join SalesLT.SalesOrderDetail d
    on h.SalesOrderID = d.SalesOrderID
--where d.OrderQty is null
;