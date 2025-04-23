# 04 – Extrémní nárůst cen potravin vs. růst mezd

## Výzkumná otázka č. 4

**Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?**

---

## 🧠 Cíl

Cílem je zjistit, zda se v některém roce výrazně zvýšily ceny potravin tak, že:

- meziroční růst cen byl **větší než 10 %**,  
- a zároveň **překonal meziroční růst mezd**.

---

## 📊 Použitá tabulka
<pre>
- `t_pavel_provazek_project_sql_primary_final`
</pre>
Z této tabulky jsme vypočítali:

- **průměrné ceny potravin** za každý rok,
- **průměrné mzdy** za každý rok,
- jejich **meziroční změny v %**.

---

## 💻 SQL přístup

1. Spočítáme průměrné roční hodnoty cen a mezd.
2. Pomocí `JOIN` a `LAG()`/`JOIN b.year = a.year - 1` získáme meziroční změny.
3. Porovnáme vývoj v jednotlivých letech.
<pre>
```sql
-- Viz SQL skript ve složce /04_otazka.sql
</pre>
### ### Odpověd 4:

 Pro zjištění, zda existoval rok s mimořádně vysokým růstem cen potravin,
  který zároveň překonal růst mezd, byl použit SQL dotaz, který počítá meziroční
  procentuální změny cen a mezd. Na základě podmínky ceny > 10 % a > růst mezd nebyl
  nalezen žádný rok v období 2007–2018, který by tuto podmínku splnil.
