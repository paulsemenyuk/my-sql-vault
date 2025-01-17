-- Solution

WITH songs as (
  SELECT
    user_id,
    song_id,
    COUNT(listen_time) as song_plays
  FROM songs_weekly
  WHERE listen_time <= '08/04/2022 23:59:59'
  GROUP BY user_id,song_id

  UNION ALL

  SELECT
    user_id,
    song_id,
    song_plays
  FROM songs_history)
SELECT
  user_id,
  song_id,
  SUM(song_plays) as song_plays
FROM songs
GROUP BY user_id,song_id
ORDER BY song_plays DESC

-- Other solution
