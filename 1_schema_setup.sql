-- FILE 1: database tables configuration
CREATE TABLE warehouses (
    warehouse_id INT PRIMARY KEY,
    city VARCHAR(50),
    max_capacity_units INT
);

CREATE TABLE inventory_stock (
    item_id INT,
    item_name VARCHAR(50),
    category VARCHAR(50),
    current_stock INT,
    unit_cost_inr INT,
    warehouse_id INT,
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

INSERT INTO warehouses VALUES 
(1, 'Bengaluru', 5000),
(2, 'Mumbai', 3000),
(3, 'Delhi', 4000);

INSERT INTO inventory_stock VALUES
(10, 'Pixel 8 Phone', 'Electronics', 4200, 75000, 1),
(20, 'Chromebook Laptop', 'Electronics', 1500, 32000, 1),
(30, 'Nest Smart Speaker', 'Devices', 3100, 9999, 2),
(40, 'Pixel Watch', 'Devices', 800, 28000, 2),
(50, 'Type-C Charger', 'Accessories', 4500, 1999, 3),
(60, 'Wireless Earbuds', 'Accessories', 1200, 11999, 3);
