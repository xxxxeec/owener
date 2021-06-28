## 项目名称
区域医疗机构数据标准化



## 运行条件
* 医疗机构数据库连接信息
* 能够连接多种数据库的工具，例如dbeaver、navicat等
* 本地和远程桌面直接能够复制粘贴



## 运行说明
1. 运行sql尽可能限定范围，不要全表扫描 
2. DML只能执行select语句，**insert、delete、update、truncate不能执行**
3. DDL语句统统不能执行，包括但不限于**CREATE、ALTER、DROP、TRUNCATE等**  



## 测试说明
1. 先进行思路梳理，你要写的是什么，数据来源的主表是哪张，目标表和数据来源表的对应关系是什么
2. 运行sql执行计划，看看哪些语句耗时长需要优化，哪些表全面扫描，进行优化，**不能在数据来源表上面建索引、修改字段类型等**
3. 整个sql语句是否按照sql规则来编写，是否加了注释等



## 技术要求
* 数据库基础
* 数据结构 
* sql编写
* python(用来处理一下sql不能处理的问题)
* linux基础指令


## 协作者
| 姓名 | 用户名 | 邮箱 |
| ---  | ----  | ---- |
| 金诚 | NikolaiJ | jc@group-ds.com |  
| 林晨 | cenyanming | lc@group-ds.com |
| 张鑫 | xxxeeec | zx@group-ds.com |