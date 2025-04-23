-- Abychom dostali jednu průměrnou mzdu ročně pro každé odvětví, uděláme to takto:
SELECT
    industry_name,
    year,
    ROUND(AVG(avg_salary)) AS avg_salary
FROM
    t_pavel_provazek_project_sql_primary_final
GROUP BY
    industry_name, year
ORDER BY
    industry_name, year;


-- Pro sledování  růst/pokles mezi lety, přidejme LAG() funkci:
WITH aggregated AS (
    SELECT
        industry_name,
        year,
        ROUND(AVG(avg_salary)) AS avg_salary
    FROM
        t_pavel_provazek_project_sql_primary_final
    GROUP BY
        industry_name, year
)

SELECT
    industry_name,
    year,
    avg_salary,
    avg_salary - LAG(avg_salary) OVER (PARTITION BY industry_name ORDER BY year) AS salary_diff,
    ROUND(
        (avg_salary - LAG(avg_salary) OVER (PARTITION BY industry_name ORDER BY year)) /
        NULLIF(LAG(avg_salary) OVER (PARTITION BY industry_name ORDER BY year), 0) * 100, 2
    ) AS pct_change
FROM aggregated
ORDER BY industry_name, year;
