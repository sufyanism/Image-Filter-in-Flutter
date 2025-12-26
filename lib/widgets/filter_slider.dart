import 'package:flutter/material.dart';

class FilterSlider extends StatelessWidget {
  final String title;
  final double value;
  final double min;
  final double max;
  final Function(double) onChanged;

  const FilterSlider({
    super.key,
    required this.title,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$title: ${value.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 16)),
        Slider(
          value: value,
          min: min,
          max: max,
          onChanged: onChanged,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
