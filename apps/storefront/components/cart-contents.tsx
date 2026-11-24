"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import { Minus, Plus, ShoppingBag, Trash2 } from "lucide-react";
import { changeCartQuantity, cartUpdatedEvent, readCart, type CartLine } from "@/lib/cart-store";
import { products } from "@/lib/catalog";

export function CartContents() {
  const [cart, setCart] = useState<CartLine[]>([]);

  useEffect(() => {
    const refresh = () => setCart(readCart());
    refresh();
    window.addEventListener(cartUpdatedEvent, refresh);
    return () => window.removeEventListener(cartUpdatedEvent, refresh);
  }, []);

  const items = cart.flatMap((line) => {
    const product = products.find((candidate) => candidate.id === line.productId);
    return product ? [{ product, quantity: line.quantity }] : [];
  });
  const subtotal = items.reduce((sum, item) => sum + item.product.price * item.quantity, 0);

  return (
    <div className="page-wrap inner-page">
      <div className="eyebrow">YOUR LITTLE SHOPPING LIST</div>
      <h1 className="page-title">Your basket</h1>
      {items.length ? (
        <div className="cart-layout">
          <section className="cart-items" aria-label="Basket items">
            {items.map(({ product, quantity }) => (
              <article className="cart-item" key={product.id}>
                <div className={`cart-item-art ${product.tone}`} aria-hidden="true">{product.emoji}</div>
                <div className="cart-item-details"><strong>{product.name}</strong><small>{product.unit}</small><b>₹{product.price}</b></div>
                <div className="quantity-control">
                  <button onClick={() => changeCartQuantity(product.id, -1)} aria-label={`Remove one ${product.name}`}><Minus size={14} /></button>
                  <span>{quantity}</span>
                  <button onClick={() => changeCartQuantity(product.id, 1)} aria-label={`Add one ${product.name}`}><Plus size={14} /></button>
                </div>
                <button className="remove-item" onClick={() => changeCartQuantity(product.id, -quantity)} aria-label={`Remove ${product.name} from basket`}><Trash2 size={16} /></button>
              </article>
            ))}
          </section>
          <aside className="cart-summary">
            <h2>Order summary</h2>
            <div><span>Subtotal</span><strong>₹{subtotal}</strong></div>
            <div><span>Delivery</span><span className="summary-note">Calculated at checkout</span></div>
            <div className="summary-total"><strong>Total</strong><strong>₹{subtotal}</strong></div>
            <p>Delivery fees and availability will be confirmed in a later checkout step.</p>
            <button className="button button-dark checkout-button" disabled>Checkout coming soon</button>
            <Link className="text-link continue-shopping" href="/products">Continue shopping</Link>
          </aside>
        </div>
      ) : (
        <div className="empty-state cart-empty">
          <span className="empty-icon"><ShoppingBag size={28} /></span>
          <h2>Room for something good?</h2>
          <p>Your basket is ready when you are. Find something lovely for your day.</p>
          <Link className="button button-dark" href="/products">Browse the good stuff</Link>
        </div>
      )}
    </div>
  );
}
