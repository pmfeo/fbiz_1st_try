from pydantic import BaseSettings

class Settings(BaseSettings):
    """Application settings."""
    APP_NAME: str = "Forecaster.biz API"
    DEBUG: bool = False
    SUPABASE_URL: str
    SUPABASE_KEY: str
    
    class Config:
        env_file = ".env"

settings = Settings()