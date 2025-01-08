# Background Picker 🚀

[![Flutter](https://img.shields.io/badge/Flutter-Framework-blue)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-Language-blue)](https://dart.dev/)

## Project Description
Background Picker is an application designed to help users select and set backgrounds or wallpapers on their devices. The app supports setting wallpapers for the home screen, lock screen, or both simultaneously. Inspired by the design concept of the Android app Backdrops, Background Picker incorporates subtle changes to its features and design for a unique and enhanced user experience.

## Preview
<img src="https://github.com/dwikadewanta/Background-Picker/blob/master/assets/preview_app.png">

## Key Features
- 🖥️ Simple and User-Friendly Interface
- 🔄 Landscape Mode Support
- 🌍 Flexible Background Options
- ⚡ Powered by Supabase
- 🖼️ Backgrounds from Pixabay
- 📱 Multi-platform Support

## Screen Overview
1. Explore Screen
   - The top section features a carousel that automatically scrolls through background images.
   - The bottom section displays a grid view showcasing background images along with:
     * The background's name
     * The creator's name
     * A favorite icon to add the image to the favorite list.
2. Similar to the Explore Screen, this screen uses a grid view to display the list of favorite backgrounds selected by the user.
3. This screen provides comprehensive details about a selected background, including:
   - Background image preview
   - Background name
   - Creator's name
   - Favorite icon to add or remove the background from the favorite list
   - Download button to save the image locally
   - Set as background button to directly set the image as wallpaper without downloading
   - Background description
   - Number of downloads
   - Category of the background
   - Pixel dimensions of the image
   - File size of the background

## Installation
Follow the steps below to run this project on your local machine:

1. Clone this repository:
    ```bash
    git clone https://github.com/username/repo-name.git
    ```
2. Navigate to the project directory:
    ```bash
    cd repo-name
    ```
3. Install the required dependencies:
    ```bash
    flutter pub get
    ```
4. Add your Supabase URL and API Key to the main.dart file.
   
5. Run the application:
    ```bash
    flutter run
    ```
    
## Technologies Used
This project was built using:
- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)

## Package / Libraries
- [transparent_image](https://pub.dev/packages/transparent_image)
- [carousel_slider](https://pub.dev/packages/carousel_slider)
- [smooth_page_indicator](https://pub.dev/packages/carousel_slider)
- [wallpaper_manager_plus](https://pub.dev/packages/wallpaper_manager_plus)
- [flutter_cache_manager](https://pub.dev/packages/flutter_cache_manager)
- [supabase_flutter](https://pub.dev/packages/supabase_flutter)
- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod)
- [path_provider](https://pub.dev/packages/path_provider)
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
