import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends ChangeNotifier {
  File? _imageFile;
  
  File? get imageFile => _imageFile;

  void setImageFile(File file) {
    _imageFile = file;
    notifyListeners();
  }


  Future<void> pickImageAndNavigateToCrop(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final File? resultFile = await context.push<File?>(
        '/crop', 
        extra: pickedFile.path,
      );
      if (resultFile != null) {
        setImageFile(resultFile);
      }
    }
  }
}