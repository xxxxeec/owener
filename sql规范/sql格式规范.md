## sql格式规范
1. 基本要求
   * 代码行清晰、整齐、层次分明、结构性强，易于阅读；
   * 代码中应具备必要的注释以增强代码的可读性和可维护性；
   * 代码应充分考虑执行效率，保证代码的高效性；  
错误代码：
```sql
SELECT mzh,pname,age,sex
FROM ms_brda 
WHERE mzh = 111
;
```
正确代码：
```sql
SELECT 
    mzh, --门诊号
    pname, --姓名
    age, --年龄
    sex --性别 
FROM ms_brda a 
WHERE mzh = 111
;
```

2. 大小写
   * 所有**对象名称**，包括schema 名称、表名称、视图名称、函数名称、字段名、别名等都统一使用**小写**；
   * 所有SQL 语句中的保留字都统一采用**大写**，例如**SELECT 、FROM、WHERE、AND、OR、UNION、INSERT、DELETE、GROUP、HAVING、COUNT**等等；
   * 表名、视图名、函数(FUNCTION)、字段名、字段别名等，使用规范命名，**不能**包含**中文和特殊字符**，对象名称应只包含字母、数字和“_”,不能包含其他字符；
  
3. 缩进和换行
   * 整个SQL语句最好按照子句进行分行编写;
   * 同一级别的子句间要对齐;
   * 分号放在SQL语句的最后，单独占一行；
   * 一行有多列并超过80个字符，基于列对齐原则，超过行宽的代码可折行与上行左对齐编排；
   * 每个字段后面，使用字段标题作为注释；
   * SQL 文中不应出现空行；
   * SQL语句内的算术运算符、逻辑运算符（AND、OR、NOT）、 比较运算符（=、<=、>=、>、<、<>、!=、BETWEEN AND）、IN、LIKE等运算符前后都应加一空格；

4. WHERE条件
   * 每个过滤条件单独一行；
   * AND OR 等关键字放行首；
错误代码：
```sql
SELECT 
     mzh, --门诊号
     pname, --姓名
     age, --年龄
     sex --性别 
FROM ms_brda a 
WHERE mzh = 111 AND pname = '张三' OR sex = '女'
;
```
正确代码：
```sql
SELECT 
     mzh, --门诊号
     pname, --姓名
     age, --年龄
     sex --性别 
FROM ms_brda a 
WHERE mzh = 111 
AND pname = '张三' 
OR sex = '女'
;
```

5. 表连接
   * 表连接中的每个表应指定缩写的别名；
   * 多表关联的时候，所有的关联必须写成JOIN的形式；
   * 慎用CROSS JOIN ，不要对大表使用CROSS JOIN 连接；
错误代码：
```sql
SELECT 
     a.emp_sn AS id, -- 记录主键 
     a.code AS doctorno, -- 医生工号 
     a.dept_sn2 AS keshibqid, -- 科室病区id 
     b.name AS keshibqmc -- 科室病区名称 
FROM a_employee_mi a ,
     zd_unit_code b
WHERE a.dept_sn2 = b.unit_sn 
;
```
正确代码：
```sql
SELECT 
     a.emp_sn AS id, -- 记录主键 
     a.code AS doctorno, -- 医生工号 
     a.dept_sn2 AS keshibqid, -- 科室病区id 
     b.name AS keshibqmc -- 科室病区名称 
FROM a_employee_mi a 
INNER JOIN zd_unit_code b 
      ON a.dept_sn2 = b.unit_sn
;
```

6. 排序语句
   * 不要在视图中使用ORDER BY排序语句，在视图中，排序语句会被忽略；
   * ORDER BY 语句执行成本很高，建议尽量避免使用；
   * 不要在大的数据集上执行排序操作；

7. CASE语句
   * CASE语句从CASE开头到END结束要用括弧包括起来，并给结果值赋别名字段；
   * WHEN子语在CASE语句的下一行并缩进两个缩进量后编写；
   * 每个WHEN子语一行编写，当然如果语句较长可换行编排；
   * CASE语句必须包含ELSE子语；
正确代码：
```sql
SELECT 
    mzh, --门诊号
    pname, --姓名
    age, --年龄 
    (CASE
       WHEN sex = '1' THEN '男'
       ELSE '女'
     END) AS sex --性别 1-男，2-女
FROM ms_brda a 
;
```

8. SQL语句注释
   * 对于较为复杂的数据操作例程应有充分的注释，注明实现的功能，业务逻辑关系输入输出关系等内容；
   * 多行注释可用 /*   */ 来标识，这种类型注释还可以注释在SQL语句中间；
   * 单行注释可用--来标识；  
   * 在SELECT语句中，源表的每个字段后面使用字段标题作为注释，其他语句中，尽量对字段做注释，尤其是经过加工处理的字段；
   * 有字典的，尽可能有注释；
正确代码：
```sql
/*
 *获取患者的基本信息
 */
SELECT 
    mzh, --门诊号
    pname, --姓名
    age, --年龄 
    sex --性别 1-男，2-女
FROM ms_brda a 
;
```


