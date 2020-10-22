-- SQL架构
-- Employees 表：

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | name          | varchar |
-- +---------------+---------+
-- id 是这张表的主键。
-- 这张表的每一行分别代表了某公司其中一位员工的名字和 ID 。
 

-- EmployeeUNI 表：

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | unique_id     | int     |
-- +---------------+---------+
-- (id, unique_id) 是这张表的主键。
-- 这张表的每一行包含了该公司某位员工的 ID 和他的唯一标识码（unique ID）。
 

-- 写一段SQL查询来展示每位用户的 唯一标识码（unique ID ）；如果某位员工没有唯一标识码，使用 null 填充即可。

-- 你可以以 任意 顺序返回结果表。

-- 查询结果的格式如下例所示：

-- Employees table:
-- +----+----------+
-- | id | name     |
-- +----+----------+
-- | 1  | Alice    |
-- | 7  | Bob      |
-- | 11 | Meir     |
-- | 90 | Winston  |
-- | 3  | Jonathan |
-- +----+----------+

-- EmployeeUNI table:
-- +----+-----------+
-- | id | unique_id |
-- +----+-----------+
-- | 3  | 1         |
-- | 11 | 2         |
-- | 90 | 3         |
-- +----+-----------+

-- EmployeeUNI table:
-- +-----------+----------+
-- | unique_id | name     |
-- +-----------+----------+
-- | null      | Alice    |
-- | null      | Bob      |
-- | 2         | Meir     |
-- | 3         | Winston  |
-- | 1         | Jonathan |
-- +-----------+----------+

-- Alice and Bob 没有唯一标识码, 因此我们使用 null 替代。
-- Meir 的唯一标识码是 2 。
-- Winston 的唯一标识码是 3 。
-- Jonathan 唯一标识码是 1 。

select a.unique_id ,b.name from Employees b left join EmployeeUNI a  using(id)