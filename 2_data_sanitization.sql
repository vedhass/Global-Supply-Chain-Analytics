-- FILE 2: Data cleaning and conditional flags
SELECT 
    item_name,
    current_stock,
    CASE 
        WHEN current_stock >= 4000 THEN 'CRITICAL: OVERSTOCKED'
        WHEN current_stock <= 1000 THEN 'ALERT: LOW STOCK'
        ELSE 'Healthy Level'
    END AS stock_status_flag
FROM inventory_stock;
