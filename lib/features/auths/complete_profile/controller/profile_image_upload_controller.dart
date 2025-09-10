import 'dart:io';
import 'package:flutter/material.dart';

class ProfileImageUploadController extends ChangeNotifier{
  File? selectedImage;

  void onImagePicked(File image) {
    selectedImage = image;
    notifyListeners();
  }
}