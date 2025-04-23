DROP TABLE IF EXISTS t_pavel_provazek_project_sql_primary_final;

CREATE TABLE t_pavel_provazek_project_sql_primary_final AS
SELECT
    p.payroll_year AS year,
    pib.name AS industry_name,
    AVG(p.value) AS avg_salary,
    pr.name AS product_name,
    AVG(cp.value) AS avg_price
FROM
    czechia_payroll p
JOIN czechia_payroll_industry_branch pib ON p.industry_branch_code = pib.code
JOIN czechia_price cp ON p.payroll_year = cp.date_year
JOIN czechia_price_category pr ON cp.category_code = pr.code
WHERE
    p.value_type_code = '5958' AND -- průměrná mzda
    p.unit_code = '200' AND        -- Kč
    p.calculation_code = '100'     -- průměr za kvartál
GROUP BY
    p.payroll_year,
    pib.name,
    pr.name
ORDER BY
    p.payroll_year,
    pib.name,
    pr.name;
