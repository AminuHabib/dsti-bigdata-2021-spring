SET hivevar:username=gauthier;
INSERT OVERWRITE TABLE dsti_2021_spring_1.${username}_nyc_drivers
PARTITION (import_date)
SELECT
  driver_id,
  split(full_name, ' ')[0] AS first_name,
  split(full_name, ' ')[1] AS last_name,
  ssn,
  location,
  CASE WHEN certified = "Y" THEN true ELSE false END,
  wage_plan,
  import_date
FROM dsti_2021_spring_1.${username}_nyc_drivers_ext
WHERE import_date = current_date;
