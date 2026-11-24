import Link from "next/link";
import { ArrowRight } from "lucide-react";
import { categories } from "@/lib/catalog";

export default function CategoriesPage() {
  return (
    <div className="page-wrap inner-page">
      <div className="eyebrow">A LITTLE BIT OF EVERYTHING</div>
      <h1 className="page-title">Find your kind of fresh.</h1>
      <p className="page-intro">From the fruit bowl to the pantry, there&apos;s a place for everything.</p>
      <div className="category-grid category-grid-large">
        {categories.map((category) => (
          <Link href={`/products?category=${encodeURIComponent(category.name)}`} className={`category-tile ${category.tone}`} key={category.name}>
            <span>{category.emoji}</span><strong>{category.name}</strong><small>Explore everyday picks</small><ArrowRight className="category-arrow" size={18} />
          </Link>
        ))}
      </div>
    </div>
  );
}
