select ProductID, sum(OrderQty) as 'Sum of Orders'
from SalesLT.SalesOrderDetail
group by ProductID;