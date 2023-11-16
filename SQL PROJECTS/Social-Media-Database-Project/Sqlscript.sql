 -- 1 . Find the total number of users in data
 
 select count(user_id) from users;
 
 -- 2 . Find most commonly used hastags
 
 SELECT h.hashtag_name,
       Count(h.hashtag_name) AS "tags count"
FROM   hashtags h
       inner JOIN post_tags ph
               ON h.hashtag_id = ph.hashtag_id
GROUP  BY h.hashtag_name
ORDER  BY Count(h.hashtag_name) DESC
LIMIT  5;

-- 3. Find most followed hashtags

SELECT h.hashtag_name,
       Count(h.hashtag_name) AS "Most Followed hashtags"
FROM   hashtags h
       inner JOIN hashtag_follow ph
               ON h.hashtag_id = ph.hashtag_id
GROUP  BY h.hashtag_name
ORDER  BY Count(h.hashtag_name) desc
LIMIT  5; 


-- 4  Most Inactive User
SELECT user_id, username AS 'Most Inactive User'
FROM users
WHERE user_id NOT IN (SELECT user_id FROM post);

-- 5 Average post per user
SELECT ROUND((COUNT(post_id) / COUNT(DISTINCT user_id) ),2) AS 'Average Post per User' 
FROM post;


-- 6 User Never Comment
SELECT user_id, username AS 'User Never Comment'
FROM users
WHERE user_id NOT IN (SELECT user_id FROM comments);


-- 7.Posted more than 5 times
SELECT user_id, COUNT(user_id) AS post_count FROM post
GROUP BY user_id
HAVING post_count > 5
ORDER BY COUNT(user_id) DESC;


-- 8. Followers > 40
SELECT followee_id, COUNT(follower_id) AS follower_count FROM follows
GROUP BY followee_id
HAVING follower_count > 40
ORDER BY COUNT(follower_id) DESC;


-- 9. Longest captions in post
SELECT user_id, caption, LENGTH(post.caption) AS caption_length FROM post
ORDER BY caption_length DESC LIMIT 5;


-- 10. People who have been using the platform for the longest time.
SELECT user_id,
       username,
       created_at
FROM   users
ORDER  BY created_at
LIMIT  5;