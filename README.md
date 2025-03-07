# SageSearch

A modern search interface built with Flutter and a FastAPI-based backend, featuring a responsive design and an intuitive user experience.

## Features

- 🎯 Clean and modern user interface
- 📱 Responsive design that adapts to different screen sizes
- 🔍 Powerful search functionality
- 💡 Suggested searches and recent history
- 🎨 Dark theme with custom color scheme
- ⚡ Collapsible sidebar navigation
- 🌐 Web search using Tavily API
- 📊 Source relevancy ranking using sentence transformers
- 🤖 AI-powered response generation using Google Gemini
- 🔄 WebSocket support for streaming responses
- 🌐 RESTful API endpoints

## Getting Started

### Prerequisites

- **Frontend:**
  - Flutter SDK (latest version)
  - Dart SDK (latest version)
  - A code editor (VS Code, Android Studio, or IntelliJ IDEA)

- **Backend:**
  - Python 3.8+
  - Tavily API key
  - Google Gemini API key

### Installation

#### Frontend

1. Clone the repository:
   ```bash
   git clone https://github.com/AyushKr2003/sage_search.git
   ```

2. Navigate to the project directory:
   ```bash
   cd sage_search
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the application:
   ```bash
   flutter run
   ```

#### Backend

1. Navigate to the backend directory:
   ```bash
   cd sage_search/backend
   ```

2. Create and activate a virtual environment:
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

5. Start the development server:
   ```bash
   uvicorn main:app --reload
   ```

   The server will start at `http://localhost:8000`

## Project Structure

```
sage_search/
├── backend/
│   ├── main.py              # FastAPI application and endpoints
│   ├── config.py            # Configuration settings
│   ├── services/
│   │   ├── search_service.py     # Tavily API integration
│   │   ├── sort_sorce_service.py # Source ranking
│   │   └── llm_service.py        # Gemini AI integration
│   └── pydantic_model/
│       └── chat_body.py          # Request/Response models
├── lib/
│   ├── constant/
│   │   └── const.dart          # Constants and static data
│   ├── pages/
│   │   └── home_page.dart      # Main home page
│   ├── theme/
│   │   └── colors.dart         # Theme colors and styling
│   ├── widgets/
│   │   ├── custome_list.dart   # Custom list component
│   │   ├── search_section.dart # Search interface
│   │   ├── side_bar.dart       # Navigation sidebar
│   │   ├── side_bar_button.dart# Sidebar button component
│   │   └── top_bar.dart        # Top navigation bar
└── main.dart                  # Application entry point
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Flutter team for the amazing framework
- Google Fonts for the beautiful typography
- Material Design for the icon set
