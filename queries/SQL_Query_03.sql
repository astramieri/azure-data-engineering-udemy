-- CTE (commmon table expression)
with CTE_Products as (
select ProductID, OrderQty
from SalesLT.SalesOrderDetail
)
select * from CTE_Products;