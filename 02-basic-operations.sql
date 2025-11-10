/* TABLE CREATION */
CREATE TABLE person (
    person_id smallint UNSIGNED,
    /* smallint stores 2-bit number */
    fname varchar(20),
    /* stores up to 65,535 bytes */
    lname varchar(20),
    eye_color ENUM ('BR', 'BL', 'GR'),
    /* enum have possible values BR, BL or GR */
    birth_date date,
    /* stores YYYY-MM-DD */
    street varchar(30),
    city varchar(20),
    state varchar(20),
    country varchar(20),
    postal_code varchar(20),
    CONSTRAINT pk_person PRIMARY KEY (person_id)
);


/* reverse action */
DROP TABLE person;


/* CREATE TABLE WITH FOREIGN KEY */
CREATE TABLE favorite_food (
    person_id smallint UNSIGNED,
    food varchar(20),
    CONSTRAINT pk_favorite_food PRIMARY KEY (person_id, food),
    CONSTRAINT fk_fav_food_person_id FOREIGN KEY (person_id) REFERENCES person (person_id)
);


/* reverse action */
DROP TABLE favorite_food;


/* TABLE ALTERATION */
/* enabling of the auto-incrementing of the key */
ALTER TABLE person MODIFY person_id smallint UNSIGNED AUTO_INCREMENT;


/* DATA INSERTION */
INSERT INTO person (fname, lname, eye_color, birth_date)
    VALUES ('William', 'Turner', 'BR', '1972-08-11');

INSERT INTO favorite_food (person_id, food)
    VALUES (1, 'ice cream'),
    (1, 'pizza'),
    (1, 'hamburger');


/* DATA DELETION */
/* reverse action */
DELETE FROM favorite_food
WHERE person_id = 1;


/* without where clause all the data from the table is deleted */
DELETE FROM favorite_food;


/* SELECTION WITH ORDERING */
SELECT
    *
FROM
    favorite_food
WHERE
    person_id = 1
ORDER BY
    food;


/* DATA UPDATING */
UPDATE
    person
SET
    street = '1225 Tremont St.',
    city = 'Boston',
    state = 'MA'
WHERE
    person_id = 1;


/* reverse action */
UPDATE
    person
SET
    street = NULL,
    city = NULL,
    state = NULL
WHERE
    person_id = 1;
