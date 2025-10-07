// New page for image cropping (using image_cropper package logic)
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart'; 

class EditPhotoPage extends StatelessWidget {
  final String imagePath;

  const EditPhotoPage({super.key, required this.imagePath});

  Future<CroppedFile?> cropImage(BuildContext context) async {
    return await ImageCropper().cropImage(
      sourcePath: imagePath,
      // Enforce a square aspect ratio for the profile picture
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0), 
      uiSettings: [
        AndroidUiSettings(
          // Ensure the toolbar settings match the dark theme
          toolbarTitle: 'Edit Photo',
          toolbarColor: const Color(0xFF1E2129), 
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true, 
        ),
        IOSUiSettings(
          title: 'Edit Photo',
          aspectRatioPickerButtonHidden: true,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // 1. Call the crop function immediately after the frame is built.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final croppedFile = await cropImage(context);
      if (croppedFile != null) {
        // Return the cropped file back to the previous screen (EditProfilePage)
        Navigator.pop(context, File(croppedFile.path));
      } else {
        // If cropping is cancelled, go back without a result
        Navigator.pop(context);
      }
    });

    // 2. This Scaffold serves as a placeholder/loading screen until image_cropper takes over.
    // The AppBar here is styled to visually match the initial "Edit Photo" screenshot.
    return Scaffold(
      backgroundColor: const Color(0xFF1E2129),
      appBar: AppBar(
        // Dark background color matching the overall screen look
        backgroundColor: Colors.transparent, // Use transparent to blend with the body/scaffold color
        elevation: 0, 
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Photo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17, // Match typical iOS/Android header font size
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          // "Save" button as seen in the screenshot
          TextButton(
            // NOTE: The actual saving is done when the user hits 'Done' in the cropper plugin's UI.
            // This button's onPressed is inactive here, but it provides the required visual.
            onPressed: () {}, 
            child: const Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      // Body content is a simple loading indicator as the cropper launches immediately
      body: const Center(
        child: CircularProgressIndicator(color: Color(0xFF4A90E2)),
      ),
    );
  }
}