# 📸 Flutter Image Filter App
A simple and powerful Flutter application that allows users to apply real-time filters to any image, similar to Instagram. Users can modify brightness, contrast, saturation, toggle grayscale, add sepia effects, and preview changes instantly.

## 🚀 Features
1. Import image from gallery
2. Adjust brightness, contrast, saturation
3. Apply Grayscale & Sepia filters
4. Real-time image preview
5. Smooth pixel-based rendering using the image package

## 📂 Project Structure
```plaintext
lib/
 ├─ main.dart
 ├─ views/
 │   ├─ home_screen.dart
 │   └─ filter_screen.dart
 └─ utils/
     └─ filter_utils.dart
```

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
By building this app, you learn how to: - Use Image Picker - Decode images to raw pixels - Modify pixel data with the image library - Build slider-based UI for real-time adjustments - Update UI efficiently with Image.memory.

## Screencast 
https://github.com/user-attachments/assets/35d2e28b-1fdb-4604-8d4c-553489e530a0

## About Me 
✨ I’m **Sufyan bin Uzayr**, an open-source developer passionate about building and sharing meaningful projects.
You can learn more about me and my work at [sufyanism.com](https://sufyanism.com/) or connect with me on [Linkedin](https://www.linkedin.com/in/sufyanism)

## Your all-in-one learning hub! 
🚀 Explore courses and resources in coding, tech, and development at **zeba.academy** and **code.zeba.academy**. Empower yourself with practical skills through curated tutorials, real-world projects, and hands-on experience. Level up your tech game today! 💻✨

**Zeba Academy**  is a learning platform dedicated to **coding**, **technology**, and **development**.  
➡ Visit our main site: [zeba.academy](https://zeba.academy)   </br>
➡ Explore hands-on courses and resources at: [code.zeba.academy](https://code.zeba.academy)   </br>
➡ Check out our YouTube for more tutorials: [zeba.academy](https://www.youtube.com/@zeba.academy)  </br>
➡ Follow us on Instagram: [zeba.academy](https://www.instagram.com/zeba.academy/)  </br>

**Thank you for visiting!**


