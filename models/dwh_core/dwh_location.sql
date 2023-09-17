WITH cleaned_data AS (
  SELECT
    SUBSTR(SENSOR_ID, 5, 4) AS SENSOR_ID,
    LATITUDE,
    LONGITUDE,
    ELEVATION,
    REGION
  FROM {{ ref("stg_location") }}
)


SELECT * FROM cleaned_data 