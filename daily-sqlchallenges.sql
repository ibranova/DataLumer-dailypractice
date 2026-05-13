-- Day 1: Histogram of Tweets

/* Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022.
 Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.

In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group. */

-- SQL Query:
select tweet_bucket, count(*) as users_num 
FROM 
    (SELECT user_id, count(*) as tweet_bucket FROM tweets 
    where tweet_date Between '01/01/2022'  and '12/31/2022'
    group by user_id) as a 
group by tweet_bucket order by 1 ;

-- Day 2: Data Science Skills
/*Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job.
You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.

Write a query to list the candidates who possess all of the required skills for the job.
 Sort the output by candidate ID in ascending order.*/

 -- SQL Query: 
 SELECT candidate_id
FROM candidates
where skill in ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING count(skill) = 3;

-- Day 3: Page With No Likes
/*
Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").

Write a query to return the IDs of the Facebook pages that have zero likes.
The output should be sorted in ascending order based on the page IDs.
*/

-- Query: 
SELECT p.page_id
FROM pages p
FULL JOIN page_likes pl
ON p.page_id = pl.page_id
GROUP BY p.page_id
HAVING COUNT(liked_date) = 0
ORDER BY p.page_id ASC;