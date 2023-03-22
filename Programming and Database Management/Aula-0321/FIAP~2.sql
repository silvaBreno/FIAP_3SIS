SELECT last_name, job_id, salary
FROM  employees
WHERE employee_id = 100;

SELECT last_name, job_id, salary
FROM  employees
WHERE last_name = 'King';

CREATE INDEX idx_emp_ln
ON employees(last_name);

SELECT table_name, num_rows
FROM user_tables
order by 1;

SELECT COUNT(*) 
FROM departments;

CREATE TABLE SIS3_T
(codigo int         constraint sis3_pk primary key,
 email varchar(500) constraint sis3_uk unique);
 
 insert into sis3_t
 values (1,'x');
 
 SELECT index_name
 FROM user_indexes
 WHERE table_name = 'SIS3_T';
 
 DROP TABLE SIS3_T;
 
 CREATE TABLE SIS3_T
(codigo int         NOT NULL,
 email varchar(500) );
 
 CREATE UNIQUE INDEX sis3_pk
 ON SIS3_T (COdigo);