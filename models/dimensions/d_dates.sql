WITH data AS (
    SELECT
        EXTRACT(MONTH FROM TIMESTAMP) AS _MONTH,
        CAST(EXTRACT(YEAR FROM TIMESTAMP) AS STRING) AS _YEAR
    FROM {{ ref("f_daily_average_records") }}
    GROUP BY TIMESTAMP
)

SELECT *
FROM data