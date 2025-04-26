"""Test suite for database connections."""
import pytest
from src.database.client import get_supabase_client
from src.config import get_settings, Settings
from supabase import Client

def test_supabase_client_creation():
    """Test successful creation of Supabase client."""
    client = get_supabase_client()
    assert isinstance(client, Client)

def test_missing_env_vars(monkeypatch):
    """Test error handling when environment variables are missing."""
    # Patch Settings to not use .env file
    monkeypatch.setattr(Settings.Config, "env_file", None)
    
    # Remove environment variables
    monkeypatch.delenv("SUPABASE_URL", raising=False)
    monkeypatch.delenv("SUPABASE_KEY", raising=False)
    
    # Clear the settings cache
    get_settings.cache_clear()
    
    with pytest.raises(ValueError):
        get_supabase_client()