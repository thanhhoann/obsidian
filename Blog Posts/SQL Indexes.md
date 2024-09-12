SQL indexes are data structures that store a subset of data from a table in a way that allows for faster data retrieval. They are used to improve query performance by reducing the amount of data that needs to be scanned during a query execution. Indexes are particularly useful for large tables with many rows and columns, and for queries that involve searching, sorting, or joining data.

There are different types of indexes in SQL, including:

1. **Clustered Index**: This is a special type of index that determines the physical order of data in a table. Each table can have only one clustered index, and it is typically created on the primary key column(s) of the table. When data is inserted or updated, the rows are physically reordered to match the order of the clustered index.

Example:
```sql
CREATE CLUSTERED INDEX idx_employee_id ON Employees (EmployeeID);
```

2. **Non-Clustered Index**: This is the most common type of index, and it is a separate object from the table data. Non-clustered indexes store the values of the indexed columns and a pointer to the corresponding row in the table. Multiple non-clustered indexes can be created on a single table.

Example:
```sql
CREATE NONCLUSTERED INDEX idx_employee_name ON Employees (LastName, FirstName);
```

3. **Unique Index**: This type of index ensures that the indexed column(s) have unique values across all rows in the table. Unique indexes can be either clustered or non-clustered.

Example:
```sql
CREATE UNIQUE NONCLUSTERED INDEX idx_employee_email ON Employees (Email);
```

4. **Composite Index**: This is an index created on multiple columns in a table. Composite indexes can improve query performance when the query involves searching or sorting on multiple columns.

Example:
```sql
CREATE INDEX idx_employee_dept ON Employees (DepartmentID, HireDate);
```

Indexes can significantly improve query performance, but they also have some drawbacks. Creating and maintaining indexes requires additional storage space and can slow down data modification operations (INSERT, UPDATE, DELETE) because the index needs to be updated as well. Therefore, it's important to create indexes judiciously and only on columns that are frequently used in queries.

Explanation for a 3-year-old:

Imagine you have a big box of toys, and you want to find your favorite teddy bear quickly. It would be hard to look through the whole box every time, right? That's where indexes come in!

Indexes are like little helpers that make it easier to find things in a big collection, just like a table of contents in a book helps you find specific pages quickly.

When you create an index, it's like making a list of all your toys, sorted by their names or colors or sizes. So, instead of looking through the whole box, you can just check the list to see where your teddy bear is.

Indexes make it faster to find things, but they also take up a little bit of extra space, just like having a list takes up some extra paper. That's why we only make indexes for the toys we play with the most, so we don't waste too much space.

In the end, indexes are like little helpers that make it easier to find things quickly, just like how a list or a table of contents helps you find what you're looking for in a book or a toy box!