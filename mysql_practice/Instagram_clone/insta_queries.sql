SELECT
    username,
    created_at AS DATE_JOINED
FROM users
ORDER BY created_at LIMIT 5;
    
SELECT 
    COUNT(*) AS no_of_registers,
    DATE_FORMAT(created_at,"%W") as Registered_on
FROM users
GROUP BY Registered_on
ORDER BY no_of_registers DESC LIMIT 2;

SELECT
    username
FROM users
LEFT JOIN photos
ON users.id = photos.user_id
WHERE photos.user_id IS NULL;


SELECT
    username,
    image_url,
    COUNT(*) AS nlikes
FROM photos
INNER JOIN likes
ON photos.id = likes.photo_id
INNER JOIN users
ON photos.user_id = users.id
GROUP BY likes.photo_id
ORDER BY nlikes DESC LIMIT 1;


SELECT 
    username,
    AVG(photos.image_url) AS total_post_avg
FROM users
INNER JOIN photos
ON photos.user_id = users.id
GROUP BY username;
-- this is wrong need to correct this

-- total number of photos/total number of users
SELECT
    (SELECT COUNT(*) FROM photos)/
    (SELECT COUNT(*) FROM users);
    
SELECT 
    tags.tag_name,
    COUNT(image_url) AS count_used
FROM photo_tags
INNER JOIN tags
ON photo_tags.tag_id=tags.id
INNER JOIN photos
ON photo_tags.photo_id = photos.id
GROUP BY tags.id
ORDER BY count_used DESC LIMIT 5;


SELECT
    tags.tag_name,
    COUNT(photo_tags.photo_id) AS count_used
FROM tags 
INNER JOIN photo_tags
ON photo_tags.tag_id=tags.id
GROUP BY tags.id
ORDER BY count_used DESC LIMIT 5;

SELECT
    user_id,
    COUNT(*) as nlikes
FROM likes 
GROUP BY user_id
WHERE nlikes = (SELECT COUNT(*) FROM photos);
-- where caluse does not come after group by ,throws error

SELECT 
    username,
    COUNT(*) as num_likes
FROM users
INNER JOIN likes
ON likes.user_id = users.id 
GROUP BY likes.user_id
HAVING num_likes= (SELECT COUNT(*) FROM photos);
