# datasql1
Projekt SQL
"""# Projekt: Analýza životních nákladů a mezd v ČR

Tento projekt analyzuje data z České republiky (2006–2021) a dalších evropských států (2000–2020) s cílem odpovědět na 5 výzkumných otázek ohledně vývoje mezd, cen potravin a vztahu k HDP.

## 🔧 Použité datové tabulky

- `t_pavel_provazek_project_sql_primary_final`  
  Obsahuje: průměrné mzdy v odvětvích + ceny základních potravin v ČR.
- `t_pavel_provazek_project_sql_secondary_final`  
  Obsahuje: HDP, GINI index a populaci vybraných států EU.

---

## 📌 Výzkumné otázky

### 1️⃣ Rostou mzdy ve všech odvětvích?
- 📊 Použita funkce `LAG()` pro výpočet meziročního rozdílu.
- ✅ Zjištěno: mzdy **ve všech odvětvích rostly**.

### 2️⃣ Kolik mléka a chleba si lze koupit za mzdu v letech 2006 a 2018?
- ✅ Využita `primary` tabulka, výpočty přes `CASE` a průměrné ceny.
- 📈 Kupní síla **výrazně vzrostla** – mzdy rostly rychleji než ceny.

### 3️⃣ Která potravina zdražuje nejpomaleji?
- ✅ Pouze `primary` tabulka, výpočet meziročního růstu cen.
- 🥄 **Cukr krystalový** – průměrně **−1,92 % ročně** (zlevňoval).

### 4️⃣ Existoval rok, kdy ceny potravin rostly o více než 10 % a rychleji než mzdy?
- ✅ Meziroční porovnání růstu mzdy vs. ceny.
- ❌ **Nebyl nalezen žádný rok**, který by splnil obě podmínky.

### 5️⃣ Má HDP vliv na mzdy a ceny potravin?
- ✅ Spojeno s `secondary` tabulkou.
- 📈 Mezi **HDP a mzdami existuje pozitivní korelace**.
- ❌ **Ceny potravin nejsou navázané na HDP**, ovlivňuje je více faktorů.

---

## 🧠 Závěr

- Růst HDP = růst mezd ✅
- Růst HDP ≠ automaticky růst cen potravin ❌
- Kupní síla se v čase zlepšovala 📈
- Projekt splnil zadání a všechny dotazy byly vyřešeny s využitím připravených finálních tabulek.

---

_Vypracoval: Pavel Provázek_  
_Datum: 2025-04-23_
"""
