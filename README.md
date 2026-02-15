# Cultural Regeneration Dashboard
### Data-Driven Decision Support for Maritime Heritage Investment

> **Transforming how city planners evaluate heritage site regeneration opportunities through integrated analytics on economic impact, creative industry clustering, and regional benchmarking.**

[![Project Type](https://img.shields.io/badge/Project-Data%20Product%20Case%20Study-blue)](https://github.com/yourusername/cultural-regeneration-dashboard)
[![Status](https://img.shields.io/badge/Status-Portfolio%20Project-green)](https://github.com/yourusername/cultural-regeneration-dashboard)
[![Skills](https://img.shields.io/badge/Skills-SQL%20%7C%20Power%20BI%20%7C%20Product%20Strategy-orange)](https://github.com/yourusername/cultural-regeneration-dashboard)

---

## The Problem

City planners allocate ressources without integrated data on:
- Which sites have the highest economic ROI potential
- Which creative industries thrive at which site types  
- How seasonal patterns affect visitor revenue
- What regional best practices apply from successful regeneration models

**Result:** 6-12 month decision cycles, misallocated funding, and missed opportunities to unlock post-industrial maritime assets.

---

## 💡 The Solution

A **self-service analytics dashboard** that consolidates:
- 🏛️ **Maritime heritage site inventory** (transformation history, protection status, current use)
- 🎨 **Creative industry mapping** (company locations, employment, revenue, sector diversity)
- 📊 **Economic impact metrics** (quarterly visitor trends, tourism revenue, local business growth)
- 🌍 **Regional benchmarking** (Europe vs. North Africa performance comparisons)

**Target Users:** Heritage Investment Officers, Urban Development Directors, Economic Development Agencies

---

## Key Insights Discovered

From analyzing Glasgow's 5 maritime heritage sites across 24 SQL queries:

| Finding | Impact |
|---------|--------|
| **Pacific Quay generates 2x city average revenue per visitor** | Media production facilities create dual benefit: jobs + tourism |
| **Q2-Q3 show 40-50% higher visitor counts than Q1/Q4** | Need year-round programming to smooth seasonal cashflow |
| **Sites with 4+ creative sectors generate 2x economic resilience** | Mixed clusters outperform mono-industry developments |
| **North Africa heritage tourism growing 9.2% annually vs. Europe 4.1%** | Emerging markets offer partnership + learning opportunities |
| **Govan Graving Docks: heritage protected + abandoned = high opportunity** | Priority candidate for next regeneration investment |

📄 **[See Full Analysis & Strategic Recommendations →](SQL/key_insights.md)**

---

## Dashboard Features

### **Page 1: Executive Overview**
High-level city-wide performance metrics and trends

**Key Visualizations:**
- **3 KPI Cards:** Total Visitors (2M), Total Revenue (£26M), Total Creative Companies (12)
- **Bar Chart:** Sites ranked by visitor volume
- **Line Chart:** Quarterly visitor trends showing seasonal patterns
- **Data Table:** Complete creative industry company roster with employment & revenue
- **Utilization Gauge:** Heritage site activation rate (80% - 4 of 5 sites active)

**Strategic Value:** Enables quick assessment of overall regeneration program health and identifies high/low performers at a glance.

---

### **Page 2: Site Deep Dive**
Interactive drill-down for individual site analysis

**Key Features:**
- **Interactive Slicer:** Dropdown menu to select any of the 5 sites
- **Dynamic KPIs:** Visitor count, tourism revenue, creative companies, cultural events (auto-update based on site selection)
- **Trend Analysis:** Quarterly visitor patterns for selected site
- **Company Directory:** Table of all creative businesses located at the selected site
- **Site Profile Cards:** Heritage status, conversion year, current use, area size

**Strategic Value:** Allows planners to evaluate individual site performance, compare before/after transformation metrics, and assess creative industry composition for targeted recruitment.

**Interactive Capabilities:** All visuals update automatically when a different site is selected - demonstrating true self-service analytics.

---

## Technical Skills Demonstrated

### **Data & Analytics**
- **SQL** (MySQL): 24 queries demonstrating JOINs, CTEs, window functions, subqueries, aggregations, UNION
- **Database Design**: 4-table relational schema with foreign keys, constraints, indexes
- **Data Modeling**: Normalized structure supporting time-series + cross-regional analysis
- **Business Intelligence**: Calculated metrics (revenue efficiency, opportunity scoring, YoY growth)

### **Product Management**
- **Problem Discovery**: User persona development, pain point identification, stakeholder mapping
- **Product Strategy**: PRD writing, feature prioritization, MVP scoping, success metrics definition
- **Requirements Gathering**: User stories with acceptance criteria (23 stories across 5 epics)
- **Technical Documentation**: Data dictionaries, system architecture, testing plans

### **Domain Expertise**
- **International Trade Background**: Cross-regional market comparison (Europe vs. North Africa)
- **Economic Development**: ROI analysis, industry clustering, multiplier effects
- **Heritage Preservation**: Balancing cultural significance with commercial viability

---

## Project Structure

```
cultural-regeneration-dashboard/
│
├── 📄 README.md                          # You are here
│
├── 📂 data/
│   ├── raw/                              # 4 CSV files (maritime sites, industries, impact, markets)
│   └── data_dictionary.md                # Comprehensive table/column documentation
│
├── 📂 sql/
│   ├── data_setup.sql                    # Database schema with constraints & indexes
│   ├── analysis_queries.sql              # 24 queries organized by complexity
│   └── key_insights.md                   # Business takeaways from each query
│
├── 📂 docs/
│   ├── problem_statement.md              # Strategic context & user needs
│   ├── prd.md                            # Product Requirements Document (MVP definition)
│   └── PROJECT_SUMMARY.md                # Elevator pitches for various contexts
│
├── 📂 visualizations/
│   └── Creative Sites Dashboard.pbix  # Power BI dashboard file
│
└── 📂 assets/
    └── screenshots/                      # Dashboard page screenshots
        ├── Overview.png
        └── DeepDive per site.png
```

---

## How to Explore This Project

### **For Recruiters (5-minute tour):**

1. **Start here:** [Problem Statement](docs/problem_statement.md) - Understand the strategic context
2. **Product thinking:** [PRD](docs/prd.md) - See how I define features and scope
3. **Data skills:** [Key Insights](sql/key_insights.md) - Business intelligence from SQL analysis
4. **Visualizations:** [Screenshots](assets/screenshots/) - See the Power BI dashboard in action
5. **Technical depth:** [SQL Queries](sql/analysis_queries.sql) - 24 queries from basic to advanced

### **For Technical Reviewers:**

1. **Database design:** [Data Setup](sql/data_setup.sql) - Schema, relationships, constraints
2. **Data dictionary:** [Tables & Columns](data/data_dictionary.md) - Full data model documentation
3. **Query complexity:** [Analysis Queries](sql/analysis_queries.sql) - CTEs, window functions, multi-table JOINs
4. **BI Development:** Download the .pbix file and explore the dashboard interactivity

### **For Fellow PMs:**

1. **User stories:** [PRD Section 3](docs/prd.md#user-stories--acceptance-criteria) - 5 epics, 23 stories
2. **Scope management:** [PRD Out of Scope](docs/prd.md#out-of-scope-v1) - What's NOT in MVP and why
3. **Success metrics:** [PRD Metrics](docs/prd.md#success-metrics--kpis) - Adoption + business impact KPIs

---

## Sample SQL Query & Insight

### **Query: Comprehensive Site Performance Dashboard**

```sql
-- Using CTEs to create multi-dimensional site analysis
WITH IndustryMetrics AS (
    SELECT
        ms.site_id,
        ms.site_name,
        COUNT(DISTINCT ci.industry_type) AS industry_diversity,
        SUM(ci.employees_count) AS total_employees
    FROM maritime_sites ms
    LEFT JOIN creative_industries ci ON ms.site_id = ci.site_id
    GROUP BY ms.site_id, ms.site_name
),
RevenueMetrics AS (
    SELECT
        site_id,
        SUM(tourism_revenue) / SUM(visitor_count) AS revenue_per_visitor
    FROM economic_impact
    WHERE year = 2022
    GROUP BY site_id
)
SELECT
    im.site_name,
    im.industry_diversity,
    im.total_employees,
    rm.revenue_per_visitor,
    RANK() OVER (ORDER BY rm.revenue_per_visitor DESC) AS efficiency_rank
FROM IndustryMetrics im
JOIN RevenueMetrics rm ON im.site_id = rm.site_id
ORDER BY efficiency_rank;
```

### **Insight:**

Sites with **4+ industry types** show **2x higher revenue per visitor** compared to single-sector sites. This demonstrates the economic value of creative industry diversity in heritage regeneration.

**Strategic Implication:** Future developments should actively recruit mixed creative clusters (media + museums + design) rather than focusing on a single industry vertical.

---

## What I Learned

### **Product Thinking**
- How to translate user pain points into product requirements
- Balancing technical feasibility with business value
- Writing PRDs that engineering teams could actually build from

### **Data Product Design**
- Difference between dashboards (exploratory) vs. reports (prescriptive)
- Importance of calculated metrics (not just raw data display)
- How to design for non-technical users (explainable calculations, plain language)

### **Domain Integration**
- Applying my international trade background to urban development
- Understanding heritage economics (preservation costs vs. regeneration ROI)
- Cross-regional benchmarking methodologies

---

## About Me

**Khaoula Ait Faraji**  
Product Management Student | Transitioning from International Trade

I bring a unique combination of:
- 🌍 **Global trade perspective** (understanding cross-border markets, economic development, investment decisions)
- 📊 **Data fluency** (SQL, Power BI, analytical thinking)
- 🎯 **Product mindset** (user-centered design, strategic scoping, metrics-driven)

**Why this project?**  
Heritage regeneration sits at the intersection of economic development, data analytics, and strategic planning—exactly where my background in international trade meets my future in product management. I see heritage assets like maritime sites as similar to trade goods: they have latent value that must be unlocked through market analysis, strategic positioning, and evidence-based investment.

---

## Let's Connect

- 🌐 **Portfolio:** https://sites.google.com/view/aitfarajikhaoula
- 💼 **LinkedIn:** http://linkedin.com/in/khaoula-ait-faraji-741127397
- 📧 **Email:** aitfarajikhaoula01@gmail.com
- 📂 **GitHub:** https://github.com/AFKhaoula

**I'm currently seeking:**
- Associate Product Manager roles
- Data Product Manager positions  
- Business/Product Analyst roles
- Opportunities that value international trade + data analytics backgrounds

**Open to feedback!** If you're a PM, data professional, or city planner with thoughts on this approach, I'd love to hear from you.

---

## 📊 Dashboard Access

### **Power BI Desktop File**
Download the `.pbix` file from the [visualizations folder](visualizations/) to explore the full interactive dashboard.

**Requirements:**
- Power BI Desktop (free download from Microsoft)
- Data files are embedded in the .pbix file for easy exploration

---

## 🔍 Featured Capabilities

### **Interactive Analytics**
- **Dynamic Filtering:** Slicer on Page 2 allows instant switching between sites with all visuals updating automatically
- **Cross-Filtering:** Clicking any data point filters related visuals across the page
- **Drill-Down:** Navigate from high-level trends to granular company details

### **Calculated Intelligence**
- **Utilization Rate:** Automated calculation of heritage site activation percentage
- **Revenue Efficiency:** Revenue per visitor metric for comparing site monetization
- **Seasonal Patterns:** Q2-Q3 vs Q1-Q4 comparison revealing 40-50% visitor fluctuations

---

## License & Usage

This is a **portfolio/educational project** using fictional sample data created for demonstration purposes.

**Data Notice:** The dataset is not sourced from official publications. It demonstrates analytical capabilities and realistic data structures for heritage site regeneration analysis.

**Reuse:** Feel free to fork this repo for learning purposes. If you adapt this approach for real city planning work, please credit the methodology and reach out—I'd love to hear about it!

---

## 🙏 Acknowledgments

- **Inspiration:** Glasgow's actual maritime heritage transformation (Pacific Quay, Riverside Museum, Govan Graving Docks)
- **Learning Resources:** Anthropic's Claude for brainstorming, SQL documentation, PRD best practices

---

<div align="center">

### ⭐ If this project demonstrates skills relevant to your team, let's talk!

**Built with:** MySQL • Power BI • Product Strategy • Domain Expertise  
**Timeline:** 6-8 weeks (10-15 hours/week)  
</div>

---

## 🏷️ Tags

`product-management` `data-analytics` `sql` `power-bi` `heritage-preservation` `urban-development` `portfolio-project` `data-product` `business-intelligence` `international-trade` `creative-economy` `city-planning`
