# Telkom Regional Network Asset & Enterprise Database Schema 🌐

An enterprise-grade relational database architecture designed to simulate PT Telkom Indonesia's regional asset management, operational expenditure, and automated maintenance tracking.

## 🛠️ Tech Stack & Concepts
- **Database Engine:** MySQL (via Laragon / phpMyAdmin)
- **Advanced SQL Operations:** Multi-table LEFT JOINs, Data Aggregation (`SUM`, `COUNT`), and Database Normalization.
- **Relational Integrity:** Foreign Key constraints with `CASCADE` actions on Delete/Update to ensure strict data integrity.

## 📐 Database Schema Architecture
The ecosystem consists of 3 highly-relational tables:
1. `telkom_assets` (Master Table): Stores network infrastructure hardware assets.
2. `maintenance_logs` (Transaction Table): Tracks real-time maintenance logs and costs, linked to specific assets.
3. `operational_budgets` (Financial Table): Manages regional budget allocations and technician payrolls.

## 📊 Analytical Query & Financial Automation
This system utilizes a complex analytical query to generate a real-time financial health report by calculating the automated **Net Budget** (Allocated Budget - Payroll Cost - Cumulative Maintenance Cost) across different regional zones.

```sql
SELECT 
    b.regional_zone AS "Regional Telkom",
    b.budget_period AS "Periode Anggaran",
    b.allocated_budget AS "Total Alokasi Anggaran",
    COUNT(m.log_id) AS "Total Perangkat Diperbaiki",
    SUM(m.cost) AS "Total Biaya Perbaikan (Maintenance Cost)",
    b.technician_payroll AS "Total Gaji Teknisi (Payroll Cost)",
    (b.allocated_budget - b.technician_payroll - SUM(m.cost)) AS "Sisa Anggaran Bersih (Net Budget)"
FROM operational_budgets b
LEFT JOIN telkom_assets a ON b.regional_zone = a.regional_zone
LEFT JOIN maintenance_logs m ON a.asset_id = m.asset_id
GROUP BY b.regional_zone, b.budget_period, b.allocated_budget, b.technician_payroll;<img width="1590" height="912" alt="Screenshot 2026-06-10 140538" src="https://github.com/user-attachments/assets/3f417fca-ef61-422b-9138-1a87d82c6a56" />
<img width="1613" height="915" alt="Screenshot 2026-06-10 140228" src="https://github.com/user-attachments/assets/7a3ee840-6df5-41ed-8481-9bf30068e14a" />
