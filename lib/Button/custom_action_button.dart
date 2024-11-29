import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final String label; // Button label (e.g., "Add Designation")
  final VoidCallback onPressed; // Callback for button click

  const CustomActionButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.add), // "+" icon is predefined
        label: Text(label),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        ),
      ),
    );
  }
}
