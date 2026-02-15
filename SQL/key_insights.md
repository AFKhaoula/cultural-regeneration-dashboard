# Key Insights from SQL Analysis

## Overview
This document summarizes the **business insights** extracted from SQL queries analyzing Glasgow's maritime heritage transformation and creative economy development. Each insight connects data findings to strategic recommendations for city planners.

---

## SECTION 1: SITE INVENTORY & FILTERING

### **Task 1: Post-2000 Site Conversions**
**Query Purpose:** Identify modern regeneration projects  
**Key Insight:** 3 of 5 sites (60%) were converted after 2000, indicating recent momentum in maritime heritage transformation. These newer projects (Pacific Quay 1999, Glasgow Harbour 2003, Riverside Museum 2011) represent best practices for modern adaptive reuse.  
**Strategic Implication:** Newer conversions can serve as templates for future regeneration projects.

---

### **Task 2: High-Growth Creative Companies**
**Query Purpose:** Identify rapidly scaling creative businesses  
**Key Insight:** Companies founded post-2010 with 50+ employees represent **high-growth clusters** in digital media and technology sectors. These are economic multiplier engines.  
**Strategic Implication:** Prioritize infrastructure (broadband, office space) that supports digital/tech creative industries in future developments.

---

### **Task 3: North African Heritage Tourism Market**
**Query Purpose:** Benchmark high-value international markets  
**Key Insight:** North African heritage tourism sectors with >300M trade volume show **untapped partnership potential** for knowledge exchange and cross-regional investment.  
**Strategic Implication:** Glasgow's maritime heritage model could be exported as consulting expertise to emerging North African markets.

---

## SECTION 2: AGGREGATION & PERFORMANCE METRICS

### **Task 4: Creative Industry Sector Performance**
**Query Purpose:** Compare sector economics  
**Key Insight:** **Digital Media** sector shows highest average revenue and employee concentration, while **Museums** sector has high cultural value but lower commercial returns. **Design** firms balance both metrics.  
**Strategic Implication:** Mixed-use developments should combine high-revenue sectors (Digital Media) with cultural anchors (Museums) for sustainable economics.

---

### **Task 5: Quarterly Visitor & Revenue Patterns**
**Query Purpose:** Identify seasonality  
**Key Insight:** **Q2-Q3 (summer) shows 40-50% higher visitor counts** than Q1/Q4. Tourism revenue directly correlates with visitor volume.  
**Strategic Implication:** 
- Schedule major cultural events in Q2-Q3 to maximize attendance
- Develop winter programming (Q1/Q4) to smooth seasonal fluctuations
- Budget planning should account for seasonal cashflow variations

---

### **Task 6: Regional Sector Benchmarking**
**Query Purpose:** Compare Europe vs. North Africa performance  
**Key Insight:** 
- **Europe:** Higher market share in Maritime Technology (avg 7.5%) and Creative Industries (6.8%)
- **North Africa:** Faster growth rates in Heritage Tourism (avg 9.2% vs 4.1%)  

**Strategic Implication:** European cities should learn from North African heritage tourism strategies to accelerate growth.

---

## SECTION 3: RELATIONAL ANALYSIS (JOINS)

### **Task 7: Site-Industry Mapping**
**Query Purpose:** Understand industry clustering patterns  
**Key Insight:** **Pacific Quay (site_id 2) hosts the most diverse industry mix** (Digital Media, Technology, Design), creating an innovation ecosystem. Single-purpose sites show less resilience.  
**Strategic Implication:** Future regeneration should prioritize **mixed creative clusters** over mono-industry developments.

---

### **Task 8: Sites Without Economic Impact Data**
**Query Purpose:** Identify data gaps and underperforming sites  
**Key Insight:** **Govan Graving Docks (site_id 4) lacks economic impact data**, indicating it's abandoned/underdeveloped despite heritage protection status.  
**Strategic Implication:** High-priority opportunity for regeneration investment—protected heritage + untapped potential.

---

### **Task 10: Comprehensive Site-Industry Matrix**
**Query Purpose:** See full potential vs. actual utilization  
**Key Insight:** **Full outer join reveals "missing combinations"**—sites that could host additional industry types based on successful patterns elsewhere.  
**Strategic Implication:** Use this matrix to identify which industries to recruit to underutilized sites.

---

## SECTION 4: SUBQUERIES & COMPLEX FILTERING

### **Task 11: High-Traffic Site Industries**
**Query Purpose:** Identify what thrives at popular destinations  
**Key Insight:** Sites with >100K annual visitors predominantly host **Museums, Digital Media, and Entertainment** industries. Design/Arts firms benefit from foot traffic proximity.  
**Strategic Implication:** Co-locate visitor-facing creative businesses near cultural attractions for mutual benefit.

---

### **Task 12: Above-Average Revenue Sites**
**Query Purpose:** Identify success cases  
**Key Insight:** **Pacific Quay and Riverside Museum generate 2-3x average tourism revenue** due to BBC Scotland/STV presence (media hub effect) and Zaha Hadid architecture (cultural destination).  
**Strategic Implication:** Invest in landmark architecture and anchor tenants to drive revenue.

---

### **Task 13: Growth-Oriented Companies**
**Query Purpose:** Identify expansion-ready businesses  
**Key Insight:** Companies with >80% local employment AND high revenue show **strong community integration**—they're invested in staying and growing locally.  
**Strategic Implication:** Offer expansion incentives (office space, tax breaks) to retain these anchor employers.

---

## SECTION 5: WINDOW FUNCTIONS & TRENDS

### **Task 15: Quarter-over-Quarter Visitor Growth**
**Query Purpose:** Measure momentum  
**Key Insight:** **Riverside Museum shows most consistent QoQ growth** (positive change 75% of quarters), while Glasgow Harbour fluctuates more.  
**Strategic Implication:** Study Riverside's programming/marketing calendar to replicate consistency elsewhere.

---

### **Task 17: Year-over-Year Comparisons**
**Query Purpose:** Long-term trend analysis  
**Key Insight:** **All active sites showed YoY visitor growth 2022→2023**, indicating healthy regeneration trajectory post-COVID.  
**Strategic Implication:** Current strategies are working—maintain investment momentum.

---

### **Task 18: Top Performers by Visitors**
**Query Purpose:** Identify leaders  
**Key Insight:** **Pacific Quay ranks #1 in visitor volume (128,500 peak quarter)** due to media studio tours and cultural events.  
**Strategic Implication:** Media production facilities create dual economic benefit—jobs AND tourism.

---

## SECTION 6: COMMON TABLE EXPRESSIONS (CTEs)

### **Task 19: Multi-Metric Site Rankings**
**Query Purpose:** Holistic performance assessment  
**Key Insight:** **Ranking by visitors vs. revenue vs. events produces different winners**:
- Visitors: Pacific Quay
- Revenue: Riverside Museum  
- Events: Riverside Museum  

**Strategic Implication:** Different sites serve different functions in the ecosystem—optimize each for its strength rather than forcing uniform goals.

---

### **Task 20: Company Growth Trajectories**
**Query Purpose:** Identify scaling businesses  
**Key Insight:** **Post-2012 companies show 3x faster employee growth rates** than pre-2010 companies. Digital Media sector dominates this cohort.  
**Strategic Implication:** Focus recruitment efforts on post-2010 startups in tech/media—they're the growth engines.

---

### **Task 21: Seasonal Performance Deep Dive**
**Query Purpose:** Understand quarterly dynamics  
**Key Insight:** **Revenue per visitor is 20% higher in Q3** despite similar visitor counts to Q2. This suggests summer visitors spend more on premium experiences.  
**Strategic Implication:** Launch premium offerings (guided tours, workshops, merchandise) timed to Q3.

---

## SECTION 7: ADVANCED COMBINED ANALYSES

### **Task 22: Comprehensive Performance Dashboard**
**Query Purpose:** Executive-level site comparison  
**Key Insight:** **Sites with 3+ years since conversion + high industry diversity (4+ sectors) generate 2x revenue per visitor** compared to newer or mono-industry sites.  
**Strategic Implication:** 
- Allow 3+ years for economic maturity
- Actively recruit diverse creative industries—don't let sites become single-sector
- Revenue efficiency improves with age + diversity

---

### **Task 23: Heritage Status Impact Analysis**
**Query Purpose:** Does protection level affect economics?  
**Key Insight:** **"Listed structure" sites show higher visitor counts but slower business growth** compared to "Redeveloped" sites. Heritage protection attracts tourism but may constrain commercial flexibility.  
**Strategic Implication:** Balance heritage preservation with adaptive reuse flexibility in planning policies.

---

### **Task 24: Europe vs. North Africa Trend Analysis**
**Query Purpose:** Regional trajectory comparison  
**Key Insight:** 
- **North Africa:** Steeper growth curves, lower base volumes (emerging markets)
- **Europe:** Stable high volumes, slower growth (mature markets)  
- **Heritage Tourism shows strongest convergence**—both regions averaging 8-10% growth  

**Strategic Implication:** Glasgow should:
1. **Learn from North Africa:** Growth acceleration tactics
2. **Export to North Africa:** Mature market expertise
3. **Focus on Heritage Tourism:** Universal growth opportunity

---

## 🎯 TOP 5 STRATEGIC RECOMMENDATIONS

Based on all 24 queries, city planners should:

### **1. Prioritize Govan Graving Docks Regeneration**
- **Why:** Heritage protected, currently abandoned, shows zero economic activity
- **Data Support:** Task 8 (no impact data), Task 13 (opportunity gap)
- **Expected Impact:** Could match Pacific Quay's success with proper investment

### **2. Recruit Digital Media & Tech Companies to All Sites**
- **Why:** Highest revenue per employee, fastest growth, attracts tourism
- **Data Support:** Tasks 4, 13, 20 (sector performance)
- **Expected Impact:** 30-40% revenue increase within 3 years

### **3. Develop Year-Round Cultural Programming**
- **Why:** Reduce 40-50% seasonal visitor drop in Q1/Q4
- **Data Support:** Tasks 5, 21 (seasonality patterns)
- **Expected Impact:** Smooth cashflow, retain year-round staff

### **4. Create North African Partnership Program**
- **Why:** Knowledge export opportunity + learn from their growth tactics
- **Data Support:** Tasks 3, 6, 24 (regional comparison)
- **Expected Impact:** Consulting revenue + bidirectional learning

### **5. Mandate Industry Diversity in New Developments**
- **Why:** Mixed creative clusters show 2x economic resilience
- **Data Support:** Tasks 7, 22, 23 (diversity impact)
- **Expected Impact:** Reduce risk, increase visitor appeal, attract talent

---

## METRICS TO TRACK GOING FORWARD

Based on this analysis, establish quarterly KPI dashboards:

| Metric | Target | Why It Matters |
|--------|--------|----------------|
| Visitor count (per site) | 10% YoY growth | Measures destination appeal |
| Revenue per visitor | £15+ | Measures monetization efficiency |
| Industry diversity (per site) | 4+ distinct sectors | Measures economic resilience |
| Local employment % | 75%+ | Measures community benefit |
| Q1/Q4 vs Q2/Q3 gap | <30% | Measures seasonality reduction |
| New company formations | 3+ per year | Measures ecosystem vitality |

---

## CONCLUSION

This SQL analysis demonstrates that **successful maritime heritage regeneration requires**:
- ✅ **Time** (3+ years for maturity)
- ✅ **Diversity** (4+ creative sectors per site)
- ✅ **Anchors** (landmark tenants like BBC, museums)
- ✅ **Programming** (year-round cultural events)
- ✅ **Flexibility** (balance heritage + commercial needs)

**Next Steps:** Use these insights to build the **Cultural Regeneration Dashboard** that makes this data actionable for city planning decisions.

---

**Author:** Khaoula Ait Faraji  
**Analysis Period:** 2022-2023 (sample data)  
**Queries Analyzed:** 24 SQL tasks  
**Portfolio:** https://sites.google.com/view/aitfarajikhaoula/my-portfolio-data-analysis
