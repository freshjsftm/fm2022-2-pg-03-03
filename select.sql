SELECT * FROM "users";

SELECT "firstName", "lastName", "email", "isMale" 
FROM "users";

-- only female
SELECT "firstName", "lastName", "email", "isMale" 
FROM "users"
WHERE "isMale"=false;

-- even id
SELECT * 
FROM "users"
WHERE "id"%2=0;

-- only male && odd id
SELECT "firstName", "lastName", "id", "isMale" 
FROM "users"
WHERE "isMale"=true
AND "id"%2=1;

SELECT "id", "firstName", "lastName",  "isMale" 
FROM "users"
WHERE "firstName"='Alex';

SELECT "id", "firstName", "lastName",  "isMale" 
FROM "users"
WHERE "firstName" IN ('Fred','Tom','Alex','Hanna');


SELECT "id", "firstName", "lastName",  "isMale" 
FROM "users"
WHERE "id">220 AND "id"<230;

SELECT "id", "firstName", "lastName",  "isMale" 
FROM "users"
WHERE "id" BETWEEN 220 AND 230;

--знайдіть усіх юзерів чоловіків зі зростом вище 1.75
--"id", "firstName", "lastName",  "isMale", "height" 
SELECT "id", "firstName", "lastName",  "isMale", "height" 
FROM "users"
WHERE "isMale"=true AND "height" > 1.75;


SELECT "id", "firstName", "isMale", 
extract("years" from age("birthday"))
FROM "users"
WHERE extract("years" from age("birthday"))=55;

-- день народження людей до 30 років
SELECT "id", "firstName", "isMale", 
"birthday"
FROM "users"
WHERE age("birthday") BETWEEN make_interval(25) AND make_interval(27);

--дістати усіх повнолітніх жінок
SELECT "id", "firstName", "isMale", extract("years" FROM age("birthday")) FROM "users"
WHERE extract("years" FROM age("birthday"))>=18
AND "isMale"=false;

--дістати усіх повнолітніх чоловіків зі зростом більше 1.85
SELECT  "firstName",
 "isMale","birthday","height"
FROM "users"
WHERE "isMale"=true 
AND age("birthday")>=make_interval(18) 
AND "height">1.85;


--дістати усіх юзерів, які народилися 13 числа
SELECT "firstName", "birthday" 
FROM "users"
WHERE extract("day" FROM "birthday")=13;

--дістати усіх юзерів, які народилися у березні
SELECT "firstName", "birthday" FROM "users"
WHERE extract("month" FROM "birthday")=3;

--дістати email усіх Alex або John
SELECT "firstName","email"
FROM "users"
WHERE "firstName" IN ('Alex','John') ;



SELECT "id", "firstName","email" AS "пошта"
FROM "users"
LIMIT 5 OFFSET 5;


SELECT "id", "firstName","email"
FROM "users" AS "u"
WHERE "u"."id" BETWEEN 130 AND 140;



SELECT "id", "firstName"||' '||"lastName" AS "fullName"
FROM "users"
LIMIT 5 OFFSET 5;


SELECT "id", concat("firstName",' ',"lastName") AS "fullName"
FROM "users"
LIMIT 5 OFFSET 5;

SELECT *
FROM
(
  SELECT "id", concat("firstName",' ',"lastName") AS "fullName", length(concat("firstName",' ',"lastName")) AS "length"
  FROM "users"
) AS "LENGTH_FN"
WHERE "LENGTH_FN"."length" <=8;






--знайти пошту усіх чоловіків у яких fullName в діапазоні від 10 до 15 символів
SELECT "email", concat("firstName", ' ',"lastName") AS "fullName", length(concat("firstName", ' ',"lastName"))  FROM "users"
WHERE length(concat("firstName", ' ',"lastName"))BETWEEN 10 AND 15
AND "isMale"=true;