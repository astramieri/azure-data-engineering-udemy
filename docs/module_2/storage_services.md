# Azure Storage Services

**Azure Storage** is a Microsoft-managed service providing cloud storage that is highly available, secure, durable, scalable, and redundant. 

Azure Storage includes:
- Azure Blobs (objects)
- Azure Data Lake Storage Gen2
- Azure Files
- Azure Queues
- Azure Tables

**IMPORTANT** The name of the Storage Account **needs to be unique** across Azure.

## Azure Blobs

A **container** is a root folder for holding objects.

When you upload a file into a container, it is actually stored as a **binary object (blob)**.

    https://storageaccount01.blob.core.windows.net/container01/file01.csv

## Azure Date Lake Storage Gen2

In order to have a Data Lake Gen2 Storage service you need to enable the **Hierarchical Namespace**.

In addition to uploading objects, there is the option of **adding a directory**. You can also add individual permissions for the files and folders.
