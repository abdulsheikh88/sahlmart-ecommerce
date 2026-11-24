ALTER TABLE items
  ADD COLUMN IF NOT EXISTS package_label TEXT,
  ADD COLUMN IF NOT EXISTS price_inr NUMERIC(10, 2),
  ADD COLUMN IF NOT EXISTS mrp_inr NUMERIC(10, 2);

UPDATE categories
SET name = 'Cleaning Essentials',
    is_active = TRUE
WHERE id = 'cleaning-laundry';

INSERT INTO items (
  id,
  category_id,
  name,
  measurement_unit_code,
  package_label,
  price_inr,
  mrp_inr
) VALUES
  ('tide-plus-2x-deep-clean-7kg', 'cleaning-laundry', 'Tide Plus 2X Deep Clean Power Detergent Powder (Lemon & Mint)', 'kg', '7 kg', 668, 720),
  ('dynamite-matic-detergent-2kg', 'cleaning-laundry', 'Dynamite Matic Detergent Powder', 'kg', '2 kg', 173, 440),
  ('henko-matic-top-load-floral-4kg', 'cleaning-laundry', 'Henko Matic Top Load Detergent Powder (Floral)', 'kg', '4 kg', 1060, 1375),
  ('henko-stain-care-detergent-bar-4x250g', 'cleaning-laundry', 'Henko Stain Care Big Bar Detergent Bar', 'pack', '4 × 250 g', 119, 135),
  ('surf-excel-matic-top-load-6kg', 'cleaning-laundry', 'Surf Excel Matic Top Load Detergent Powder', 'kg', '6 kg', 1619, 1700),
  ('ariel-matic-front-load-6-6kg', 'cleaning-laundry', 'Ariel Matic Front Load Detergent Powder', 'kg', '6.6 kg', 1399, 1525),
  ('ariel-matic-top-load-8kg-combo', 'cleaning-laundry', 'Ariel Matic Top Load Detergent Powder', 'kg', '6 kg + 2 kg', 1330, 1449),
  ('ariel-matic-top-load-6kg-combo', 'cleaning-laundry', 'Ariel Matic Top Load Detergent Powder (Extra Pack)', 'kg', '4 kg + 2 kg', 1343, 1372),
  ('surf-excel-matic-front-load-4kg', 'cleaning-laundry', 'Surf Excel Matic Front Load Detergent Powder', 'kg', '4 kg', 999, 1100),
  ('ariel-matic-top-load-4kg', 'cleaning-laundry', 'Ariel Matic Top Load Detergent Powder', 'kg', '4 kg', 1025, 1199),
  ('tide-naturals-detergent-powder-4kg', 'cleaning-laundry', 'Tide Naturals Detergent Powder', 'kg', '4 kg', 299, 350),
  ('ghadi-machine-wash-detergent-powder-4kg', 'cleaning-laundry', 'Ghadi Machine Wash Detergent Powder', 'kg', '4 kg', 445, 499),
  ('comfort-fabric-conditioner-860ml', 'cleaning-laundry', 'Comfort Fabric Conditioner', 'ml', '860 ml', 189, 220),
  ('vim-dishwash-gel-750ml', 'cleaning-laundry', 'Vim Dishwash Gel', 'ml', '750 ml', 149, 175),
  ('lizol-floor-cleaner-1l', 'cleaning-laundry', 'Lizol Disinfectant Floor Cleaner', 'l', '1 L', 190, 220)
ON CONFLICT (id) DO UPDATE SET
  category_id = EXCLUDED.category_id,
  name = EXCLUDED.name,
  measurement_unit_code = EXCLUDED.measurement_unit_code,
  package_label = EXCLUDED.package_label,
  price_inr = EXCLUDED.price_inr,
  mrp_inr = EXCLUDED.mrp_inr,
  is_active = TRUE;
