CREATE TABLE post (
  id serial primary key,
  headline varchar(300),
  copy varchar(400),
  tag varchar(100)
);

CREATE TABLE author (
  id serial primary key,
  name varchar(100),
  post_id integer
);

CREATE TABLE snippet (
  id serial primary key,
  url varchar(200),
  post_id integer
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
  post_id integer
);

CREATE TABLE image (
  id serial primary key,
  tag varchar(100),
  post_id integer
);