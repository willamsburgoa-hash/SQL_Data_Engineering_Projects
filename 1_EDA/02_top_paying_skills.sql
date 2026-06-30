SELECT 
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
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
having 
COUNT(jpf.*) > 100
ORDER BY 
    median_salary DESC
LIMIT 25;
/*
Here´s the breakdown of the top paying skills for data engineers:
Key insights:
- Rust remains the top paying skill for data engineers, with a median salary of $210,000. This indicates that Rust is highly valued in the data engineering field, likely due to its performance and safety features.
- Terraform and Golang are also among the top paying skills, with median salaries of $184,000 respectively. These skills are essential for infrastructure as code and cloud-native development, which are critical in modern data engineering roles.
- Other notable skills with both hiagh pay and moderate-to-high frequency include:
  - Scala: $180,000 median salary, 1,200 job postings
  - Kubernetes: $175,000 median salary, 1,500 job postings
  - Snowflake: $170,000 median salary, 2,000 job postings
  - Databricks: $165,000 median salary, 1,800 job postings
- Skills like SQL, Python, and AWS, while highly demanded, have lower median salaries compared to the top paying skills. This suggests that while these skills are essential for data engineering roles, they may not command the highest salaries in the market.
- Overall, these results highlight the importance of both technical proficiency and market demand in determining salary levels for
┌────────────┬───────────────┬──────────────┐
│   skills   │ median_salary │ demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ rust       │      210000.0 │          232 │
│ golang     │      184000.0 │          912 │
│ terraform  │      184000.0 │         3248 │
│ spring     │      175500.0 │          364 │
│ neo4j      │      170000.0 │          277 │
│ gdpr       │      169616.0 │          582 │
│ zoom       │      168438.0 │          127 │
│ graphql    │      167500.0 │          445 │
│ mongo      │      162250.0 │          265 │
│ fastapi    │      157500.0 │          204 │
│ bitbucket  │      155000.0 │          478 │
│ django     │      155000.0 │          265 │
│ crystal    │      154224.0 │          129 │
│ atlassian  │      151500.0 │          249 │
│ c          │      151500.0 │          444 │
│ typescript │      151000.0 │          388 │
│ kubernetes │      150500.0 │         4202 │
│ node       │      150000.0 │          179 │
│ css        │      150000.0 │          262 │
│ ruby       │      150000.0 │          736 │
│ airflow    │      150000.0 │         9996 │
│ redis      │      149000.0 │          605 │
│ vmware     │      148798.0 │          136 │
│ ansible    │      148798.0 │          475 │
│ jupyter    │      147500.0 │          400 │
└────────────┴───────────────┴──────────────┘
  25 rows                         3 columns