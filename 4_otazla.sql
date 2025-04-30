
WITH ceny_rocne AS (
    SELECT 
        year,
        ROUND(AVG(avg_price)::numeric, 2) AS prumerna_cena
    FROM t_pavel_provazek_project_sql_primary_final
    GROUP BY year
),

ceny_mezirocni AS (
    SELECT 
        a.year,
        a.prumerna_cena,
        b.prumerna_cena AS predchozi_cena,
        ROUND(((a.prumerna_cena - b.prumerna_cena) / b.prumerna_cena) * 100, 2) AS mezirocni_zmena_cen
    FROM ceny_rocne a
    JOIN ceny_rocne b ON a.year = b.year + 1
),

mzdy_rocne AS (
    SELECT 
        year,
        ROUND(AVG(avg_salary)::numeric, 2) AS prumerna_mzda
    FROM t_pavel_provazek_project_sql_primary_final
    GROUP BY year
),

mzdy_mezirocni AS (
    SELECT 
        a.year,
        a.prumerna_mzda,
        b.prumerna_mzda AS predchozi_mzda,
        ROUND(((a.prumerna_mzda - b.prumerna_mzda) / b.prumerna_mzda) * 100, 2) AS mezirocni_zmena_mezd
    FROM mzdy_rocne a
    JOIN mzdy_rocne b ON a.year = b.year + 1
),

spojene_zmeny AS (
    SELECT 
        c.year,
        c.mezirocni_zmena_cen,
        m.mezirocni_zmena_mezd
    FROM ceny_mezirocni c
    JOIN mzdy_mezirocni m ON c.year = m.year
)

SELECT *
FROM spojene_zmeny
WHERE mezirocni_zmena_cen > 10
  AND mezirocni_zmena_cen > mezirocni_zmena_mezd
ORDER BY year;
