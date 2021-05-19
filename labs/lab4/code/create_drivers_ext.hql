SET hivevar:username=gauthier;
CREATE EXTERNAL TABLE dsti_2021_spring_1.${username}_nyc_drivers_ext (
  driver_id INT,
  full_name STRING,
  ssn INT,
  location STRING,
  certified STRING,
  wage_plan STRING
)
PARTITIONED BY (import_date DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION '/education/dsti/big-data/2021/spring/resources/lab4/nyc_drivers'
TBLPROPERTIES ('skip.header.line.count'='1');
MSCK REPAIR TABLE dsti_2021_spring_1.${username}_nyc_drivers_ext;
