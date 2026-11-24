export type CartLine = {
  productId: string;
  quantity: number;
};

const storageKey = "sahlmart-cart";
const cartUpdatedEvent = "sahlmart:cart-updated";

export function readCart(): CartLine[] {
  const stored = window.localStorage.getItem(storageKey);
  if (!stored) return [];

  const parsed: unknown = JSON.parse(stored);
  if (!Array.isArray(parsed)) return [];

  return parsed.filter((line): line is CartLine =>
    typeof line === "object" &&
    line !== null &&
    "productId" in line &&
    typeof line.productId === "string" &&
    "quantity" in line &&
    typeof line.quantity === "number" &&
    Number.isInteger(line.quantity) &&
    line.quantity > 0
  );
}

export function changeCartQuantity(productId: string, change: number) {
  const cart = readCart();
  const existingLine = cart.find((line) => line.productId === productId);
  const nextQuantity = (existingLine?.quantity ?? 0) + change;
  const updatedCart = nextQuantity > 0
    ? existingLine
      ? cart.map((line) => line.productId === productId ? { ...line, quantity: nextQuantity } : line)
      : [...cart, { productId, quantity: nextQuantity }]
    : cart.filter((line) => line.productId !== productId);

  window.localStorage.setItem(storageKey, JSON.stringify(updatedCart));
  window.dispatchEvent(new Event(cartUpdatedEvent));
}

export { cartUpdatedEvent };
