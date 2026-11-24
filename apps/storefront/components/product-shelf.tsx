"use client";

import Link from "next/link";
import { ChevronLeft, ChevronRight } from "lucide-react";
import { useRef } from "react";
import { ProductCard } from "@/components/product-card";
import type { Product } from "@/lib/catalog";

export function ProductShelf({ category, products }: { category: string; products: Product[] }) {
  const shelfRef = useRef<HTMLDivElement>(null);

  function scrollShelf(direction: -1 | 1) {
    const shelf = shelfRef.current;
    if (shelf) {
      shelf.scrollBy({ left: direction * shelf.clientWidth * 0.8, behavior: "smooth" });
    }
  }

  return (
    <section className="product-shelf-section">
      <div className="product-shelf-heading">
        <h2>{category}</h2>
        <Link href={`/products?category=${encodeURIComponent(category)}`}>See all</Link>
      </div>
      <div className="product-shelf-viewport">
        {products.length > 5 && (
          <button className="shelf-arrow shelf-arrow-left" type="button" onClick={() => scrollShelf(-1)} aria-label={`Scroll ${category} products left`}>
            <ChevronLeft size={18} />
          </button>
        )}
        <div className="product-shelf-track" ref={shelfRef}>
          {products.map((product) => <ProductCard key={product.id} product={product} compact />)}
        </div>
        {products.length > 5 && (
          <button className="shelf-arrow shelf-arrow-right" type="button" onClick={() => scrollShelf(1)} aria-label={`Scroll ${category} products right`}>
            <ChevronRight size={18} />
          </button>
        )}
      </div>
    </section>
  );
}
