# 03 – Nejpomaleji zdražující potravina

## Výzkumná otázka č. 3

**Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?**

---

## Použitá tabulka

- `t_pavel_provazek_project_sql_primary_final`

---

## Použitý SQL dotaz:

```sql
WITH prumerne_ceny AS (
    SELECT
        product_name,
        year,
        ROUND(AVG(avg_price)::numeric, 2) AS prumerna_cena
    FROM t_pavel_provazek_project_sql_primary_final
    GROUP BY product_name, year
),

rocni_zmeny AS (
    SELECT
        a.product_name,
        a.year,
        a.prumerna_cena AS cena_aktualni,
        b.prumerna_cena AS cena_predchozi,
        ROUND(((a.prumerna_cena - b.prumerna_cena) / b.prumerna_cena)::numeric, 4) AS procentualni_zmena
    FROM prumerne_ceny a
    JOIN prumerne_ceny b 
        ON a.product_name = b.product_name AND a.year = b.year + 1
),

prumerne_tempo_zdrazovani AS (
    SELECT
        product_name,
        ROUND(AVG(procentualni_zmena)::numeric, 4) AS prumerna_rocni_zmena
    FROM rocni_zmeny
    GROUP BY product_name
)

SELECT product_name, prumerna_rocni_zmena
FROM prumerne_tempo_zdrazovani
ORDER BY prumerna_rocni_zmena ASC
LIMIT 1;

### Odpověď na dotaz 3

**Potravinou, která zdražovala nejpomaleji (dokonce mírně zlevnila), je:**

 Cukr krystalový
*Průměrný meziroční cenový rozdíl*: **−0,02 %**
