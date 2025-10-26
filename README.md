# Starter App

A skeleton app with a Python FastAPI backend and a Vite frontend.

## Technology

- **Backend:** Python 3.13, FastAPI, Uvicorn
- **Frontend:** Node.js 24, Vite, React, TypeScript
- **Containerization:** Docker, Docker Compose

The FastAPI app serves the Vite app as a static asset. The entire application is containerized.

## Usage

### Development

The development environment uses Docker Compose to run the backend server and the Vite development server with hot reloading. The application is available at [http://localhost:80](http://localhost:80)`.

- `make up`: Start the development servers.
- `make down`: Stop the development servers.
- `make build`: Build or rebuild the development images.
- `make clean`: Stop and remove all development containers, volumes, and images.

### Production

The production environment runs in a single container. The application is available at `http://localhost`.

- `make run-prod`: Build the production image and run it.
- `make stop-prod`: Stop the production container.

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
