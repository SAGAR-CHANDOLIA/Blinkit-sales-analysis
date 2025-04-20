#  Blinkit Sales Analysis (SQL Project)

This project analyzes over 8,500 sales records from a fictional Blinkit dataset to derive meaningful business insights using advanced SQL queries. It covers data cleaning, aggregation, and segmentation based on various dimensions like item fat content, outlet location, size, and type. The project simulates real-world data analysis tasks a data analyst would perform.

---

##  Project Overview

- **Tools Used**: PostgreSQL
- **Dataset**: `blinkitdata` table with 8,500+ records
- **Focus Areas**:
  - KPI calculations (Revenue, Average Sales, Ratings)
  - Sales trends by item type, fat content, outlet type
  - Data cleaning and standardization
  - Business insights for decision making

---

##  Data Cleaning

Standardized inconsistent `item_fat_contents` values for uniformity:

```sql
UPDATE blinkitdata
SET item_fat_contents = CASE
    WHEN item_fat_contents IN ('LF', 'low fat') THEN 'Low Fat'
    WHEN item_fat_contents = 'reg' THEN 'Regular'
    ELSE item_fat_contents
END;
```

---

##  Exploratory Data Analysis (EDA)

- Checked dataset size, null values, and unique entries  
- Cleaned and standardized categorical variables such as `item_fat_contents`, `outlet_type`, and `outlet_size`  
- Explored sales trends across variables like item types, ratings, outlet establishment years, and locations  
- Evaluated fat content distribution and its effect on revenue  
- Grouped data to analyze purchase behavior and rating patterns by category

---

##  Results & Findings

- **"Low Fat" items** contributed the highest total revenue, outperforming Regular fat content items  
- **Top 5 item types** accounted for a significant share of total sales and should be prioritized  
- **Tier 1 and Urban outlets** showed higher average sales and stronger performance in terms of customer ratings  
- **Outlet establishment year** showed a positive correlation with revenue, suggesting brand maturity impacts sales  
- **Outlet size** had a clear influence on revenue contribution, with medium-sized outlets performing best

---

##  Recommendations

- Focus on expanding the “Low Fat” product segment in Tier 1 and high-performing regions  
- Increase inventory and promotion of top-selling item types to maximize ROI  
- Investigate opportunities to improve customer engagement in low-rated outlet types or locations  
- Promote loyalty programs in newer outlets and underperforming regions to boost sales consistency  
- Use outlet size performance data to guide expansion or remodeling efforts

