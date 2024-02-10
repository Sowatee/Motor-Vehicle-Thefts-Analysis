SELECT YEAR(date_stolen), COUNT(*) AS 'Vehicles Stolen'
FROM stolen_vehicles
GROUP BY YEAR(date_stolen)
ORDER BY YEAR(date_stolen);