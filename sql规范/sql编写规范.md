## sql编写规范
1. 避免直接查询全表  
   错误代码：`select * from A`，如果查询工具没有制定返回的条数，则会返回整张表的数据  
   正确代码：  
   ```sql
   oracle: SELECT * FROM A WHERE ROWNUM<100;  
   sqlserver: SELECT TOP 100 * FROM A;  
   mysql：SELECT * FROM A LIMIT 100;
   ......
   ```
   
2. 搜索严禁左模糊或者全模糊  
   索引文件具有B-tree的最左前缀匹配特性，如果左边的值未确定，那么无法使用此索引，左模糊必然走全表扫描，导致相关列的索引无法使用，除非必要，否则不要在关键词前加%。  
   错误代码：
   ```sql
   SELECT * FROM A WHERE column LIKE '%xx';
   SELECT * FROM A WHERE column LIKE '%xx%';
   ```

   正确代码：  
   ```sql
   SELECT * FROM A WHERE column LIKE 'xx%';
   ```

3. 禁止在WHERE中对列进行转换  
   WHERE从句中禁止对列进行函数转换和计算，应将SQL语句中的数据库函数、计算表达式等放置在等号右边  
   说明：对列进行函数转换或计算时会导致无法使用索引。  
   错误代码：
   ```sql
   SELECT * FROM A
   WHERE DATE(create_time) = '20210101'
   ;
   ```
   正确代码：  
   ```sql
   SELECT * FROM A
   WHERE create_time >= '20210101' 
   AND create_time < '20210102'
   ;
   ```

4. 避免数据类型的隐式转换
   建表语句
   ```sql
   CREATE TABLE A (
       id INT,       
       pname VARCHAR(20)   
       )
    ;
   ```
   索引：
   ```sql
   CREATE INDEX idx_id ON A(id);
   ```
   需要join的字段，数据类型必须绝对一致  
   多表关联查询时，保证被关联的字段需要有索引  
   错误代码：
   ```sql
   SELECT * FROM A WHERE id = '123';
   ```
   正确代码：  
   ```sql
   SELECT * FROM A WHERE id = 123;
   ```

5. count使用  
   不要使用count(列名)或count(常量)来替代count(*),  
   count(*)是SQL92定义的标准统计行数的语法，跟数据库无关，跟NULL和非NULL无关。  
   count(*)会统计值为NULL的行，而count(列名)不会统计此列值为NULL值的行。  
   错误代码：
   ```sql
   SELECT count(columnName) FROM A ;
   ```
   正确代码：  
   ```sql
   SELECT count(*) FROM A ;
   ```

6. 尽可能避免子查询  
   尽可能避免使用子查询，可以把子查询优化为join操作  
   通常子查询在in子句中，且子查询中为简单SQL(不包含union、group by、order by、limit从句)时，才可以把子查询转化为关联查询进行优化。  
   子查询性能差的原因： 
   * 子查询的结果集无法使用索引，通常子查询的结果集会被存储到临时表中，不论是内存临时表还是磁盘临时表都不会存在索引，所以查询性能会受到一定的影响；  
   * 特别是对于返回结果集比较大的子查询，其对查询性能的影响也就越大；  
   * 由于子查询会产生大量的临时表也没有索引，所以会消耗过多的CPU和IO资源，产生大量的慢查询。  
   原先代码：
   ```sql
   SELECT a.code AS doctorno -- 医生工号 
   FROM a_employee_mi a 
   WHERE a.dept_sn2 IN ( 
       SELECT unit_sn 
       from zd_unit_code 
       WHERE lvl > 3 
       )
    ;
   ```
   修改后代码：  
   ```sql
   SELECT a.code AS doctorno -- 医生工号 
   FROM a_employee_mi a 
   INNER JOIN zd_unit_code b 
         ON a.dept_sn2 = b.unit_sn 
   WHERE b.lvl > 3
   ;
   ```


