-- FIND THE NUMBER OF VEHICLES THAT WERE STOLEN IN EACH REGION

SELECT l.region, COUNT(*) AS vehicles_stolen
FROM locations l
JOIN stolen_vehicles sv ON
l.location_id = sv.location_id
GROUP BY l.location_id;

-- COMBINE THE PREVIOUS OUTPUT WITH THE POPULATION AND DENSITY STATISTICS FOR EACH REGION
SELECT l.region, COUNT(*) AS vehicles_stolen, l.population, l.density
FROM locations l
LEFT JOIN stolen_vehicles sv ON
l.location_id = sv.location_id
GROUP BY l.location_id, population, density
ORDER BY density DESC;

-- DO THE TYPES OF VEHICLES STOLEN IN THE THREE MOST DENSE REGIONS DIFFER FROM THE THREE LEAST DENSE REGIONS?
SELECT sv.vehicle_type, COUNT(*) AS stolen_vehicles
FROM stolen_vehicles sv LEFT JOIN locations l
ON sv.location_id = l.location_id
WHERE l.region IN ('Auckland', 'Nelson', 'Wellington')
GROUP BY sv.vehicle_type
ORDER BY stolen_vehicles DESC;

SELECT sv.vehicle_type, COUNT(*) AS stolen_vehicles
FROM stolen_vehicles sv LEFT JOIN locations l
ON sv.location_id = l.location_id
WHERE l.region IN ('Southland', 'Gisborne', 'Otago')
GROUP BY sv.vehicle_type
ORDER BY stolen_vehicles DESC;
