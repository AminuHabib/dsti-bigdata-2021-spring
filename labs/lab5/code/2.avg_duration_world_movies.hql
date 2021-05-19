SELECT avg(runtimeminutes) AS avg_duration
FROM dsti_2021_spring_1.imdb_title_basics
WHERE originaltitle RLIKE '(^| )[Ww]orld';
