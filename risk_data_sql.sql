-- WWhat are the drivers of financial risk?

SELECT
to_char(application_date, 'YYYY') as _year,
CASE
    WHEN loan_approved = 0
    THEN 'Rejected'
    ELSE 'Approved'
END as loan_approval_status,
    count(*) as total_applicants,
    round(avg(age),2) as average_age,
    round(avg(annual_income),2) AS average_income,
    round(avg(total_assets),2) as average_assets,
    round(avg(total_liabilities),2) as average_liabilities,
    round(avg(savings_account_balance),2) as average_savings,
    round(avg(job_tenure),2) as average_job_tenure,
    round(avg(total_debt_to_income_ratio)::numeric,2) as average_debt_to_income_ratio

FROM test_project1
GROUP BY loan_approved, _year
ORDER BY _year;