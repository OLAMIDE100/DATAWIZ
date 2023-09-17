{% macro most_frequent(column, table,rank) %}
    
    SELECT  
         TIMESTAMP, 
        {{ column }} 
    FROM (
         SELECT
            TIMESTAMP,
            {{ column }},
            ROW_NUMBER() OVER (PARTITION BY TIMESTAMP ORDER BY COUNT(*) DESC) AS rn
        FROM {{ table }}
        GROUP BY TIMESTAMP, {{column }}
        ORDER BY TIMESTAMP DESC
        )
    WHERE rn = {{ rank}}
{% endmacro %}