CREATE TABLE micro_post (
  id serial primary key,
  tag varchar(100)
);

CREATE TABLE author (
  id serial primary key,
  name varchar(100),
  micro_post_id integer
);

CREATE TABLE snippet (
  id serial primary key,
  url varchar(200),
  micro_post_id integer
);

CREATE TABLE subscriber (
  id serial primary key,
  name varchar(100),
  email varchar(100),
  phone_number varchar(100)
);

CREATE TABLE tag (
  id serial primary key,
  name varchar(100),
  micro_post_id integer
);

CREATE TABLE image (
  id serial primary key,
  tag varchar(100),
  micro_post_id integer
);