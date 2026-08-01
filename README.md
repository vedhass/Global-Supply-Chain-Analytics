# Corporate Capstone: Global Supply Chain & Inventory Analytics (Multi-File SQL Architecture)

## 1. ASK (Project Objective)
- **Business Task:** Evaluate warehouse inventory distribution across regional nodes to optimize supply chain capacity, minimize overstock costs, and isolate locked capital.
- **Key Stakeholders:** Global Logistics Director, Supply Chain Financial Controller.

## 2. REPOSITORY ARCHITECTURE & PIPELINE
This project is structured across exactly four modular database files to isolate setup architecture from final report compilation:
1. **`1_schema_setup.sql`:** Configures multi-table relational schema layers mapping structural Foreign Key dependencies (`warehouses` linked to `inventory_stock`).
2. **`2_data_sanitization.sql`:** Implements logical validation scripts using advanced `CASE WHEN` flags to uncover supply velocity bottlenecks.
3. **`3_advanced_analytics.sql`:** Executes complex multi-table `INNER JOIN` operations and aggregate financial modeling functions (`SUM`, `COUNT`, `GROUP BY`).
4. **`4_executive_summary.csv`:** Displays the final tabular output dataset delivered directly to operations leadership.

## 3. ANALYZE (Core Processing Queries)
The primary analytical heavy-lifting combines relational tables using matching join boundaries to roll up micro-level stocks into localized macroeconomic insights:

```sql
SELECT 
    w.city AS warehouse_location,
    COUNT(i.item_id) AS distinct_product_lines,
    SUM(i.current_stock) AS total_items_stored,
    SUM(i.current_stock * i.unit_cost_inr) AS total_inventory_value_inr
FROM warehouses w
INNER JOIN inventory_stock i 
    ON w.warehouse_id = i.warehouse_id
GROUP BY w.city
ORDER BY total_inventory_value_inr DESC;
```

### Verified Performance Pipeline Metrics (`4_executive_summary.csv`):
- **Bengaluru Node:** 2 core product lines | 5,700 items stored | **INR 36,30,00,000.00** locked value.
- **Mumbai Node:** 2 core product lines | 3,900 items stored | **INR 5,33,96,900.00** locked value.
- **Delhi Node:** 2 core product lines | 5,700 items stored | **INR 2,33,94,300.00** locked value.

## 4. ACT (Data-Driven Logistics Recommendations)
1. **Capacity Redistribution:** The Bengaluru warehouse holds over **85% of total capital value** (primarily high-margin Pixel lines). Immediate inventory balancing initiatives should buffer this weight across under-utilized storage spaces in Delhi.
2. **Automated Procurement Triggers:** Integrate the threshold parameters established in `2_data_sanitization.sql` directly into local reorder flows to automate replenishment intervals before reaching deficit benchmarks.

## Tools Used
- **SQLite Engine:** Complex relational queries, foreign key schema designs, and data modeling blocks.
- **CSV Formats:** Standardized tabular reporting formats optimized for corporate dashboards.
- **GitHub Core:** Advanced multi-file version control and portfolio architecture documentation.
