SELECT MONTH(date_stolen) AS Month, COUNT(*) AS 'Vehicles Stolen'
FROM stolen_vehicles
GROUP BY MONTH(date_stolen)
ORDER BY MONTH(date_stolen);
