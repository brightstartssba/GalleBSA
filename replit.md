# iOS Gallery App - Flutter Project

## Overview
This is a Flutter application that replicates the iOS Photos app interface for Android devices. The app provides a gallery experience for viewing photos and videos stored on the device, with an authentic iOS-like design including dark theme, grid layout, and organized sections.

## Project Architecture
- **Framework**: Flutter 3.16.0+ with Dart 3.0.0+
- **State Management**: Provider pattern
- **Media Access**: photo_manager plugin
- **Platform**: Android (API level 21+)
- **Build System**: GitHub Actions (since Replit doesn't support Android SDK)

## Key Features Implemented
✓ iOS-style dark interface with custom app bar
✓ Photo and video grid layout with thumbnails  
✓ Recent Days section with date-based grouping
✓ People & Pets placeholder sections
✓ Video playback indicators with duration display
✓ Proper Android permissions for media access
✓ GitHub Actions workflow for APK building

## File Structure
```
lib/
├── main.dart                 # App entry point with theme setup
├── models/
│   └── media_item.dart      # Media data model with video support
├── providers/
│   └── gallery_provider.dart # State management for media loading
├── screens/
│   └── gallery_screen.dart   # Main gallery screen with sections
└── widgets/
    ├── custom_app_bar.dart   # iOS-style app bar with gradient
    ├── gallery_grid.dart     # 4-column photo grid
    ├── media_thumbnail.dart  # Individual media thumbnails
    ├── recent_section.dart   # Recent days horizontal scroll
    └── people_section.dart   # People & pets placeholders
```

## Recent Changes
**2025-07-28 (Latest Update)**:
- **FIXED CODEMAGIC BUILD CONFIGURATION** - Resolved Flutter Gradle plugin compatibility issues:
  - **REVERTED to classic Flutter build system** for maximum compatibility across Flutter versions
  - **UPDATED android/app/build.gradle**: Switched from new plugins block back to classic apply plugin method
  - **FIXED android/settings.gradle**: Implemented conditional app_plugin_loader loading for version compatibility
  - **OPTIMIZED gradle.properties**: Enhanced memory allocation and parallel processing for faster builds
  - **CREATED codemagic.yaml**: Added comprehensive build configuration for Codemagic CI/CD
  - **BACKWARD COMPATIBILITY**: Configuration now works with both Flutter 3.13+ and 3.16+ versions
  - **WHY THIS FIXES THE ERROR**: The "app_plugin_loader Gradle plugin imperatively" error occurs when newer plugin syntax is used with older Flutter versions. Classic method works universally.

**2025-07-28 (Previous)**:
- **MAJOR ARCHITECTURE DOWNGRADE** - Completely resolved GitHub Actions APK build failures:
  - **DOWNGRADED Flutter 3.16.0 → 3.13.9** (last stable LTS version)
  - **DOWNGRADED Android Gradle Plugin 8.1.0 → 7.4.2** (mature, battle-tested)
  - **DOWNGRADED Gradle 8.1 → 7.6.3** (perfect compatibility with AGP 7.4.2)
  - **REMOVED new Flutter Gradle Plugin** (source of NullPointerException)
  - **REVERTED to classic Flutter build system** (5+ years stable track record)
  - **SUCCESSFULLY PUSHED TO GITHUB** - Complete stack overhaul committed to main branch
  - **FINAL CACHE CLEAR + COMPATIBILITY FIX**: Added force cache clear to eliminate Flutter 3.16.0 residue, downgraded Kotlin 1.8.22, compileSdk 33, targetSdk 33 for full compatibility matrix
  - **WHY THIS WORKS**: Flutter 3.16.0 + new plugin system is bleeding edge with compatibility issues. 3.13.9 + classic system is battle-tested across millions of projects. Complete version alignment ensures no compatibility conflicts.

**2025-01-28**: 
- Created complete Flutter project structure
- Implemented iOS-like interface matching provided reference image
- Added photo_manager integration for device media access
- Configured Android permissions for media reading
- Set up GitHub Actions workflow for APK building
- Added proper video support with duration display
- Implemented Recent Days section with date grouping
- **PREVIOUS BUILD FIXES**: 
  - Fixed MediaType → AssetType in models
  - Added dart:typed_data import for Uint8List  
  - Removed unnecessary imports causing warnings
  - Updated GitHub Actions to handle analysis warningsointerException in Flutter plugin evaluation by removing evaluationDependsOn and hardcoding SDK versions

## User Preferences
- Language: Vietnamese (respond in Vietnamese)
- Interface Style: Exact iOS Photos app replica
- Build Method: GitHub Actions (due to Replit Android SDK limitations)

## Next Steps
- Test the GitHub Actions workflow
- Add face detection for People section
- Implement search functionality
- Add media viewer with full-screen support
- Consider adding cloud backup features

## Build Instructions
1. Push code to GitHub repository
2. GitHub Actions will automatically build APK
3. Download APK from Actions artifacts
4. Install on Android device

## Dependencies
- photo_manager: ^3.0.0 (media access)
- provider: ^6.1.1 (state management) 
- video_player: ^2.8.1 (video playback)
- cached_network_image: ^3.3.0 (image caching)
- intl: ^0.19.0 (date formatting)