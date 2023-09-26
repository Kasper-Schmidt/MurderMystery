SELECT * FROM crime_scene_report
WHERE type = 'murder'
AND date = '20180115';


-- Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".








-- WITNESS 1
SELECT * FROM person
WHERE address_street_name = 'Northwestern Dr';

-- Morty Shapiro bor på det højeste nummer og hans person_id = 14887

-- INTERVIEW
-- I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".

-- MEMBERSHIP_NUMBER = 48Z
-- CAR_LICENSPLATE = H42W


-- Nu til næste Witness


-- WITNESS 2
SELECT * FROM person
WHERE address_street_name = 'Franklin Ave'
AND name = 'Annabel Miller';


/*
id	    name	          license_id	    address_number	    address_street_name	    ssn
16371	Annabel Miller	  490173	        103	                Franklin Ave	        318771143
*/


SELECT * FROM interview
WHERE person_id = '16371';


-- I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.


SELECT * FROM get_fit_now_check_in
WHERE check_in_date = '20180109';

--  Membership_id   check_in_date   check_in_time   check_out_time
--  48Z7A	        20180109	    1600	        1730
--  48Z55	        20180109	    1530	        1700


SELECT * FROM get_fit_now_member
WHERE membership_status = 'gold';


-- id	    person_id	name	        membership_start_date	membership_status
-- 48Z7A	28819	    Joe Germuska	20160305	            gold
-- 48Z55	67318	    Jeremy Bowers	20160101	            gold


-- Mangler at tjekke nummerplade på de 2, for at se hvem af dem det er


SELECT * FROM person
WHERE name = 'Joe Germuska';

-- id	    name	        license_id	address_number	address_street_name	    ssn
-- 28819	Joe Germuska	173289	    111	            Fisk Rd	                138909730

SELECT * FROM person
WHERE name = 'Jeremy Bowers';

-- id	    name	        license_id	address_number	    address_street_name	        ssn
-- 67318	Jeremy Bowers	423327	    530	                Washington Pl, Apt 3A	    1871539279

SELECT * FROM drivers_license
WHERE id = '423327';

-- id	    age	    height	eye_color	hair_color	gender	plate_number	car_make	car_model
-- 423327	30	    70	    brown	    brown	    male	0H42W2	        Chevrolet	Spark LS


-- Her kan jeg se at H42W er indkluderet i nummerpladen, som Annabel Miller fortalte, så nu ved jeg morderen er Jeremy Bowers