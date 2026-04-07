import matplotlib.pyplot as plt
import os

os.makedirs("visuals", exist_ok=True)

# Query 2
skills_q2 = ["SQL", "Python", "R", "Go", "Crystal"]
counts_q2 = [7, 6, 3, 2, 1]

plt.figure()
plt.bar(skills_q2, counts_q2)
plt.title("Top Skills in High-Paying Jobs")
plt.savefig("visuals/query2.png")
plt.close()

# Query 3
skills_q3 = ["SQL", "Python", "Excel", "Tableau", "Power BI"]
counts_q3 = [120, 110, 95, 80, 75]

plt.figure()
plt.bar(skills_q3, counts_q3)
plt.title("Most In-Demand Skills")
plt.savefig("visuals/query3.png")
plt.close()

# Query 4
skills_q4 = ["Swift", "Golang", "Scala", "C", "Python"]
salary_q4 = [153750, 145000, 117379, 109816, 102992]

plt.figure()
plt.barh(skills_q4, salary_q4)
plt.title("Top Paying Skills")
plt.gca().invert_yaxis()
plt.savefig("visuals/query4.png")
plt.close()

# Query 5
demand = [120, 110, 95, 80, 75]
salary = [98269, 102992, 95000, 90000, 88000]
labels = ["SQL", "Python", "Excel", "Tableau", "Power BI"]

plt.figure()
plt.scatter(demand, salary)

for i, label in enumerate(labels):
    plt.text(demand[i], salary[i], label)

plt.title("Demand vs Salary")
plt.savefig("visuals/query5.png")
plt.close()

print("✅ Images created in 'visuals' folder")