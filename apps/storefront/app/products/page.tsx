import { ProductCard } from "@/components/product-card";
import { products } from "@/lib/catalog";

type ProductsPageProps = {
  searchParams: Promise<{ q?: string; category?: string }>;
};

export default async function ProductsPage({ searchParams }: ProductsPageProps) {
  const { q, category } = await searchParams;
  const query = q?.trim().toLowerCase();
  const visibleProducts = products.filter((product) => {
    const matchesQuery = !query || `${product.name} ${product.category}`.toLowerCase().includes(query);
    const matchesCategory = !category || product.category === category;
    return matchesQuery && matchesCategory;
  });
  const title = category || (query ? `Results for “${q}”` : "All the good stuff");
  const intro = category
    ? `Showing ${visibleProducts.length ? 1 : 0}–${visibleProducts.length} of ${visibleProducts.length} products`
    : "Everyday essentials, picked to make your day a little easier.";

  return (
    <div className="page-wrap inner-page">
      <div className="eyebrow">THE SAHLMART EDIT</div>
      <h1 className="page-title">{title}</h1>
      <p className="page-intro">{intro}</p>
      {visibleProducts.length ? (
        <div className="product-grid catalog-grid">{visibleProducts.map((product) => <ProductCard key={product.id} product={product} />)}</div>
      ) : (
        <div className="empty-state"><span>🧺</span><h2>No matches just yet</h2><p>Try a different search or explore all our picks.</p><a className="button button-dark" href="/products">See all products</a></div>
      )}
    </div>
  );
}
