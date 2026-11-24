import { ArrowUpRight, CircleAlert, ClipboardList, IndianRupee, ShoppingBasket, Users } from "lucide-react";
import Link from "next/link";

const stats = [
  { label: "Today’s revenue", value: "₹48,290", change: "+12.8%", positive: true, icon: IndianRupee, color: "mint" },
  { label: "Orders today", value: "186", change: "+8.2%", positive: true, icon: ClipboardList, color: "lavender" },
  { label: "Active customers", value: "1,204", change: "+4.1%", positive: true, icon: Users, color: "peach" },
  { label: "Low-stock items", value: "12", change: "Needs attention", positive: false, icon: ShoppingBasket, color: "sand" }
];

const orders = [
  { id: "SAHL-20261123-00186", customer: "Aarav Mehta", items: "5 items", total: "₹1,284", status: "Packing", tone: "amber" },
  { id: "SAHL-20261123-00185", customer: "Diya Kapoor", items: "8 items", total: "₹2,106", status: "Out for delivery", tone: "blue" },
  { id: "SAHL-20261123-00184", customer: "Kabir Shah", items: "3 items", total: "₹649", status: "Delivered", tone: "green" },
  { id: "SAHL-20261123-00183", customer: "Mira Rao", items: "11 items", total: "₹3,412", status: "Delivered", tone: "green" }
];

const stock = [
  { name: "Farm Fresh Eggs", detail: "Dairy & eggs · 6 pcs", quantity: 4, tone: "low" },
  { name: "Creamy Avocado", detail: "Fruits & veg · 1 pc", quantity: 7, tone: "low" },
  { name: "Barista Oat Milk", detail: "Dairy & eggs · 1 L", quantity: 9, tone: "okay" }
];

export default function DashboardPage() {
  return (
    <div className="dashboard">
      <div className="page-head"><div><p className="eyebrow">SAMPLE DATA · STORE OVERVIEW</p><h1>Good evening, team.</h1><p className="subhead">Here&apos;s what&apos;s happening in your store today.</p></div><button className="date-button">Today <span>⌄</span></button></div>
      <section className="stats-grid">
        {stats.map((stat) => {
          const Icon = stat.icon;
          return <article className="stat-card" key={stat.label}><div className="stat-top"><span className={`stat-icon ${stat.color}`}><Icon size={18} /></span><span className={`stat-change ${stat.positive ? "positive" : "attention"}`}>{stat.positive ? <ArrowUpRight size={14} /> : <CircleAlert size={13} />}{stat.change}</span></div><p>{stat.label}</p><strong>{stat.value}</strong></article>;
        })}
      </section>
      <div className="dashboard-grid">
        <section className="panel orders-panel">
          <div className="panel-head"><div><h2>Recent orders</h2><p>A quick look at today&apos;s activity</p></div><Link href="/orders">View all →</Link></div>
          <div className="table-scroll"><table><thead><tr><th>ORDER</th><th>CUSTOMER</th><th>TOTAL</th><th>STATUS</th></tr></thead><tbody>{orders.map((order) => <tr key={order.id}><td><strong>{order.id}</strong><small>{order.items}</small></td><td>{order.customer}</td><td className="amount">{order.total}</td><td><span className={`status-pill ${order.tone}`}>{order.status}</span></td></tr>)}</tbody></table></div>
        </section>
        <section className="panel stock-panel">
          <div className="panel-head"><div><h2>Low stock watch</h2><p>Items that may need a restock</p></div><Link href="/inventory">Inventory →</Link></div>
          <div className="stock-list">{stock.map((item) => <div className="stock-item" key={item.name}><span className={`stock-dot ${item.tone}`} /><div><strong>{item.name}</strong><small>{item.detail}</small></div><b className={item.tone}>{item.quantity} left</b></div>)}</div>
          <div className="stock-foot"><CircleAlert size={15} /><span>12 products are running low</span><Link href="/inventory">Review</Link></div>
        </section>
      </div>
      <section className="panel chart-panel"><div className="panel-head"><div><h2>Sales overview</h2><p>A steady week is a good week.</p></div><button className="select-button">This week <span>⌄</span></button></div><div className="chart-area"><div className="chart-y"><span>₹50k</span><span>₹35k</span><span>₹20k</span><span>₹5k</span></div><div className="chart"><div className="grid-lines"><i /><i /><i /><i /></div><svg viewBox="0 0 700 170" preserveAspectRatio="none" role="img" aria-label="Sales trending upward through the week"><defs><linearGradient id="salesFill" x1="0" x2="0" y1="0" y2="1"><stop offset="0%" stopColor="#4d9a70" stopOpacity=".22" /><stop offset="100%" stopColor="#4d9a70" stopOpacity="0" /></linearGradient></defs><path d="M0 128 C45 119 58 133 100 105 S170 111 200 94 S265 100 300 73 S365 87 400 58 S465 74 500 47 S568 62 600 32 S665 38 700 15 V170 H0 Z" fill="url(#salesFill)" /><path d="M0 128 C45 119 58 133 100 105 S170 111 200 94 S265 100 300 73 S365 87 400 58 S465 74 500 47 S568 62 600 32 S665 38 700 15" fill="none" stroke="#37835a" strokeWidth="3" vectorEffect="non-scaling-stroke" /></svg><div className="chart-x"><span>Mon</span><span>Tue</span><span>Wed</span><span>Thu</span><span>Fri</span><span>Sat</span><span>Sun</span></div></div></div></section>
    </div>
  );
}
