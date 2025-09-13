import 'dart:io';
import 'package:flutter/material.dart';

class CustomImageUploader extends StatelessWidget {
  final File? imageFile;
  final VoidCallback onAddMedia;
  final VoidCallback onRemoveMedia;

  const CustomImageUploader({
    Key? key,
    required this.imageFile,
    required this.onAddMedia,
    required this.onRemoveMedia,
  }) : super(key: key);

  Widget _buildAddMediaBox() {
    return GestureDetector(
      onTap: onAddMedia,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFF23254D),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            // ignore: deprecated_member_use
            color: Colors.blueAccent.withOpacity(0.3),
            width: 1.5,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.image_outlined, color: Colors.white60, size: 28),
            SizedBox(height: 6),
            Text("Add media", style: TextStyle(color: Colors.white)),
            SizedBox(height: 2),
            Text(
              "Supported png, jpeg, mov etc",
              style: TextStyle(color: Colors.white38, fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePreviewBox() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
            imageFile!,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: onRemoveMedia,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white70,
              ),
              padding: const EdgeInsets.all(2),
              child: const Icon(Icons.close, size: 16, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (imageFile != null) _buildImagePreviewBox(),
        if (imageFile == null) _buildAddMediaBox(),
        if (imageFile != null) const SizedBox(width: 10),
        if (imageFile != null) _buildAddMediaBox(), 
      ],
    );
  }
}
