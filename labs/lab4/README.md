# Big Data Ecosystem

## Lab 4: Hive

### Goals

- Create an external table on top of data stored as CSV
- Create a managed ORC table
- Load data from the CSV table to the ORC table (with some transformations)

### Create an external table

For this lab we will be using a very small dataset of NYC taxi drivers.

Using the official [Hive Data Definition Langage](https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL):

1. Using the HDFS CLI, take a look at the data used for this lab at `/education/dsti/big-data/2021/spring/resources/lab4/nyc_drivers/import_date=2021-05-19/drivers.csv`
2. Copy the `nyc_drivers` folder to your user directory in HDFS:
   ```sh
   hdfs dfs -mkdir -p "/education/dsti/big-data/2021/spring/$USER/lab4"
   hdfs dfs -cp /education/dsti/big-data/2021/spring/resources/lab4/nyc_drivers "/education/dsti/big-data/2021/spring/$USER/lab4/"
   ```
3. Open a Beeline session by typing `beeline`
4. Create an external table targeting our data with this statement (to be completed, replace `YOUR_USERNAME`):
   ```sql
   SET hivevar:username=YOUR_USERNAME;
   CREATE EXTERNAL TABLE dsti_2021_spring_1.${username}_nyc_drivers_ext (
     driver_id INT,
     -- COMPLETE HERE
   )
   ROW FORMAT SERDE -- COMPLETE HERE
   STORED AS TEXTFILE
   LOCATION -- COMPLETE HERE
   TBLPROPERTIES ('skip.header.line.count'='1');
   MSCK REPAIR TABLE dsti_2021_spring_1.${username}_nyc_drivers_ext;
   ```
5. Check that the table is correctly created by selecting all the data in it. **If you see only `NULL` values, your schema is not correct.**

### Create a managed ORC table

**Tip:** to create a managed ORC table, you don't have to specify a `LOCATION` nor a `SERDE`:

```sql
CREATE ...
STORED AS ORC;
```

1. Create a managed ORC table (**not external**) that must have the same schema as the external table created above (`${username}_nyc_drivers_ext`) but with:
   1. The `_ext` prefix removed from the name: `${username}_nyc_drivers`
   2. The column `name` devided into `first_name` and `last_name`
   3. The column `location` renamed as `address` (because `LOCATION` is a Hive keyword)
   4. The column `certified` as a `BOOLEAN`
2. Check that your table was created using the HDFS CLI at `/warehouse/tablespace/managed/hive/dsti_2021_spring_1.db/$USER_nyc_drivers` (should be empty)

### Load data from the CSV table to the ORC table

Now we want to populate our ORC table from our CSV table. Using the [Hive Data Manipulation Language](https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DML):

1. Write a statement to insert data to the ORC table by applying 2 transformations (check the available [HiveQL string functions](https://cwiki.apache.org/confluence/display/Hive/LanguageManual+UDF#LanguageManualUDF-StringFunctions)):
   - Split `name` into `first_name` and `last_name`
   - Transform `certified` from `STRING` to `BOOLEAN`
   - Rename `location` to `address`
2. Execute your query
3. Check what the data looks like in the managed table using the HDFS CLI at `/warehouse/tablespace/managed/hive/dsti_2021_spring_1.db/$USER_nyc_drivers`
