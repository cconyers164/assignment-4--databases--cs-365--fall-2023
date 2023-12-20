-- This CONCAT function will concatenate the name of the artist with the name of the album under a column called "Recording".
SELECT CONCAT(artist_name, " recorded ", album_name) AS Recording FROM Compiles;

--This command will show you a table with two columns labeled as artist_name and album_name. The name of the artists will be listed
--artist_name while the name of the albums will be listed underalbum_name.
SELECT artist_name, album_name FROM Artist JOIN Album ON Artist.artist_id = Album.artist_id WHERE Artist.artist_id IN (SELECT Album.artist_id FROM Album);

-- This command will show all the albums created by the artists.
SELECT * FROM Compiles;

-- This command will show the tracks belonging to every album in the database.
SELECT * FROM Contains;

-- This command will show all the played tracks in the database.
SELECT * FROM Played;

