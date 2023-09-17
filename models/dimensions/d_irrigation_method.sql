WITH unique_irrigation_methods AS (
    SELECT DISTINCT IRRIGATION_METHOD
    FROM {{ ref("dwh_irrigation") }}
)

SELECT
    ROW_NUMBER() OVER (ORDER BY IRRIGATION_METHOD) AS IRRIGATION_METHOD_ID,
    IRRIGATION_METHOD,
    CURRENT_TIMESTAMP() AS created_at
FROM unique_irrigation_methods

