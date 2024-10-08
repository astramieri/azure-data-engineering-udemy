# Azure Dedicated SQL Pool

**Azure Dedicated SQL pool** (formerly SQL DW) refers to the enterprise data warehousing features that are available in Azure Synapse Analytics.

Synapse SQL uses a scale-out architecture to distribute computational processing of data across multiple nodes. **Compute is separate from storage**, which enables you to **scale compute independently of the data** in your system.

For dedicated SQL pool, the unit of scale is an abstraction of compute power that is known as a **data warehouse unit (DWU)**.

For serverless SQL pool, being serverless, scaling is done automatically to accommodate query resource requirements. As topology changes over time by adding, removing nodes or failovers, it adapts to changes and makes sure your query has enough resources and finishes successfully. 

With decoupled storage and compute, when using Synapse SQL one can benefit from independent sizing of compute power irrespective of your storage needs. For serverless SQL pool scaling is done automatically, while for dedicated SQL pool one can:
- grow or shrink compute power, within a dedicated SQL pool, without moving data
- pause compute capacity while leaving data intact, so you only pay for storage
- resume compute capacity during operational hours

![Dedicated SQL Pool](../../images/dedicated_sql_pool.png)

## Dedicated SQL Pool vs Serverless SQL Pool

With the Serverless SQL pool, you can just define the table schema, but the data itself resides in external storage.

If you need to persist the data in actual tables and query them via SQL, you need to a SQL data warehouse in place. You can host a SQL data warehouse with the help of dedicated SQL pool.

**NOTE**. In the dedicated SQL pool, in addition to creating our normal tables, you can also create external tables as well.

## Hash Distributed tables

An **Hash Distributed table** distributes table rows across the compute nodes by using a deterministic hash function to assign each row to one distribution. 

Hash-distribution improves query performance **on large fact tables**. 

A hash-distributed table has a **distribution column or set of columns that is the hash key**.

To balance the parallel processing, select a distribution column or set of columns that:
- **Has many unique values**. One or more distribution columns can have duplicate values. All rows with the same value are assigned to the same distribution. Since there are 60 distributions, some distributions can have > 1 unique values while others can end with zero values.
- **Does not have NULLs, or has only a few NULLs**. For an extreme example, if all values in the distribution columns are NULL, all the rows are assigned to the same distribution. As a result, query processing is skewed to one distribution, and does not benefit from parallel processing.
- **Is not a date column**. All data for the same date lands in the same distribution, or will cluster records by date. If several users are all filtering on the same date (such as today's date), then only 1 of the 60 distributions does all the processing work.

### Example

```
CREATE TABLE [dbo].[FactInternetSales]
(   
    [ProductKey]        int          NOT NULL,
    [OrderDateKey]      int          NOT NULL,
    [CustomerKey]       int          NOT NULL,
    [PromotionKey]      int          NOT NULL,
    [SalesOrderNumber]  nvarchar(20) NOT NULL,
    [OrderQuantity]     smallint     NOT NULL,
    [UnitPrice]         money        NOT NULL,
    [SalesAmount]       money        NOT NULL
)
WITH
(   
    CLUSTERED COLUMNSTORE INDEX,  
    DISTRIBUTION = HASH([ProductKey])
);
```

## Round-Robin Distributed tables

A **Round-Robin distributed table** distributes table rows evenly across all distributions. The assignment of rows to distributions is random. 

Unlike hash-distributed tables, rows with equal values are not guaranteed to be assigned to the same distribution. Consider using the round-robin distribution for your table when the table is a **temporary staging table**.

**NOTE.** When you don't specify any sort of distribution, the default is the Round-Robin distribution.

## Replicated Tables

Another table storage option is to replicate a small table across all the compute nodes. 

**Replicated tables work well for dimension tables in a star schema**. Dimension tables are typically joined to fact tables, which are distributed differently than the dimension table. 

Dimensions are usually of a size that makes it feasible to store and maintain multiple copies.


