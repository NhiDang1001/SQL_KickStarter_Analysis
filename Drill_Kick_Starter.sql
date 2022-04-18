#Kickstarter

#1. 
SELECT category, count(*)
FROM kickstarter_part
GROUP BY category
ORDER BY count(*)
limit 3;

#2.
SELECT count(*)
FROM kickstarter_part
WHERE project_name REGEXP 'coffee';

#3.
SELECT country, count(*) 
FROM kickstarter_part
GROUP BY country
HAVING count(*) >200;

#10.
SELECT *, usd_pledged_amt/ backers as avgpledged
FROM kickstarter_part
ORDER BY avgpledged desc
limit 1;

#11.
SELECT category, count(*) as Total
FROM kickstarter_part
WHERE state = "successful"
GROUP By category
ORDER BY count(*) desc;

#12.
SELECT count(*) as NumbTech
FROM kickstarter_part
WHERE category = "Technology";

SELECT NumbTech/Totalcount as ProofSuccess
FROM (SELECT count(*) Totalcount
FROM kickstarter_part
WHERE category = "Technology") as sub1, (SELECT count(*) as NumbTech
FROM kickstarter_part
WHERE state = "successful" and category = "Technology") as sub2;


#13.
SELECT sub1.category, Successcount/Totalcount as SuccessProb
FROM (SELECT category, count(*) as Successcount
FROM kickstarter_part
WHERE state = "successful"
GROUP By category) as sub1, (SELECT category, count(*) Totalcount
FROM kickstarter_part
GROUP BY category) as sub2
WHERE sub1.category = sub2.category
ORDER BY SuccessProb desc;
