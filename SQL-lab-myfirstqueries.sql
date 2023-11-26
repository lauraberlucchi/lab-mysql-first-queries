USE applestore;
SELECT * FROM applestore2data;

    
/* QUESTION 1: Which are the different genres?*/
/* Answer:
Games
Productivity
Weather
Shopping
Reference
Finance
Music
Utilities
Travel
Social Networking
Sports
Business
Health & Fitness
Entertainment
Photo & Video
Navigation
Education
Lifestyle
Food & Drink
News
Book
Medical
Catalogs*/
SELECT DISTINCT
    prime_genre
FROM
    applestore2data;

/* QUESTION 2: Which is the genre with more apps rated?*/
/* Answer: Games */
SELECT 
    prime_genre, SUM(rating_count_tot) AS sum_ratings_genre
FROM
    applestore2data
GROUP BY prime_genre
ORDER BY sum_ratings_genre DESC;

/*3. Which is the genre with more apps?*/
/*Answer: Games*/
SELECT 
    prime_genre, COUNT(*) AS apps_per_genre
FROM
    applestore2data
GROUP BY prime_genre
ORDER BY apps_per_genre DESC;

/*4. Which is the one with less?
Answer: Catalogs*/
SELECT 
    prime_genre, COUNT(*) AS apps_per_genre
FROM
    applestore2data
GROUP BY prime_genre
ORDER BY apps_per_genre ASC;

/*5. Take the 10 apps most rated.
*id, track_name, rating_count_tot, user_rating, prime_genre
284882215	Facebook	2974676	3.5	4	Social Networking
389801252	Instagram	2161558	4.5	12	Photo & Video
529479190	Clash of Clans	2130805	4.5	9	Games
420009108	Temple Run	1724546	4.5	9	Games
284035177	Pandora - Music & Radio	1126879	4	12	Music
429047995	Pinterest	1061624	4.5	12	Social Networking
282935706	Bible	985920	4.5	4	Reference
553834731	Candy Crush Saga	961794	4.5	4	Games
324684580	Spotify Music	878563	4.5	12	Music
343200656	Angry Birds	824451	4.5	4	Games*/

SELECT 
    id, track_name, rating_count_tot, user_rating, cont_rating, prime_genre
FROM
    applestore2data
ORDER BY rating_count_tot DESC
LIMIT 10;

/*6. Take the 10 apps best rated by users.
*id, track_name, user_rating, cont_rating, rating_count_tot, prime_genre
1134835650	Mystery of Fortune 2	5	12	19	Games
1145541321	Flow Free: Hexes	5	4	2791	Games
1147863312	Clashy Colors	5	4	854	Games
1137262188	Gweep Gwop	5	4	32	Games
1144397186	?????????????????? ?????????????????? - ???????????????????????????????????????	5	12	17	Games
1162783385	Cannonfire Concerto	5	12	19	Games
1151680145	Slots - Lucky Win Casino Games & Slot Machines	5	12	3807	Games
1132358193	Slots: Fast Fortune Slot Machines & Fun Slot Games	5	12	1474	Games
1151496004	Jeremstar box	5	9	1	Entertainment
1162255664	SMILE Inc.	5	12	25859	Games*/

SELECT id, track_name, user_rating, cont_rating, rating_count_tot, prime_genre
FROM applestore2data
ORDER BY user_rating DESC
LIMIT 10;

/* 7. Take a look on the data you retrieved in the question 5. Give some insights.
Answer: Amongst the 10 most rated apps are very well known games, world wide used social networks and music platforms. 
Therefore the rating_count_tot (number of rating) for these apps is a very high number and the average user rating of 4.5 or 3.5 not be compared to a higher average rate obtained by apps that have many fewer users than these ones.

/* 8. Take a look on the data you retrieved in the question 6. Give some insights.
/*9. Now compare the data from questions 5 and 6. What do you see?
Answer: Amongst the top 10 rated apps, I can draw two conclusions (and a small insight): first, the average rating value is from 1 to 5 and those apps are rated 5, but there are more apps rated like that (490, as I show in the following query).
What I see selecting the 10 best rated apps are just the first 10 apps of many ordered by id (as second level of order after user_rating). So, this information is not useful and possibly misleading. 
(Small insight: since the most popular genre is Games and by looking at the proportion between genre it seems that more than half of the apps are gaming apps, it is also very likely that we will have a lot of best rated gaming apps,
not because gaming apps are better than other apps, but just because they are more).
Secondly, the rating_count_tot for these first 10 apps should not be compared to the same rating for the most rated apps (like pointed out before) because of the large difference in number of users 
(some apps have less than 10 users, while the most rated ones have millions). If I think about the 'theoretical' population of app users, I can think a good and bad sample sizes of this population. 
The average user rating is the average of the sample (as I see it), because we don't have the population of users since not every user bothers enough to rate the app. 
Huge sample size like for the top 10 rated apps would give me a better approximation of what is the general perception about this app, 
while sample very small (less than 10 users) won't convince me that the app is really that good even if the user_rating equals the maximum value.*/

SELECT COUNT(*) as count_max_user_rating
FROM applestore2data
WHERE user_rating = 5;

/*10. How could you take the top 3 regarding the user ratings but also the number of votes?
*id, track_name, rating_count_tot, user_rating
487119327	Head Soccer	481564	5
350642635	Plants vs. Zombies	426463	5
930574573	Sniper 3D Assassin: Shoot to Kill Gun Game	386521	5 */

SELECT id, track_name, rating_count_tot, user_rating
FROM applestore2data
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

-- or with filtering --
SELECT id, track_name, rating_count_tot, user_rating
FROM applestore2data
WHERE user_rating = 5
ORDER BY rating_count_tot DESC
LIMIT 3;

