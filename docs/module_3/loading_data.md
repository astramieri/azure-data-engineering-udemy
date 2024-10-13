# Loading Data Techniques

Azure Data Factory and Synapse pipelines support three ways to load data into Azure Synapse Analytics:
- Use **COPY command**
- Use **PolyBase**
- Use **Bulk Insert**

The two options labeled **PolyBase** and the **COPY command** are only applicable to Azure Synapse Analytics (formerly Azure SQL Data Warehouse). They are both fast methods of loading which involve staging data in Azure storage (if it’s not already in Azure Storage) and using a fast, highly parallel method of loading to each compute node from storage. Especially on large tables these options are preferred due to their scalability but they do come with some restrictions (see documentation).

In contrast, on Azure Synapse Analytics a **Bulk Insert** is a slower load method which loads data through the control node and is not as highly parallel or performant. It is an order of magnitude slower on large files, but it can be more forgiving in terms of data types and file formatting.