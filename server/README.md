# Sage Search Backend

<div align="center">

<img src="image/app_icon_bg.png" alt="SageSearch Logo" width="150" style="background-color: white; padding: 10px; border-radius: 100px;">

[![FastAPI](https://img.shields.io/badge/FastAPI-0.95.0-009688.svg?style=flat&logo=fastapi)](https://fastapi.tiangolo.com/)
[![Python](https://img.shields.io/badge/Python-3.8+-3776AB.svg?style=flat&logo=python&logoColor=white)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

**A powerful backend service that combines Tavily search with Gemini AI to deliver intelligent, comprehensive responses.**

[Features](#features) • [Installation](#installation) • [Usage](#usage) • [API Reference](#api-reference) • [Contributing](#contributing)

</div>

## 🚀 Features

- **Intelligent Web Search** - Leverages Tavily API for accurate and relevant search results
- **Smart Source Ranking** - Uses sentence transformers to prioritize the most relevant sources
- **AI-Powered Responses** - Generates comprehensive answers using Google Gemini
- **Real-time Communication** - WebSocket support for streaming responses
- **RESTful API** - Clean and well-documented endpoints for easy integration

## 📋 Prerequisites

- Python 3.8+
- [Tavily API key](https://tavily.com/) - For web search capabilities
- [Google Gemini API key](https://ai.google.dev/) - For AI response generation

## 🔧 Installation

### Clone the repository

```bash
git clone https://github.com/yourusername/sage-search-backend.git
cd sage-search-backend
```

### Set up the environment

```bash
# Create and activate virtual environment
python -m venv venv
.\venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Configure environment variables
copy .env.example .env
```

Edit the `.env` file with your API keys:
```
TAVILY_API_KEY=your_tavily_api_key
GEMINI_API_KEY=your_gemini_api_key
```

## 🚀 Running the Server

```bash
# Development mode with auto-reload
uvicorn main:app --reload

# Production mode
uvicorn main:app --host 0.0.0.0 --port 8000
```

The server will be available at `http://localhost:8000`

## 📖 API Reference

### REST Endpoints

#### Search and Generate Response

```
POST /chats
```

Request body:
```json
{
  "query": "What are the latest developments in quantum computing?"
}
```

Response:
```json
{
  "response": "Comprehensive AI-generated response...",
  "sources": [
    {
      "url": "https://example.com/article1",
      "title": "Recent Quantum Computing Breakthroughs",
      "snippet": "..."
    }
  ]
}
```

### WebSocket

Connect to `/ws/chats` to receive streaming responses.

Example client usage:
```javascript
const ws = new WebSocket('ws://localhost:8000/ws/chats');
ws.onopen = () => {
  ws.send(JSON.stringify({ query: "What are the latest developments in quantum computing?" }));
};
ws.onmessage = (event) => {
  const data = JSON.parse(event.data);
  console.log(data);
};
```

## 📁 Project Structure

```
sage-search-backend/
├── main.py                    # FastAPI application and endpoints
├── config.py                  # Configuration settings
├── services/
│   ├── search_service.py      # Tavily API integration
│   ├── sort_source_service.py # Source ranking
│   └── llm_service.py         # Gemini AI integration
├── pydantic_model/
│   └── chat_body.py           # Request/Response models
├── tests/                     # Unit and integration tests
├── docs/                      # Documentation
├── .env.example               # Example environment variables
└── requirements.txt           # Project dependencies
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgements

- [Tavily API](https://tavily.com/) for search capabilities
- [Google Gemini](https://ai.google.dev/) for AI response generation
- [FastAPI](https://fastapi.tiangolo.com/) for the web framework
- [Sentence Transformers](https://www.sbert.net/) for source ranking
