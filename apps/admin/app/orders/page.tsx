import { ClipboardList } from "lucide-react";

export default function OrdersPage() {
  return <div className="dashboard"><div className="page-head"><div><p className="eyebrow">FULFILLMENT</p><h1>Orders</h1><p className="subhead">A calm view of everything headed out the door.</p></div></div><section className="panel placeholder-panel"><div className="placeholder-icon"><ClipboardList size={21} /></div><h2>Order management is next</h2><p>Order updates, delivery assignments, and status history will appear here.</p><span>Orders in this scaffold are illustrative sample data.</span></section></div>;
}
