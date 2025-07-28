# iOS Gallery App

A Flutter gallery app with iOS-like interface for viewing photos and videos on Android devices.

## Features

- **iOS-like Design**: Replicates the iOS Photos app interface
- **Media Gallery**: View photos and videos from device storage
- **Recent Days**: Browse media organized by recent dates
- **People & Pets**: Placeholder sections for future AI-powered organization
- **Search & Select**: Interface for searching and selecting media
- **Video Support**: Play videos with duration indicators

## Screenshots

Based on the iOS Photos app design with:
- Black background with photo grid
- Custom app bar with search, select, and profile buttons  
- Recent Days section with date-based grouping
- People & Pets section placeholders

## Getting Started

### Prerequisites

- Flutter SDK 3.16.0 or later
- Dart SDK 3.0.0 or later
- Android Studio/VS Code
- Android device/emulator (API level 21+)

### Installation

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd ios-gallery-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Building APK

Since Replit doesn't support Android SDK, use GitHub Actions:

1. **Push to GitHub**
   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

2. **GitHub Actions will automatically:**
   - Build the APK
   - Run tests and analysis
   - Upload artifacts

3. **Download APK from Actions tab** in your GitHub repository

## Permissions

The app requests the following permissions:
- `READ_EXTERNAL_STORAGE` - Access photos and videos
- `READ_MEDIA_IMAGES` - Read image files (Android 13+)
- `READ_MEDIA_VIDEO` - Read video files (Android 13+)

## Architecture

### Folder Structure
```
lib/
├── main.dart                 # App entry point
├── models/
│   └── media_item.dart      # Media data model
├── providers/
│   └── gallery_provider.dart # State management
├── screens/
│   └── gallery_screen.dart   # Main gallery screen
└── widgets/
    ├── custom_app_bar.dart   # iOS-style app bar
    ├── gallery_grid.dart     # Photo grid
    ├── media_thumbnail.dart  # Individual media item
    ├── recent_section.dart   # Recent days section
    └── people_section.dart   # People & pets section
```

### State Management
- Uses `Provider` for state management
- `GalleryProvider` handles media loading and organization
- Reactive UI updates when media data changes

### Media Handling
- `photo_manager` plugin for accessing device media
- Supports both images and videos
- Thumbnail generation and caching
- Video duration display

## Customization

### Colors & Theme
- Modify `lib/main.dart` for app-wide theming
- Black background with iOS-style white text
- Blue accent color for interactive elements

### Grid Layout
- Adjust `crossAxisCount` in `gallery_grid.dart` for different grid sizes
- Modify spacing and aspect ratios as needed

### Sections
- Add new sections by creating widgets similar to `recent_section.dart`
- Implement additional media organization features

## Building for Production

### GitHub Actions (Recommended)
The included workflow builds APK automatically:
- Triggers on push to main branch
- Runs tests and analysis
- Builds both APK and App Bundle
- Uploads artifacts for download

### Local Build (if Android SDK available)
```bash
flutter build apk --release
flutter build appbundle --release
```

## Future Enhancements

- [ ] AI-powered face detection for People section
- [ ] Pet detection and organization
- [ ] Advanced search functionality
- [ ] Media editing capabilities
- [ ] Cloud backup integration
- [ ] Album creation and management
- [ ] Live Photos support
- [ ] Memories and highlights

## License

This project is licensed under the MIT License - see the LICENSE file for details.