WITH mzdy_cr AS (
    SELECT 
        year,
        ROUND(AVG(avg_salary)) AS prumerna_mzda
    FROM t_pavel_provazek_project_sql_primary_final
    GROUP BY year
),

ceny_cr AS (
    SELECT 
        year,
        ROUND(AVG(avg_price)::numeric, 2) AS prumerna_cena
    FROM t_pavel_provazek_project_sql_primary_final
    GROUP BY year
),

hpd_cr AS (
    SELECT 
        year,
        gdp
    FROM t_pavel_provazek_project_sql_secondary_final
    WHERE country = 'Czech Republic'
)

SELECT 
    h.year,
    h.gdp,
    m.prumerna_mzda,
    c.prumerna_cena,
    LEAD(m.prumerna_mzda) OVER (ORDER BY h.year) AS mzda_next_year,
    LEAD(c.prumerna_cena) OVER (ORDER BY h.year) AS cena_next_year
FROM hpd_cr h
JOIN mzdy_cr m ON h.year = m.year
JOIN ceny_cr c ON h.year = c.year
ORDER BY h.year;
	
