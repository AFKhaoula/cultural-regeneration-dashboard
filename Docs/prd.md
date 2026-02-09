# Product Requirements Document (PRD)
## Cultural Regeneration Dashboard

---

## 📄 Document Information

| Field | Details |
|-------|---------|
| **Product Name** | Cultural Regeneration Dashboard |
| **Document Owner** | Khaoula Ait Faraji |
| **Version** | 1.0 (MVP Definition) |
| **Status** | Draft - Portfolio Project |
| **Last Updated** | February 2026 |
| **Stakeholders** | City Heritage Officers, Urban Development Directors, Economic Development Agencies |

---

## 🎯 Product Vision & Objectives

### **Vision Statement**

*"Empower city planners to make data-driven heritage regeneration decisions that maximize economic impact while preserving cultural significance."*

### **Product Mission**

Transform how post-industrial cities evaluate and prioritize maritime heritage site redevelopment by providing **integrated analytics** on site performance, industry clustering, visitor trends, and regional benchmarks—replacing slow consultant reports with **real-time self-service insights**.

### **North Star Metric**

**Heritage Site Economic Activation Rate**  
= (Number of heritage sites with active economic use / Total heritage sites) × 100

**Current:** ~60% (3 of 5 Glasgow sites active)  
**Target:** 80% within 24 months of dashboard deployment

---

## 🧭 Strategic Context

### **Problem Recap** (See Full Problem Statement Document)

City planners allocate financial ressources without **integrated data** on:
- Which sites have highest ROI potential
- Which creative industries thrive at which site types
- How seasonal patterns affect revenue
- What regional best practices apply

**Result:** Misallocated funding, missed opportunities, delayed economic benefits.

### **Solution Approach**

Build a **self-service analytics dashboard** that consolidates:
1. Maritime heritage site inventory (Glasgow focus, scalable to other cities)
2. Creative industry mapping (who's located where, employment, revenue)
3. Economic impact metrics (visitors, tourism revenue, local business growth)
4. Regional benchmarking (Europe vs. North Africa performance)

---

## Target Users & Personas

### **Primary Persona: Sarah, Heritage Investment Officer**

| Attribute | Details |
|-----------|---------|
| **Age / Experience** | 42 years old, 12 years in heritage planning |
| **Role** | Manages £25M annual regeneration budget for Glasgow City Council |
| **Technical Proficiency** | Comfortable with Excel, basic Tableau usage, no SQL skills |
| **Key Frustration** | "I spend 6 months commissioning consultant reports that are outdated by the time I present them to the board" |
| **Daily Workflow** | Reviews site proposals → Requests data from 3 departments → Waits 2-4 weeks → Compiles PowerPoint → Presents to investment committee |
| **Success Metric** | Projects approved / Projects proposed (wants >70% approval rate) |
| **What She Needs** | Self-service tool to generate site comparison reports in <1 hour |

**User Story Example:**  
*"As a Heritage Investment Officer, I want to compare 3 candidate sites on economic potential metrics so that I can justify my funding recommendation to the board with data instead of intuition."*

---

### **Secondary Persona: James, Urban Development Director**

| Attribute | Details |
|-----------|---------|
| **Age / Experience** | 51 years old, 20 years in urban planning |
| **Role** | Sets city-wide creative economy strategy |
| **Technical Proficiency** | Reads reports, doesn't create them (relies on analysts) |
| **Key Frustration** | "I don't know if we should recruit more tech companies or more cultural organizations—what actually works?" |
| **What He Needs** | Industry clustering analysis + regional benchmarks |

**User Story Example:**  
*"As an Urban Development Director, I want to see which creative industry types generate the most jobs per square meter so that I can focus recruitment efforts on high-impact sectors."*

---

### **Tertiary Persona: Amara, Economic Development Officer**

| Attribute | Details |
|-----------|---------|
| **Age / Experience** | 34 years old, 6 years in economic development |
| **Role** | Recruits creative businesses to heritage sites |
| **Technical Proficiency** | Power user (comfortable with dashboards, APIs, data exports) |
| **What She Needs** | Real-time view of "site capacity" (which sites have room for more businesses) |

**User Story Example:**  
*"As an Economic Development Officer, I want to identify sites with low creative industry density but high visitor traffic so that I can target businesses that benefit from foot traffic."*

---

## 🎯 User Stories & Acceptance Criteria

### **Epic 1: Site Comparison & Prioritization**

**User Story 1.1:** Site Economic Performance Dashboard  
**As a** Heritage Investment Officer  
**I want to** view a dashboard comparing all 5 Glasgow sites on key economic metrics  
**So that** I can quickly identify which sites are performing well vs. underutilized  

**Acceptance Criteria:**
- [ ] Dashboard displays all sites in a single view
- [ ] Metrics shown: Total visitors (2022-2023), Total revenue, Revenue per visitor, Creative industry count, Industry diversity, Heritage status
- [ ] User can sort by any metric
- [ ] Visual indicators (green/yellow/red) show performance vs. city average
- [ ] Data updates quarterly (for MVP, static dataset is acceptable)

---

**User Story 1.2:** Site Detail View  
**As a** Heritage Investment Officer  
**I want to** drill into a specific site to see its full profile  
**So that** I can understand its history, current status, and economic trajectory  

**Acceptance Criteria:**
- [ ] Clicking a site opens detailed view
- [ ] Shows: Site name, location, size, historical purpose, current use, year converted, heritage protection status
- [ ] Displays quarterly visitor trend chart (line graph)
- [ ] Lists all creative companies located at the site (table)
- [ ] Shows year-over-year revenue growth (%)
- [ ] Includes "opportunity score" (calculated metric: high heritage status + low utilization = high score)

---

**User Story 1.3:** Side-by-Side Site Comparison  
**As a** Heritage Investment Officer  
**I want to** select 2-3 sites and compare them side-by-side  
**So that** I can evaluate investment tradeoffs  

**Acceptance Criteria:**
- [ ] User can select 2-3 sites via checkboxes
- [ ] Comparison view shows all metrics in aligned columns
- [ ] Highlights differences (e.g., Site A has 2x more visitors but Site B has higher revenue per visitor)
- [ ] Exportable as PDF report (1-page summary)

---

### **Epic 2: Creative Industry Analysis**

**User Story 2.1:** Industry Clustering Visualization  
**As an** Urban Development Director  
**I want to** see which creative industry types are located at each site  
**So that** I can identify successful clustering patterns  

**Acceptance Criteria:**
- [ ] Heatmap or grouped bar chart showing industry type × site matrix
- [ ] Color intensity = number of companies in that category
- [ ] Hovering shows detail: "3 Digital Media companies at Pacific Quay: BBC Scotland, STV Productions, Clyde Digital Studios"
- [ ] Filter by industry type (show only Digital Media across all sites)

---

**User Story 2.2:** Industry Performance Metrics  
**As an** Urban Development Director  
**I want to** compare creative sectors on employment and revenue  
**So that** I can prioritize which industries to recruit  

**Acceptance Criteria:**
- [ ] Table showing: Industry Type, Total Companies, Total Employees, Avg Revenue per Company, Avg Local Employment %
- [ ] Sortable by any column
- [ ] Visual indicator for "high-growth" sectors (founded post-2010, >50 employees)
- [ ] Link to companies in each sector (drill-down capability)

---

**User Story 2.3:** Site-Industry Recommendations  
**As an** Economic Development Officer  
**I want to** see which sites could benefit from additional industry types  
**So that** I can target recruitment strategically  

**Acceptance Criteria:**
- [ ] Algorithm identifies "gaps": Site A has Museums + Digital Media but no Design firms (while successful Site B has all three)
- [ ] Dashboard displays: "Recommended: Recruit 2-3 Design firms to Riverside Museum based on Pacific Quay success pattern"
- [ ] User can accept/dismiss recommendations (for future tracking)

---

### **Epic 3: Economic Impact Tracking**

**User Story 3.1:** Quarterly Visitor Trends  
**As a** Heritage Investment Officer  
**I want to** see visitor count trends over time  
**So that** I can identify seasonal patterns and growth trajectories  

**Acceptance Criteria:**
- [ ] Line chart: X-axis = Quarter (Q1 2022 through Q4 2023), Y-axis = Visitor count
- [ ] Separate line for each site (color-coded)
- [ ] Hovering shows exact count + quarter-over-quarter % change
- [ ] Toggle to view: Visitors, Revenue, or Events count

---

**User Story 3.2:** Revenue Efficiency Analysis  
**As a** Heritage Investment Officer  
**I want to** understand revenue per visitor by site  
**So that** I can identify which sites monetize effectively  

**Acceptance Criteria:**
- [ ] Scatter plot: X-axis = Total visitors, Y-axis = Revenue per visitor
- [ ] Each point = one site (sized by area_sqm)
- [ ] Quadrants labeled: "High Traffic, Low Monetization" / "High Traffic, High Monetization" / etc.
- [ ] Insight: "Pacific Quay generates £23.40 per visitor vs. city average of £18.90—what are they doing differently?"

---

**User Story 3.3:** Seasonal Performance Deep Dive  
**As a** Cultural Programming Manager  
**I want to** see which quarters have highest visitor activity  
**So that** I can schedule major events strategically  

**Acceptance Criteria:**
- [ ] Grouped bar chart: 4 bars per site (one for each quarter)
- [ ] Shows average visitors across all years in dataset
- [ ] Highlights Q2-Q3 peaks (typically summer in Northern Hemisphere)
- [ ] Recommendation: "Schedule festivals in Q2-Q3 for maximum attendance, develop winter programming to smooth Q1/Q4 dips"

---

### **Epic 4: Regional Benchmarking**

**User Story 4.1:** Europe vs. North Africa Comparison  
**As an** Urban Development Director  
**I want to** compare Glasgow's performance to European and North African peers  
**So that** I can learn from best practices elsewhere  

**Acceptance Criteria:**
- [ ] Dual-line chart: Europe average vs. North Africa average (by sector: Maritime Tech, Creative Industries, Heritage Tourism)
- [ ] Metrics: Trade volume, Growth rate, Market share
- [ ] Insight callouts: "North Africa Heritage Tourism growing 9.2% annually vs. Europe 4.1%—what strategies are they using?"
- [ ] Link to country detail (drill into Morocco, Sweden, etc.)

---

**User Story 4.2:** Peer City Identification  
**As an** Urban Development Director  
**I want to** identify cities with similar characteristics to Glasgow  
**So that** I can study their regeneration approaches  

**Acceptance Criteria:**
- [ ] Algorithm identifies peer cities based on: Port city, Population 500K-1M, Post-industrial economy, Active heritage sites
- [ ] Displays: "Glasgow's peer cities: Rotterdam (Netherlands), Bilbao (Spain), Marseille (France)"
- [ ] Links to case studies (if available in database)

---

### **Epic 5: Reporting & Export**

**User Story 5.1:** Board-Ready Report Generation  
**As a** Heritage Investment Officer  
**I want to** export a 2-page PDF summary of any analysis  
**So that** I can share with decision-makers who don't use the dashboard  

**Acceptance Criteria:**
- [ ] "Export Report" button on every dashboard view
- [ ] PDF includes: Title, Date generated, Data sources, Key metrics (table), Visualization (chart), 2-3 bullet insights
- [ ] Branded with city logo (customizable)
- [ ] Generated in <10 seconds

---

**User Story 5.2:** Data Export for Deep Analysis  
**As an** Economic Development Officer  
**I want to** export raw data to Excel  
**So that** I can perform custom calculations not available in the dashboard  

**Acceptance Criteria:**
- [ ] "Download CSV" button available on all data tables
- [ ] Exports current filtered/sorted view
- [ ] Includes all columns from database (not just displayed columns)
- [ ] File naming convention: `CulturalRegen_[ViewName]_[Date].csv`

---

## Technical Requirements

### **Data Architecture**

**Database:** MySQL 8.0+  
**Schema:** 4 tables (see `data_setup.sql`)
1. `maritime_sites` (master table)
2. `creative_industries` (many-to-one with sites)
3. `economic_impact` (quarterly time series)
4. `market_comparison` (regional benchmarks)

**Data Volume (MVP):**
- 5 sites × 8 quarters = 40 economic impact records
- ~12 creative companies = 12 industry records
- ~100 market comparison records (8 countries × 3 sectors × 4 quarters)
- **Total:** <500 rows (easily handled by MySQL)

**Data Updates:** Quarterly (manual CSV upload for MVP, automated ETL for production)

---

### **Visualization Platform**

**MVP Choice:** Power BI Desktop (free, runs locally)  
**Rationale:**
- ✅ User already has intermediate Power BI skills
- ✅ Connects directly to MySQL
- ✅ Rich visualization library
- ✅ Shareable via Power BI Service (limited free tier)



**Future State:** React + D3.js web app (fully custom, no licensing constraints)

---

### **Deployment Architecture (MVP)**

```
┌─────────────────────────────────────────┐
│  User Machine                           │
│  ┌─────────────────┐                    │
│  │  Power BI       │◄──────────────┐    │
│  │  Desktop        │               │    │
│  └─────────────────┘               │    │
│         ▲                          │    │
│         │ ODBC Connection          │    │
│         ▼                          │    │
│  ┌─────────────────┐               │    │
│  │  MySQL          │               │    │
│  │  (Local DB)     │               │    │
│  └─────────────────┘               │    │
│         ▲                          │    │
│         │ CSV Import               │    │
│  ┌─────────────────┐               │    │
│  │  data/raw/      │               │    │
│  │  - maritime_    │               │    │
│  │    sites.csv    │               │    │
│  │  - creative_    │               │    │
│  │    industries...│               │    │
│  └─────────────────┘               │    │
└─────────────────────────────────────────┘

---

### **Key Metrics & Calculations**

**Calculated Fields to Implement:**

1. **Revenue per Visitor**  
   `= SUM(tourism_revenue) / SUM(visitor_count)`

2. **Industry Diversity Score**  
   `= COUNT(DISTINCT industry_type) per site`

3. **Quarter-over-Quarter Growth**  
   `= (Current Quarter Visitors - Previous Quarter Visitors) / Previous Quarter Visitors × 100`

4. **Opportunity Score** (for underutilized sites)  
   ```
   = (Heritage Status Weight × 0.4) + 
     (Low Utilization Weight × 0.3) + 
     (Area Size Weight × 0.3)
   
   Where:
   - High heritage status (Category A) = 10 points
   - Low creative industry count (<3) = 10 points
   - Large area (>20,000 sqm) = 10 points
   - Max score = 30
   ```

5. **Revenue Efficiency Benchmark**  
   `= Site Revenue per sqm / City Average Revenue per sqm × 100`

---

##  Out of Scope 

**Features NOT included in MVP:**

❌ **Predictive Analytics / ML Models**  
*Why:* Requires more data (5 sites insufficient for training)  
*Future:* V2 could predict "site success probability" based on 50+ city dataset

❌ **Real-Time Data Integration**  
*Why:* No APIs available for heritage/economic data  
*Future:* Build ETL pipelines when deployed in production city environment

❌ **Mobile App**  
*Why:* Primary users (officers, directors) work at desks with large screens  
*Future:* Responsive web design if field usage emerges

❌ **Collaborative Features** (commenting, sharing annotations)  
*Why:* Adds complexity, not validated as user need yet  
*Future:* V3 feature if user research shows demand

❌ **Custom Alert System** ("Notify me when Site X hits 100K visitors")  
*Why:* Quarterly updates make real-time alerts unnecessary  
*Future:* Production feature if data refresh increases to weekly

❌ **Multi-City Deployment**  
*Why:* MVP validates concept with Glasgow only  
*Future:* V2 expands to Liverpool, Rotterdam (requires data partnerships)

❌ **Financial Modeling** (ROI calculators, NPV analysis)  
*Why:* Requires investment cost data not in current dataset  
*Future:* Add if pilot users request

---

## Success Metrics & KPIs

### **Product Adoption Metrics**

| Metric | Baseline | 3-Month Target | 6-Month Target | Measurement |
|--------|----------|----------------|----------------|-------------|
| **Active Users** | 0 | 10 | 20 | Unique logins per month |
| **Dashboard Views** | 0 | 150 | 400 | Page views in Power BI Service |
| **Reports Exported** | 0 | 30 | 80 | PDF/CSV download count |
| **Avg Session Duration** | N/A | 12 min | 15 min | Time spent in dashboard |

### **Business Impact Metrics**

| Metric | Current | 6-Month | 12-Month | Data Source |
|--------|---------|---------|----------|-------------|
| **Decision Cycle Time** | 6 months | 3 months | 6 weeks | User survey |
| **Sites with Active Investment Plans** | 3 of 5 | 4 of 5 | 5 of 5 | City planning records |
| **Creative Industry Job Growth** | Baseline | +5% | +12% | Employment data |
| **User Satisfaction (NPS)** | N/A | 40 | 60 | Quarterly survey |

### **Data Quality Metrics**

| Metric | Target | Why It Matters |
|--------|--------|----------------|
| **Data Freshness** | <90 days old | Quarterly updates = max 90 day lag acceptable |
| **Completeness** | >95% fields populated | Missing data reduces trust |
| **Accuracy** | <2% error rate | Validated against source systems |

---

##  Development Timeline

### **Phase 1: Foundation (Week 1-2)**
-  Define problem statement 
-  Write PRD 
-  Create database schema 
-  Load sample data 
-  Set up Power BI connection
-  Create basic site overview dashboard

### **Phase 2: Core Dashboards (Week 3-4)**
-  Build Site Comparison view
-  Build Creative Industry Analysis view
-  Build Economic Impact Trends view
-  Implement calculated metrics
-  Add filtering and drill-down

### **Phase 3: Advanced Features (Week 5-6)**
-  Regional benchmarking dashboard
-  Report export functionality
-  Opportunity scoring algorithm
-  User testing with 2-3 sample users

### **Phase 4: Polish & Documentation (Week 7-8)**
-  Refine visualizations based on feedback
-  Create user guide (1-page quick start)
-  Record demo video (3-5 min)
-  Update GitHub with final assets
-  Write case study for portfolio

**MVP Delivery Target:** 8 weeks from start (6-8 hours/week effort)

---

##  Testing & Validation Plan

### **Phase 1: Data Validation**
- [ ] Run all 24 SQL queries against database
- [ ] Verify calculations match expected results
- [ ] Cross-check totals (e.g., sum of site visitors = total city visitors)
- [ ] Test edge cases (what if site has 0 creative companies?)

### **Phase 2: Usability Testing**
- [ ] 3 users attempt tasks without guidance:
  - Task 1: "Find which site has most creative industry diversity"
  - Task 2: "Compare Site 2 and Site 3 revenue efficiency"
  - Task 3: "Identify which quarter has highest visitor activity"
- [ ] Measure: Time to complete, success rate, user feedback
- [ ] Iterate based on findings

### **Phase 3: Stakeholder Review**
- [ ] Present to 2-3 city planning professionals (network connections, LinkedIn outreach)
- [ ] Questions to validate:
  - "Would this change how you make decisions?"
  - "What's missing that you'd need to use this weekly?"
  - "Is this better than your current approach?"

---


##  Appendix A: Technical Specifications

### **Power BI Dashboard Structure**

**Page 1: Executive Overview**
- KPI cards: Total sites, Total creative companies, Total annual visitors, Total revenue
- Map visual: Sites plotted on Glasgow map (if coordinates available)
- Bar chart: Sites ranked by visitor count

**Page 2: Site Deep Dive**
- Slicer: Select site (dropdown)
- Line chart: Quarterly visitor trend
- Table: Creative companies at selected site
- Gauge: Revenue efficiency vs. city average

**Page 3: Industry Analysis**
- Matrix: Sites (rows) × Industry types (columns), cell = company count
- Scatter plot: Employees (X) × Revenue (Y), sized by local employment %

**Page 4: Regional Benchmarking**
- Dual-axis line: Europe vs. North Africa growth trends
- Table: Top 5 countries by sector

**Page 5: Opportunity Identification**
- Ranked table: Sites by opportunity score (descending)
- Conditional formatting: High scores = green, Low = red

---

##  Appendix B: Data Dictionary Reference

See full data dictionary at: `data/data_dictionary.md`

**Quick Reference:**
- **maritime_sites:** 5 Glasgow sites, historical + current use
- **creative_industries:** ~12 companies, employment + revenue
- **economic_impact:** 40 quarterly records (2022-2023)
- **market_comparison:** 8 countries, 3 sectors, benchmarking data

---

##  Appendix C: Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| **Sample data limits realism** | High | Medium | Clearly label as "demonstration dataset," explain how real data would enhance |
| **Power BI free tier limits sharing** | Medium | Medium | Publish screenshots + video, offer .pbix file download |
| **Users prefer Excel** | Low | High | Provide CSV export, explain Power BI advantages in documentation |
| **Calculations disputed** | Low | Medium | Document methodology, cite sources for formulas |

---

## Definition of Done

**This product is "complete" (MVP) when:**

- [ ] All 4 data tables loaded into MySQL
- [ ] Power BI connected and querying database
- [ ] 5 dashboard pages built as specified
- [ ] All calculated metrics implemented and validated
- [ ] PDF export functional
- [ ] User guide written (1-page)
- [ ] Demo video recorded (3-5 min)
- [ ] GitHub repo updated with:
  - [ ] .pbix file
  - [ ] Screenshots of each dashboard page
  - [ ] README with "How to Use" instructions
- [ ] Case study written for portfolio site

---

## 📞 Contact & Feedback

**Product Owner:** Khaoula Ait Faraji  
**Email:** aitfarajikhaoula01@gmail.com 
**LinkedIn:** http://linkedin.com/in/khaoula-ait-faraji-741127397
**Portfolio:** https://sites.google.com/view/aitfarajikhaoula/my-portfolio-data-analysis  
**GitHub Repo:** github.com/AFKhaoula/cultural-regeneration-dashboard

**Feedback Welcome:** This is a learning project! If you're a city planner, PM, or data professional with thoughts on this approach, I'd love to hear from you.

---

## Document Version History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | Feb 2026 | MVP definition | Khaoula Ait Faraji |

---

