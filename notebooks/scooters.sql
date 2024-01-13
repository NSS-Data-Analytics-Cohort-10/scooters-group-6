SELECT *
FROM scooters
WHERE NOT(scooters IS NOT NULL);

SELECT *
FROM trips
WHERE sumdid = 'Poweredffcc1b11-af95-5e06-b002-82ffb342aae8'

SELECT 
    startdate date,
    COUNT(startdate)
FROM trips
GROUP BY startdate;

SELECT COUNT(*)
FROM scooters;

(SELECT
    'scooters' subject,
    MAX(pubdatetime) begin,
    MIN(pubdatetime) end
FROM scooters)
UNION
(SELECT
    'trips' subject,
    MAX(pubtimestamp) begin,
    MIN(pubtimestamp) end
FROM trips);

SELECT
    companyname company,
    COUNT(DISTINCT sumdid) total_scooters
FROM scooters
WHERE sumdid NOT IN
    (SELECT
        DISTINCT sumdid
    FROM trips)
GROUP BY companyname;


SELECT 
    DISTINCT sumdid,
    companyname company,
    ROUND(AVG(COUNT(sumdid)) OVER (PARTITION BY sumdid, DATE(pubtimestamp)),2) avg_daily_usage
FROM trips
GROUP BY sumdid, company, pubtimestamp

SELECT 