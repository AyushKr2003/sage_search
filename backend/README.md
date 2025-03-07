# Sage Search Backend

A FastAPI-based backend service that provides intelligent search capabilities using Tavily API and Gemini AI for generating comprehensive responses.

## Features

- Web search using Tavily API
- Source relevancy ranking using sentence transformers
- AI-powered response generation using Google Gemini
- WebSocket support for streaming responses
- RESTful API endpoints

## Prerequisites

- Python 3.8+
- Tavily API key
- Google Gemini API key

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd sage_search/backend
```

2. Create and activate virtual environment:
```bash
python -m venv venv
.\venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

4. Set up environment variables:
```bash
copy .env.example .env
```
Then edit `.env` with your API keys and configuration.

## Configuration

Required environment variables:
- `TAVILY_API_KEY`: Your Tavily API key
- `GEMINI_API_KEY`: Your Google Gemini API key

## Running the Server

Start the development server:
```bash
uvicorn main:app --reload
```

The server will start at `http://localhost:8000`

## API Endpoints

### REST API

`POST /chats`
- Request body: `{ "query": "your search query" }`
- Returns: AI-generated response based on search results

### WebSocket

`WS /ws/chats`
- Connect to receive streaming responses
- Send: `{ "query": "your search query" }`
- Receive: Search results and streamed AI responses

## Project Structure

```
backend/
├── main.py              # FastAPI application and endpoints
├── config.py           # Configuration settings
├── services/
│   ├── search_service.py     # Tavily API integration
│   ├── sort_sorce_service.py # Source ranking
│   └── llm_service.py        # Gemini AI integration
└── pydantic_model/
    └── chat_body.py          # Request/Response models
```

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
