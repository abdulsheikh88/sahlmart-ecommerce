# SahlMart

SahlMart is a quick-commerce grocery storefront prototype with a customer-facing storefront, an admin UI, and a small NestJS API. It uses original SahlMart branding and sample data.

## Project status

- The storefront has category browsing, sample products, product search, and a browser-local basket.
- The admin app contains sample dashboard, products, orders, and inventory screens.
- The API currently provides a health endpoint; it does not yet serve the storefront catalog or persist orders.
- PostgreSQL and Redis are available as optional local services. SQL catalog migrations are provided, but the apps are not yet connected to those services.
- Prices and products in the demo catalog are illustrative and are not live inventory or pricing.

## Technology and workspace layout

| Workspace | Technology | Local URL |
| --- | --- | --- |
| `apps/storefront` | Next.js, React, TypeScript | `http://localhost:3000` |
| `apps/admin` | Next.js, React, TypeScript | `http://localhost:3002/admin` |
| `apps/api` | NestJS, TypeScript | `http://localhost:3001` |

This is an npm workspaces monorepo. The root `package.json` contains commands for running, building, and type-checking all workspaces.

Useful files:

- `apps/storefront/lib/category-products.json` — sample items for the 18 storefront categories.
- `apps/storefront/lib/catalog.ts` — catalog types and mapping from sample data to storefront products.
- `apps/storefront/components/` — shared storefront components, including product cards.
- `apps/admin/app/` — admin dashboard and screens.
- `apps/api/src/` — NestJS API source.
- `database/init/001_catalog_master.sql` — initial category, item, and measurement-unit tables and seeds.
- `database/init/002_cleaning_products.sql` — package/price columns and Cleaning Essentials products.
- `database/init/003_category_products.sql` — current category names and 180 sample category products.
- `docker-compose.yml` — optional PostgreSQL and Redis services.
- `.env.example` — example/future service settings; current UI and API do not consume most of these settings.

## Requirements

- Node.js 20.11 or later
- npm 10 or later
- Windows PowerShell, macOS Terminal, or Linux shell
- Docker Desktop with Docker Compose, only if you want to run the optional database and Redis services

## Install dependencies

Run these commands from the repository root:

```powershell
npm install
```

Install dependencies once at the root; npm workspaces installs packages for all three apps.

## Run the project locally

Start the storefront, admin app, and API together:

```powershell
npm run dev
```

The root command starts all three services and stops the group when you press **Ctrl+C**.

Open:

- Storefront: `http://localhost:3000`
- Categories: `http://localhost:3000/categories`
- Products: `http://localhost:3000/products`
- Products in a category: `http://localhost:3000/products?category=Paan%20Corner`
- Basket: `http://localhost:3000/cart`
- Admin: `http://localhost:3002/admin`
- API health check: `http://localhost:3001/api/health`

To run only one service, use a separate terminal for each command:

```powershell
npm run dev:storefront
npm run dev:admin
npm run dev:api
```

Stop each service with **Ctrl+C** in its terminal.

## Catalog, basket, and persistence

The storefront catalog is currently bundled sample data, not a live database query. The canonical category sample data is in `apps/storefront/lib/category-products.json`; it contains 18 categories and 10 demo products per category. Existing featured products may also appear in category lists.

The basket and saved pincode are stored in the browser's local storage. They are not associated with a user account and are not sent to the API. Location detection can request browser coordinates but does not resolve them to a delivery address.

The API currently has a health endpoint only. PostgreSQL/Redis configuration and Razorpay variables in `.env.example` are placeholders for future integrations; copying that file does not connect the apps to those services. Do not put real credentials in source control.

## Optional PostgreSQL and Redis

Start Docker Desktop, then start the services from the repository root:

```powershell
docker compose up -d postgres redis
docker compose ps
```

PostgreSQL is available at `localhost:5432` and Redis at `localhost:6379`. The local PostgreSQL database, user, and development password are configured in `docker-compose.yml` as `sahlmart`. Do not reuse the development password outside local development.

### Database initialization and migrations

On the first startup with a new, empty PostgreSQL data volume, Docker runs the scripts in `database/init/` in filename order:

1. `001_catalog_master.sql` creates the category, item, and measurement-unit tables and initial data.
2. `002_cleaning_products.sql` adds package and price columns and Cleaning Essentials products.
3. `003_category_products.sql` updates the category catalog and seeds the 18-category sample catalog.

These initialization scripts run only when PostgreSQL's data directory is empty. Restarting the container does not rerun them.

For an existing database that already has migration `001` applied, start PostgreSQL and apply the remaining migrations from the repository root:

```powershell
Get-Content -Raw database\init\002_cleaning_products.sql | docker compose exec -T postgres psql -U sahlmart -d sahlmart
Get-Content -Raw database\init\003_category_products.sql | docker compose exec -T postgres psql -U sahlmart -d sahlmart
```

If the existing database has no SahlMart schema, apply `001`, then `002`, then `003`:

```powershell
Get-Content -Raw database\init\001_catalog_master.sql | docker compose exec -T postgres psql -U sahlmart -d sahlmart
Get-Content -Raw database\init\002_cleaning_products.sql | docker compose exec -T postgres psql -U sahlmart -d sahlmart
Get-Content -Raw database\init\003_category_products.sql | docker compose exec -T postgres psql -U sahlmart -d sahlmart
```

Do not rerun `001` after `003`: it contains the original category names and display order. These migrations prepare database records but do not make the current storefront or API read from PostgreSQL.

Stop the optional services without deleting their data:

```powershell
docker compose down
```

The PostgreSQL and Redis data are stored in Docker volumes. Removing those volumes permanently deletes the local database contents; do not use `docker compose down -v` unless you intentionally want to erase them.

## Checks and production builds

Run TypeScript checks for all three workspaces:

```powershell
npm run typecheck
```

Build all three apps:

```powershell
npm run build
```

Stop development servers before building, especially the Next.js apps, to avoid concurrent access to their `.next` build directories.

After a successful build, start each production server in a separate terminal:

```powershell
npm run start -w @sahlmart/storefront
npm run start -w @sahlmart/admin
npm run start -w @sahlmart/api
```

## Troubleshooting

### A local URL does not load

- Confirm `npm install` completed successfully at the repository root.
- Check the terminal running `npm run dev` for compilation errors.
- Confirm ports `3000`, `3001`, and `3002` are not already in use. Stop the specific process using the occupied port, then restart the project.
- Open the admin app at `/admin` (`http://localhost:3002/admin`); `/` is not its configured base path.

### Docker database commands fail

- Confirm Docker Desktop is running, then check `docker compose ps`.
- If `localhost:5432` is unavailable, inspect the PostgreSQL container logs with `docker compose logs postgres`.
- If the container is running but a schema or seed is missing, remember that init scripts only run on an empty data volume. Apply the appropriate SQL migration manually using the commands above.
- The current API does not require PostgreSQL or Redis to start.

### Next.js build reports a file lock or access error

Stop the development servers before running `npm run build`, then try the build again.

## Production routing

The apps can be deployed independently behind a reverse proxy on one domain: route `/admin` to the admin app (port 3002), `/api` to the API (port 3001), and other paths to the storefront (port 3000). The admin app is configured with the Next.js `basePath` `/admin`.

No Azure services or deployment assumptions are required.

## Planned feature areas

Authentication and refresh tokens; delivery areas and addresses; database-backed catalog, product variants, search, cart and stock validation; delivery slots, checkout and Razorpay/COD; order history and realtime tracking; customer accounts; and admin reporting, catalog, orders, inventory and delivery management.
