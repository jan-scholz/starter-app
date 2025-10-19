# Starter App

A simple skeleton app with a Python FastAPI backend and a Vite frontend.


## Technology

The backend FastAPI app is served via Uvicorn. The frontend Vite app is compiled to a static asset that is also served via FastAPI. For development purposes the frontend app can be served via the development server.

The entire application (backend and static frontend) is available as Docker image. For development purposes the frontend development server can be served alongside the backend using hot reloading.


## Usage

Use the `Makefile` to build and run the application.

```bash
make run
```


## Directory structure

This is the directory structure:

```
├── backend/
│   ├── app/
│   │   ├── __init__.py
│   │   └── main.py
│   └── requirements.txt
├── frontend/
│   ├── public/
│   ├── src/
│   ├── index.html
│   ├── package.json
│   └── vite.config.ts
├── docker-compose.yml
├── Dockerfile
└── Dockerfile.dev
```

## Main Components

1. `backend/`: This directory contains the Python FastAPI application.
   * `app/main.py`: The main FastAPI application file. It serves the frontend as a static asset and provides the API.
   * `requirements.txt`: This file lists the Python dependencies for the backend (e.g., fastapi, uvicorn).

2. `frontend/`: This directory houses the Vite-based frontend application.
   * `vite.config.ts`: The Vite configuration file. It proxies API requests to the FastAPI backend during development.
   * `package.json`: The npm package configuration file, listing frontend dependencies and scripts.

3. `Dockerfile`: This is a multi-stage Dockerfile for creating a production-ready image.
   * Stage 1: Builds the frontend application.
   * Stage 2: Sets up the Python environment, installs backend dependencies, and copies the built frontend assets and the backend application.

4. `Dockerfile.dev`: A Dockerfile specifically for frontend development. It sets up a container with the Vite development server, which supports hot reloading.

5. `docker-compose.yml`: This file orchestrates the multi-container setup for a seamless development experience.
   * Defines a backend service to run the FastAPI application.
   * Defines a frontend service using Dockerfile.dev to run the Vite development server.
   * Configured to enable hot reloading for both the frontend and backend code.
