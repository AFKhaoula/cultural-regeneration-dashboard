# Data Dictionary

## Overview
This database contains information about maritime heritage sites in Glasgow, their transformation into creative economy hubs, economic impact metrics, and cross-regional market comparisons between European and North African countries.

**Database Type:** MySQL  
**Total Tables:** 4  
**Primary Focus:** Cultural regeneration and creative industry development in post-industrial port cities

---

## Table 1: Maritime Sites

**File:** `Maritime_sites.csv`  
**Description:** Catalog of Glasgow's maritime heritage sites, their historical context, current usage, and transformation timeline.

| Column Name | Data Type | Description | Example Values |
|-------------|-----------|-------------|----------------|
| `site_id` | INT | Unique identifier for each maritime site | 1, 2, 3, 4, 5 |
| `site_name` | VARCHAR | Official name of the maritime site | "Glasgow Harbour", "Pacific Quay" |
| `city` | VARCHAR | City location (all Glasgow in current dataset) | "Glasgow" |
| `country` | VARCHAR | Country location | "United Kingdom" |
| `historical_purpose` | VARCHAR | Original maritime/industrial function of the site | "Commercial shipping", "Shipbuilding and repair" |
| `current_use` | VARCHAR | Current function after transformation | "Mixed-use residential", "Media hub and business park" |
| `year_of_conversion` | INT | Year when site transformation was completed | 1999, 2003, 2011 |
| `heritage_status` | VARCHAR | Level of heritage protection/designation | "Partially protected", "Listed structure", "Category A listed" |
| `area_sqm` | DECIMAL | Total site area in square meters | 52000.75, 33800.5 |

**Key Relationships:**  
- `site_id` → Links to `Creative_industries.site_id`  
- `site_id` → Links to `Economic_impact.site_id`

**Business Context:**  
This table serves as the master reference for all maritime sites. It enables analysis of transformation timelines, heritage preservation status, and site characteristics that influence regeneration success.

---

## Table 2: Creative Industries

**File:** `Creative_industries.csv`  
**Description:** Information about creative businesses and organizations located at each transformed maritime site.

| Column Name | Data Type | Description | Example Values |
|-------------|-----------|-------------|----------------|
| `industry_id` | INT | Unique identifier for each creative business entry | 1, 2, 3... |
| `site_id` | INT | Foreign key linking to Maritime Sites table | 1, 2, 3, 4, 5 |
| `company_name` | VARCHAR | Name of the creative business/organization | "BBC Scotland", "Clyde Digital Studios" |
| `industry_type` | VARCHAR | Creative sector classification | "Digital Media", "Design", "Museums", "Arts" |
| `employees_count` | INT | Number of employees at this location | 45, 1120, 18 |
| `founding_year` | INT | Year the company was established at this site | 2007, 2010, 2013 |
| `annual_revenue` | DECIMAL | Estimated annual revenue (currency unspecified) | 42500000, 1250000 |
| `local_employment_percentage` | DECIMAL | Percentage of employees from local area | 78.5, 85.7, 94.2 |

**Key Relationships:**  
- `site_id` → References `Maritime_sites.site_id` (many-to-one)

**Business Context:**  
Tracks the concentration and characteristics of creative industries at each site. Critical for understanding which sectors thrive in maritime regeneration contexts and measuring economic clustering effects.

**Data Notes:**  
- Site 4 (Govan Graving Docks) has no entries as it's currently abandoned
- Revenue figures are sample data for demonstration purposes

---

## Table 3: Economic Impact

**File:** `Economic_impact.csv`  
**Description:** Quarterly cultural-economic performance metrics for each maritime site, including visitor activity, tourism revenue, and local business growth.

| Column Name | Data Type | Description | Example Values |
|-------------|-----------|-------------|----------------|
| `impact_id` | INT | Unique identifier for each quarterly measurement | 1, 2, 3... |
| `site_id` | INT | Foreign key linking to Maritime Sites table | 1, 2, 3, 4, 5 |
| `year` | INT | Year of measurement | 2022, 2023 |
| `quarter` | INT | Quarter of measurement (1=Q1, 2=Q2, etc.) | 1, 2, 3, 4 |
| `visitor_count` | INT | Number of visitors to the site during the quarter | 32500, 148700 |
| `tourism_revenue` | DECIMAL | Revenue generated from tourism/cultural activities | 687500, 2680000 |
| `local_business_count` | DECIMAL | Percentage growth in surrounding local businesses vs. previous quarter | 2.1, 4.6, 5.2 |
| `cultural_events_count` | INT | Number of cultural events held (exhibitions, performances, festivals) | 3, 12, 24 |

**Key Relationships:**  
- `site_id` → References `Maritime_sites.site_id` (many-to-one)

**Business Context:**  
Time-series data enabling trend analysis, seasonal pattern detection, and ROI measurement for regeneration investments. Shows how cultural programming drives economic activity.

**Data Notes:**  
- Data spans 2022-2023 (8 quarters per site)
- Site 4 shows minimal activity due to abandoned status
- `local_business_count` measures **percentage growth**, not absolute count

---

## Table 4: Market Comparison

**File:** `Market_comparison.csv`  
**Description:** Cross-regional comparison data for maritime technology, creative industries, and heritage tourism sectors across European and North African countries.

| Column Name | Data Type | Description | Example Values |
|-------------|-----------|-------------|----------------|
| `comparison_id` | INT | Unique identifier for each market data point | 1, 2, 3... |
| `country` | VARCHAR | Country name | "Morocco", "Sweden", "Scotland" |
| `region` | VARCHAR | Geographic region classification | "North Africa", "Europe" |
| `sector` | VARCHAR | Industry sector being measured | "Maritime Technology", "Creative Industries", "Heritage Tourism" |
| `trade_volume` | BIGINT | Total trade volume in the sector (currency unspecified) | 285000000, 587000000 |
| `year` | INT | Year of measurement | 2022 |
| `quarter` | INT | Quarter of measurement | 1, 2, 3, 4 |
| `growth_rate` | DECIMAL | Quarterly growth rate percentage | 4.2, 6.8, 12.4 |
| `market_share` | DECIMAL | Percentage of regional market share | 3.8, 7.8, 4.5 |

**Key Relationships:**  
- No direct foreign keys (standalone comparative dataset)
- Can be joined with other tables conceptually via sector/industry alignment

**Business Context:**  
Enables benchmarking Glasgow's performance against international markets. Identifies which regional models (European vs. North African) show growth patterns applicable to maritime heritage regeneration strategies.

**Countries Included:**  
- **Europe:** Sweden, Scotland, Germany, Netherlands, Spain  
- **North Africa:** Morocco, Tunisia, Egypt, Algeria

---

## Data Quality & Assumptions

### Sample Data Notice
⚠️ **This is fictional data created for educational/portfolio purposes.** It is not sourced from official publications or datasets. It demonstrates analytical capabilities and realistic data structures.

### Data Integrity
- All `site_id` values in child tables (Creative Industries, Economic Impact) exist in the Maritime Sites master table
- No null values in primary/foreign key columns
- Dates are consistent (no future dates, logical transformation timelines)

### Known Limitations
1. **Revenue data:** Currency not specified; assume GBP for UK sites
2. **Market comparison:** Sample countries only; not exhaustive regional coverage
3. **Temporal scope:** Limited to 2022-2023 data
4. **Abandoned sites:** Site 4 (Govan Graving Docks) has incomplete economic data due to pending redevelopment

---

## Usage Examples

**Find all creative companies at a specific site:**
```sql
SELECT company_name, industry_type, employees_count
FROM Creative_industries
WHERE site_id = 2;
```

**Calculate total annual visitors by site:**
```sql
SELECT ms.site_name, SUM(ei.visitor_count) as total_visitors
FROM Maritime_sites ms
JOIN Economic_impact ei ON ms.site_id = ei.site_id
WHERE ei.year = 2022
GROUP BY ms.site_name;
```

**Compare regional sector performance:**
```sql
SELECT region, sector, AVG(growth_rate) as avg_growth
FROM Market_comparison
WHERE year = 2022
GROUP BY region, sector
ORDER BY avg_growth DESC;
```

---

## Maintenance & Updates

**Last Updated:** February 2026  
**Maintained By:** Khaoula Ait Faraji  
**Update Frequency:** Static dataset (portfolio project)

---

## Contact

For questions about this data dictionary or dataset:  
- **Portfolio:** https://sites.google.com/view/aitfarajikhaoula 
- **GitHub:** https://github.com/AFKhaoula 
- **LinkedIn:** http://linkedin.com/in/khaoula-ait-faraji-741127397