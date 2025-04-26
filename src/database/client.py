"""Supabase client configuration and initialization."""
from supabase import create_client, Client
from ..config import get_settings

def get_supabase_client() -> Client:
    """
    Create and return a Supabase client instance.

    Returns:
        Client: Configured Supabase client

    Raises:
        ValueError: If SUPABASE_URL or SUPABASE_KEY are not set
    """
    settings = get_settings()
    if not settings.SUPABASE_URL or not settings.SUPABASE_KEY:
        raise ValueError("Supabase URL and key must be set in environment variables")
    
    return create_client(
        settings.SUPABASE_URL,
        settings.SUPABASE_KEY
    )