WITH cleaned_data AS (
  SELECT 
    TO_DATE(TIMESTAMP, 'MM/DD/YYYY HH24:MI') AS timestamp,
    WEATHER_CONDITION AS weather_condition,
    CAST(PRECIPITATION AS FLOAT) AS precipitation,
    CAST(WIND_SPEED AS FLOAT) AS wind_speed
  FROM {{ ref("stg_weather")}}
  WHERE PRECIPITATION != 'NA' AND WIND_SPEED != 'NA'
  
)

SELECT * FROM cleaned_data 
ORDER BY TIMESTAMP DESC
