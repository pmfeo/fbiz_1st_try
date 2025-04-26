from functools import lru_cache
from pydantic import BaseSettings

class Settings(BaseSettings):
    """Application settings."""
    APP_NAME: str = "Fbiz clone API"
    DEBUG: bool = False
    SUPABASE_URL: str
    SUPABASE_KEY: str
    
    class Config:
        env_file = ".env"

@lru_cache()
def get_settings() -> Settings:
    """Get cached settings instance."""
    return Settings()

settings = get_settings()