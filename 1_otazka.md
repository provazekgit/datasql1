# 01 – Vývoj mezd ve všech odvětvích

## Výzkumná otázka č. 1

**Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?**

---

## Použité zdroje

- Tabulka: `t_pavel_provazek_project_sql_primary_final`
- Sloupce: `industry_name`, `year`, `avg_salary`

---

## Postup

1. Nejprve jsme agregovali průměrné mzdy za každý rok a každé odvětví.
2. Pomocí funkce `LAG()` jsme spočítali meziroční změny:
   - absolutní rozdíl
   - relativní změnu v procentech

---

## Použité SQL dotazy

### 1. Základní přehled vývoje mezd:

```sql
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

### 2. Přehled s meziroční změnou (rozdíl + procenta):
```sql
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

### Odpověd 1

Mzdy ve všech sledovaných odvětvích mezi roky 2006 a 2018 rostly – nenalezli jsme žádné odvětví, kde by mzda klesla.
