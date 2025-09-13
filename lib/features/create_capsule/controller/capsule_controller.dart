import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CapsuleController extends ChangeNotifier{
  File? image;

  void pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      image = File(picked.path);
      notifyListeners();
    }
  }

  void removeImage() {
    image = null;
    notifyListeners();
  }
}