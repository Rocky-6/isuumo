DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
	id          INTEGER             NOT NULL PRIMARY KEY,
	name        VARCHAR(64)         NOT NULL,
	description VARCHAR(4096)       NOT NULL,
	thumbnail   VARCHAR(128)        NOT NULL,
	address     VARCHAR(128)        NOT NULL,
	latitude    DOUBLE PRECISION    NOT NULL,
	longitude   DOUBLE PRECISION    NOT NULL,
	point POINT AS (POINT(latitude, longitude)) STORED NOT NULL SRID 0,
	rent        INTEGER             NOT NULL,
	door_height INTEGER             NOT NULL,
	door_width  INTEGER             NOT NULL,
	features    VARCHAR(64)         NOT NULL,
	popularity  INTEGER             NOT NULL,
	popularity_desc INTEGER AS (-popularity) NOT NULL
);

CREATE TABLE isuumo.chair
(
	id          INTEGER         NOT NULL PRIMARY KEY,
	name        VARCHAR(64)     NOT NULL,
	description VARCHAR(4096)   NOT NULL,
	thumbnail   VARCHAR(128)    NOT NULL,
	price       INTEGER         NOT NULL,
	height      INTEGER         NOT NULL,
	width       INTEGER         NOT NULL,
	depth       INTEGER         NOT NULL,
	color       VARCHAR(64)     NOT NULL,
	features    VARCHAR(64)     NOT NULL,
	kind        VARCHAR(64)     NOT NULL,
	popularity  INTEGER         NOT NULL,
	popularity_desc INTEGER AS (-popularity) NOT NULL,
	stock       INTEGER         NOT NULL
);

CREATE INDEX chair_price_id_idx on isuumo.chair(price, id);
CREATE INDEX estate_rent_id_idx on isuumo.estate(rent, id);
CREATE INDEX estate_popularity_desc_id_idx on isuumo.estate(popularity_desc, id);
CREATE INDEX chair_popularity_desc_id_idx on isuumo.chair(popularity_desc, id);
CREATE INDEX estate_door_height_idx on isuumo.estate(door_height);
CREATE INDEX estate_door_width_idx on isuumo.estate(door_width);
