-- ============================================
-- DATABASE SETUP SCRIPT
-- Cultural Regeneration Dashboard Project
-- ============================================
-- Purpose: Create the database schema for maritime heritage sites,
--          creative industries, economic impact, and market comparison data
-- Author: Khaoula Ait Faraji
-- Date: February 2026
-- ============================================

-- Create database 
-- CREATE DATABASE IF NOT EXISTS cultural_regeneration_db;
-- USE cultural_regeneration_db;

-- ============================================
-- TABLE 1: MARITIME SITES (Master Table)
-- ============================================
-- Description: Catalog of Glasgow's maritime heritage sites with their
--              transformation history and current status

DROP TABLE IF EXISTS maritime_sites;

CREATE TABLE maritime_sites (
    site_id INT PRIMARY KEY AUTO_INCREMENT,
    site_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    historical_purpose VARCHAR(200),
    current_use VARCHAR(200),
    year_of_conversion INT,
    heritage_status VARCHAR(100),
    area_sqm DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Constraints
    CONSTRAINT chk_year CHECK (year_of_conversion BETWEEN 1900 AND 2100),
    CONSTRAINT chk_area CHECK (area_sqm > 0)
);

-- Add index for common queries
CREATE INDEX idx_year_conversion ON maritime_sites(year_of_conversion);
CREATE INDEX idx_heritage_status ON maritime_sites(heritage_status);
CREATE INDEX idx_city ON maritime_sites(city);

-- ============================================
-- TABLE 2: CREATIVE INDUSTRIES
-- ============================================
-- Description: Creative businesses and organizations located at maritime sites

DROP TABLE IF EXISTS creative_industries;

CREATE TABLE creative_industries (
    industry_id INT PRIMARY KEY AUTO_INCREMENT,
    site_id INT NOT NULL,
    company_name VARCHAR(150) NOT NULL,
    industry_type VARCHAR(100) NOT NULL,
    employees_count INT,
    founding_year INT,
    annual_revenue DECIMAL(15, 2),
    local_employment_percentage DECIMAL(5, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Foreign key relationship
    CONSTRAINT fk_site_creative FOREIGN KEY (site_id) 
        REFERENCES maritime_sites(site_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    
    -- Constraints
    CONSTRAINT chk_employees CHECK (employees_count >= 0),
    CONSTRAINT chk_founding_year CHECK (founding_year BETWEEN 1900 AND 2100),
    CONSTRAINT chk_revenue CHECK (annual_revenue >= 0),
    CONSTRAINT chk_local_emp_pct CHECK (local_employment_percentage BETWEEN 0 AND 100)
);

-- Add indexes for performance
CREATE INDEX idx_site_id ON creative_industries(site_id);
CREATE INDEX idx_industry_type ON creative_industries(industry_type);
CREATE INDEX idx_employees ON creative_industries(employees_count);
CREATE INDEX idx_founding_year ON creative_industries(founding_year);

-- ============================================
-- TABLE 3: ECONOMIC IMPACT
-- ============================================
-- Description: Quarterly cultural-economic performance metrics for each site

DROP TABLE IF EXISTS economic_impact;

CREATE TABLE economic_impact (
    impact_id INT PRIMARY KEY AUTO_INCREMENT,
    site_id INT NOT NULL,
    year INT NOT NULL,
    quarter INT NOT NULL,
    visitor_count INT,
    tourism_revenue DECIMAL(15, 2),
    local_business_growth DECIMAL(5, 2),
    cultural_events_count INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Foreign key relationship
    CONSTRAINT fk_site_economic FOREIGN KEY (site_id) 
        REFERENCES maritime_sites(site_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    
    -- Constraints
    CONSTRAINT chk_quarter CHECK (quarter BETWEEN 1 AND 4),
    CONSTRAINT chk_year_economic CHECK (year BETWEEN 2000 AND 2100),
    CONSTRAINT chk_visitors CHECK (visitor_count >= 0),
    CONSTRAINT chk_tourism_revenue CHECK (tourism_revenue >= 0),
    CONSTRAINT chk_events CHECK (cultural_events_count >= 0),
    
    -- Ensure unique time period per site
    CONSTRAINT uq_site_period UNIQUE (site_id, year, quarter)
);

-- Add indexes for time-series analysis
CREATE INDEX idx_site_year_quarter ON economic_impact(site_id, year, quarter);
CREATE INDEX idx_year_quarter ON economic_impact(year, quarter);
CREATE INDEX idx_visitor_count ON economic_impact(visitor_count);

-- ============================================
-- TABLE 4: MARKET COMPARISON
-- ============================================
-- Description: Cross-regional market data for maritime tech, creative industries,
--              and heritage tourism sectors

DROP TABLE IF EXISTS market_comparison;

CREATE TABLE market_comparison (
    comparison_id INT PRIMARY KEY AUTO_INCREMENT,
    country VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL,
    sector VARCHAR(100) NOT NULL,
    trade_volume BIGINT,
    year INT NOT NULL,
    quarter INT NOT NULL,
    growth_rate DECIMAL(5, 2),
    market_share DECIMAL(5, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Constraints
    CONSTRAINT chk_quarter_market CHECK (quarter BETWEEN 1 AND 4),
    CONSTRAINT chk_year_market CHECK (year BETWEEN 2000 AND 2100),
    CONSTRAINT chk_trade_volume CHECK (trade_volume >= 0),
    CONSTRAINT chk_market_share CHECK (market_share BETWEEN 0 AND 100),
    
    -- Ensure unique entry per country/sector/period
    CONSTRAINT uq_country_sector_period UNIQUE (country, sector, year, quarter)
);

-- Add indexes for analysis queries
CREATE INDEX idx_region ON market_comparison(region);
CREATE INDEX idx_sector ON market_comparison(sector);
CREATE INDEX idx_country_sector ON market_comparison(country, sector);
CREATE INDEX idx_year_quarter_market ON market_comparison(year, quarter);

-- ============================================
-- Uncomment and modify to insert sample data

-- INSERT INTO maritime_sites 
--     (site_name, city, country, historical_purpose, current_use, year_of_conversion, heritage_status, area_sqm)
-- VALUES
--     ('Glasgow Harbour', 'Glasgow', 'United Kingdom', 'Commercial shipping', 'Mixed-use residential', 2003, 'Partially protected', 52000.75),
--     ('Pacific Quay', 'Glasgow', 'United Kingdom', 'Shipbuilding and repair', 'Media hub and business park', 1999, 'Redeveloped', 33800.50),
--     ('Riverside Museum', 'Glasgow', 'United Kingdom', 'Pointhouse Quay', 'Transport museum', 2011, 'Listed structure', 11000.25),
--     ('Govan Graving Docks', 'Glasgow', 'United Kingdom', 'Ship repair and maintenance', 'Abandoned heritage site', 1988, 'Category B listed', 28500.00),
--     ('Finnieston Crane', 'Glasgow', 'United Kingdom', 'Heavy lifting crane', 'Inactive industrial heritage', 1969, 'Category A listed', 3200.80);

-- ============================================
-- VIEWS FOR COMMON QUERIES 
-- ============================================

-- View: Site Overview with Industry Count
CREATE OR REPLACE VIEW vw_site_overview AS
SELECT 
    ms.site_id,
    ms.site_name,
    ms.city,
    ms.heritage_status,
    ms.current_use,
    ms.year_of_conversion,
    COUNT(DISTINCT ci.industry_id) AS industry_count,
    COUNT(DISTINCT ci.industry_type) AS industry_diversity,
    SUM(ci.employees_count) AS total_employees
FROM maritime_sites ms
LEFT JOIN creative_industries ci ON ms.site_id = ci.site_id
GROUP BY ms.site_id, ms.site_name, ms.city, ms.heritage_status, ms.current_use, ms.year_of_conversion;

-- View: Latest Economic Performance
CREATE OR REPLACE VIEW vw_latest_performance AS
SELECT 
    ms.site_name,
    ei.year,
    ei.quarter,
    ei.visitor_count,
    ei.tourism_revenue,
    ei.local_business_growth,
    ei.cultural_events_count,
    ei.tourism_revenue / NULLIF(ei.visitor_count, 0) AS revenue_per_visitor
FROM economic_impact ei
JOIN maritime_sites ms ON ei.site_id = ms.site_id
WHERE (ei.year, ei.quarter) = (
    SELECT MAX(year), MAX(quarter) 
    FROM economic_impact 
    WHERE year = (SELECT MAX(year) FROM economic_impact)
);

-- ============================================
-- VERIFICATION QUERIES
-- ============================================
-- Run these to verify your setup

-- Check table structure
-- DESCRIBE maritime_sites;
-- DESCRIBE creative_industries;
-- DESCRIBE economic_impact;
-- DESCRIBE market_comparison;

-- Check foreign key relationships
-- SELECT 
--     TABLE_NAME,
--     COLUMN_NAME,
--     CONSTRAINT_NAME,
--     REFERENCED_TABLE_NAME,
--     REFERENCED_COLUMN_NAME
-- FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
-- WHERE TABLE_SCHEMA = 'cultural_regeneration_db'
--   AND REFERENCED_TABLE_NAME IS NOT NULL;

-- ============================================
-- END OF SETUP SCRIPT
-- ============================================
