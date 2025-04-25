from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    """
    Root endpoint that returns a hello world message.

    Returns:
        dict: A simple hello world message
    """
    return {"message": "Hello World"}