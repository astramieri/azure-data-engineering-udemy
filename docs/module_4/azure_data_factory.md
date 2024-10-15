# Azure Data Factory

**Azure Data Factory** is a cloud-based ETL and a data integration service.

With Azure Data Factory:
- you can connect to a variety of data sources/destinations
- you can create data-driven workflows
- you can orchestrate data movements
- you can trasform data at scale

An Azure subscription might have one or more Azure Data Factory instances or **data factories**. 

A data factory is composed of the following key components:
- Pipelines
- Activities
- Datasets
- Linked services
- Data Flows
- Integration Runtimes

These components work together to provide the platform on which you can compose data-driven workflows with steps to move and transform data.

## Pipelines

A pipeline is a logical grouping of activities that performs a unit of work. Together, the activities in a pipeline perform a task. 

For example, a pipeline can contain a group of activities that ingests data from an Azure blob, and then runs a Hive query on an HDInsight cluster to partition the data.

The benefit of this is that the pipeline allows you to manage the activities as a set instead of managing each one individually. The activities in a pipeline can be chained together to operate sequentially, or they can operate independently in parallel.

## Linked services

**Linked services** are much like connection strings, which define the connection information that's needed for Azure Data Factory to connect to external resources.

Linked services are used for two purposes:
- to represent a **data store**
- to represent a **compute resource**

