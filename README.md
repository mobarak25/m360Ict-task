# M 360 ICT Flutter Task

This Flutter project is a submission for the evaluation task provided as part of the hiring process. The application is a pixel-perfect implementation of the Figma design provided, and it adheres to all the specified requirements.

## Features

- **Pixel-Perfect UI Implementation**: The UI screens are implemented to match the Figma design precisely in terms of layout, spacing, fonts, colors, and overall appearance.
- **State Management**: Utilized `Bloc` for efficient state management across the application.
- **Authentication**: Firebase Authentication is integrated for Sign In and Sign Up functionality.
- **Responsive Design**: The UI adapts gracefully to different screen sizes and orientations.
- **Clean and Maintainable Code**: The project follows Flutter best practices and recommended coding conventions.
- **Screens Implemented**:
  - Splash Screen
  - Sign In Screen
  - Sign Up Screen
  - Home Screen
  - Details Screen


## Requirements Fulfilled

1. **Pixel-Perfect Implementation**: The application matches the Figma design with precision as possible.
2. **State Management**: `Bloc` is used for state management.
3. **Firebase Authentication**: Firebase is used for implementing Sign In and Sign Up functionalities.
4. **Responsive Design**: The app is tested on various screen sizes and orientations.
5. **Adherence to Flutter Best Practices**: The codebase is clean, structured, and maintainable.

## Bonus Features

- **Authentication using Firebase**: Users can Sign In and Sign Up seamlessly.

## Installation and Setup

Follow these steps to run the project locally:

1. Clone the repository:
   ```bash
   git clone https://github.com/mobarak25/m360Ict-task.git
   ```
2. Navigate to the project directory:
   ```bash
   cd m360Ict-task
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Set up Firebase for the project:
   - Add your Firebase configuration files (`google-services.json` for Android and `GoogleService-Info.plist` for iOS) to the respective directories.
5. Run the application:
   ```bash
   flutter run
   ```



## Folder Structure

The project follows a feature-first folder structure for better scalability and maintainability:
```
lib/
├── core/          
├── data/     
├── domain/          
├── presentation/   
└── main.dart
└── app.dart  
```

## Packages Used

- `flutter_bloc`: For state management
- `firebase_auth`: For Firebase authentication
- `firebase_core`: For Firebase
- `flutter_screenutil`: For responsive design
- `custom_fonts`: For custom fonts
- `intl_phone_field`: For Country code
- `fl_chart`: For Chart
- `get_it`: Dependency injection

---
Thank you for reviewing my submission!


