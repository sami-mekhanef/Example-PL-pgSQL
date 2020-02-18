CREATE TABLE Test (
    ID SERIAL PRIMARY KEY,
    Sum int,
    Name varchar(255)

);

insert into Test (Sum,Name) values (200,'jean');
insert into Test (Sum,Name) values (400,'Yve');
insert into Test (Sum,Name) values (4200,'Orche');
insert into Test (Sum,Name) values (100,'David');
insert into Test (Sum,Name) values (800,'Goliat');
insert into Test (Sum,Name) values (1500,'Sof');
insert into Test (Sum,Name) values (1400,'Omar');
insert into Test (Sum,Name) values (3000,'SuperMan');


CREATE TABLE SORT(noSort INT[], sort INT[]);
insert into SORT (noSort) values ('{10,2,8,9,0,4,2,10}');
