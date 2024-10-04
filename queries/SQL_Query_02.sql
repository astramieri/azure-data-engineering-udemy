select 
ProductID, 
OrderQty, 
sum(OrderQty) over (partition by ProductID) as'Total Order Quantity by ProductID'
from SalesLT.SalesOrderDetail
order by ProductID asc;