# 🛒 Superstore Sales Intelligence Dashboard

An end-to-end data analytics project analyzing 10,000+ retail transactions to uncover regional performance gaps, discount-driven profit erosion, and loss-making products.

---

## 📌 Business Questions Answered

1. **Which regions generate high revenue but low profit?**
2. **Do higher discounts increase sales or reduce profitability?**
3. **Which products consistently lose money?**

---

## 🛠️ Tech Stack

| Tool | Purpose |
|---|---|
| Python (Pandas, NumPy) | Data cleaning & feature engineering |
| Matplotlib, Seaborn | Exploratory visualizations |
| SQLite + SQL | Business queries on cleaned data |
| Power BI | Interactive dashboard |
| Google Colab | Development environment |
| GitHub | Version control |

---

## 📁 Project Structure
superstore-sales-analysis/
├── notebooks/
│   └── 01_cleaning_and_eda.ipynb   # Cleaning, EDA, visualizations
├── data/
│   └── superstore_clean.csv        # Cleaned dataset
├── sql/
│   └── business_queries.sql        # 6 business SQL queries
├── charts/
│   ├── monthly_sales_trend.png
│   ├── region_revenue_vs_profit.png
│   ├── discount_vs_profit_scatter.png
│   └── loss_making_products.png
├── dashboard/
│   └── superstore_dashboard.pdf    # Power BI dashboard export
└── README.md
---

## 📊 Dashboard Preview

![Dashboard](dashboard/superstore_dashboard.pdf)

### KPI Summary
| Metric | Value |
|---|---|
| Total Sales | $2.30M |
| Total Profit | $286.40K |
| Avg Profit Margin | 12.07% |
| Total Orders | 9,994 |

---

## 🔍 Key Insights

- **West region** leads in sales but **Central** has the lowest profit ratio — flagged as underperforming
- Discounts above **30%** result in negative profit margins — a significant business risk
- **Tables** and **Bookcases** are the highest loss-making sub-categories
- **Technology** is the most profitable category overall
- Clear **seasonal spike** in sales every November–December

---

## 📈 Visualizations

| Chart | Insight |
|---|---|
| Revenue vs Profit by Region | Identifies high-revenue but low-margin regions |
| Monthly Sales Trend | Shows seasonality patterns across 2014–2017 |
| Discount Band vs Profit Margin | Proves discount erosion beyond 30% |
| Top 10 Loss-Making Products | Products to consider discontinuing |

---

## 🚀 How to Run

1. Clone this repo
2. Open `notebooks/01_cleaning_and_eda.ipynb` in Google Colab
3. Upload `superstore_clean.csv` from the `data/` folder
4. Run all cells
5. For SQL: load `superstore.db` and run `sql/business_queries.sql`

---

## 📜 Dataset

- **Source:** [Superstore Dataset — Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
- **Size:** 9,994 rows × 21 columns
- **Period:** 2014–2017

---

