select
    h.SalesOrderID,
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
;