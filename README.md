# 📸 Flutter Image Filter App
A simple and powerful Flutter application that allows users to apply real-time filters to any image, similar to Instagram. Users can modify brightness, contrast, saturation, toggle grayscale, add sepia effects, and preview changes instantly.

## 🚀 Features
1. Import image from gallery
2. Adjust brightness, contrast, saturation
3. Apply Grayscale & Sepia filters
4. Real-time image preview
5. Smooth pixel-based rendering using the image package

📂 Project Structure
lib/
 ├─ main.dart
 ├─ views/
 │   ├─ home_screen.dart
 │   └─ filter_screen.dart
 └─ utils/
     └─ filter_utils.dart

## 📦 Dependencies
Add the following packages in your pubspec.yaml:
```plaintext
dependencies:
  flutter:
    sdk: flutter
  image: ^4.2.0
  image_picker: ^1.0.7
```

## Purpose
1. image → Pixel-level manipulation
2. image_picker → Import image from gallery/camera

## ▶️ How to Run the App
1. Clone or download the project
2. Install dependencies:
flutter pub get
3. Run the app:
flutter run

## 🖼️ How It Works
• The selected image is decoded into raw pixels
• Filters (brightness, contrast, saturation) are applied using adjustColor()
• Sepia & grayscale effects adjust color channels
• Updated bytes are rendered immediately using Image.memory
• Smooth & real-time filter rendering

## filter_screen.dart
1. Loads original image
2. Applies filters live
3. Updates the preview instantly

## 📚 Learning Outcomes
By building this app, you learn how to: - Use Image Picker - Decode images to raw pixels - Modify pixel data with the image library - Build slider-based UI for real-time adjustments - Update UI efficiently with Image.memory
