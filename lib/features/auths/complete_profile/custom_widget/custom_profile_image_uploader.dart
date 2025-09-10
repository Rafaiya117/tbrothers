import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CustomImagePicker extends StatefulWidget {
  final double height;
  final double width;
  final Function(File) onImagePicked;

  const CustomImagePicker({
    super.key,
    this.height = 180.0,
    this.width = 280.0,
    required this.onImagePicked,
  });

  @override
  _CustomImagePickerState createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      widget.onImagePicked(_image!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Rectangular container with rounded corners
          Container(
            height: 224.h,
            width: 318.w,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
              image: _image != null
                  ? DecorationImage(
                      image: FileImage(_image!),
                      fit: BoxFit.cover,
                    )
                  : null,
                ),
              child: _image == null
                ? Image.asset(
                  "assets/images/profile_image.png",
                  // height: 207.h,
                  //width: 230.w,
                  color: Colors.grey[400],
                  fit: BoxFit.fitHeight,
                )
                : null,
              ),
            // Positioned upload button at bottom center
            Positioned(
              bottom: 14,
              child: ElevatedButton.icon(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.16),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 2,
                ),
                icon:SvgPicture.asset(
                  "assets/icons/image_icon.svg",
                  width: 18.w,height: 18.h,color: Colors.white
                ),
                label: const Text(
                  'Upload Image',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
