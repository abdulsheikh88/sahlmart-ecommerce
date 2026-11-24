import Link from "next/link";
import { ArrowRight, Clock3, Leaf, ShieldCheck, Sparkles } from "lucide-react";
import { ProductShelf } from "@/components/product-shelf";
import { categories, products } from "@/lib/catalog";

export default function HomePage() {
  const productShelves = categories
    .map((category) => ({
      category: category.name,
      products: products.filter((product) => product.category === category.name)
    }))
    .filter((shelf) => shelf.products.length > 0);

  return (
    <div className="page-wrap">
      <section className="hero">
        <div className="hero-copy">
          <div className="eyebrow"><Sparkles size={15} /> THE GOOD STUFF, RIGHT ON TIME</div>
          <h1>Little things.<br /><span>Big fresh energy.</span></h1>
          <p>Everyday groceries and feel-good finds, picked for your home.</p>
          <Link className="button button-dark" href="/products">Shop the collection <ArrowRight size={17} /></Link>
          <div className="hero-note"><Clock3 size={15} /> Quick delivery in your neighborhood</div>
        </div>
        <div className="hero-art" aria-label="Fresh groceries illustration">
          <div className="sun-disc" />
          <div className="art-card art-card-one"><span>🥑</span><small>fresh picks</small></div>
          <div className="art-card art-card-two"><span>🍊</span><small>good days</small></div>
          <div className="art-bag">🥬<br />🍞<br />🍓</div>
          <div className="floating-label">A little more<br /><strong>fresh, please.</strong></div>
          <div className="art-sparkle">✳</div>
        </div>
      </section>

      <section className="benefit-row" aria-label="Shopping benefits">
        <div><span className="benefit-icon green"><Leaf size={18} /></span><span><strong>Fresh by nature</strong><small>Good things, picked daily</small></span></div>
        <div><span className="benefit-icon peach"><Clock3 size={18} /></span><span><strong>On your time</strong><small>Easy, reliable delivery</small></span></div>
        <div><span className="benefit-icon lilac"><ShieldCheck size={18} /></span><span><strong>Feel-good value</strong><small>Everyday prices, no fuss</small></span></div>
      </section>

      <section className="section-block">
        <div className="section-heading">
          <div><div className="eyebrow">A GOOD PLACE TO START</div><h2>Shop by category</h2></div>
          <Link className="text-link" href="/categories">All categories <ArrowRight size={16} /></Link>
        </div>
        <div className="home-category-grid">
          {categories.map((category) => (
            <Link href={`/products?category=${encodeURIComponent(category.name)}`} className="home-category-tile" key={category.name}>
              <span className="home-category-art" aria-hidden="true">
                {category.artwork.map((item, index) => <span className={`home-category-item item-${index + 1}`} key={`${category.name}-${item}`}>{item}</span>)}
              </span>
              <strong>{category.name}</strong>
            </Link>
          ))}
        </div>
      </section>

      <section className="section-block product-section">
        <div className="section-heading">
          <div><div className="eyebrow">FRESH FROM OUR SHELVES</div><h2>Shop everyday favorites</h2></div>
          <Link className="text-link" href="/products">Browse all <ArrowRight size={16} /></Link>
        </div>
        {productShelves.map((shelf) => <ProductShelf key={shelf.category} category={shelf.category} products={shelf.products} />)}
      </section>

      <section className="deal-banner">
        <div><div className="eyebrow">A LITTLE TREAT FOR YOUR LIST</div><h2>Good finds. <span>Lovely prices.</span></h2><p>Meet the everyday favorites worth making room for.</p></div>
        <Link className="button button-light" href="/products">Explore all picks <ArrowRight size={17} /></Link>
        <div className="deal-orbit" aria-hidden="true">✳</div>
      </section>
    </div>
  );
}
