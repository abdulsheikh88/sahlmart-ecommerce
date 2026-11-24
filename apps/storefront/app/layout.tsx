import type { Metadata } from "next";
import "./globals.css";
import { SiteHeader } from "@/components/site-header";

export const metadata: Metadata = {
  title: "SahlMart | Everyday shopping, made simple",
  description: "Fresh groceries and daily essentials, thoughtfully brought together."
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return (
    <html lang="en">
      <body>
        <SiteHeader />
        <main>{children}</main>
        <footer className="site-footer">
          <div className="footer-inner">
            <a className="brand footer-brand" href="/">sahl<span>mart</span><i>.</i></a>
            <p>Your everyday essentials, in one easy place.</p>
            <span>© 2026 SahlMart</span>
          </div>
        </footer>
      </body>
    </html>
  );
}
