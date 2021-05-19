SET hivevar:username=gauthier;
CREATE TABLE dsti_2021_spring_1.${username}_nyc_drivers (
  driver_id INT,
  first_name STRING,
  last_name STRING,
  ssn INT,
  address STRING,
  certified BOOLEAN,
  wage_plan STRING
)
PARTITIONED BY (import_date DATE)
STORED AS ORC;
