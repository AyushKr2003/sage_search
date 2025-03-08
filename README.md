<div align="center">
  <img src="assets/app_icon_bg.png" alt="SageSearch Logo" width="150" style="background-color: white; padding: 10px; border-radius: 10px;">
  <h1>SageSearch</h1>
  <p><strong>Intelligent web search and information synthesis platform</strong></p>
  
  <p>
    <a href="#features">Features</a> •
    <a href="#demo">Demo</a> •
    <a href="#installation">Installation</a> •
    <a href="#usage">Usage</a> •
    <a href="#architecture">Architecture</a> •
    <a href="#contributing">Contributing</a> •
    <a href="#license">License</a>
  </p>
  
  <p>
    <img alt="GitHub stars" src="https://img.shields.io/github/stars/AyushKr2003/sage_search_frontend?style=for-the-badge">
    <img alt="GitHub forks" src="https://img.shields.io/github/forks/AyushKr2003/sage_search_frontend?style=for-the-badge">
    <img alt="GitHub issues" src="https://img.shields.io/github/issues/AyushKr2003/sage_search_frontend?style=for-the-badge">
    <img alt="License" src="https://img.shields.io/github/license/AyushKr2003/sage_search_frontend?style=for-the-badge">
  </p>
</div>

## 📋 Overview

SageSearch is a sophisticated search interface built with Flutter that transforms how users discover information online. It intelligently retrieves, analyzes, and synthesizes content from multiple web sources, delivering comprehensive AI-enhanced responses to user queries while maintaining source attribution.

<div align="center">
  <!-- Consider adding a screenshot here -->
  <p><em>SageSearch in action - Intelligent search results with source attribution</em></p>
</div>

## ✨ Features

- 🎯 **Intuitive Interface** - Clean, modern UI with focus on content and readability
- 📱 **Fully Responsive** - Seamless experience across desktop, tablet, and mobile devices
- 🔍 **Advanced Search** - Powerful query processing with semantic understanding
- 💡 **Smart Suggestions** - Contextual search suggestions and history tracking
- 🎨 **Customizable Theme** - Dark mode support with elegant color scheme
- ⚡ **Performance Optimized** - Fast loading times and smooth animations
- 🔄 **Real-time Updates** - WebSocket support for streaming search responses
- 🌐 **API Integration** - RESTful endpoints for easy backend communication

## 🎬 Demo

<!-- Consider adding a GIF or link to video demo -->
Check out our [live demo](https://github.com/AyushKr2003/sage_search_frontend) to see SageSearch in action.

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Dart SDK (latest version)
- A code editor (VS Code, Android Studio, or IntelliJ IDEA)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/AyushKr2003/sage_search_frontend.git
   ```

2. **Navigate to the project directory**
   ```bash
   cd sage_search_frontend
   ```

3. **Install dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the application**
   ```bash
   flutter run
   ```

## 📖 Usage

SageSearch provides an intuitive interface for searching and discovering information:

1. Enter your query in the search bar
2. Review the AI-synthesized answer with highlighted sources
3. Explore related topics through suggested searches
4. Toggle between light and dark themes based on your preference

## 🏗️ Architecture

```
sage_search_frontend/
├── lib/
│   ├── constant/
│   │   └── const.dart           # Application constants and configuration
│   ├── pages/ 
│   │   └── home_page.dart       # Main application interface
│   ├── theme/ 
│   │   └── colors.dart          # Theme definitions and styling
│   ├── widgets/ 
│   │   ├── custome_list.dart    # Reusable list component
│   │   ├── search_section.dart  # Search interface component
│   │   ├── side_bar.dart        # Navigation sidebar
│   │   ├── side_bar_button.dart # Interactive sidebar elements
│   │   └── top_bar.dart         # Application header component
│   ├── services/                # API and data services
│   ├── models/                  # Data models and state management
│   └── utils/                   # Helper functions and utilities
└── main.dart                    # Application entry point
```

## 🤝 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/amazing-feature`)
3. Commit your Changes (`git commit -m 'Add some amazing feature'`)
4. Push to the Branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

See the [open issues](https://github.com/AyushKr2003/sage_search_frontend/issues) for a list of proposed features and known issues.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👏 Acknowledgments

- [Flutter](https://flutter.dev/) - UI toolkit for building natively compiled applications
- [Google Fonts](https://fonts.google.com/) - Beautiful typography
- [Material Design](https://material.io/) - Design system and components
- All [contributors](https://github.com/AyushKr2003/sage_search_frontend/graphs/contributors) who have helped shape SageSearch

---

<div align="center">
  <sub>Built with ❤️ by <a href="https://github.com/AyushKr2003">Ayush Kumar Singh</a></sub>
</div>
