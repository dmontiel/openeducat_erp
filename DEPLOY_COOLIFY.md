# Deploying OpenEduCat on Coolify

This repository is an Odoo 18 custom-addons project. The Docker setup builds an `odoo:18.0` image with all OpenEduCat addons copied to `/mnt/extra-addons`, then runs it with PostgreSQL.

## Coolify Setup

1. Create a new application from this Git repository.
2. Choose Docker Compose as the build/deploy method.
3. Use `docker-compose.yml` from the repository root.
4. Add these environment variables in Coolify:

```env
POSTGRES_PASSWORD=change-this-database-password
ODOO_MASTER_PASSWORD=change-this-odoo-master-password
```

5. Set the public domain for the `odoo` service on port `8069`. The compose file includes `SERVICE_FQDN_ODOO_8069` so Coolify can proxy that service port.
6. Deploy.

## First Run

After deployment, open the Coolify domain and create the first Odoo database. Install the `OpenEduCat ERP` app from the Odoo Apps screen. Its manifest pulls in the included OpenEduCat modules.

## Persistent Data

The compose file defines two named volumes:

- `odoo-data`: Odoo filestore, sessions, and generated assets.
- `postgres-data`: PostgreSQL database files.

Keep both volumes attached during upgrades and redeployments.

## Local Smoke Test

```bash
POSTGRES_PASSWORD=odoo ODOO_MASTER_PASSWORD=admin docker compose up --build
```

Then visit `http://localhost:8069` if you add a local port mapping or run through a local reverse proxy. Coolify handles the public reverse proxy in production.

The included `odoo.conf` runs with `workers = 0` so Coolify can proxy the app through a single port. If you later enable Odoo workers for higher traffic, also route `/websocket` traffic to Odoo's gevent port `8072`.
