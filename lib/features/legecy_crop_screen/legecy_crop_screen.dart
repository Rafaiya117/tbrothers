import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
// Make sure this is imported:
import 'package:image_cropper/image_cropper.dart'; 

class EditPhotoPage extends StatefulWidget {
  final XFile imageFile;

  const EditPhotoPage({Key? key, required this.imageFile, required String imagePath}) : super(key: key);

  @override
  State<EditPhotoPage> createState() => _EditPhotoPageState();
}

class _EditPhotoPageState extends State<EditPhotoPage> {
  File? _croppedImage;

  @override
  void initState() {
    super.initState();
    _cropImage(File(widget.imageFile.path));
  }

  Future<void> _cropImage(File imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          aspectRatioPresets: [CropAspectRatioPreset.square],
          lockAspectRatio: true,
          initAspectRatio: CropAspectRatioPreset.square,
        ),
        IOSUiSettings(
          title: 'Crop Image',
          aspectRatioLockEnabled: true,
          aspectRatioLockDimensionSwapEnabled: true,
          aspectRatioPresets: [CropAspectRatioPreset.square],
        ),
      ],
    );

    if (croppedFile != null) {
      setState(() {
        _croppedImage = File(croppedFile.path);
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        title: const Text(
          'Edit Photo',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _croppedImage == null
            ? null : () {
              Navigator.pop(context, _croppedImage);
            },
            child: Text(
              'Save',
              style: TextStyle(
                color: _croppedImage == null ? Colors.grey : Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          color: const Color(0xFF1A1A2E), 
          child: _croppedImage == null
            ? Center(child: Image.file(File(widget.imageFile.path), fit: BoxFit.contain))
            : Image.file(_croppedImage!, fit: BoxFit.contain),
        ),
      ),
    );
  }
}