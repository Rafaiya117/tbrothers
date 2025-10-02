import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CaptureController extends ChangeNotifier {
  String _selectedOption = 'Picture';
  final List<String> _options = ['Picture', 'Video', 'Audio'];

  String get selectedOption => _selectedOption;
  List<String> get options => List.unmodifiable(_options);

  void selectOption(String option) {
    if (_selectedOption != option && _options.contains(option)) {
      _selectedOption = option;
      notifyListeners();
    }
  }

  //!----------Open Camera and gallery-----------!
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;

  CameraController? get cameraController => _cameraController;

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(
      _cameras!.first,
      ResolutionPreset.medium,
    );
    await _cameraController!.initialize();
    notifyListeners();
  }

  void disposeCamera() {
    _cameraController?.dispose();
  }

  File? _capturedImage;
  File? get capturedImage => _capturedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      print("Image picked: ${image.path}");
      _capturedImage = File(image.path);
      notifyListeners();
    }
  }

  Future<void> openGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print("Image picked: ${image.path}");
      _capturedImage = File(image.path);
      notifyListeners();
    }
  }

  void setCapturedImage(File file) {
    _capturedImage = file;
    notifyListeners();
  }
}
