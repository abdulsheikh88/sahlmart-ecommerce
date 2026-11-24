import { ShoppingBasket } from "lucide-react";

export default function InventoryPage() {
  return <div className="dashboard"><div className="page-head"><div><p className="eyebrow">STOCK & SUPPLY</p><h1>Inventory</h1><p className="subhead">Know what&apos;s in, what&apos;s low, and what&apos;s next.</p></div></div><section className="panel placeholder-panel"><div className="placeholder-icon"><ShoppingBasket size={21} /></div><h2>Inventory tools are on the list</h2><p>Stock adjustments, low-stock alerts, and audit logs will be added in a later milestone.</p><span>Dashboard stock counts are mock data.</span></section></div>;
}
