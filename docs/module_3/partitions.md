# Partitions

Table partitions enable you to divide your data into smaller groups of data. In most cases, table partitions are created on a date column. 

Partitioning is supported on all dedicated SQL pool table types including clustered columnstore, clustered index, and heap. 

Partitioning is also supported on all distribution types, including both hash or round robin distributed.

**NOTE**. While partitioning can be used to improve performance some scenarios, creating a table with too many partitions can hurt performance under some circumstances. These concerns are especially true for clustered columnstore tables.

```
CREATE TABLE myTable
(  
    id            INT           NOT NULL,  
    operationName VARCHAR(100) 
    time          DATETIME
)  
WITH 
(
    DISTRIBUTION = HASH(operationName)
    PARTITION (
        Time RANGE RIGHT FOR VALUES ('2024-01-01', '2024-05-01')
    )
);
```

## Partition switching

Dedicated SQL pool supports partition splitting, merging, and switching. Each of these functions is executed using the ALTER TABLE statement.