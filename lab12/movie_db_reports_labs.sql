-- Active: 1663945334496@@127.0.0.1@3306@movie_db
SELECT s.song_name, b.band_name
FROM song as s
JOIN song_band as sb
	ON sb.song_song_id=s.song_id
JOIN band as b
	ON sb.b_band_id=b.band_id;


/* --------- Show all artist which are not associated with any band. -------- */
SELECT *
FROM artist as a
LEFT JOIN artist_band as ab
	ON a.artist_id=ab.a_artist_id
WHERE ab.artist_band_id IS NULL;