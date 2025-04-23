WITH zaklad AS (
    SELECT
        industry_name,
        year,
        ROUND(AVG(avg_salary)) AS mzda,
        MAX(CASE WHEN product_name = 'Mléko polotučné pasterované' THEN avg_price ELSE NULL END) AS cena_mleka,
        MAX(CASE WHEN product_name = 'Chléb konzumní kmínový' THEN avg_price ELSE NULL END) AS cena_chleba
    FROM t_pavel_provazek_project_sql_primary_final
    WHERE year IN (2006, 2018)
    GROUP BY industry_name, year
)

SELECT
    industry_name,
    year,
    mzda,
    ROUND(mzda / cena_mleka, 2) AS litru_mleka,
    ROUND(mzda / cena_chleba, 2) AS kg_chleba
FROM zaklad
WHERE cena_mleka IS NOT NULL AND cena_chleba IS NOT NULL
ORDER BY industry_name, year;
