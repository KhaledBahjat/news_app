# News App
A Flutter-based news application that allows users to explore top headlines, browse articles by category, and search for news topics. The app supports both English and Arabic languages.

## Features

*   **Top Headlines**: View the latest top news articles from the US.
*   **Categorized News**: Browse articles in categories such as Travel, Technology, Business, and Entertainment.
*   **Search**: Find articles by searching for keywords.
*   **Article Details**: Tap on any article to view its full description and details.
*   **Multi-language Support**: Seamlessly switch between English and Arabic.
*   **Responsive UI**: The user interface adapts to different screen sizes.

## Tech Stack & Dependencies

*   **Framework**: Flutter
*   **Language**: Dart
*   **Networking**:
    *   `dio`: A powerful HTTP client for making API requests to the [News API](https://newsapi.org/).
    *   `pretty_dio_logger`: Logs network requests and responses for easy debugging.
*   **State Management & Navigation**:
    *   `go_router`: For declarative routing and navigation.
*   **UI & UX**:
    *   `flutter_screenutil`: Adapts UI and font sizes for different screen dimensions.
    *   `cached_network_image`: Displays and caches images from the network.
*   **Internationalization**:
    *   `easy_localization`: Provides support for multiple languages (English & Arabic).

## Setup and Installation

To run this project locally, follow these steps:

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/khaledbahjat/news_app.git
    cd news_app
    ```

2.  **Get a News API Key:**
    *   Visit [newsapi.org](https://newsapi.org/) and register to get a free API key.

3.  **Add the API Key:**
    *   Open the file `lib/core/constant/app_constant.dart`.
    *   Replace the placeholder value of `newsApiKey` with your own key:
        ```dart
        class AppConstant {
          static const String newsApiKey = "YOUR_NEWS_API_KEY_HERE";
          // ...
        }
        ```

4.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

5.  **Run the application:**
    ```sh
    flutter run
    ```

## Project Structure

The project follows a feature-driven architecture to keep the codebase organized and scalable.

```
lib/
├── core/                  # Shared utilities, constants, and core components
│   ├── constant/          # Application constants (e.g., API key)
│   ├── networking/        # Dio setup and API endpoint definitions
│   ├── routing/           # GoRouter configuration
│   ├── style/             # App-wide color and text styles
│   └── widgets/           # Common reusable widgets
│
├── features/              # Feature-specific screens and components
│   ├── home/              # Home screen, widgets, services, and models
│   └── search_result_screen/# Search results screen and its related parts
│
└── main.dart              # Main entry point for the application
