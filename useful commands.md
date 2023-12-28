#### View all constraints for a table
```sql
SELECT
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE,
    STATUS,
    SEARCH_CONDITION
FROM
    USER_CONSTRAINTS
WHERE
    TABLE_NAME = 'INDUSTRY';
```


### Show all column names
```sql
SELECT
    COLUMN_NAME
FROM
    ALL_TAB_COLUMNS
WHERE
    TABLE_NAME = 'STOCKCLOSING';
```
