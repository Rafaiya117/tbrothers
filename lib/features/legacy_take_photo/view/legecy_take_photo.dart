// camera_page.dart

import 'dart:io';

import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/capture_message/custom_widget/capture_buttons_section.dart';
import 'package:appsoleum/features/legacy_take_photo/controller/legecy_capture_image_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart'; // For SVG icons

class CameraPage extends StatelessWidget {
  final String? filterContext;
  const CameraPage({super.key, this.filterContext});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF2B78E4);
    const Color scaffoldBackground = Color(0xFF1E2129);
    const Color orangeButton = Color(0xFFFF7A00);

    // ✅ Initialize camera when page is built (replaces initState)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = Provider.of<LegecyCaptureImageController>(context, listen: false);
      if (controller.cameraController == null ||
        !controller.cameraController!.value.isInitialized) {
        controller.initializeCamera();
      }
    });

    Future<void> _disposeCamera(BuildContext context) async {
      final controller = Provider.of<LegecyCaptureImageController>(context, listen: false);
      controller.disposeCamera();
    }

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        await _disposeCamera(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: scaffoldBackground,
        appBar: AppBar(
          backgroundColor: primaryBlue,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () async {
              await _disposeCamera(context);
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Travel',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {
                print('More options tapped');
              },
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: AppGradientColors.background_color,
          ),
          child: Padding(
            padding:EdgeInsets.symmetric(vertical: 32.h),
            child: Column(
              children: [
                Stack(
                  children: [
                    Consumer<LegecyCaptureImageController>(
                      builder: (context, controller, _) {
                        return Container(
                          width: 350.w,
                          height: controller.capturedImage != null ? 405.h : 528.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black,
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: controller.capturedImage != null
                            ? Image.file(
                              controller.capturedImage!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            )
                            : (controller.cameraController != null &&
                              controller.cameraController!.value.isInitialized)
                            ? CameraPreview(controller.cameraController!)
                            : const Center(
                              child: CircularProgressIndicator(), 
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Expanded(
                  child: Consumer<LegecyCaptureImageController>(
                    builder: (context, controller, _) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CameraControlBar(
                            onGalleryTap: () => context.read<LegecyCaptureImageController>().openGallery(),
                            onCaptureTap: () async {
                              if (controller.cameraController != null &&
                                  controller.cameraController!.value.isInitialized) {
                                final XFile image = await controller.cameraController!.takePicture();
                                controller.setCapturedImage(File(image.path));
                              }
                            },
                            onFlashTap: () => print('Flash toggled'),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 30.h),
                // ✅ Capture Button
                Consumer<LegecyCaptureImageController>(
                  builder: (context, controller, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFF353953)
                          ),
                          child: IconButton(
                            onPressed: (){}, 
                            icon: SvgPicture.asset(
                              'assets/icons/micro_phone.svg'
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w,),
                        SizedBox(
                          width: 300,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: orangeButton,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () async {},
                            child: const Text(
                              'Save',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
