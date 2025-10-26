import os

from fastapi import FastAPI
from fastapi.responses import FileResponse
from fastapi.staticfiles import StaticFiles

from .routes import users

app = FastAPI()

app.include_router(users.router, prefix="/api")


# API endpoint
@app.get("/api/hello")
def read_root():
    return {"Hello": "World"}


# Serve frontend
# Check if the "static" directory exists, which contains the frontend build
if os.path.exists("static"):
    app.mount("/assets", StaticFiles(directory="static/assets"), name="assets")

    @app.get("/{full_path:path}")
    async def serve_frontend(full_path: str):
        # Check if the requested path is a file in the static directory
        file_path = os.path.join("static", full_path)
        if os.path.isfile(file_path):
            return FileResponse(file_path)
        # If it's a directory or doesn't exist, serve index.html for client-side routing
        return FileResponse("static/index.html")


# Serve index.html as a fallback for any other route
@app.get("/")
async def read_index():
    if os.path.exists("static/index.html"):
        return FileResponse("static/index.html")
    return {"message": "Frontend not built yet. Run `docker-compose build`"}
