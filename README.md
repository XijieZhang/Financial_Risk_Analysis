# Financial Risk Analysis Project

I used my Excel, SQL and Power BI skills to finish this project


# Objective 

We need to assess the financial risk in an underwriter's point of view, based on the given personal and financial data records.

- What is the ideal solution? 

To create a dashboard that provides insights into each individual's likelihood of loan default or financial instability. Seeing if there's a potential relationship between their loan approval status and their 
- age
- debt to income ratio
- job tenure
- and more


# Data source 

The data is sourced from Kaggle (csv file), you can [find it here](https://www.kaggle.com/datasets/lorenzozoppelletto/financial-risk-for-loan-approval).

Or check the csv file out here: [Loan.csv](/Loan.csv/)

# Design 

- What questions we need the dashboard to answer:

1. How many loan applications did we get?
2. What's the average yearly loan approval status and what's the approved ratio?
3. The average age, debt to income ratio, job tenure, income, assets, liabilities of applicants and their relation between approval status.

### Tools 

| Tool | Purpose |
| --- | --- |
| Excel | Exploring the data |
| PostgreSQL | Cleaning, testing, and analyzing the data |
| Power BI | Visualizing the data via interactive dashboards |
| GitHub | Hosting the project documentation and version control |


# Development

- What's the general approach in creating this solution from start to finish?

1. Get the data
2. Explore the data in Excel
3. Load the data into SQL Server
4. Clean the data with SQL
5. Test the data with SQL
6. Visualize the data in Power BI
7. Generate the findings based on the insights
8. Write the documentation + commentary
9. Publish the data to GitHub Pages

## Data exploration

- Have a scan of what's in the data, errors, inconcsistencies, bugs, weird and corrupted characters etc  

![loan data excel](https://github.com/user-attachments/assets/8bd9f6b6-5e38-4265-a88c-049aa978809b)

1. We need to count the applicants.
2. We need to calculate the averaged yearly data.
3. We need to convert the 'LoanApproved' data into status(Approved/ Rejected).
4. Some of the numbers need to be rounded up, in order to have a clearer visualization.
5. We have more data than we need, so some of these columns would need to be removed.

## Data loading

- Load the data (in csv file) into PostgreSQL server, using pgAdmin 4.

1. Create a new database 'project1'.
2. Create a new table 'test_project1' under Schemas.
3. Import the data into the table.

![pgadmin project1 data load](https://github.com/user-attachments/assets/c188a1c3-9a49-4398-86d2-fe3fa46cc81f)

## Data cleaning 

The aim is to refine our dataset to ensure it is structured and ready for analysis. The cleaned data should meet the above criteria and constraints and the following:

- Only relevant columns should be retained.
- All data types should be appropriate for the contents of each column.
- No column should contain null values, indicating complete data for all records.

Check the SQL queries out here: [risk_data_sql.sql](/risk_data_sql.sql/)

```sql
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
```

The returned dataset looks like this:

![project1 sql returned risk data](https://github.com/user-attachments/assets/ad5ed5f1-2ef0-4d6a-804e-08e433cd895a)

Check the csv file out here: [risk_data.csv](/risk_data.csv/)

## Testing 

1. Count the total number of records (or rows) are in the SQL view.
2. Count the total number of columns (or fields) are in the SQL view.
3. Check for duplicate rows in the view.


## Visualization 

- What does the dashboard look like?

Check the file out here: [Financial risk project pbi](/Financial_risk_project_pbi.pdf/)

![financial risk pbi](https://github.com/user-attachments/assets/48b892e7-570a-4867-bfdb-a64a2612e518)

This shows the drivers of financial risk. 


# Analysis 

We discovered that 

1. There are always more declined than approved applicants.
2. The declined applicants tend to have a higher debt-to-income ratio than the approved ones (in a same period of time).
3. Older applicants are more likely to get their loan approved than younger ones.
4. The approved applicants tend to have a longer job tenure.


# Conclusions
This project shows my ability of generating business insights from a group of data using my Excel, SQL and Power BI skills. It also shows the general approach in creating a solution from start to finish.
