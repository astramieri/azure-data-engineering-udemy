# Transact-SQL

**Transact-SQL** is a language that's understood by the (Microsoft) SQL products, that is Microsoft SQL Server, Azure SQL Database, Azure Synapse, etc.

## Square brackets

In T-SQL, **square brackets [ ]** are used to delimit identifiers, such as table names, column names, schema names, etc. This is helpful in several scenarios:
- **Reserved Words**: If an identifier is a reserved keyword in SQL (e.g., User, Order), using square brackets allows you to use it as an identifier without causing a syntax error.
- **Special Characters**: If an identifier contains special characters (e.g., spaces, dashes), square brackets allow you to define these names correctly. For example, [Sales Amount] or [Order-Number].
- **Case Sensitivity**: In SQL Server, by default, identifiers are not case-sensitive, but in environments with case-sensitive collations, square brackets ensure that the exact identifier is used.
