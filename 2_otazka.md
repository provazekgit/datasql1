# 02 – Kupní síla: kolik si šlo koupit mléka a chleba za mzdu

## Výzkumná otázka č. 2

**Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?**

---

## Použité tabulky

- `t_pavel_provazek_project_sql_primary_final`

---

## Produkty pro výpočet:

- **Mléko polotučné pasterované (1 litr)**
- **Chléb konzumní kmínový (1 kg)**

---

## Použité roky:
- **2006**
- **2018**

---

## Použitý SQL dotaz:

```sql
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

### ## Odpověď :

 V roce 2006 se za mzdu dalo koupit cca 913 až 1293 litrů mléka a 747 až 1058 kg chleba
 V roce 2018 to bylo **1106 až 1598 litrů mléka** a **796 až 1150 kg chleba**

  Kupní síla rostla, protože mzdy rostly rychleji než ceny těchto základních potravin.
