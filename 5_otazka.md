# Výzkumná otázka č. 5

## Má výška HDP vliv na změny ve mzdách a cenách potravin?

> Pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

---

## 📊 Souvislost mezi HDP a průměrnou mzdou

Z analýzy dat v letech 2006–2018 vyplývá, že růst HDP v České republice má **pozitivní dopad na růst mezd**. Tabulka níže ukazuje vývoj obou veličin:

| Rok  | HDP (v mld Kč) | Průměrná mzda (Kč) |
|------|----------------|--------------------|
| 2006 | 197,5          | 20 343             |
| 2010 | 209,1          | 24 722             |
| 2015 | 227,4          | 26 960             |
| 2018 | 253,0          | 31 981             |

**Mzdy rostly rychleji než HDP:**  
- HDP vzrostlo o cca **28 %**,  
- průměrná mzda o cca **57 %**.

<pre>
```sql
-- Viz SQL skript v souboru /5_otazka.sql
</pre>

### ✅ Závěr:
> **Růst HDP ovlivňuje pozitivně růst mezd,** a to buď ve stejném roce, nebo s malým zpožděním.

---

## 🍞 Souvislost mezi HDP a průměrnou cenou potravin

Na rozdíl od mezd **není mezi růstem HDP a růstem cen potravin žádná přímá vazba**.

| Rok  | HDP (v mld Kč) | Průměrná cena potravin (Kč) |
|------|----------------|-----------------------------|
| 2006 | 197,5          | 45,52                       |
| 2009 | 204,1          | 48,29                       |
| 2013 | 211,0          | 57,07                       |
| 2018 | 253,0          | 63,27                       |

I v letech, kdy HDP stagnovalo nebo pokleslo (např. 2009, 2012), ceny potravin dále rostly.

### ⚠️ Závěr:
> **Ceny potravin nejsou přímo navázány na HDP.**  
> Ovlivňuje je více faktorů, např. inflace, ceny energií, komoditní trhy, dovoz atd.

---

## 🧠 Shrnutí

- **ANO**, existuje pozitivní korelace mezi HDP a mzdami.
- **NE**, ceny potravin HDP přímo nesledují.

Růst HDP tedy **podporuje kupní sílu** obyvatel, ale **neznamená automaticky růst cen základních potravin**.

---

_Vypracoval: Pavel Provázek_  
_Datum: 2025-04-23_
