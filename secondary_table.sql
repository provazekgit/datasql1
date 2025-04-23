DROP TABLE IF EXISTS t_pavel_provazek_project_sql_secondary_final;

CREATE TABLE t_pavel_provazek_project_sql_secondary_final AS
SELECT DISTINCT
    country,
    year,
    gdp,
    gini,
    population
FROM economies
WHERE
    country IN (
        'Austria', 'Czech Republic', 'France', 'Germany', 'Hungary',
        'Italy', 'Netherlands', 'Poland', 'Slovakia', 'Spain'
    )
    AND year BETWEEN 2000 AND 2021
ORDER BY country, year;
