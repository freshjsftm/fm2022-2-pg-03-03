SELECT * FROM "users";

SELECT max("weight") FROM "users";
SELECT min("height") FROM "users";
SELECT avg("height") FROM "users";
SELECT sum("weight") FROM "users";
SELECT count("weight") FROM "users";


SELECT min("height") 
FROM "users"
WHERE "isMale"=false;



SELECT count("id") , "isMale", "firstName"
FROM "users"
WHERE "isMale"=false
GROUP BY "isMale", "firstName"
LIMIT 5;


--кількість чоловіків та жінок
SELECT count(*), "isMale"
FROM "users"
GROUP BY "isMale";

--середній зріст  чоловіків та жінок
SELECT avg("height") AS "avg height", "isMale"
FROM "users"
GROUP BY "isMale";

--кількість людей, які народилися у 1982 (кількість і рік народження)
SELECT count(*), extract("year" from "birthday") AS "year"
FROM "users"
WHERE extract("year" from "birthday")=1982 
GROUP BY extract("year" from "birthday");

--кількість і стать людей з прізвищем Pitt
SELECT count(*), "isMale", "lastName"
FROM "users"
WHERE "lastName"='Pitt'
GROUP BY "isMale", "lastName";

--кількість людей, які народилися 04 липня
SELECT  count(*), extract("day" from "birthday") AS "day", extract("month" from "birthday") AS "month"
FROM "users"
WHERE extract("day" from "birthday")=4 AND extract("month" from "birthday")=7
GROUP BY extract("day" from "birthday"), extract("month" from "birthday");

--загальна вага всіх з іменем Alex
SELECT sum("weight"), "firstName"
FROM "users"
WHERE "firstName" IN ('John','Alex','Mary','Anna')
GROUP BY "firstName";


--загальна вага чоловіків зі зростом вище 1.95
SELECT sum("weight"), "isMale" AS "male with height > 1.95"
FROM "users"
WHERE "isMale" = true AND "height">1.95
GROUP BY "isMale";

--кількість жінок з однаковими прізвищами
SELECT count(*), "isMale", "lastName"
FROM "users"
WHERE "isMale"=false
GROUP BY "isMale", "lastName";

--кількість чоловіків, які народилися влітку
SELECT  count(*) AS "amount summer male", "isMale"
FROM "users"
WHERE "isMale"=true AND  extract("month" from "birthday") BETWEEN 6 AND 8  
GROUP BY  "isMale";

--середня вага чоловіків 1975 року народження
SELECT  avg("weight") ,extract("year" from "birthday") As "year", "isMale"
FROM "users"
--WHERE "isMale"=true AND  extract("year" from "birthday")=1975  
GROUP BY  "isMale", extract("year" from "birthday");

