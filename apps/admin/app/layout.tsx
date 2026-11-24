import type { Metadata } from "next";
import "./globals.css";
import { AdminShell } from "@/components/admin-shell";

export const metadata: Metadata = {
  title: "SahlMart Admin",
  description: "SahlMart store operations dashboard."
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return <html lang="en"><body><AdminShell>{children}</AdminShell></body></html>;
}
