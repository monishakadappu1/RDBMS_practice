DROP TABLE cats;

CREATE TABLE cats(
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY(cat_id)
);

INSERT INTO cats(name,breed,age)
VALUES ('Ringo','Tabby',4),
       ('Cindy','Maine Coon',10),
       ('Dumbledore','Maine Coon',11),
       ('Egg','Persian',4),
       ('Misty','Tabby',13),
       ('George Michael','Ragdoll',9),
       ('Jackson','Sphynx',7);
       
       
SELECT cat_id AS id,name from cats;

UPDATE cats SET breed='ShortHair' WHERE breed='Tabby';

UPDATE cats SET age=14 
WHERE name='Misty';

UPDATE cats SET name='Jack' WHERE name='Jackson';

UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';

UPDATE cats SET age=12 WHERE breed='Maine Coon';

CRUD CHALLENGES


CREATE DATABASE shirts_db;

CREATE TABLE shirts(
    shirt_id INT NOT NULL AUTO_INCREMENT,
    article VARCHAR(100),
    color VARCHAR(50),
    shirt_size VARCHAR(10),
    last_worn INT,
    PRIMARY KEY(shirt_id)
);

INSERT INTO shirts(article,color,shirt_size,last_worn)
VALUES ('t-shirt','white','S',10),
        ('t-shirt','green','S',200),
        ('polo shirt','black','M',10),
        ('tank top','blue','S',50),
        ('t-shirt','pink','S',0),
        ('polo shirt','red','M',5),
        ('tank top','white','S',200),
        ('tank top','blue','M',15);

INSERT INTO shirts(article,color,shirt_size,last_worn)
VALUES ('polo shirt','purple','M',50);


UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';
UPDATE cats SET last_worn=0 WHERE last_worn=15;

UPDATE shirts SET shirt_size='XS',color='off white' WHERE color='white';

DELETE FROM shirts WHERE last_worn=200;
