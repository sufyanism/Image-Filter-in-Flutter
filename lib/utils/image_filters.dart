import 'package:image/image.dart' as img;

img.Image applyBrightness(img.Image src, double value) {
  // value: -1.0 to 1.0
  // brightness expects -1.0 → 1.0
  return img.adjustColor(src, brightness: value);
}

img.Image applyContrast(img.Image src, double value) {
  // value: 0 → 3
  return img.adjustColor(src, contrast: value);
}

img.Image applySaturation(img.Image src, double value) {
  // value: 0 → 3
  return img.adjustColor(src, saturation: value);
}

img.Image applyGrayScale(img.Image src, double amount) {
  return img.grayscale(src);
}

img.Image applySepia(img.Image src, double amount) {
  return img.sepia(src);
}
