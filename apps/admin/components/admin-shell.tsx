"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { Bell, Boxes, ChevronDown, ClipboardList, LayoutDashboard, Leaf, Package, Search, Settings, Truck } from "lucide-react";

const navigation = [
  { label: "Overview", href: "/", icon: LayoutDashboard },
  { label: "Orders", href: "/orders", icon: ClipboardList, badge: "8" },
  { label: "Products", href: "/products", icon: Package },
  { label: "Inventory", href: "/inventory", icon: Boxes }
];

export function AdminShell({ children }: { children: React.ReactNode }) {
  const pathname = usePathname().replace(/^\/admin(?=\/|$)/, "") || "/";

  return (
    <div className="admin-layout">
      <aside className="sidebar">
        <Link className="admin-brand" href="/"><span className="brand-mark"><Leaf size={17} /></span><span>sahl<strong>mart</strong><small>STORE STUDIO</small></span></Link>
        <div className="store-switch"><span className="store-avatar">S</span><span><strong>SahlMart · Central</strong><small>Neighborhood store</small></span><ChevronDown size={15} /></div>
        <p className="nav-caption">WORKSPACE</p>
        <nav className="side-nav" aria-label="Admin navigation">{navigation.map((item) => { const Icon = item.icon; const active = pathname === item.href || (item.href !== "/" && pathname.startsWith(`${item.href}/`)); return <Link key={item.label} href={item.href} className={`side-link ${active ? "active" : ""}`}><Icon size={17} /><span>{item.label}</span>{item.badge && <b>{item.badge}</b>}</Link>; })}</nav>
        <div className="sidebar-bottom"><Link className="side-link" href="/"><Truck size={17} /><span>Delivery partners</span></Link><Link className="side-link" href="/"><Settings size={17} /><span>Settings</span></Link><div className="help-card"><span>Need a hand?</span><p>We&apos;re always happy to help.</p><a href="mailto:hello@sahlmart.example">Talk to support →</a></div><div className="user-card"><span className="user-avatar">AS</span><span><strong>Admin account</strong><small>Store administrator</small></span><ChevronDown size={15} /></div></div>
      </aside>
      <div className="admin-main">
        <header className="topbar"><div className="crumb">Store operations <span>/</span> <strong>Overview</strong></div><div className="topbar-actions"><label className="admin-search"><Search size={16} /><input placeholder="Search anything..." aria-label="Search admin" /><kbd>⌘ K</kbd></label><button className="icon-button" aria-label="Notifications"><Bell size={18} /><i /></button><span className="top-avatar">AS</span></div></header>
        <main>{children}</main>
      </div>
    </div>
  );
}
