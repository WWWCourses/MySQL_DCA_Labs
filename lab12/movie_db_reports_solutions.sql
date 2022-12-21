-- Active: 1663945334496@@127.0.0.1@3306@movie_db
/* --------------------------- Soundtrack Reports --------------------------- */
### Show all songs performed by each band
	SELECT s.song_name, b.band_name
	FROM band as b
	LEFT JOIN song_band as sb
		ON b.band_id=sb.b_band_id
	LEFT JOIN song as s
		ON s.song_id=sb.song_song_id;
--

### Show all songs performed by each artist
	SELECT a.artist_name, s.song_name
	FROM artist as a
	JOIN song_artist as sa
		ON a.artist_id=sa.a_artist_id
	JOIN song as s
		ON s.song_id=sa.s_song_id;
--

### Show how many songs each artist have performed.
##  Sort data by song count in descending order
	SELECT a.artist_name, COUNT(s.song_id) as song_count
	FROM artist as a
	JOIN song_artist as sa
		ON a.artist_id=sa.a_artist_id
	JOIN song as s
		ON s.song_id=sa.s_song_id
	GROUP BY a.artist_id
	ORDER BY song_count DESC;
--

### Show all artists names and the band they are associated (if there is any)
	SELECT a.artist_name,b.band_name
	FROM artist as a
	LEFT JOIN artist_band as ab
		ON a.artist_id=ab.a_artist_id
	LEFT JOIN band as b
		ON b.band_id=ab.b_band_id;
--

### Show only artists,which are associated with a band, and the role they play in it:
	SELECT a.artist_name,b.band_name,ab.band_role
	FROM artist as a
	JOIN artist_band as ab
		ON a.artist_id=ab.a_artist_id
	JOIN band as b
		ON b.band_id=ab.b_band_id;
--

### Show all artist which are not associated with any band
	SELECT a.artist_name
	FROM artist as a
	LEFT JOIN artist_band as ab
		ON a.artist_id=ab.a_artist_id
	WHERE ab.a_artist_id IS NULL;
--

### How many songs are performed by artists which are not associated with any band?
	SELECT t.artist_name,s.song_name
	FROM song as s
	JOIN song_artist as sa
		ON s.song_id=sa.s_song_id
	JOIN (
		SELECT a.artist_id,a.artist_name
		FROM artist as a
		LEFT JOIN artist_band as ab
			ON a.artist_id=ab.a_artist_id
		WHERE ab.a_artist_id IS NULL
	) as t
		ON t.artist_id=sa.a_artist_id;
--

/* ------------------------------ Movie reports ----------------------------- */
### Show movie with highest rating
	SELECT * FROM movie
	WHERE movie_rating = (
		SELECT MAX(movie_rating) as max_rating
		FROM movie
	);
--

### Show the newest and the oldest movie
	SELECT movie_title,movie_release_date FROM movie as m
	JOIN (
		SELECT MIN(movie_release_date) as mini, MAX(movie_release_date) as maxi FROM movie
	)as t
	WHERE movie_release_date IN (t.mini,t.maxi);
--


### Which is the most common person last_name:
	SELECT COUNT(person_last_name) as name_count, person_last_name
	FROM person
	GROUP BY person_last_name
	ORDER BY name_count DESC;
--

### Show the person which share same family (i.e. find 2 or more person with same family )
	SELECT COUNT(person_last_name) as name_count, person_last_name, GROUP_CONCAT(person_first_name)
	FROM person
	GROUP BY person_last_name
	HAVING name_count>1
	ORDER BY name_count DESC;
--

### How many are the person with unique family
	-- SELECT DISTINCT(person_last_name) FROM person;
	-- SELECT COUNT(DISTINCT person_last_name) FROM person;

	SELECT person_first_name, person_last_name
	FROM person
	WHERE person_last_name NOT IN(
		SELECT person_last_name
		FROM person
		GROUP BY person_last_name
		HAVING COUNT(person_last_name)>1
	);
--

### Show Comedy movies:
	SELECT *
	FROM movie as m
	JOIN movie_genre as mg
		ON m.movie_id=mg.m_movie_id
	JOIN genre as g
		ON g.genre_id=mg.g_genre_id
	WHERE g.genre_type LIKE 'Comedy' AND ;

### Show movies count per each genre
	SELECT COUNT(mg.g_genre_id) as movie_count,g.genre_type
	FROM genre as g
	JOIN movie_genre as mg
		ON g.genre_id=mg.g_genre_id
	GROUP BY mg.g_genre_id
	ORDER BY movie_count DESC;
--

### Show Drama movies with lowest rating
	SELECT m.movie_title, m.movie_rating, g.genre_type
	FROM movie as m
	JOIN  movie_genre as mg
		ON m.movie_id=mg.m_movie_id
	JOIN genre as g
		ON g.genre_id=mg.g_genre_id
	WHERE g.genre_type LIKE 'Drama' AND m.movie_rating = (
		### Select min movie_rating for all Drama movies
		SELECT  MIN(movie_rating)
		FROM movie as m
		JOIN  movie_genre as mg
			ON m.movie_id=mg.m_movie_id
		JOIN genre as g
			ON g.genre_id=mg.g_genre_id
		WHERE g.genre_type LIKE 'Drama'
	);
---


### Show movies with highest rating and the actors which play:
	SELECT m.movie_title, m.movie_rating,
	CONCAT_WS(" ",p.person_first_name, p.person_last_name) as actor, r.role_desc
	FROM person as p
	JOIN role as r
		ON p.person_id=r.p_person_id AND r.role_desc LIKE '%actor%'
	JOIN (
		SELECT * FROM movie
		WHERE movie_rating = (
			SELECT MAX(movie_rating) as max_rating
			FROM movie
		)
	) as m
		ON r.m_movie_id=m.movie_id
	ORDER BY m.movie_title;
--


/* ------------------------------ Export as CSV ----------------------------- */
### Export with column names
	SELECT 'movie_title', 'movie_rating', 'actor', 'role'
	UNION ALL
	SELECT * FROM (
		SELECT m.movie_title, m.movie_rating,
		CONCAT_WS(" ",p.person_first_name, p.person_last_name) as actor, r.role_desc
		FROM person as p
		JOIN role as r
			ON p.person_id=r.p_person_id AND r.role_desc LIKE '%actor%'
		JOIN (
			SELECT * FROM movie
			WHERE movie_rating = (
				SELECT MAX(movie_rating) as max_rating
				FROM movie
			)
		) as m
			ON r.m_movie_id=m.movie_id
		ORDER BY m.movie_title
	) as m
	INTO OUTFILE '/var/lib/mysql-files/actors_movies_hieghest_raitings.csv'
	FIELDS ENCLOSED BY '"'
	TERMINATED BY ','
	LINES TERMINATED BY '\n';
--

SHOW VARIABLES LIKE "secure_file_priv";
