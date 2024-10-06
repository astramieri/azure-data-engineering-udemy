# Azure Dedicated SQL Pool

**Azure Dedicated SQL pool** (formerly SQL DW) refers to the enterprise data warehousing features that are available in Azure Synapse Analytics.

Synapse SQL uses a scale-out architecture to distribute computational processing of data across multiple nodes. Compute is separate from storage, which enables you to scale compute independently of the data in your system.

For dedicated SQL pool, the unit of scale is an abstraction of compute power that is known as a **data warehouse unit (DWU)**.

For serverless SQL pool, being serverless, scaling is done automatically to accommodate query resource requirements. As topology changes over time by adding, removing nodes or failovers, it adapts to changes and makes sure your query has enough resources and finishes successfully. 

With decoupled storage and compute, when using Synapse SQL one can benefit from independent sizing of compute power irrespective of your storage needs. For serverless SQL pool scaling is done automatically, while for dedicated SQL pool one can:
- grow or shrink compute power, within a dedicated SQL pool, without moving data
- pause compute capacity while leaving data intact, so you only pay for storage
- resume compute capacity during operational hours

![Dedicated SQL Pool](../../images/dedicated_sql_pool.png)