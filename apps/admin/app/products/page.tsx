import { ArrowUpRight, PackagePlus } from "lucide-react";

export default function ProductsPage() {
  return <div className="dashboard"><div className="page-head"><div><p className="eyebrow">CATALOG</p><h1>Products</h1><p className="subhead">Keep your everyday essentials in good shape.</p></div><button className="primary-button"><PackagePlus size={16} /> Add product</button></div><section className="panel placeholder-panel"><div className="placeholder-icon"><ArrowUpRight size={21} /></div><h2>Your catalog is getting ready</h2><p>Product management, variants, pricing, and image uploads will live here.</p><span>Sample products are shown in the customer storefront.</span></section></div>;
}
