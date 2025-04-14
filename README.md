# BS flutter project task

## Overview

BS flutter project task is a Flutter application designed to browse popular repositories "Flutter" on GitHub. The application fetches data from the GitHub API and displays it in an organized and user-friendly manner. Key features include infinite scrolling, detailed repository views, and optional caching for improved performance.

## Features

1. **Popular Repositories List**:
   - Displays a list of "Flutter" repositories sorted by star count in descending order.
   - Each repository card shows the repository name, star count, and owner.

2. **Infinite Scrolling**:
   - Additional repositories are loaded automatically as the user scrolls down the page, 10 repositories at a time.

3. **Repository Detail Page**:
   - Clicking on a repository card takes the user to a dedicated detail page.
   - The detail page displays detailed information about the repository, including the owner's details, a detailed description, and the last update time.

4. **Error Handling**:
   - Robust error handling for API calls to ensure the application remains functional even if there are issues with data fetching.

5. **Caching** (Optional):
   - The application caches the repository list to improve performance and reduce API calls.

## Technical Details

- **State Management**:
  - The application uses the `bloc` package for state management, ensuring a clear separation of concerns and maintainable code structure.

- **API Call**:
  - The application uses the `HTTP` package for the API Call.
    
- **Asynchronous Operations**:
  - API calls are handled using Dart's `async` and `await` features, ensuring smooth and responsive UI interactions.

- **Data Persistence**:
  - Cached data is stored using the `get_storage` package to persist the repository list across app sessions.

## Architecture

The application follows the MVVM (Model-View-ViewModel) architecture, adhering to SOLID principles:

- **Model**:
  - Represents the data layer, including API response models and data fetching logic.

- **View**:
  - Represents the UI layer, including widgets and UI components.

- **ViewModel**:
  - Manages the state and business logic, acting as an intermediary between the Model and View layers.

## Installation and Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/BrainStation23HR/Flutter_Mobarak.git
   cd Flutter_Mobarak
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the application**:
   ```bash
   flutter run
   ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
