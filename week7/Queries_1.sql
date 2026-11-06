use movie_db;
# 1. Show the films with a budget greater than $10 million and a ranking lower than 6.
SELECT title, budget, ranking
from movies
WHERE budget > 10000000 AND ranking < 6;
# 2. Show the action films with a rating higher than 8.8, produced after 2009.

SELECT title, rating, year
FROM movies m
JOIN genres g ON g.movie_id = m.movie_id
WHERE g.genre_name = 'Action' AND m.rating > 8.8 AND m.year > 2009;

# 3. Show the drama films with a duration of more than 150 minutes and more than 2 Oscars.
SELECT title, duration, oscars
FROM movies m
JOIN genres g ON m.movie_id = g.movie_id
WHERE g.genre_name = 'Drama' AND m.duration > 150 AND m.oscars > 2;

SELECT title, duration, oscars
FROM movies
WHERE duration > 150 AND oscars > 2
AND movie_id in(SELECT movie_id from genres WHERE genre_name= 'Drama');

# 4. Show the thriller films whose budget is greater than 25 million$.
SELECT title, budget
FROM movies
WHERE budget > 25000000 AND movie_id
in (SELECT movie_id from genres WHERE genre_name= 'Thriller');

SELECT movies.movie_id, movies.title, movies.budget
FROM movies
JOIN genres ON movies.movie_id = genres.movie_id
WHERE movies.budget > 25000000 AND genres.genre_name = 'Thriller';

# 5. Show the drama films whose language is Italian and produced between 1990-2000.	
SELECT m.title, m.year
FROM movies m
JOIN genres g ON m.movie_id = g.movie_id
JOIN languages l ON m.movie_id = l.movie_id
WHERE g.genre_name = 'Drama'
AND l.language_name = 'Italian'
AND m.year BETWEEN 1990 AND 2000;

# 6. Show the Quentin Tarantino films which have more than 500000 votes and produced before 2000.