# 📊 Weekly Branch Sales Dashboard — Power BI

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=flat&logo=powerbi&logoColor=black)
![Domain](https://img.shields.io/badge/Domain-Insurance%20%2F%20BFSI-red)

A fully interactive **weekly branch performance dashboard** built in Power BI for an **insurance/financial services branch**. This report helps branch managers and team leads monitor sales pipeline health, achievement percentages, meeting activity, invoice counts, and opportunity revenue — all filterable by Account Executive.

---

## 🖼️ Dashboard Preview

> <h3>Excel Dashboard<img width="1598" height="856" alt="Screenshot 2026-04-15 190200" src="https://github.com/user-attachments/assets/22de4c32-c494-45c0-9fb3-77aadaf59af2" /></h3>
> <h3>Tableau Dashboard</h3><img width="1916" height="1079" alt="Screenshot 2026-04-13 101742" src="https://github.com/user-attachments/assets/66dd88f6-3ccf-4c55-a47f-eb7593044782" /></h3>


---

## 🎯 Business Problem

Branch managers in insurance teams often struggle to get a consolidated weekly view of:
- How much business has been **placed vs. invoiced vs. targeted**
- Which account executives are **on track or lagging**
- Where in the **sales funnel** opportunities are stalling
- Which **products and clients** are driving the most revenue

This dashboard solves that by consolidating all key metrics into one interactive weekly report.

---

## 📌 Key Metrics Tracked

| Category | Metric |
|---|---|
| Cross Sell | Target, Achieved, Invoice + Achievement % |
| New Business | Target, Achieved, Invoice + Achievement % |
| Renewal | Target, Achieved, Invoice + Achievement % |
| Meetings | Yearly count & breakdown by account executive |
| Invoices | Count by executive (Cross Sell / New / Renewal) |
| Opportunities | Total count, top 4 by revenue, stage funnel |
| Products | Distribution across Employee Benefits, Fire, Marine, Liability, etc. |

---

## 📈 Dashboard Sections

### 🔴 Top KPI Band
Six achievement % cards showing placed and invoice achievement across Cross Sell, New, and Renewal business:
- Cross Sell Plcd Achievement: **74.22%**
- Cross Sell Invoice Achievement: **15.14%**
- New Placed Achievement: **21.57%**
- New Invoice Achievement: **4.21%**
- Renewal Placed Achievement: **218.25%**
- Renewal Invoice Achievement: **68.14%**

### 📅 Yearly Meeting Count
- Comparison table showing meeting volume across years
- Bar chart: meetings broken down by each account executive

### 🧾 No. of Invoices by Account Executive
- Stacked bar chart segmented by Cross Sell, New, and Renewal
- Executives tracked: Gilbert, Ketan Jain, Vidit Shah, Vinay, Juli, Animesh Rawat, Abhinav Shivam, Mark

### 💰 Opportunity by Revenue — Top 4
- Fire: 500K
- EL-Group Mediclaim: 400K
- DB-Mega Policy: 400K
- CVP GMC: 350K

### 🔽 Stage Funnel by Revenue
Three-stage funnel: Qualify Opportunity → Negotiate → Propose Solution

### 🍩 Opportunity-Product Distribution
Donut chart segmented by:
Employee Benefits, Engineering, Fire, Liability, Marine, Miscellaneous, Terrorism

### 📊 Top 4 Opportunities (Bar Chart)
Visual bar ranking of the 4 highest-value opportunities by revenue

---

## 🎛️ Filters & Interactivity

- **Account Executive slicer** — filter the entire report by individual: Abhinav Shivam, Animesh Rawat, Gilbert, Juli, Ketan Jain, Mark, Vidit Shah, Vinay
- All visuals cross-filter each other for drill-down analysis

---

## 🛠️ Tools & Technologies

- **Power BI Desktop** — report development
- **DAX** — KPI measures, achievement %, MoM/YoY comparisons
- **Power Query (M)** — data transformation and shaping
- **Source Data** — CRM/sales export (Excel or SQL)

---

## 📐 Key DAX Measures

```dax
Achievement % = DIVIDE([Placed Amount], [Target Amount], 0) * 100

Invoice Achievement % = DIVIDE([Invoice Amount], [Target Amount], 0) * 100

Total Opportunities = DISTINCTCOUNT(Opportunities[OpportunityID])

Top Revenue = 
CALCULATE(
    SUM(Opportunities[Revenue]),
    TOPN(4, Opportunities, Opportunities[Revenue], DESC)
)
```

---

## 🚀 How to Use

1. Clone or download this repository
2. Open `WeeklyBranchDashboard.pbix` in **Power BI Desktop**
3. Connect to your data source (replace the sample data with your CRM export)
4. Refresh and interact using the Account Executive slicer

---

## 📁 File Structure

```
weekly-branch-dashboard/
│
├── WeeklyBranchDashboard.pbix      # Main Power BI file
├── data/
│   ├── sales_data.xlsx             # Source data (sample)
│   ├── opportunities.xlsx
│   └── meetings.xlsx
├── screenshots/
│   └── dashboard_preview.png
└── README.md
```

---

## 🧠 Skills Demonstrated

- Star schema data modeling for sales pipeline data
- DAX time intelligence and achievement ratio calculations
- Designing branch-level executive dashboards
- Cross-filtering and slicer-driven interactivity in Power BI
- Insurance domain knowledge (Cross Sell, Renewal, New Business KPIs)

---


This project is licensed under the MIT License.
