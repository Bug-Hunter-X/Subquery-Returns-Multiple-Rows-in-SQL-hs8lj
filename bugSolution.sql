To fix this, you need to modify the subquery to return only one row. One approach is to use aggregate functions with a `GROUP BY` clause to consolidate results.  Another solution is to use `IN` or `EXISTS` instead of `=`.

Here are a couple of corrected versions:

**Using `IN`:**
```sql
SELECT * FROM employees WHERE department_id IN (SELECT department_id FROM departments WHERE location = 'London');
```
This approach selects all employees from departments in London.

**Using `EXISTS` (Generally preferred for better performance):**
```sql
SELECT * FROM employees WHERE EXISTS (SELECT 1 FROM departments WHERE location = 'London' AND departments.department_id = employees.department_id);
```
This approach checks for the existence of matching departments before selecting employees.  It often performs better than the `IN` approach.

Choose the most suitable solution based on your specific needs and database system.