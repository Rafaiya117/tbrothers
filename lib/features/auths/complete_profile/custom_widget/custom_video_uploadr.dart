import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoUploader extends StatefulWidget {
  const CustomVideoUploader({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomVideoUploaderState createState() => _CustomVideoUploaderState();
}

class _CustomVideoUploaderState extends State<CustomVideoUploader> {
  File? _videoFile;
  VideoPlayerController? _videoController;

  Future<void> _pickVideo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      _videoFile = File(pickedFile.path);
      _videoController = VideoPlayerController.file(_videoFile!)
        ..initialize().then((_) {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _videoFile == null ? _pickVideo : null,
      child: _videoFile == null
        ? DottedBorder(
          options: RoundedRectDottedBorderOptions(
            dashPattern: [6, 3],
              strokeWidth: 1.5,
              color: Colors.blue.shade300,
              radius: Radius.circular(10),
              padding: EdgeInsets.zero,
            ),
              child: Container(
                width: 318.w,
                height: 136.h,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Circular background behind icon
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child:Center(
                        child: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: SvgPicture.asset(
                            'assets/icons/camera.svg',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Record or upload an intro video",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            )
          : Align(
              alignment: Alignment.centerLeft,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child:
                          _videoController != null &&
                              _videoController!.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _videoController!.value.aspectRatio,
                              child: VideoPlayer(_videoController!),
                            )
                          : Container(color: Colors.black),
                        ),
                      ),
                    // Play icon overlay
                  Positioned.fill(
                    child: Center(
                      child: Icon(
                        Icons.play_circle_filled,
                        size: 32,
                        color: Colors.white.withOpacity(0.85),
                      ),
                    ),
                  ),
                  
                  // Close button - overlapping top-right corner
                  Positioned(
                    top: -10,
                    right: -10,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _videoController?.dispose();
                          _videoController = null;
                          _videoFile = null;
                        });
                      },
                      child:Center(
                        child: SvgPicture.asset(
                          'assets/icons/cancel_icon.svg',
                           width: 18.w,
                          height: 18.h,
                            // ignore: deprecated_member_use
                            //color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }
