# 00 – Vytvoření pracovních tabulek

Pro analýzu všech výzkumných otázek byly vytvořeny dvě finální tabulky, které slouží jako hlavní datový zdroj. Všechny datové transformace proběhly do těchto tabulek **beze změny původních tabulek**.

---

## t_pavel_provazek_project_sql_primary_final

Tato tabulka obsahuje data týkající se mezd a cen potravin v České republice:

- Rok (`year`)
- Odvětví (`industry_name`)
- Průměrná mzda (`avg_salary`)
- Název produktu (`product_name`)
- Průměrná cena produktu (`avg_price`)

### SQL 1 definice:

```sql
DROP TABLE IF EXISTS t_pavel_provazek_project_sql_primary_final;

CREATE TABLE t_pavel_provazek_project_sql_primary_final AS
SELECT
    p.payroll_year AS year,
    pib.name AS industry_name,
    ROUND(AVG(p.value)) AS avg_salary,
    pr.name AS product_name,
    ROUND(AVG(cp.value)::numeric, 2) AS avg_price
FROM data_academy_content.czechia_payroll p
JOIN data_academy_content.czechia_payroll_industry_branch pib ON p.industry_branch_code = pib.code
JOIN data_academy_content.czechia_price cp ON p.payroll_year = EXTRACT(YEAR FROM cp.date_from)
JOIN data_academy_content.czechia_price_category pr ON cp.category_code = pr.code
WHERE
    p.value_type_code = '5958'  -- průměrná mzda
    AND p.unit_code = '200'     -- Kč
    AND p.calculation_code = '100' -- průměr za kvartál
GROUP BY
    p.payroll_year,
    pib.name,
    pr.name
ORDER BY
    p.payroll_year,
    pib.name,
    pr.name;

### SQL 2 definice:

## Datové podklady – kontrola a poznámky

### Tabulka: t_pavel_provazek_project_sql_primary_final
- Období: 2006–2021
- Pokrytí odvětví a produktů je rozsáhlé, ale některé kombinace nejsou ve všech letech dostupné.
- Produkty jako "Mléko polotučné" a "Chléb kmínový" jsou dostupné téměř ve všech sledovaných letech.
- Průměrné mzdy odpovídají očekávaným hodnotám (růst v čase).

### Tabulka: t_pavel_provazek_project_sql_secondary_final
- Období: 2000–2020
- Většina ekonomických ukazatelů je dostupná.
- GINI index má výpadky v některých letech a zemích (např. ČR 2000–2001).
- Populace a HDP jsou kompletní pro všechny sledované země.

### Obecné poznámky
- Data byla zpracována beze změny původních tabulek.
- Všechny transformace proběhly do samostatných tabulek dle zadání.
