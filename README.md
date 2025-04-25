# MCP Server Project

This is a Model Context Protocol (MCP) server implementation written in Python.

## Project Structure

```
├── src/
│   ├── api/           # API endpoints and routes
│   ├── database/      # Database models and connections
│   ├── models/        # Data models and schemas
│   ├── services/      # Business logic and services
│   ├── utils/         # Utility functions and helpers
│   ├── config.py      # Configuration settings
│   └── main.py        # Application entry point
├── tests/             # Test files
├── requirements.txt   # Python dependencies
└── PLANNING.md        # Project planning documentation
```

## Setup

1. Create a virtual environment:
```bash
python -m venv .venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

## Running the Application

To start the server:
```bash
python src/main.py
```

## Development

- The project follows a modular structure with separate concerns in different directories
- Configuration is managed through `src/config.py`
- API endpoints are defined in the `src/api` directory
- Business logic is implemented in the `src/services` directory

## Testing

Run tests using:
```bash
python -m pytest tests/
```

## Project Status

This project is under active development. See `PLANNING.md` and `TASKS.md` for current development status and upcoming features.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.