CREATE TABLE IF NOT EXISTS Artist (
  artist_id INT NOT NULL,
  artist_name VARCHAR(128) NOT NULL,
  PRIMARY KEY (artist_id)
);

CREATE TABLE IF NOT EXISTS Compiles (
  artist_name VARCHAR(128) REFERENCES Artist(artist_name),
  album_name  VARCHAR(128) REFERENCES Album(album_name),
  artist_id INT REFERENCES Artist(artist_id)
);

CREATE TABLE IF NOT EXISTS Album (
  artist_id  INT NOT NULL,
  album_id   INT NOT NULL,
  album_name VARCHAR(128) NOT NULL,
  PRIMARY KEY (artist_id, album_id),
  FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

CREATE TABLE IF NOT EXISTS Contains (
  album_name VARCHAR(128) REFERENCES Album(album_name),
  track_name VARCHAR(128) REFERENCES Track(track_name)
);

CREATE TABLE IF NOT EXISTS Track (
  artist_id  INT NOT NULL,
  album_id   INT NOT NULL,
  track_id   INT NOT NULL,
  track_name VARCHAR(128) NOT NULL,
  time       DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (artist_id, album_id, track_id),
  FOREIGN KEY (artist_id, album_id) REFERENCES Album(artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS Played (
  track_name VARCHAR(128) REFERENCES Contains(track_name),
  played TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (played)
);

CREATE UNIQUE INDEX idx_Artist ON Artist(artist_id);
CREATE UNIQUE INDEX idx_Album ON Album(artist_id, album_id);
CREATE UNIQUE INDEX idx_Track ON Track(artist_id, album_id, track_id);



