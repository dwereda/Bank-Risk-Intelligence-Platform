CREATE TABLE credit_risk(
    person_age INT,
    person_income NUMERIC(10, 2),
    person_home_ownership VARCHAR(20),
    person_emp_length NUMERIC(5, 2),
    loan_intent VARCHAR(50),
    loan_grade VARCHAR(1),
    loan_amnt NUMERIC(10, 2),
    loan_int_rate NUMERIC(5, 2),
    loan_status INT,
    loan_percent_income NUMERIC(5, 2),
    cb_person_default_on_file VARCHAR(1),
    cb_person_cred_hist_length INT
);