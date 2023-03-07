UPDATE "users"
SET "weight" = "height" * 100;

UPDATE "users"
SET "weight" = 50
WHERE "firstName" = 'Mary';

--встановіть вагу 95 усім чоловікам старшим 45
UPDATE "users"
SET "weight" = 95
WHERE "isMale"=true 
AND age("birthday")>=make_interval(45);
--встановіть вагу 63 усім чоловікам зі зростом менше 1.7
UPDATE "users" 
SET "weight" = 63
WHERE "isMale" = true
AND "height"<1.7;
--встановіть вагу 88 усім жінкам зі зростом більше 2.0
UPDATE "users"
SET "weight" = 63
WHERE "isMale"=false AND "height"> 2;

UPDATE "users"
SET "email" = 'qwerty@gmail.com'
WHERE "id"=150;

SELECT * FROM "users";

--DELETE FROM "users"; --видаляє усі рядки з таблиці
--TRUNCATE TABLE "users"; --видаляє усі рядки з таблиці
--DROP TABLE "users"; --видаляє повністю усю таблицю

DELETE FROM "users"
WHERE "id"=395
RETURNING *;

UPDATE "users"
SET "weight" = 100 
WHERE "id" = 408
RETURNING "id", "weight";

--встановіть усім юзерам з поштою довше ніж 25 символів прізвище Pitt і поверніть id та lastName
UPDATE "users" 
SET "lastName" = 'Pitt'
WHERE length("email") >25
RETURNING "id", "lastName";


DELETE FROM "users"
WHERE "weight"=153 OR "height"=0.6
RETURNING "id", "weight", "height";

DELETE FROM "users"
WHERE "weight" IN (123,127,56,80)
RETURNING "id", "weight", "height";




