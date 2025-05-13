Last login: Tue May 13 13:17:28 on ttys002
/Users/Gerardo/.zshrc:export:1: not valid in this context: 
Gerardo@luiss-mac ~ % mysqlsh
MySQL Shell 9.2.0

Copyright (c) 2016, 2025, Oracle and/or its affiliates.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.
 MySQL  SQL > \c mc--root@localhost
Creating a session to 'mc--root@localhost'
Please provide the password for 'mc--root@localhost': 
MySQL Error 1045 (28000): Access denied for user 'mc--root'@'localhost' (using password: NO)
 MySQL  SQL > \c mc-- root@localhost
Creating a session to 'root@localhost'
Fetching global names for auto-completion... Press ^C to stop.
Your MySQL connection id is 23
Server version: 9.1.0 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:3306 ssl  SQL > create database exa2_tbd
                               -> ;
Query OK, 1 row affected (0.0211 sec)
 MySQL  localhost:3306 ssl  SQL > create table alumnos(
                               -> id_alumno int key auto_increment,
                               -> nombre varchar(40) not null,
                               -> carrera varchar(20);
ERROR: 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 4
 MySQL  localhost:3306 ssl  SQL > create table alumnos( id_alumno int key auto_increment, nombre varchar(40) not null, carrera varchar(20));
ERROR: 1046 (3D000): No database selected
 MySQL  localhost:3306 ssl  SQL > use exa2_tbd;
Default schema set to `exa2_tbd`.
Fetching global names, object names from `exa2_tbd` for auto-completion... Press ^C to stop.
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > create table alumnos( id_alumno int key auto_increment, nombre varchar(40) not null, carrera varchar(20));
Query OK, 0 rows affected (0.0347 sec)
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > desc alumnos;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id_alumno | int         | NO   | PRI | NULL    | auto_increment |
| nombre    | varchar(40) | NO   |     | NULL    |                |
| carrera   | varchar(20) | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
3 rows in set (0.0111 sec)
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > create table cursos(
                                         -> id_curso int key auto_increment,
                                         -> nombre_curso varchar(25) not null,
                                         -> carrera varchar(20));
Query OK, 0 rows affected (0.0195 sec)
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > desc cursos;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| id_curso     | int         | NO   | PRI | NULL    | auto_increment |
| nombre_curso | varchar(25) | NO   |     | NULL    |                |
| carrera      | varchar(20) | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
3 rows in set (0.0074 sec)
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > create table inscripciones(
                                         -> id_inscripcion int key auto_increment,
                                         -> id_alumno int,
                                         -> id_curso int,
                                         -> fecha_inscripcion date);
Query OK, 0 rows affected (0.0609 sec)
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > show create table inscripciones;
+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table         | Create Table                                                                                                                                                                                                                                                                               |
+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| inscripciones | CREATE TABLE `inscripciones` (
  `id_inscripcion` int NOT NULL AUTO_INCREMENT,
  `id_alumno` int DEFAULT NULL,
  `id_curso` int DEFAULT NULL,
  `fecha_inscripcion` date DEFAULT NULL,
  PRIMARY KEY (`id_inscripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.0092 sec)
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > alter table inscripciones
                                         -> add foreign key(id_alumno)
                                         -> references alumnos(id_alumno);
Query OK, 0 rows affected (0.0369 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > alter table inscripciones
                                         -> add foreign key(id_curso)
                                         -> references cursos(id_curso);
Query OK, 0 rows affected (0.0283 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > desc inscripciones)
                                         -> ^C
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > desc inscripciones;
+-------------------+------+------+-----+---------+----------------+
| Field             | Type | Null | Key | Default | Extra          |
+-------------------+------+------+-----+---------+----------------+
| id_inscripcion    | int  | NO   | PRI | NULL    | auto_increment |
| id_alumno         | int  | YES  | MUL | NULL    |                |
| id_curso          | int  | YES  | MUL | NULL    |                |
| fecha_inscripcion | date | YES  |     | NULL    |                |
+-------------------+------+------+-----+---------+----------------+
4 rows in set (0.0177 sec)
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > insert into alumnos(nombre,carrera)
                                         -> values (Luis, ISC), (Diana, ISC), (Gerardo, ISC);
ERROR: 1054 (42S22): Unknown column 'Luis' in 'field list'
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > insert into alumnos(nombre, carrera) values (Luis, ISC), (Diana, ISC), (Gerardo, ISC);
ERROR: 1054 (42S22): Unknown column 'Luis' in 'field list'
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > insert into alumnos(nombre, carrera) values ("Luis", "ISC"), ("Diana", "ISC"), ("Gerardo", "ISC");
Query OK, 3 rows affected (0.0067 sec)

Records: 3  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > select * from alumnos;
+-----------+---------+---------+
| id_alumno | nombre  | carrera |
+-----------+---------+---------+
|         1 | Luis    | ISC     |
|         2 | Diana   | ISC     |
|         3 | Gerardo | ISC     |
+-----------+---------+---------+
3 rows in set (0.0037 sec)
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > insert into cursos(nombre_curso, creditos)
                                         -> values ("Algebra", 5), ("Calculo", 4), ("Metodos", 4);
ERROR: 1054 (42S22): Unknown column 'creditos' in 'field list'
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > desc cursos;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| id_curso     | int         | NO   | PRI | NULL    | auto_increment |
| nombre_curso | varchar(25) | NO   |     | NULL    |                |
| carrera      | varchar(20) | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
3 rows in set (0.0035 sec)
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > alter table cursos rename column carrera to creditos;
Query OK, 0 rows affected (0.0196 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > desc cursos;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| id_curso     | int         | NO   | PRI | NULL    | auto_increment |
| nombre_curso | varchar(25) | NO   |     | NULL    |                |
| creditos     | varchar(20) | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
3 rows in set (0.0040 sec)
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > insert into cursos(nombre_curso, creditos) values ("Algebra", 5), ("Calculo", 4), ("Metodos", 4);
Query OK, 3 rows affected (0.0020 sec)

Records: 3  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > select * from cursos;
+----------+--------------+----------+
| id_curso | nombre_curso | creditos |
+----------+--------------+----------+
|        1 | Algebra      | 5        |
|        2 | Calculo      | 4        |
|        3 | Metodos      | 4        |
+----------+--------------+----------+
3 rows in set (0.0019 sec)
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > insert into inscripciones(id_alumno, id_curso, fecha_inscripcion)
                                         -> values (1,1,'2017-05-14'), (1,2, '2018-06-15'), (2,1,'2018-08-19'), (3,1,'2018-08-22'), (3,3,'2018-08-25');
Query OK, 5 rows affected (0.0077 sec)

Records: 5  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > select * from inscripciones;
+----------------+-----------+----------+-------------------+
| id_inscripcion | id_alumno | id_curso | fecha_inscripcion |
+----------------+-----------+----------+-------------------+
|              1 |         1 |        1 | 2017-05-14        |
|              2 |         1 |        2 | 2018-06-15        |
|              3 |         2 |        1 | 2018-08-19        |
|              4 |         3 |        1 | 2018-08-22        |
|              5 |         3 |        3 | 2018-08-25        |
+----------------+-----------+----------+-------------------+
5 rows in set (0.0011 sec)
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > select a.nombre as alumno, c.nombre_curso as curso, i.fecha_inscripcion
                                         -> from inscripciones i
                                         -> inner join alumnos a on i.id_alumno = a.id_alumno
                                         -> inner join cursos c on i.id_curso = c.id_curso;
+---------+---------+-------------------+
| alumno  | curso   | fecha_inscripcion |
+---------+---------+-------------------+
| Luis    | Algebra | 2017-05-14        |
| Luis    | Calculo | 2018-06-15        |
| Diana   | Algebra | 2018-08-19        |
| Gerardo | Algebra | 2018-08-22        |
| Gerardo | Metodos | 2018-08-25        |
+---------+---------+-------------------+
5 rows in set (0.0013 sec)
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > select c.nombre_curso, a.nombre as alumno
                                         -> from cursos c
                                         -> left join inscripciones i on c.id_curso = i.id_curso
                                         -> left join alumnos a on i.id_alumno = a.id_alumno;
+--------------+---------+
| nombre_curso | alumno  |
+--------------+---------+
| Algebra      | Luis    |
| Algebra      | Diana   |
| Algebra      | Gerardo |
| Calculo      | Luis    |
| Metodos      | Gerardo |
+--------------+---------+
5 rows in set (0.0013 sec)
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > select a.nombre as alumno, c.nombre_curso
                                         -> from alumnos a
                                         -> left join inscripciones i on a.id_alumno = i.id_alumno
                                         -> left join cursos c on i.id_curso = c.id_curso;
+---------+--------------+                  insert into inscripciones(id_alumno, id_curso, fecha_inscripcion)
                                         -> values (1, 999, '2025-01-01');^C
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > select a.nombre as alumno, count(i.id_curso) as total_cursos from alumnos a left join inscripciones i on a.id_alumno = i.id_alumno group by a.nombre;
+---------+--------------+
| alumno  | total_cursos |
+---------+--------------+
| Luis    |            2 |
| Diana   |            1 |
| Gerardo |            2 |
+---------+--------------+
3 rows in set (0.0469 sec)
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > insert into inscripciones(id_alumno, id_curso, fecha_inscripcion)
                                         -> values (999, '2025-01-01');
ERROR: 1136 (21S01): Column count doesn't match value count at row 1
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > insert into inscripciones(id_curso, fecha_inscripcion) values (999, '2025-01-01');
ERROR: 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`exa2_tbd`.`inscripciones`, CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`))
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > delete from alumnos where id_alumno = 1;
ERROR: 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`exa2_tbd`.`inscripciones`, CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id_alumno`))
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > show create inscripciones;
ERROR: 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'inscripciones' at line 1
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > show create table inscripciones;
+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table         | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| inscripciones | CREATE TABLE `inscripciones` (
  `id_inscripcion` int NOT NULL AUTO_INCREMENT,
  `id_alumno` int DEFAULT NULL,
  `id_curso` int DEFAULT NULL,
  `fecha_inscripcion` date DEFAULT NULL,
  PRIMARY KEY (`id_inscripcion`),
  KEY `id_alumno` (`id_alumno`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id_alumno`),
  CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+---------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.0313 sec)
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > alter table inscripciones drop foreign key inscripciones_ibfk_1;
Query OK, 0 rows affected (0.0512 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > alter table inscripciones
                                         -> add constraint inscripciones_ibfk_2
                                         -> foreign key (id_curso) references cursos(id_curso)
                                         -> on delete cascade;
ERROR: 1826 (HY000): Duplicate foreign key constraint name 'inscripciones_ibfk_2'
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > alter table inscripciones add constraint inscripciones_ibfk_1 foreign key (id_curso) references cursos(id_curso) on delete cascade;
Query OK, 5 rows affected (0.0328 sec)

Records: 5  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > desc inscripciones;
+-------------------+------+------+-----+---------+----------------+
| Field             | Type | Null | Key | Default | Extra          |
+-------------------+------+------+-----+---------+----------------+
| id_inscripcion    | int  | NO   | PRI | NULL    | auto_increment |
| id_alumno         | int  | YES  | MUL | NULL    |                |
| id_curso          | int  | YES  | MUL | NULL    |                |
| fecha_inscripcion | date | YES  |     | NULL    |                |
+-------------------+------+------+-----+---------+----------------+
4 rows in set (0.0187 sec)
 MySQL  localhost:3306 ssl  exa2_tbd  SQL > 
