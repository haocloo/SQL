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