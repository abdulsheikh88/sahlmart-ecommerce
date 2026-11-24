CREATE TABLE IF NOT EXISTS categories (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  display_order INTEGER NOT NULL UNIQUE,
  is_active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS measurement_units (
  code TEXT PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  abbreviation TEXT NOT NULL UNIQUE,
  dimension TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS items (
  id TEXT PRIMARY KEY,
  category_id TEXT NOT NULL REFERENCES categories (id),
  name TEXT NOT NULL,
  measurement_unit_code TEXT NOT NULL REFERENCES measurement_units (code),
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  UNIQUE (category_id, name)
);

INSERT INTO categories (id, name, display_order) VALUES
  ('grains', 'Grains', 1),
  ('masala', 'Masala', 2),
  ('cold-drinks-juices', 'Cold Drinks & Juices', 3),
  ('dairy-bread-eggs', 'Dairy, Bread & Eggs', 4),
  ('candies-gums', 'Candies & Gums', 5),
  ('snacks-munchies', 'Snacks & Munchies', 6),
  ('bakery', 'Bakery', 7),
  ('cleaning-laundry', 'Cleaning and Laundry', 8),
  ('dry-fruits', 'Dry Fruits', 9),
  ('biscuits', 'Biscuits', 10),
  ('tea', 'Tea', 11)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  display_order = EXCLUDED.display_order,
  is_active = TRUE;

INSERT INTO measurement_units (code, name, abbreviation, dimension) VALUES
  ('g', 'Gram', 'g', 'mass'),
  ('kg', 'Kilogram', 'kg', 'mass'),
  ('ml', 'Millilitre', 'ml', 'volume'),
  ('l', 'Litre', 'L', 'volume'),
  ('piece', 'Piece', 'pc', 'count'),
  ('pack', 'Pack', 'pack', 'package'),
  ('bottle', 'Bottle', 'bottle', 'package'),
  ('loaf', 'Loaf', 'loaf', 'package'),
  ('box', 'Box', 'box', 'package'),
  ('dozen', 'Dozen', 'dozen', 'count'),
  ('sachet', 'Sachet', 'sachet', 'package')
ON CONFLICT (code) DO UPDATE SET
  name = EXCLUDED.name,
  abbreviation = EXCLUDED.abbreviation,
  dimension = EXCLUDED.dimension;

INSERT INTO items (id, category_id, name, measurement_unit_code) VALUES
  ('wheat', 'grains', 'Wheat', 'kg'),
  ('rice', 'grains', 'Rice', 'kg'),
  ('bajra', 'grains', 'Bajra', 'kg'),
  ('masoor-dal', 'grains', 'Masoor Dal', 'kg'),
  ('tuwar-dal', 'grains', 'Tuwar Dal', 'kg'),
  ('sambhar-masala', 'masala', 'Sambhar Masala', 'pack'),
  ('vegetable-masala', 'masala', 'Vegetable Masala', 'pack'),
  ('chicken-masala', 'masala', 'Chicken Masala', 'pack'),
  ('fish-masala', 'masala', 'Fish Masala', 'pack'),
  ('goda-masala', 'masala', 'Goda Masala', 'pack'),
  ('pepsi', 'cold-drinks-juices', 'Pepsi', 'bottle'),
  ('coca-cola', 'cold-drinks-juices', 'Coca-Cola', 'bottle'),
  ('maaza', 'cold-drinks-juices', 'Maaza', 'bottle'),
  ('mineral-water', 'cold-drinks-juices', 'Mineral Water', 'bottle'),
  ('soda', 'cold-drinks-juices', 'Soda', 'bottle'),
  ('paper-boat', 'cold-drinks-juices', 'Paper Boat', 'pack'),
  ('milk', 'dairy-bread-eggs', 'Milk', 'l'),
  ('curd', 'dairy-bread-eggs', 'Curd', 'kg'),
  ('lassi', 'dairy-bread-eggs', 'Lassi', 'bottle'),
  ('buttermilk', 'dairy-bread-eggs', 'Buttermilk', 'bottle'),
  ('bread', 'dairy-bread-eggs', 'Bread', 'loaf'),
  ('eggs', 'dairy-bread-eggs', 'Eggs', 'dozen'),
  ('dairy-milk-chocolate', 'candies-gums', 'Dairy Milk Chocolate', 'piece'),
  ('gems', 'candies-gums', 'Chocolate Gems', 'pack'),
  ('eclairs', 'candies-gums', 'Eclairs', 'pack'),
  ('chewing-gum', 'candies-gums', 'Chewing Gum', 'pack'),
  ('potato-chips', 'snacks-munchies', 'Potato Chips', 'pack'),
  ('kurkure', 'snacks-munchies', 'Kurkure', 'pack'),
  ('namkeen', 'snacks-munchies', 'Namkeen', 'pack'),
  ('popcorn', 'snacks-munchies', 'Popcorn', 'pack'),
  ('buns', 'bakery', 'Buns', 'pack'),
  ('pav', 'bakery', 'Pav', 'pack'),
  ('cake', 'bakery', 'Cake', 'piece'),
  ('rusk', 'bakery', 'Rusk', 'pack'),
  ('detergent-powder', 'cleaning-laundry', 'Detergent Powder', 'kg'),
  ('detergent-bar', 'cleaning-laundry', 'Detergent Bar', 'piece'),
  ('dishwash-liquid', 'cleaning-laundry', 'Dishwash Liquid', 'bottle'),
  ('floor-cleaner', 'cleaning-laundry', 'Floor Cleaner', 'bottle'),
  ('almonds', 'dry-fruits', 'Almonds', 'kg'),
  ('cashews', 'dry-fruits', 'Cashews', 'kg'),
  ('raisins', 'dry-fruits', 'Raisins', 'kg'),
  ('pistachios', 'dry-fruits', 'Pistachios', 'kg'),
  ('parle-g-biscuits', 'biscuits', 'Glucose Biscuits', 'pack'),
  ('marie-biscuits', 'biscuits', 'Marie Biscuits', 'pack'),
  ('good-day-biscuits', 'biscuits', 'Butter Biscuits', 'pack'),
  ('bourbon-biscuits', 'biscuits', 'Chocolate Biscuits', 'pack'),
  ('digestive-biscuits', 'biscuits', 'Digestive Biscuits', 'pack'),
  ('tea-powder', 'tea', 'Tea Powder', 'pack'),
  ('green-tea', 'tea', 'Green Tea', 'box'),
  ('masala-tea', 'tea', 'Masala Tea', 'pack')
ON CONFLICT (id) DO UPDATE SET
  category_id = EXCLUDED.category_id,
  name = EXCLUDED.name,
  measurement_unit_code = EXCLUDED.measurement_unit_code,
  is_active = TRUE;
