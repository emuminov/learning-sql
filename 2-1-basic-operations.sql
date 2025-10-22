/* TABLE CREATION */
CREATE TABLE person
  (person_id SMALLINT UNSIGNED, /* smallint stores 2-bit number */
  fname VARCHAR(20), /* stores up to 65,535 bytes */
  lname VARCHAR(20),
  eye_color ENUM('BR', 'BL', 'GR'), /* enum have possible values BR, BL or GR */
  birth_date DATE, /* stores YYYY-MM-DD */
  street VARCHAR(30),
  city VARCHAR(20),
  state VARCHAR(20),
  country VARCHAR(20),
  postal_code VARCHAR(20),
  CONSTRAINT pk_person PRIMARY KEY (person_id)
);

/* reverse action */
DROP TABLE person;

/* CREATE TABLE WITH FOREIGN KEY */
CREATE TABLE favorite_food
  (person_id SMALLINT UNSIGNED,
  food VARCHAR(20),
  CONSTRAINT pk_favorite_food PRIMARY KEY (person_id, food),
  CONSTRAINT fk_fav_food_person_id FOREIGN KEY (person_id)
  REFERENCES person (person_id)
);

/* reverse action */
DROP TABLE favorite_food;

/* TABLE ALTERATION */
/* enabling of the auto-incrementing of the key */
ALTER TABLE person MODIFY person_id SMALLINT UNSIGNED AUTO_INCREMENT;

/* DATA INSERTION */
