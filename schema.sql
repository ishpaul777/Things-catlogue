CREATE TABLE item (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  FOREIGN KEY (genre_id) REFERENCES genres (id),
);

CREATE TABLE book (
  id  INT,
  title VARCHAR(150),
  publisher VARCHAR(150),
  cover_state VARCHAR(150),
  FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE labels (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(100),
  color VARCHAR(100),
);

CREATE TABLE music_album (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  on_spotify BOOLEAN,
  publish_date DATE,
  archived BOOLEAN
);

CREATE TABLE genre (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(200)
);

CREATE TABLE game (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  multiplayer BOOLEAN,
  last_played_at DATE,
  publish_date DATE,
  archived BOOLEAN
);

CREATE TABLE author (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);
