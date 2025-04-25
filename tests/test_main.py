from fastapi.testclient import TestClient
from src.main import app

client = TestClient(app)

def test_read_root_success():
    """
    Test the root endpoint for successful response.
    
    Tests:
        - Status code is 200
        - Response contains expected message
        - Response is JSON format
    """
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello World"}
    assert response.headers["content-type"] == "application/json"

def test_read_root_wrong_method():
    """
    Test the root endpoint with incorrect HTTP method (edge case).
    
    Tests:
        - POST request returns 405 Method Not Allowed
    """
    response = client.post("/")
    assert response.status_code == 405

def test_read_root_invalid_path():
    """
    Test invalid path to ensure proper error handling (failure case).
    
    Tests:
        - Non-existent path returns 404 Not Found
    """
    response = client.get("/nonexistent")
    assert response.status_code == 404