# Indexes

Dedicated SQL pool offers several indexing options including **clustered columnstore indexes**, **clustered indexes** and **nonclustered indexes**, and a non-index option also known as **heap**.

## Clustered Columnstore indexes

By default, dedicated SQL pool creates a clustered columnstore index when no index options are specified on a table. Clustered columnstore tables offer both the highest level of data compression and the best overall query performance. 

Clustered columnstore tables will generally outperform clustered index or heap tables and are usually **the best choice for large tables**. For these reasons, clustered columnstore is the best place to start when you are unsure of how to index your table.

```
CREATE TABLE myTable
(  
    id       int         NOT NULL,  
    lastName varchar(20),  
    zipCode  varchar(6)  
)  
WITH 
(
    CLUSTERED COLUMNSTORE INDEX 
);
```

There are a few scenarios where clustered columnstore may not be a good option:
- Columnstore tables do not support *varchar(max)*, *nvarchar(max)*, and *varbinary(max)*. Consider heap or clustered index instead.
- Columnstore tables may be less efficient for transient data. Consider heap and perhaps even temporary tables.
- Small tables with less than 60 million rows. Consider heap tables.

## Clustered and nonclustered indexes

Clustered indexes may outperform clustered columnstore tables when a **single row needs to be quickly retrieved**. For queries where a single or very few row lookup is required to perform with extreme speed, consider a clustered index or nonclustered secondary index. 

The disadvantage to using a clustered index is that only queries that benefit are the ones that use a highly selective filter on the clustered index column. **To improve filter on other columns, a nonclustered index can be added to other columns**. However, each index that is added to a table adds both space and processing time to loads.

```
CREATE TABLE myTable
  (  
    id       int         NOT NULL,  
    lastName varchar(20),  
    zipCode  varchar(6)  
  )  
WITH 
( 
    CLUSTERED INDEX (id) 
);
```

```
CREATE INDEX zipCodeIndex ON myTable (zipCode);
```

## Heap tables 

If you are loading data only to stage it before running more transformations, loading the table to heap table is much faster than loading the data to a clustered columnstore table. In addition, loading data to a temporary table loads faster than loading a table to permanent storage. After data loading, you can create indexes in the table for faster query performance.

```
CREATE TABLE myTable
  (  
    id       int         NOT NULL,  
    lastName varchar(20),  
    zipCode  varchar(6)  
  )  
WITH ( 
    HEAP 
);
```