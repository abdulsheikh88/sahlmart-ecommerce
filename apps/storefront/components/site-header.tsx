"use client";

import Link from "next/link";
import { useEffect, useState } from "react";
import { MapPin, Search, ShoppingBag, LocateFixed, X } from "lucide-react";
import { cartUpdatedEvent, readCart } from "@/lib/cart-store";

export function SiteHeader() {
  const [locationOpen, setLocationOpen] = useState(false);
  const [postalCode, setPostalCode] = useState("");
  const [locationMessage, setLocationMessage] = useState("");
  const [cartCount, setCartCount] = useState(0);

  useEffect(() => {
    const refreshCartCount = () => setCartCount(readCart().reduce((sum, line) => sum + line.quantity, 0));
    refreshCartCount();
    window.addEventListener(cartUpdatedEvent, refreshCartCount);
    return () => window.removeEventListener(cartUpdatedEvent, refreshCartCount);
  }, []);

  function detectLocation() {
    if (!navigator.geolocation) {
      setLocationMessage("Location detection is not available in this browser.");
      return;
    }
    setLocationMessage("Checking your location…");
    navigator.geolocation.getCurrentPosition(
      () => setLocationMessage("Location captured. Address lookup and delivery coverage will be confirmed at checkout."),
      () => setLocationMessage("We couldn’t access your location. You can enter a pincode instead."),
      { timeout: 10000 }
    );
  }

  function savePostalCode(event: React.FormEvent<HTMLFormElement>) {
    event.preventDefault();
    if (!/^\d{6}$/.test(postalCode)) {
      setLocationMessage("Enter a valid 6-digit pincode.");
      return;
    }
    localStorage.setItem("sahlmart-postal-code", postalCode);
    setLocationMessage(`Pincode ${postalCode} saved. We’ll confirm delivery coverage at checkout.`);
  }

  return (
    <>
      <header className="site-header">
        <div className="header-inner">
          <Link className="brand" href="/">sahl<span>mart</span><i>.</i></Link>
          <button className="location-button" onClick={() => setLocationOpen(true)} aria-label="Set delivery location">
            <MapPin size={17} /><span><small>DELIVERING TO</small><strong>Choose your location</strong></span>
          </button>
          <form action="/products" className="search-form">
            <Search size={18} />
            <input name="q" placeholder="Find your everyday favorites..." aria-label="Search products" />
            <button type="submit">Search</button>
          </form>
          <nav className="header-nav" aria-label="Main navigation">
            <Link href="/categories">Categories</Link>
            <Link className="cart-link" href="/cart"><ShoppingBag size={19} /><span>Basket{cartCount > 0 ? ` (${cartCount})` : ""}</span></Link>
          </nav>
        </div>
      </header>
      {locationOpen && (
        <div className="modal-backdrop" role="presentation" onMouseDown={(event) => { if (event.target === event.currentTarget) setLocationOpen(false); }}>
          <section className="location-modal" role="dialog" aria-modal="true" aria-labelledby="location-title">
            <button className="modal-close" onClick={() => setLocationOpen(false)} aria-label="Close location dialog"><X size={19} /></button>
            <div className="eyebrow">MAKE IT YOUR NEIGHBORHOOD STORE</div>
            <h2 id="location-title">Where should we deliver?</h2>
            <p>Check your area to see what&apos;s fresh nearby.</p>
            <form className="pincode-form" onSubmit={savePostalCode}>
              <input value={postalCode} onChange={(event) => setPostalCode(event.target.value.replace(/\D/g, "").slice(0, 6))} inputMode="numeric" placeholder="Enter 6-digit pincode" aria-label="6-digit pincode" />
              <button className="button button-dark" type="submit">Check area</button>
            </form>
            <button className="detect-button" onClick={detectLocation}><LocateFixed size={17} /> Detect my location</button>
            {locationMessage && <p className="location-message" role="status">{locationMessage}</p>}
          </section>
        </div>
      )}
    </>
  );
}
