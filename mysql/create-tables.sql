CREATE TABLE IF NOT EXISTS Artist (
  artist_id   INT          NOT NULL,
  artist_name VARCHAR(128) NOT NULL,
  PRIMARY KEY (artist_id)
);

CREATE TABLE IF NOT EXISTS Album (
  artist_id  INT          NOT NULL,
  album_id   INT          NOT NULL,
  album_name VARCHAR(128) NOT NULL,
  PRIMARY KEY (album_id),
  FOREIGN KEY (artist_id, album_id) REFERENCES Artist(artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS Track (
  artist_id  INT          NOT NULL,
  album_id   INT          NOT NULL,
  track_id   INT          NOT NULL,
  track_name VARCHAR(128) NOT NULL,
  time       DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (artist_id, album_id, track_id),
  FOREIGN KEY (artist_id, album_id) REFERENCES Album(artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS Played (
  artist_id  INT          NOT NULL,
  album_id   INT          NOT NULL,
  track_id   INT          NOT NULL,
  played     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (artist_id, album_id, track_id, played),
  FOREIGN KEY (artist_id, album_id, track_id) REFERENCES Track(artist_id, album_id, track_id)
);





