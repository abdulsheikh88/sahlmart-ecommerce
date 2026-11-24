"use client";

import Link from "next/link";
import { useState } from "react";
import { Plus } from "lucide-react";
import type { Product } from "@/lib/catalog";
import { changeCartQuantity } from "@/lib/cart-store";

export function ProductCard({ product, compact = false }: { product: Product; compact?: boolean }) {
  const [added, setAdded] = useState(false);

  return (
    <article className={`product-card${compact ? " product-card-compact" : ""}`}>
      <Link href={`/products?category=${encodeURIComponent(product.category)}`} className={`product-art ${product.tone}`} aria-label={`Browse ${product.category}`}>
        <span>{product.emoji}</span>
        {product.badge && <small className="product-badge">{product.badge}</small>}
      </Link>
      <div className="product-info">
        <div><p className="product-category">{product.category}</p><h3>{product.name}</h3><span className="product-unit">{product.unit}</span></div>
        <div className="product-buy">
          <div className="product-price">
            <strong>₹{product.price}</strong>
            {product.mrp && product.mrp > product.price && (
              <span className="product-discount"><del>₹{product.mrp}</del><small>{Math.round(((product.mrp - product.price) / product.mrp) * 100)}% off</small></span>
            )}
          </div>
          <button type="button" onClick={() => { changeCartQuantity(product.id, 1); setAdded(true); }} aria-label={`Add ${product.name} to basket`}><Plus size={18} /> {added ? "ADDED" : "ADD"}</button>
        </div>
      </div>
    </article>
  );
}
