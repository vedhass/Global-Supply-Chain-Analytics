-- FILE 3: Advanced analytical join query
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
