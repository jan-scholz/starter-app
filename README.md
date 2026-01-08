# Starter App

A skeleton app with a Python FastAPI backend and a Vite frontend.

## Technology

- **Backend:** Python 3.13, FastAPI, Uvicorn
- **Frontend:** Node.js 24, Vite, React, TypeScript
- **Containerization:** Docker, Docker Compose

The FastAPI app serves the Vite app as a static asset. The entire application is containerized.

## Usage

### Quickstart

Start the Docker Desktop app, create a `.env` file, and start the services.

```bash
cp -iv .env.example .env
make up
```

Open the application at [`http://localhost:80`](http://localhost:80).

### Development

The development environment uses Docker Compose to run the backend server and the Vite development server with hot reloading. The application is available at [`http://localhost:80`](http://localhost:80).

- `make up`: Start the development servers.
- `make down`: Stop the development servers.
- `make build`: Build or rebuild the development images.
- `make clean`: Stop and remove all development containers, volumes, and images.

### Production

The production environment runs in a single container. The application is available at `http://localhost`.

- `make run-prod`: Build the production image and run it.
- `make stop-prod`: Stop the production container.

### Docker Dependencies

Node.js is used to compile the frontend and serve it for the hot-reloading development server. The Node.js version is centrally set in the `.env` file.

```
NODE_VERSION=24-alpine
```

Spin up the development services (`make build && make up`) and check the node version with:

```bash
docker compose exec frontend node -v

```

Similarly, the Python version for the backend can be set in `.env` (`PYTHON_VERSION=3.13-slim`) and verified with:

```bash
docker compose exec backend python --version
```

## Frontend Dependencies

Run the following commands to update minor versions only (within the range allowed by your `package.json`). The `package.json` file itself will not get modified.

```bash
npm update
npm install
```

Use `ncu` to update `package.json` itself. This will update major versions by default, but the `--target minor` option can be used to constrain the edits to `package.json`.

```bash
# install globally (once)
npm install -g npm-check-updates

# see what would be updated
ncu

# update package.json versions
ncu -u

# install the new versions
npm install
```

After any updates install the latest dependencies and ensure there are no security vulnerabilities.

```bash
npm install
npm audit fix
```

## Testing

Test endpoints can be easily tested with `curl`. Make sure to use the correct (backend) port, e.g. `8000`.

```
curl localhost:8000/api/users/
# [{"username":"Rick"},{"username":"Morty"}]%

curl localhost:8000/api/users/me
# {"username":"fakecurrentuser"}%
```

## Documentation

The automatically generated documentatino can be accessed at either of these addresses:

- [localhost:8000/docs](http://localhost:8000/docs)
- [localhost:8000/redoc](http://localhost:8000/redoc)

## Directory Structure

```
.
├── backend/
│   ├── app/
│   │   ├── __init__.py
│   │   └── main.py
│   └── requirements.txt
├── frontend/
│   ├── public/
│   │   └── vite.svg
│   ├── src/
│   │   ├── assets/
│   │   │   └── react.svg
│   │   ├── App.css
│   │   ├── App.tsx
│   │   ├── index.css
│   │   ├── main.tsx
│   │   └── vite-env.d.ts
│   ├── index.html
│   ├── package.json
│   ├── tsconfig.json
│   ├── tsconfig.node.json
│   └── vite.config.ts
├── .dockerignore
├── docker-compose.yml
├── Dockerfile
├── Dockerfile.dev
└── Makefile
```

## Main Components

1.  **`backend/`**: The Python FastAPI application.
2.  **`frontend/`**: The Vite-based frontend application.
3.  **`Dockerfile`**: A multi-stage Dockerfile for the production image.
4.  **`Dockerfile.dev`**: A Dockerfile for the frontend development server.
5.  **`docker-compose.yml`**: Orchestrates the development environment.
6.  **`Makefile`**: Provides convenience commands for managing the application.
