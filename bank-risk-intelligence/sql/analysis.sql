-- 1. Portfolio overview

SELECT 
    COUNT(*) AS total_loans,
    SUM(loan_status) AS defaults,
    ROUND(
        AVG(loan_status) * 100,
        2
    ) AS default_rate_percent
FROM credit_risk;

-- 2. Default rate by loan purpose

SELECT
    loan_intent,
    COUNT(*) AS number_of_loans,
    ROUND(
        AVG(loan_status) * 100,
        2
    ) AS default_rate_percent
FROM credit_risk
GROUP BY loan_intent
ORDER BY default_rate_percent DESC;

-- 3. Default rate by credit grade

SELECT
    loan_grade,
    COUNT(*) AS number_of_loans,
    ROUND(
        AVG(loan_status) * 100,
        2
    ) AS default_rate_percent
FROM credit_risk
GROUP BY loan_grade
ORDER BY loan_grade;

-- 4. Default rate by age group

SELECT
    CASE
        WHEN person_age < 25 THEN '18-24'
        WHEN person_age < 35 THEN '25-34'
        WHEN person_age < 45 THEN '35-44'
        WHEN person_age < 55 THen '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS clients,
    ROUND(
        AVG(loan_status) * 100,
        2
    ) AS default_rate_percent
FROM credit_risk
GROUP BY age_group
ORDER BY default_rate_percent DESC;

-- 5. Default rate by income group

SELECT
    CASE
        WHEN person_income < 30000 THEN 'Low Income'
        WHEN person_income < 60000  THEN 'Medium Income'
        WHEN person_income < 100000 THEN 'High Income'
        ELSE 'Very High Income'
    END AS income_group,
    COUNT(*) AS clients,
    ROUND(
        AVG(loan_status) * 100,
        2
    ) AS default_rate_percent
FROM credit_risk
GROUP BY income_group
ORDER BY default_rate_percent DESC;

-- 6. Default rate by home ownership

SELECT
    person_home_ownership,
    COUNT(*) AS number_of_loans,
    ROUND(
        AVG(loan_status) * 100,
        2
    ) AS default_rate_percent
FROM credit_risk
GROUP BY person_home_ownership
ORDER BY default_rate_percent DESC;

-- 7. Portfolio value

SELECT
    ROUND(
        SUM(loan_amnt),
        2
    ) AS total_portfolio_value
FROM credit_risk;

-- 8. Value of defaulted loans

SELECT
    ROUND(
        SUM(
            CASE
                WHEN loan_status = 1 THEN loan_amnt
                ELSE 0 
            END
        ),
        2
    ) AS defaulted_loan_value
FROM credit_risk;

-- 9. Risk by loan purpose and grade

SELECT
    loan_intent,
    loan_grade,
    COUNT(*) AS loans,
    ROUND(
        AVG(loan_status) * 100,
        2
    ) AS default_rate_percent
FROM credit_risk
GROUP BY 
    loan_intent,
    loan_grade
HAVING COUNT(*) >= 50
ORDER BY default_rate_percent DESC;

-- 10. High-risk customer segments

SELECT
    CASE
        WHEN person_age < 25 THEN '18-24'
        WHEN person_age < 35 THEN '25-34'
        WHEN person_age < 45 THEN '35-44'
        ELSE '45+'
    END AS age_group,
    loan_grade,
    COUNT(*) AS number_of_loans,
    ROUND(
        AVG(loan_status) * 100,
        2
    ) AS default_rate_percent
FROM credit_risk
GROUP BY
    age_group,
    loan_grade
HAVING COUNT(*) >= 100
ORDER BY default_rate_percent DESC;