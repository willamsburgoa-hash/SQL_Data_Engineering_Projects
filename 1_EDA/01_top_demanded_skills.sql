SELECT 
    sd.skills,
    COUNT(jpf.*) AS demand_count
FROM job_postings_fact as jpf
INNER JOIN skills_job_dim as sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim as sd
    ON sjd.skill_id = sd.skill_id
WHERE 
    job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = TRUE
GROUP BY 
    sd.skills
ORDER BY 
    demand_count DESC
LIMIT 10;

/*
Here´s the brakdown of the most demanded skills for data engineers:
SQL and Python are by far the most in-demand skills, with around 29,000 job postings each-nearly double the next most in-demand skill, AWS. Cloud platforms like AWS, Azure, and GCP are also highly sought after, reflecting the growing importance of cloud computing in data engineering roles. Additionally, skills related to big data processing and workflow management, such as Spark and Airflow, are also in high demand.
Apache Spark completes the top 5 with nearly 13,000 postings, highlighting the importance of big data processing frameworks in the data engineering field. Airflow, a popular workflow management tool, also shows significant demand with nearly 10,000 postings. Snowflake and Databricks, both cloud-based data platforms, are also notable, indicating a trend towards modern data warehousing and analytics solutions. Java remains relevant with over 7,000 postings, while GCP rounds out the top 10 skills with over 6,000 postings. Overall, these results underscore the critical skills that aspiring data engineers should focus on to enhance their employability in the current job market.

Key Takeaways:
- SQL and Python remain the foundational skills for data engineers
- Cloud platforms (AWS, Azure) are essential for modern data engineering roles
- Big data processing frameworks (Spark) and workflow management tools (Airflow) are highly valued
- Data pipeline tools and cloud-based data platforms (Snowflake, Databricks) are increasingly important
- Java and GCP round out the top 10 skills
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
  10 rows         2 columns
*/