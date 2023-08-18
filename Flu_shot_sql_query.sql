/*
Objectives
Come up with flu shots dashboard for 2022 that does the following

1 - TOtal % of patients getting flu shots stratified by 
	a - Age
	b - Race
	c - County(On a Map)
	d - Overall

2 - Running total of flu shots ove the course of 2022
3 - Total number of flu shots given in 2022
4 - A list of patients that show whether or not they receive the flu shots

requirements: 
Patients must have been "Active at our hospitals"


*/
-- select * from patients
WITH active_patients AS
(

	SELECT DISTINCT patient
	FROM encounters as e
	JOIN patients as pat
	ON e.patient = pat.id
	WHERE START BETWEEN '2020-01-01 00:00' AND '2022-12-31 23:59'
	AND pat.deathdate IS NULL
	AND EXTRACT(month FROM age('2022-12-31', pat.birthdate)) >= 6

),


 flu_shot_2022 AS
(
SELECT patient, min(date) AS earliest_flu_shot_2022
FROM immunizations
WHERE code = '5302'
AND date BETWEEN '2022-01-01 00:00' AND '2022-12-31 23:59'
GROUP BY patient
)

SELECT pat.birthdate,
		pat.race,
		pat.county,
		pat.id,
		pat.first,
		pat.last,
		flu.earliest_flu_shot_2022,
		CASE WHEN earliest_flu_shot_2022 IS NOT NULL THEN 'Yes'
		ELSE 'No'
		END AS flu_shot_2022
FROM patients AS pat
LEFT JOIN flu_shot_2022 AS flu
ON pat.id = flu.patient
WHERE 1 = 1
AND pat.id in (SELECT patient FROM active_patients)