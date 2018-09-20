--Question 1
CREATE TABLE users
(
    user_id         NUMBER       NOT NULL,
    email_address   VARCHAR2(50) NOT NULL,
    first_name      VARCHAR2(10) NOT NULL,
    last_name       VARCHAR2(10) NOT NULL,
    CONSTRAINT users_pk PRIMARY KEY(user_id)
);

CREATE SEQUENCE users_id_seq;

CREATE TABLE downloads 
(   
    download_id     NUMBER       NOT NULL,  
    user_id         NUMBER       NOT NULL,
    download_date   DATE                         DEFAULT SYSDATE,
    filename        VARCHAR2(50) NOT NULL        UNIQUE,
    product_id      NUMBER       NOT NULL,
    CONSTRAINT downloads_pk PRIMARY KEY (download_id),
    CONSTRAINT downloads_fk_users FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT downloads_fk_product FOREIGN KEY(product_id) REFERENCES product(product_id)
);

CREATE SEQUENCE downloads_id_seq;
CREATE INDEX downloads_user_id_ix
    ON downloads(user_id);
CREATE INDEX downloads_product_id_ix
    ON downloads(product_id);

CREATE TABLE product
(
    product_id     NUMBER       NOT NULL,
    product_name   VARCHAR2(50) NOT NULL        UNIQUE,
    CONSTRAINT product_pk PRIMARY KEY(product_id)
);

CREATE SEQUENCE product_id_seq;

--Question 2
INSERT INTO users(user_id,email_address,first_name,last_name)
VALUES(users_id_seq.NEXTVAL,'johnsmith@gmail.com','John','Smith');
INSERT INTO users(user_id,email_address,first_name,last_name)
VALUES(users_id_seq.NEXTVAL,'janedoe@yahoo.com','Jane','Doe');

INSERT INTO product(product_id,product_name)
VALUES(product_id_seq.NEXTVAL,'Local Music Vol 1');
INSERT INTO product(product_id,product_name)
VALUES(product_id_seq.NEXTVAL,'Local Music Vol 2');

INSERT INTO downloads
VALUES(downloads_id_seq.NEXTVAL,1,SYSDATE,'pedal_are_falling.mp3',2);
INSERT INTO downloads
VALUES(downloads_id_seq.NEXTVAL,2,SYSDATE,'turn_signal.mp3',1);
INSERT INTO downloads
VALUES(downloads_id_seq.NEXTVAL,2,SYSDATE,'one_horse_town.mp3',2);

--Question 3
ALTER TABLE product
ADD product_price NUMBER(5,2)    DEFAULT 9.99;

ALTER TABLE product 
ADD date_added DATE;

--Question 4
INSERT INTO users 
VALUES(users_id_seq1.NEXTVAL,'jerryche@utexas.edu','ThisIsNotMyFirstName','Che');

ALTER TABLE users
MODIFY first_name VARCHAR2(20);



