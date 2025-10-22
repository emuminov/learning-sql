/* TABLE CREATION */

CREATE TABLE person
  (person_id SMALLINT UNSIGNED, /* smallint stores 2-bit number */
  fname VARCHAR(20), /* stores up to 65,535 bytes */
  lname VARCHAR(20),
  /* char stores up to 255 bytes, anything less than specified size is filled with spaces */
  /* makes sure that eye color is one of BR, BL or GR */
  eye_color CHAR(2) CHECK (eye_color IN ('BR', 'BL', 'GR')),
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
