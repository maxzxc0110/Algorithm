-- SQL架构
-- Views 表：

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | article_id    | int     |
-- | author_id     | int     |
-- | viewer_id     | int     |
-- | view_date     | date    |
-- +---------------+---------+
-- 此表无主键，因此可能会存在重复行。
-- 此表的每一行都表示某人在某天浏览了某位作者的某篇文章。
-- 请注意，同一人的 author_id 和 viewer_id 是相同的。
 

-- 请编写一条 SQL 查询以找出所有浏览过自己文章的作者，结果按照 id 升序排列。

-- 查询结果的格式如下所示：

-- Views 表：
-- +------------+-----------+-----------+------------+
-- | article_id | author_id | viewer_id | view_date  |
-- +------------+-----------+-----------+------------+
-- | 1          | 3         | 5         | 2019-08-01 |
-- | 1          | 3         | 6         | 2019-08-02 |
-- | 2          | 7         | 7         | 2019-08-01 |
-- | 2          | 7         | 6         | 2019-08-02 |
-- | 4          | 7         | 1         | 2019-07-22 |
-- | 3          | 4         | 4         | 2019-07-21 |
-- | 3          | 4         | 4         | 2019-07-21 |
-- +------------+-----------+-----------+------------+

-- 结果表：
-- +------+
-- | id   |
-- +------+
-- | 4    |
-- | 7    |
-- +------+

select a.author_id as id from Views a join Views b on a.author_id = b.author_id and a.viewer_id = b.viewer_id and a.author_id = a.viewer_id group by a.author_id order by a.author_id