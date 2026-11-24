BEGIN;
ALTER TABLE items ADD COLUMN IF NOT EXISTS package_label TEXT;
ALTER TABLE items ADD COLUMN IF NOT EXISTS price_inr NUMERIC(10, 2);
ALTER TABLE items ADD COLUMN IF NOT EXISTS mrp_inr NUMERIC(10, 2);
UPDATE categories SET display_order = display_order + 1000;
UPDATE categories SET name = CASE id
    WHEN 'grains' THEN 'Atta, Rice & Dal'
    WHEN 'masala' THEN 'Masala, Oil & More'
    WHEN 'candies-gums' THEN 'Sweet Tooth'
    WHEN 'bakery' THEN 'Bakery & Biscuits'
    WHEN 'tea' THEN 'Tea, Coffee & Milk Drinks'
    WHEN 'dry-fruits' THEN 'Organic & Healthy Living'
    WHEN 'cleaning-laundry' THEN 'Cleaning Essentials'
    ELSE name
  END
WHERE id IN ('grains', 'masala', 'candies-gums', 'bakery', 'tea', 'dry-fruits', 'cleaning-laundry');
INSERT INTO categories (id, name, display_order) VALUES
  ('paan-corner', 'Paan Corner', 2001),
  ('dairy-bread-eggs', 'Dairy, Bread & Eggs', 2002),
  ('fruits-vegetables', 'Fruits & Vegetables', 2003),
  ('cold-drinks-juices', 'Cold Drinks & Juices', 2004),
  ('snacks-munchies', 'Snacks & Munchies', 2005),
  ('breakfast-instant-food', 'Breakfast & Instant Food', 2006),
  ('candies-gums', 'Sweet Tooth', 2007),
  ('bakery', 'Bakery & Biscuits', 2008),
  ('tea', 'Tea, Coffee & Milk Drinks', 2009),
  ('grains', 'Atta, Rice & Dal', 2010),
  ('masala', 'Masala, Oil & More', 2011),
  ('sauces-spreads', 'Sauces & Spreads', 2012),
  ('chicken-meat-fish', 'Chicken, Meat & Fish', 2013),
  ('dry-fruits', 'Organic & Healthy Living', 2014),
  ('baby-care', 'Baby Care', 2015),
  ('pharma-wellness', 'Pharma & Wellness', 2016),
  ('cleaning-laundry', 'Cleaning Essentials', 2017),
  ('home-office', 'Home & Office', 2018)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  is_active = TRUE;
UPDATE items SET category_id = 'bakery' WHERE category_id = 'biscuits';
UPDATE categories SET
  display_order = CASE id
    WHEN 'paan-corner' THEN 1
    WHEN 'dairy-bread-eggs' THEN 2
    WHEN 'fruits-vegetables' THEN 3
    WHEN 'cold-drinks-juices' THEN 4
    WHEN 'snacks-munchies' THEN 5
    WHEN 'breakfast-instant-food' THEN 6
    WHEN 'candies-gums' THEN 7
    WHEN 'bakery' THEN 8
    WHEN 'tea' THEN 9
    WHEN 'grains' THEN 10
    WHEN 'masala' THEN 11
    WHEN 'sauces-spreads' THEN 12
    WHEN 'chicken-meat-fish' THEN 13
    WHEN 'dry-fruits' THEN 14
    WHEN 'baby-care' THEN 15
    WHEN 'pharma-wellness' THEN 16
    WHEN 'cleaning-laundry' THEN 17
    WHEN 'home-office' THEN 18
    WHEN 'biscuits' THEN 19
    ELSE display_order
  END,
  is_active = (id <> 'biscuits')
WHERE id IN ('paan-corner', 'dairy-bread-eggs', 'fruits-vegetables', 'cold-drinks-juices', 'snacks-munchies', 'breakfast-instant-food', 'candies-gums', 'bakery', 'tea', 'grains', 'masala', 'sauces-spreads', 'chicken-meat-fish', 'dry-fruits', 'baby-care', 'pharma-wellness', 'cleaning-laundry', 'home-office', 'biscuits');
INSERT INTO items (id, category_id, name, measurement_unit_code, package_label, price_inr, mrp_inr) VALUES
  ('paan-corner-fresh-betel-leaves', 'paan-corner', 'Fresh Betel Leaves', 'piece', '10 leaves', 25, 30),
  ('paan-corner-sweet-gulkand', 'paan-corner', 'Sweet Gulkand', 'g', '200 g', 95, 110),
  ('paan-corner-roasted-fennel-seeds', 'paan-corner', 'Roasted Fennel Seeds', 'g', '100 g', 55, 65),
  ('paan-corner-cardamom-pods', 'paan-corner', 'Cardamom Pods', 'g', '50 g', 110, 125),
  ('paan-corner-paan-supari-mix', 'paan-corner', 'Paan Supari Mix', 'g', '100 g', 65, 75),
  ('paan-corner-desiccated-coconut', 'paan-corner', 'Desiccated Coconut', 'g', '100 g', 48, 55),
  ('paan-corner-rose-petal-preserve', 'paan-corner', 'Rose Petal Preserve', 'g', '250 g', 125, 140),
  ('paan-corner-whole-cloves', 'paan-corner', 'Whole Cloves', 'g', '50 g', 75, 85),
  ('paan-corner-mint-mouth-freshener', 'paan-corner', 'Mint Mouth Freshener', 'g', '100 g', 60, 70),
  ('paan-corner-sweet-saunf-mix', 'paan-corner', 'Sweet Saunf Mix', 'g', '100 g', 55, 65),
  ('dairy-bread-eggs-fresh-full-cream-milk', 'dairy-bread-eggs', 'Fresh Full Cream Milk', 'l', '1 L', 72, 85),
  ('dairy-bread-eggs-farm-curd-tub', 'dairy-bread-eggs', 'Farm Curd Tub', 'g', '400 g', 42, 50),
  ('dairy-bread-eggs-sweet-mango-lassi', 'dairy-bread-eggs', 'Sweet Mango Lassi', 'ml', '200 ml', 28, 35),
  ('dairy-bread-eggs-classic-salted-buttermilk', 'dairy-bread-eggs', 'Classic Salted Buttermilk', 'ml', '500 ml', 25, 30),
  ('dairy-bread-eggs-salted-butter', 'dairy-bread-eggs', 'Salted Butter', 'g', '100 g', 62, 70),
  ('dairy-bread-eggs-fresh-paneer', 'dairy-bread-eggs', 'Fresh Paneer', 'g', '200 g', 95, 110),
  ('dairy-bread-eggs-cheddar-cheese-slices', 'dairy-bread-eggs', 'Cheddar Cheese Slices', 'g', '200 g', 145, 165),
  ('dairy-bread-eggs-pure-cow-ghee', 'dairy-bread-eggs', 'Pure Cow Ghee', 'ml', '500 ml', 325, 365),
  ('dairy-bread-eggs-brown-bread-loaf', 'dairy-bread-eggs', 'Brown Bread Loaf', 'g', '400 g', 48, 55),
  ('dairy-bread-eggs-farm-eggs', 'dairy-bread-eggs', 'Farm Eggs', 'piece', '6 pieces', 55, 65),
  ('fruits-vegetables-fresh-potatoes', 'fruits-vegetables', 'Fresh Potatoes', 'kg', '1 kg', 38, 45),
  ('fruits-vegetables-red-onions', 'fruits-vegetables', 'Red Onions', 'kg', '1 kg', 44, 50),
  ('fruits-vegetables-vine-tomatoes', 'fruits-vegetables', 'Vine Tomatoes', 'g', '500 g', 32, 40),
  ('fruits-vegetables-robusta-bananas', 'fruits-vegetables', 'Robusta Bananas', 'piece', '6 pieces', 48, 55),
  ('fruits-vegetables-shimla-apples', 'fruits-vegetables', 'Shimla Apples', 'kg', '1 kg', 165, 185),
  ('fruits-vegetables-fresh-spinach-bunch', 'fruits-vegetables', 'Fresh Spinach Bunch', 'piece', '1 bunch', 25, 30),
  ('fruits-vegetables-ooty-carrots', 'fruits-vegetables', 'Ooty Carrots', 'g', '500 g', 42, 50),
  ('fruits-vegetables-green-cucumbers', 'fruits-vegetables', 'Green Cucumbers', 'g', '500 g', 30, 35),
  ('fruits-vegetables-nagpur-oranges', 'fruits-vegetables', 'Nagpur Oranges', 'kg', '1 kg', 88, 100),
  ('fruits-vegetables-green-capsicum', 'fruits-vegetables', 'Green Capsicum', 'g', '500 g', 48, 55),
  ('cold-drinks-juices-pepsi-cola', 'cold-drinks-juices', 'Pepsi Cola', 'ml', '750 ml', 40, 45),
  ('cold-drinks-juices-coca-cola-classic', 'cold-drinks-juices', 'Coca-Cola Classic', 'ml', '750 ml', 40, 45),
  ('cold-drinks-juices-maaza-mango-drink', 'cold-drinks-juices', 'Maaza Mango Drink', 'l', '1.2 L', 75, 85),
  ('cold-drinks-juices-packaged-mineral-water', 'cold-drinks-juices', 'Packaged Mineral Water', 'l', '1 L', 20, 25),
  ('cold-drinks-juices-club-soda', 'cold-drinks-juices', 'Club Soda', 'ml', '750 ml', 25, 30),
  ('cold-drinks-juices-paper-boat-aam-panna', 'cold-drinks-juices', 'Paper Boat Aam Panna', 'ml', '200 ml', 30, 35),
  ('cold-drinks-juices-orange-juice', 'cold-drinks-juices', 'Orange Juice', 'l', '1 L', 125, 140),
  ('cold-drinks-juices-lemon-soda', 'cold-drinks-juices', 'Lemon Soda', 'ml', '300 ml', 35, 40),
  ('cold-drinks-juices-mango-fruit-drink', 'cold-drinks-juices', 'Mango Fruit Drink', 'ml', '600 ml', 45, 55),
  ('cold-drinks-juices-sparkling-water', 'cold-drinks-juices', 'Sparkling Water', 'ml', '750 ml', 55, 65),
  ('snacks-munchies-classic-salted-potato-chips', 'snacks-munchies', 'Classic Salted Potato Chips', 'g', '52 g', 20, 25),
  ('snacks-munchies-masala-crunch-sticks', 'snacks-munchies', 'Masala Crunch Sticks', 'g', '90 g', 25, 30),
  ('snacks-munchies-spicy-mixture-namkeen', 'snacks-munchies', 'Spicy Mixture Namkeen', 'g', '200 g', 55, 65),
  ('snacks-munchies-butter-popcorn', 'snacks-munchies', 'Butter Popcorn', 'g', '70 g', 45, 55),
  ('snacks-munchies-cheese-balls', 'snacks-munchies', 'Cheese Balls', 'g', '40 g', 30, 35),
  ('snacks-munchies-banana-chips', 'snacks-munchies', 'Banana Chips', 'g', '150 g', 65, 75),
  ('snacks-munchies-roasted-peanuts', 'snacks-munchies', 'Roasted Peanuts', 'g', '200 g', 58, 65),
  ('snacks-munchies-classic-sev', 'snacks-munchies', 'Classic Sev', 'g', '200 g', 50, 60),
  ('snacks-munchies-nacho-chips', 'snacks-munchies', 'Nacho Chips', 'g', '100 g', 55, 65),
  ('snacks-munchies-masala-chakli', 'snacks-munchies', 'Masala Chakli', 'g', '180 g', 70, 80),
  ('breakfast-instant-food-rolled-oats', 'breakfast-instant-food', 'Rolled Oats', 'kg', '1 kg', 185, 210),
  ('breakfast-instant-food-crunchy-corn-flakes', 'breakfast-instant-food', 'Crunchy Corn Flakes', 'g', '500 g', 175, 200),
  ('breakfast-instant-food-instant-noodles', 'breakfast-instant-food', 'Instant Noodles', 'pack', '4 × 70 g', 56, 65),
  ('breakfast-instant-food-thick-poha', 'breakfast-instant-food', 'Thick Poha', 'g', '500 g', 48, 55),
  ('breakfast-instant-food-instant-upma-mix', 'breakfast-instant-food', 'Instant Upma Mix', 'g', '500 g', 95, 110),
  ('breakfast-instant-food-fruit-and-nut-muesli', 'breakfast-instant-food', 'Fruit and Nut Muesli', 'g', '500 g', 265, 300),
  ('breakfast-instant-food-macaroni-pasta', 'breakfast-instant-food', 'Macaroni Pasta', 'g', '500 g', 85, 100),
  ('breakfast-instant-food-roasted-vermicelli', 'breakfast-instant-food', 'Roasted Vermicelli', 'g', '400 g', 58, 65),
  ('breakfast-instant-food-instant-dosa-mix', 'breakfast-instant-food', 'Instant Dosa Mix', 'g', '500 g', 115, 130),
  ('breakfast-instant-food-pancake-mix', 'breakfast-instant-food', 'Pancake Mix', 'g', '500 g', 145, 165),
  ('candies-gums-silk-milk-chocolate-bar', 'candies-gums', 'Silk Milk Chocolate Bar', 'g', '60 g', 85, 100),
  ('candies-gums-chocolate-gems-mini-pack', 'candies-gums', 'Chocolate Gems Mini Pack', 'g', '28 g', 20, 25),
  ('candies-gums-coffee-eclairs-share-pack', 'candies-gums', 'Coffee Eclairs Share Pack', 'g', '160 g', 55, 65),
  ('candies-gums-mint-chewing-gum', 'candies-gums', 'Mint Chewing Gum', 'piece', '10 pieces', 50, 60),
  ('candies-gums-mango-fruit-candy', 'candies-gums', 'Mango Fruit Candy', 'g', '100 g', 45, 55),
  ('candies-gums-assorted-fruit-lollipops', 'candies-gums', 'Assorted Fruit Lollipops', 'piece', '10 pieces', 40, 45),
  ('candies-gums-peanut-chikki', 'candies-gums', 'Peanut Chikki', 'g', '200 g', 75, 85),
  ('candies-gums-dark-chocolate-bar', 'candies-gums', 'Dark Chocolate Bar', 'g', '80 g', 110, 125),
  ('candies-gums-assorted-jelly-candy', 'candies-gums', 'Assorted Jelly Candy', 'g', '100 g', 60, 70),
  ('candies-gums-caramel-toffee-pack', 'candies-gums', 'Caramel Toffee Pack', 'g', '150 g', 65, 75),
  ('bakery-soft-milk-bread-loaf', 'bakery', 'Soft Milk Bread Loaf', 'g', '400 g', 42, 50),
  ('bakery-butter-pav-pack', 'bakery', 'Butter Pav Pack', 'piece', '6 pieces', 35, 40),
  ('bakery-chocolate-muffins', 'bakery', 'Chocolate Muffins', 'piece', '2 pieces', 65, 75),
  ('bakery-glucose-biscuit-value-pack', 'bakery', 'Glucose Biscuit Value Pack', 'g', '800 g', 90, 105),
  ('bakery-marie-biscuit-family-pack', 'bakery', 'Marie Biscuit Family Pack', 'g', '600 g', 85, 100),
  ('bakery-butter-cookies', 'bakery', 'Butter Cookies', 'g', '250 g', 110, 125),
  ('bakery-multigrain-digestive-biscuits', 'bakery', 'Multigrain Digestive Biscuits', 'g', '250 g', 95, 110),
  ('bakery-butter-croissant', 'bakery', 'Butter Croissant', 'piece', '2 pieces', 75, 85),
  ('bakery-jam-roll-cake', 'bakery', 'Jam Roll Cake', 'g', '200 g', 80, 90),
  ('bakery-pizza-base-pack', 'bakery', 'Pizza Base Pack', 'piece', '2 pieces', 55, 65),
  ('tea-assam-ctc-tea', 'tea', 'Assam CTC Tea', 'g', '250 g', 165, 185),
  ('tea-green-tea-bags', 'tea', 'Green Tea Bags', 'pack', '25 bags', 125, 140),
  ('tea-instant-coffee', 'tea', 'Instant Coffee', 'g', '100 g', 245, 275),
  ('tea-south-indian-filter-coffee', 'tea', 'South Indian Filter Coffee', 'g', '200 g', 195, 220),
  ('tea-masala-chai-tea', 'tea', 'Masala Chai Tea', 'g', '250 g', 175, 200),
  ('tea-hot-chocolate-mix', 'tea', 'Hot Chocolate Mix', 'g', '200 g', 185, 210),
  ('tea-malted-milk-drink', 'tea', 'Malted Milk Drink', 'g', '500 g', 285, 320),
  ('tea-lemon-tea-bags', 'tea', 'Lemon Tea Bags', 'pack', '25 bags', 115, 130),
  ('tea-chilled-coffee-drink', 'tea', 'Chilled Coffee Drink', 'ml', '180 ml', 45, 55),
  ('tea-ginger-tea-premix', 'tea', 'Ginger Tea Premix', 'sachet', '10 sachets', 95, 110),
  ('grains-queen-s-choice-rozana-gold-tibar-basmati-rice', 'grains', 'Queen''s Choice Rozana Gold Tibar Basmati Rice', 'kg', '5 kg', 421, 475),
  ('grains-queen-s-choice-rozana-gold-basmati-rice', 'grains', 'Queen''s Choice Rozana Gold Basmati Rice', 'kg', '1 kg', 104, 120),
  ('grains-rozana-dubar-broken-basmati-rice', 'grains', 'Rozana Dubar Broken Basmati Rice', 'kg', '5 kg', 338, 380),
  ('grains-fortune-besan', 'grains', 'Fortune Besan', 'kg', '1 kg', 48, 55),
  ('grains-fortune-soya-chunks', 'grains', 'Fortune Soya Chunks', 'kg', '1 kg', 130, 150),
  ('grains-classic-brown-chana', 'grains', 'Classic Brown Chana', 'g', '500 g', 48, 55),
  ('grains-classic-yellow-moong-dal-split', 'grains', 'Classic Yellow Moong Dal Split', 'kg', '1 kg', 135, 155),
  ('grains-classic-chana-dal-split', 'grains', 'Classic Chana Dal Split', 'kg', '1 kg', 105, 120),
  ('grains-premium-whole-wheat-atta', 'grains', 'Premium Whole Wheat Atta', 'kg', '5 kg', 265, 300),
  ('grains-toor-dal-family-pack', 'grains', 'Toor Dal Family Pack', 'kg', '1 kg', 165, 185),
  ('masala-sambhar-masala-family-pack', 'masala', 'Sambhar Masala Family Pack', 'g', '100 g', 65, 75),
  ('masala-vegetable-masala-premium-pack', 'masala', 'Vegetable Masala Premium Pack', 'g', '100 g', 58, 65),
  ('masala-chicken-masala-spice-blend', 'masala', 'Chicken Masala Spice Blend', 'g', '100 g', 62, 70),
  ('masala-fish-masala-spice-blend', 'masala', 'Fish Masala Spice Blend', 'g', '100 g', 60, 70),
  ('masala-goda-masala-special-blend', 'masala', 'Goda Masala Special Blend', 'g', '100 g', 75, 85),
  ('masala-ground-turmeric-powder', 'masala', 'Ground Turmeric Powder', 'g', '200 g', 72, 85),
  ('masala-kashmiri-chilli-powder', 'masala', 'Kashmiri Chilli Powder', 'g', '200 g', 115, 130),
  ('masala-whole-cumin-seeds', 'masala', 'Whole Cumin Seeds', 'g', '200 g', 98, 110),
  ('masala-sunflower-cooking-oil', 'masala', 'Sunflower Cooking Oil', 'l', '1 L', 155, 175),
  ('masala-cold-pressed-mustard-oil', 'masala', 'Cold Pressed Mustard Oil', 'l', '1 L', 185, 210),
  ('sauces-spreads-tomato-ketchup', 'sauces-spreads', 'Tomato Ketchup', 'kg', '1 kg', 125, 140),
  ('sauces-spreads-mint-green-chutney', 'sauces-spreads', 'Mint Green Chutney', 'g', '200 g', 55, 65),
  ('sauces-spreads-eggless-mayonnaise', 'sauces-spreads', 'Eggless Mayonnaise', 'g', '250 g', 95, 110),
  ('sauces-spreads-creamy-peanut-butter', 'sauces-spreads', 'Creamy Peanut Butter', 'g', '340 g', 185, 210),
  ('sauces-spreads-mixed-fruit-jam', 'sauces-spreads', 'Mixed Fruit Jam', 'g', '500 g', 145, 165),
  ('sauces-spreads-cheese-spread', 'sauces-spreads', 'Cheese Spread', 'g', '200 g', 125, 140),
  ('sauces-spreads-schezwan-chutney', 'sauces-spreads', 'Schezwan Chutney', 'g', '250 g', 95, 110),
  ('sauces-spreads-dark-soy-sauce', 'sauces-spreads', 'Dark Soy Sauce', 'ml', '200 ml', 75, 85),
  ('sauces-spreads-sandwich-spread', 'sauces-spreads', 'Sandwich Spread', 'g', '250 g', 115, 130),
  ('sauces-spreads-sweet-chilli-sauce', 'sauces-spreads', 'Sweet Chilli Sauce', 'ml', '250 ml', 99, 115),
  ('chicken-meat-fish-chicken-curry-cut', 'chicken-meat-fish', 'Chicken Curry Cut', 'g', '500 g', 175, 200),
  ('chicken-meat-fish-boneless-chicken-breast', 'chicken-meat-fish', 'Boneless Chicken Breast', 'g', '500 g', 245, 275),
  ('chicken-meat-fish-chicken-drumsticks', 'chicken-meat-fish', 'Chicken Drumsticks', 'g', '500 g', 195, 220),
  ('chicken-meat-fish-whole-chicken-cleaned', 'chicken-meat-fish', 'Whole Chicken Cleaned', 'kg', '1 kg', 285, 320),
  ('chicken-meat-fish-mutton-curry-cut', 'chicken-meat-fish', 'Mutton Curry Cut', 'g', '500 g', 425, 480),
  ('chicken-meat-fish-lamb-mince', 'chicken-meat-fish', 'Lamb Mince', 'g', '500 g', 395, 445),
  ('chicken-meat-fish-rohu-fish-curry-cut', 'chicken-meat-fish', 'Rohu Fish Curry Cut', 'g', '500 g', 185, 210),
  ('chicken-meat-fish-boneless-fish-fillet', 'chicken-meat-fish', 'Boneless Fish Fillet', 'g', '400 g', 265, 300),
  ('chicken-meat-fish-cleaned-prawns', 'chicken-meat-fish', 'Cleaned Prawns', 'g', '250 g', 225, 255),
  ('chicken-meat-fish-chicken-breakfast-sausages', 'chicken-meat-fish', 'Chicken Breakfast Sausages', 'g', '250 g', 165, 185),
  ('dry-fruits-sunflower-seeds', 'dry-fruits', 'Sunflower Seeds', 'g', '250 g', 88, 100),
  ('dry-fruits-farmley-barkat-dates', 'dry-fruits', 'Farmley Barkat Dates', 'pack', '2 × 500 g', 598, 670),
  ('dry-fruits-almonds-and-cashews-combo', 'dry-fruits', 'Almonds and Cashews Combo', 'pack', '2 × 200 g', 442, 500),
  ('dry-fruits-dried-figs', 'dry-fruits', 'Dried Figs', 'g', '200 g', 253, 285),
  ('dry-fruits-premium-pumpkin-seeds', 'dry-fruits', 'Premium Pumpkin Seeds', 'g', '200 g', 192, 220),
  ('dry-fruits-premium-raisins', 'dry-fruits', 'Premium Raisins', 'g', '500 g', 243, 275),
  ('dry-fruits-gold-makhana', 'dry-fruits', 'Gold Makhana', 'g', '200 g', 346, 390),
  ('dry-fruits-roasted-salted-pistachios', 'dry-fruits', 'Roasted Salted Pistachios', 'g', '200 g', 418, 470),
  ('dry-fruits-raw-chia-seeds', 'dry-fruits', 'Raw Chia Seeds', 'g', '200 g', 175, 200),
  ('dry-fruits-dried-apricots', 'dry-fruits', 'Dried Apricots', 'g', '200 g', 225, 255),
  ('baby-care-baby-diapers-medium', 'baby-care', 'Baby Diapers Medium', 'piece', '20 pieces', 299, 335),
  ('baby-care-gentle-baby-wipes', 'baby-care', 'Gentle Baby Wipes', 'pack', '72 wipes', 125, 140),
  ('baby-care-mild-baby-body-wash', 'baby-care', 'Mild Baby Body Wash', 'ml', '200 ml', 185, 210),
  ('baby-care-tear-free-baby-shampoo', 'baby-care', 'Tear-Free Baby Shampoo', 'ml', '200 ml', 175, 200),
  ('baby-care-daily-baby-lotion', 'baby-care', 'Daily Baby Lotion', 'ml', '200 ml', 195, 220),
  ('baby-care-soft-baby-powder', 'baby-care', 'Soft Baby Powder', 'g', '200 g', 145, 165),
  ('baby-care-baby-diaper-rash-cream', 'baby-care', 'Baby Diaper Rash Cream', 'g', '50 g', 165, 185),
  ('baby-care-nourishing-baby-oil', 'baby-care', 'Nourishing Baby Oil', 'ml', '200 ml', 185, 210),
  ('baby-care-stage-1-baby-cereal', 'baby-care', 'Stage 1 Baby Cereal', 'g', '300 g', 285, 320),
  ('baby-care-baby-feeding-bottle', 'baby-care', 'Baby Feeding Bottle', 'piece', '1 piece', 225, 255),
  ('pharma-wellness-digital-thermometer', 'pharma-wellness', 'Digital Thermometer', 'piece', '1 piece', 225, 255),
  ('pharma-wellness-antiseptic-solution', 'pharma-wellness', 'Antiseptic Solution', 'ml', '100 ml', 85, 100),
  ('pharma-wellness-cotton-crepe-bandage', 'pharma-wellness', 'Cotton Crepe Bandage', 'piece', '1 roll', 65, 75),
  ('pharma-wellness-ors-hydration-sachets', 'pharma-wellness', 'ORS Hydration Sachets', 'sachet', '5 sachets', 55, 65),
  ('pharma-wellness-hand-sanitizer', 'pharma-wellness', 'Hand Sanitizer', 'ml', '100 ml', 55, 65),
  ('pharma-wellness-hot-water-bag', 'pharma-wellness', 'Hot Water Bag', 'piece', '1 piece', 245, 275),
  ('pharma-wellness-pain-relief-balm', 'pharma-wellness', 'Pain Relief Balm', 'g', '25 g', 65, 75),
  ('pharma-wellness-vitamin-c-supplement', 'pharma-wellness', 'Vitamin C Supplement', 'pack', '30 tablets', 125, 140),
  ('pharma-wellness-mosquito-repellent-cream', 'pharma-wellness', 'Mosquito Repellent Cream', 'g', '50 g', 85, 100),
  ('pharma-wellness-adhesive-bandages', 'pharma-wellness', 'Adhesive Bandages', 'pack', '20 strips', 75, 85),
  ('cleaning-laundry-liquid-laundry-detergent', 'cleaning-laundry', 'Liquid Laundry Detergent', 'l', '2 L', 345, 390),
  ('cleaning-laundry-antibacterial-handwash', 'cleaning-laundry', 'Antibacterial Handwash', 'ml', '750 ml', 145, 165),
  ('cleaning-laundry-dishwash-bar-value-pack', 'cleaning-laundry', 'Dishwash Bar Value Pack', 'piece', '3 pieces', 55, 65),
  ('cleaning-laundry-multi-surface-cleaner', 'cleaning-laundry', 'Multi-Surface Cleaner', 'ml', '500 ml', 125, 140),
  ('cleaning-laundry-bathroom-cleaner', 'cleaning-laundry', 'Bathroom Cleaner', 'ml', '500 ml', 135, 155),
  ('cleaning-laundry-laundry-stain-remover', 'cleaning-laundry', 'Laundry Stain Remover', 'ml', '500 ml', 185, 210),
  ('cleaning-laundry-scrub-sponge-pack', 'cleaning-laundry', 'Scrub Sponge Pack', 'piece', '2 pieces', 45, 55),
  ('cleaning-laundry-garbage-bags', 'cleaning-laundry', 'Garbage Bags', 'pack', '30 bags', 99, 115),
  ('cleaning-laundry-microfiber-cleaning-cloth', 'cleaning-laundry', 'Microfiber Cleaning Cloth', 'piece', '2 pieces', 85, 100),
  ('cleaning-laundry-toilet-cleaner', 'cleaning-laundry', 'Toilet Cleaner', 'l', '1 L', 165, 185),
  ('home-office-a5-ruled-notebook', 'home-office', 'A5 Ruled Notebook', 'piece', '1 piece', 65, 75),
  ('home-office-ball-pens', 'home-office', 'Ball Pens', 'pack', '5 pieces', 55, 65),
  ('home-office-facial-tissue-box', 'home-office', 'Facial Tissue Box', 'box', '100 tissues', 95, 110),
  ('home-office-kitchen-paper-towels', 'home-office', 'Kitchen Paper Towels', 'pack', '2 rolls', 125, 140),
  ('home-office-aa-alkaline-batteries', 'home-office', 'AA Alkaline Batteries', 'pack', '4 pieces', 145, 165),
  ('home-office-transparent-adhesive-tape', 'home-office', 'Transparent Adhesive Tape', 'piece', '1 roll', 35, 40),
  ('home-office-glue-stick', 'home-office', 'Glue Stick', 'piece', '1 piece', 45, 55),
  ('home-office-led-bulb', 'home-office', 'LED Bulb', 'piece', '9 W', 125, 140),
  ('home-office-room-air-freshener', 'home-office', 'Room Air Freshener', 'ml', '220 ml', 185, 210),
  ('home-office-sticky-notes', 'home-office', 'Sticky Notes', 'pack', '100 sheets', 55, 65)
ON CONFLICT (id) DO UPDATE SET
  category_id = EXCLUDED.category_id,
  name = EXCLUDED.name,
  measurement_unit_code = EXCLUDED.measurement_unit_code,
  package_label = EXCLUDED.package_label,
  price_inr = EXCLUDED.price_inr,
  mrp_inr = EXCLUDED.mrp_inr,
  is_active = TRUE;
COMMIT;
