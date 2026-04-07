import matplotlib.pyplot as plt
import os
os.makedirs("visuals_2nd", exist_ok=True)


plt.savefig("visuals_2nd/query1_jobs.png", bbox_inches='tight')
plt.close()
import matplotlib.pyplot as plt
# -------------------------------
# Query 1: Top Paying Jobs
# -------------------------------
jobs = [
    "Associate Director - Data Insights",
    "Data Analyst, Marketing",
    "Data Analyst (Remote)",
    "Principal Data Analyst",
    "Director, Data Analyst",
    "Principal Data Analyst (AV)",
    "Principal Data Analyst (2)",
    "Data Analyst Lead",
    "Senior Data Analyst",
    "Data Analyst Specialist"
]

salaries = [
    255829, 232423, 217000, 205000, 189309,
    189000, 186000, 180000, 175000, 170000
]

plt.figure(figsize=(10,6))
plt.barh(jobs, salaries)
plt.title("Top 10 Highest Paying Data Analyst Jobs", pad=15)
plt.xlabel("Average Salary")
plt.ylabel("Job Titles")
plt.grid(axis='x', linestyle='--', alpha=0.7)
plt.gca().invert_yaxis()

# -------------------------------
# Query 2: Skills in Top Paying Jobs
# -------------------------------
skills_q2 = ["SQL", "Python", "R", "Go", "Crystal"]
counts_q2 = [7, 6, 3, 2, 1]

plt.figure(figsize=(8,5))
plt.bar(skills_q2, counts_q2)
plt.title("Top Skills in High-Paying Data Analyst Jobs")
plt.xlabel("Skills")
plt.ylabel("Frequency")
plt.savefig("visuals_2nd/query2_skills.png", bbox_inches='tight')
plt.close()

# -------------------------------
# Query 3: Most In-Demand Skills
# -------------------------------
skills_q3 = ["SQL", "Python", "Excel", "Tableau", "Power BI"]
counts_q3 = [120, 110, 95, 80, 75]

plt.figure(figsize=(8,5))
plt.bar(skills_q3, counts_q3)
plt.title("Most In-Demand Skills")
plt.xlabel("Skills")
plt.ylabel("Demand Count")
plt.savefig("visuals_2nd/query3_demand.png", bbox_inches='tight')
plt.close()

# -------------------------------
# Query 4: Top Paying Skills
# -------------------------------
skills_q4 = ["Swift", "Golang", "Scala", "C", "Python"]
salary_q4 = [153750, 145000, 117379, 109816, 102992]

plt.figure(figsize=(8,5))
plt.barh(skills_q4, salary_q4)
plt.title("Top Paying Skills")
plt.xlabel("Average Salary")
plt.ylabel("Skills")
plt.gca().invert_yaxis()
plt.savefig("visuals_2nd/query4_salary.png", bbox_inches='tight')
plt.close()

# -------------------------------
# Query 5: Demand vs Salary
# -------------------------------
demand = [120, 110, 95, 80, 75]
salary = [98269, 102992, 95000, 90000, 88000]
labels = ["SQL", "Python", "Excel", "Tableau", "Power BI"]

plt.figure(figsize=(8,5))
plt.scatter(demand, salary)

for i, label in enumerate(labels):
    plt.text(demand[i], salary[i], label)

plt.title("Demand vs Salary (Optimal Skills)")
plt.xlabel("Demand")
plt.ylabel("Salary")
plt.savefig("visuals_2nd/query5_scatter.png", bbox_inches='tight')
plt.close()