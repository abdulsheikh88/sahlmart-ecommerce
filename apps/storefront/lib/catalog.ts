import categoryProductData from "./category-products.json";

export type Product = {
  id: string;
  name: string;
  category: string;
  unit: string;
  price: number;
  mrp?: number;
  emoji: string;
  tone: string;
  badge?: string;
};

type CategorySeed = {
  id: string;
  name: string;
  emoji: string;
  artwork: string[];
  tone: string;
  items: Array<{ name: string; unit: string; unitCode: string; price: number; emoji: string }>;
};

const categorySeeds: CategorySeed[] = categoryProductData.categories;

export const categories = categorySeeds.map(({ id, name, emoji, artwork, tone }) => ({ id, name, emoji, artwork, tone }));

const featuredProducts: Product[] = [
  { id: "avocado", name: "Creamy Avocado", category: "Fruits & Vegetables", unit: "1 piece · approx. 200 g", price: 89, emoji: "🥑", tone: "tone-green", badge: "FRESH PICK" },
  { id: "strawberries", name: "Sweet Strawberries", category: "Fruits & Vegetables", unit: "1 pack · 200 g", price: 129, emoji: "🍓", tone: "tone-pink", badge: "IN SEASON" },
  { id: "farm-eggs", name: "Farm Fresh Eggs", category: "Dairy, Bread & Eggs", unit: "6 pieces", price: 72, emoji: "🥚", tone: "tone-yellow" },
  { id: "sourdough", name: "Rustic Sourdough", category: "Bakery & Biscuits", unit: "1 loaf · 400 g", price: 149, emoji: "🍞", tone: "tone-peach" },
  { id: "oranges", name: "Juicy Oranges", category: "Fruits & Vegetables", unit: "4 pieces · approx. 500 g", price: 79, emoji: "🍊", tone: "tone-orange" },
  { id: "oat-milk", name: "Barista Oat Milk", category: "Dairy, Bread & Eggs", unit: "1 carton · 1 L", price: 159, emoji: "🥛", tone: "tone-blue" },
  { id: "popcorn", name: "Sea Salt Popcorn", category: "Snacks & Munchies", unit: "1 pack · 70 g", price: 55, emoji: "🍿", tone: "tone-yellow" },
  { id: "honey", name: "Wildflower Honey", category: "Organic & Healthy Living", unit: "1 jar · 250 g", price: 189, emoji: "🍯", tone: "tone-lilac" },
  { id: "milk", name: "Fresh Toned Milk", category: "Dairy, Bread & Eggs", unit: "500 ml", price: 32, emoji: "🥛", tone: "tone-blue" },
  { id: "curd", name: "Fresh Curd", category: "Dairy, Bread & Eggs", unit: "380 g", price: 37, emoji: "🥣", tone: "tone-blue" },
  { id: "lassi", name: "Sweet Lassi", category: "Dairy, Bread & Eggs", unit: "200 ml", price: 25, emoji: "🥤", tone: "tone-pink" },
  { id: "buttermilk", name: "Spiced Buttermilk", category: "Dairy, Bread & Eggs", unit: "200 ml", price: 15, emoji: "🥛", tone: "tone-blue" },
  { id: "potato-chips", name: "Potato Chips", category: "Snacks & Munchies", unit: "1 pack · 52 g", price: 20, emoji: "🥔", tone: "tone-yellow" },
  { id: "kurkure", name: "Masala Crunch Sticks", category: "Snacks & Munchies", unit: "1 pack · 55 g", price: 20, emoji: "🌶️", tone: "tone-orange" },
  { id: "namkeen", name: "Classic Namkeen", category: "Snacks & Munchies", unit: "1 pack · 200 g", price: 45, emoji: "🥨", tone: "tone-peach" },
  { id: "tide-plus-2x-deep-clean-7kg", name: "Tide Plus 2X Deep Clean Power Detergent Powder (Lemon & Mint)", category: "Cleaning Essentials", unit: "7 kg", price: 668, mrp: 720, emoji: "🫧", tone: "tone-blue" },
  { id: "dynamite-matic-detergent-2kg", name: "Dynamite Matic Detergent Powder", category: "Cleaning Essentials", unit: "2 kg", price: 173, mrp: 440, emoji: "🧺", tone: "tone-pink" },
  { id: "henko-matic-top-load-floral-4kg", name: "Henko Matic Top Load Detergent Powder (Floral)", category: "Cleaning Essentials", unit: "4 kg", price: 1060, mrp: 1375, emoji: "🫧", tone: "tone-lilac" },
  { id: "henko-stain-care-detergent-bar-4x250g", name: "Henko Stain Care Big Bar Detergent Bar", category: "Cleaning Essentials", unit: "4 × 250 g", price: 119, mrp: 135, emoji: "🧼", tone: "tone-yellow" },
  { id: "surf-excel-matic-top-load-6kg", name: "Surf Excel Matic Top Load Detergent Powder", category: "Cleaning Essentials", unit: "6 kg", price: 1619, mrp: 1700, emoji: "🫧", tone: "tone-blue" },
  { id: "ariel-matic-front-load-6-6kg", name: "Ariel Matic Front Load Detergent Powder", category: "Cleaning Essentials", unit: "6.6 kg", price: 1399, mrp: 1525, emoji: "🧺", tone: "tone-green" },
  { id: "ariel-matic-top-load-8kg-combo", name: "Ariel Matic Top Load Detergent Powder", category: "Cleaning Essentials", unit: "6 kg + 2 kg", price: 1330, mrp: 1449, emoji: "🫧", tone: "tone-pink" },
  { id: "ariel-matic-top-load-6kg-combo", name: "Ariel Matic Top Load Detergent Powder (Extra Pack)", category: "Cleaning Essentials", unit: "4 kg + 2 kg", price: 1343, mrp: 1372, emoji: "🧺", tone: "tone-lilac" },
  { id: "surf-excel-matic-front-load-4kg", name: "Surf Excel Matic Front Load Detergent Powder", category: "Cleaning Essentials", unit: "4 kg", price: 999, mrp: 1100, emoji: "🫧", tone: "tone-blue" },
  { id: "ariel-matic-top-load-4kg", name: "Ariel Matic Top Load Detergent Powder", category: "Cleaning Essentials", unit: "4 kg", price: 1025, mrp: 1199, emoji: "🧺", tone: "tone-green" },
  { id: "tide-naturals-detergent-powder-4kg", name: "Tide Naturals Detergent Powder", category: "Cleaning Essentials", unit: "4 kg", price: 299, mrp: 350, emoji: "🫧", tone: "tone-yellow" },
  { id: "ghadi-machine-wash-detergent-powder-4kg", name: "Ghadi Machine Wash Detergent Powder", category: "Cleaning Essentials", unit: "4 kg", price: 445, mrp: 499, emoji: "🧺", tone: "tone-orange" },
  { id: "comfort-fabric-conditioner-860ml", name: "Comfort Fabric Conditioner", category: "Cleaning Essentials", unit: "860 ml", price: 189, mrp: 220, emoji: "🧴", tone: "tone-pink" },
  { id: "vim-dishwash-gel-750ml", name: "Vim Dishwash Gel", category: "Cleaning Essentials", unit: "750 ml", price: 149, mrp: 175, emoji: "🧽", tone: "tone-green" },
  { id: "lizol-floor-cleaner-1l", name: "Lizol Disinfectant Floor Cleaner", category: "Cleaning Essentials", unit: "1 L", price: 190, mrp: 220, emoji: "🧴", tone: "tone-blue" }
];

function slugify(value: string) {
  return value.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "");
}

const categoryProducts: Product[] = categorySeeds.flatMap((category) =>
  category.items.map((item) => ({
    id: `${category.id}-${slugify(item.name)}`,
    name: item.name,
    category: category.name,
    unit: item.unit,
    price: item.price,
    mrp: Math.ceil((item.price * 1.12) / 5) * 5,
    emoji: item.emoji,
    tone: category.tone
  }))
);

export const products: Product[] = [...featuredProducts, ...categoryProducts];
