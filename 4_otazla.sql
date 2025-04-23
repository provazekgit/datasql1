-- Vytvoření přehledu průměrné ceny všech potravin za každý rok
WITH ceny_rocne AS (
    SELECT 
        EXTRACT(YEAR FROM cp.date_from) AS rok,               -- extrahujeme rok z datumu
        AVG(cp.value) AS prumerna_cena                        -- spočítáme průměrnou cenu všech potravin v daném roce
    FROM data_academy_content.czechia_price cp
    GROUP BY EXTRACT(YEAR FROM cp.date_from)
),

-- Výpočet meziroční změny cen (v %)
ceny_mezirocni_zmena AS (
    SELECT 
        a.rok,
        a.prumerna_cena,
        b.prumerna_cena AS predchozi_cena,
        ROUND(((a.prumerna_cena - b.prumerna_cena) / b.prumerna_cena)::numeric, 2) AS mezirocni_zmena_cen
    FROM ceny_rocne a
    JOIN ceny_rocne b ON a.rok = b.rok + 1                   -- spojení s předchozím rokem
),

-- Vytvoření přehledu průměrných mezd za každý rok
mzdy_rocne AS (
    SELECT 
        payroll_year AS rok,
        AVG(value) AS prumerna_mzda
    FROM data_academy_content.czechia_payroll
    WHERE value_type_code = 200       -- průměrné hodnoty
      AND calculation_code = 316      -- celkové mzdy (kód podle číselníku)
    GROUP BY payroll_year
),

-- Výpočet meziroční změny mezd (v %)
mzdy_mezirocni_zmena AS (
    SELECT 
        a.rok,
        a.prumerna_mzda,
        b.prumerna_mzda AS predchozi_mzda,
        ROUND(((a.prumerna_mzda - b.prumerna_mzda) / b.prumerna_mzda)::numeric, 2) AS mezirocni_zmena_mezd
    FROM mzdy_rocne a
    JOIN mzdy_rocne b ON a.rok = b.rok + 1                   -- spojení s předchozím rokem
),

-- Spojení obou změn do jedné tabulky pro srovnání
spojene_zmeny AS (
    SELECT 
        c.rok,
        c.mezirocni_zmena_cen,
        m.mezirocni_zmena_mezd
    FROM ceny_mezirocni_zmena c
    JOIN mzdy_mezirocni_zmena m ON c.rok = m.rok             -- spojení podle roku
)

-- Finální výběr: hledáme roky, kdy ceny vzrostly o více než 10 % a zároveň rychleji než mzdy
SELECT *
FROM spojene_zmeny
WHERE mezirocni_zmena_cen > 10
  AND mezirocni_zmena_cen > mezirocni_zmena_mezd
ORDER BY rok;
