import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import '../utils/image_filters.dart';
import '../widgets/filter_slider.dart';
import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? originalFile;
  img.Image? editedImage;
  Uint8List? editedBytes;

  double brightness = 0;
  double contrast = 1;
  double saturation = 1;
  double grayscale = 0;
  double sepia = 0;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      originalFile = File(picked.path);
      final bytes = await picked.readAsBytes();
      editedImage = img.decodeImage(bytes);
      setState(() {});
    }
  }

  void applyFilters() {
    if (editedImage == null) return;

    // Correct safe clone for image 4.x
    img.Image temp = img.Image.from(editedImage!);

    temp = applyBrightness(temp, brightness);
    temp = applyContrast(temp, contrast);
    temp = applySaturation(temp, saturation);

    if (grayscale > 0) temp = applyGrayScale(temp, grayscale);
    if (sepia > 0) temp = applySepia(temp, sepia);

    editedBytes = Uint8List.fromList(img.encodeJpg(temp));

    setState(() {});
  }

  Future<void> saveImage() async {
    if (editedBytes == null) return;

    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/filtered_image.jpg");
    await file.writeAsBytes(editedBytes!);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Image saved successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Filter Editor"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: saveImage,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Load Image Button
            Center(
              child: ElevatedButton.icon(
                onPressed: pickImage,
                icon: const Icon(Icons.photo),
                label: const Text("Pick Image"),
              ),
            ),

            const SizedBox(height: 20),

            // Preview Image
            if (editedBytes != null || originalFile != null)
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: editedBytes != null
                        ? Image.memory(editedBytes!, height: 300)
                        : Image.file(originalFile!, height: 300),
                  ),
                  const SizedBox(height: 20),
                ],
              ),

            // Filter sliders
            if (originalFile != null) ...[
              FilterSlider(
                title: "Brightness",
                value: brightness,
                min: -1,
                max: 1,
                onChanged: (v) {
                  brightness = v;
                  applyFilters();
                },
              ),
              FilterSlider(
                title: "Contrast",
                value: contrast,
                min: 0,
                max: 3,
                onChanged: (v) {
                  contrast = v;
                  applyFilters();
                },
              ),
              FilterSlider(
                title: "Saturation",
                value: saturation,
                min: 0,
                max: 3,
                onChanged: (v) {
                  saturation = v;
                  applyFilters();
                },
              ),
              FilterSlider(
                title: "Grayscale",
                value: grayscale,
                min: 0,
                max: 1,
                onChanged: (v) {
                  grayscale = v;
                  applyFilters();
                },
              ),
              FilterSlider(
                title: "Sepia",
                value: sepia,
                min: 0,
                max: 1,
                onChanged: (v) {
                  sepia = v;
                  applyFilters();
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
