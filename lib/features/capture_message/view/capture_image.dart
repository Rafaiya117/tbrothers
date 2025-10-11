import 'dart:io';

import 'package:appsoleum/core/components/custom_button.dart';
import 'package:appsoleum/core/components/custom_input_field.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/capture_message/controller/capture_controller.dart';
import 'package:appsoleum/features/capture_message/custom_widget/capture_buttons_section.dart';
import 'package:appsoleum/features/capture_message/custom_widget/media_seletor.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CaptureImage extends StatelessWidget {
  const CaptureImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final controller = CaptureController();
        controller.initializeCamera(); 
        return controller;
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16.0),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: AppGradientColors.background_color,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32.h),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        context.pop();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/arrow_back.svg',
                        width: 16.w,
                        height: 10.h,
                      ),
                    ),
                    SizedBox(width: 100.w),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Capture Memory",
                        style: GoogleFonts.inter(
                          color: FontColors.text_colors,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                MediaToggle(
                  controller: context.read<CaptureController>(),
                  onSelectionChanged: (value) {
                    print('Selected: $value');
                  },
                ),
                SizedBox(height: 20.h),
                Stack(
                  children: [
                    Consumer<CaptureController>(
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
                            ): (controller.cameraController != null &&
                              controller.cameraController!.value.isInitialized)
                              ? CameraPreview(controller.cameraController!)
                              : const Center(child: CircularProgressIndicator()),
                            );
                          },
                        ),
                        Positioned(
                          top: 12,
                          right: 12,
                          child: GestureDetector(
                            onTap: () {
                              print("Filter icon tapped");
                            },
                          child: Container(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            'assets/icons/filter_icon.svg',
                            width: 44.w,
                            height: 44.h,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Expanded(
                  child: Consumer<CaptureController>(
                    builder: (context, controller, _) {
                      return controller.capturedImage == null
                        ? CameraControlBar(
                          onGalleryTap: () =>context.read<CaptureController>().openGallery(),
                            onCaptureTap: () async {
                              if (controller.cameraController != null &&
                                controller.cameraController!.value.isInitialized) {
                                final XFile image = await controller.cameraController!.takePicture();
                                controller.setCapturedImage(File(image.path));
                                }
                              },
                            onFlashTap: () => print('Flash toggled'),
                          )
                        : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Suggested Tags",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              _buildTag("Family"),
                              SizedBox(width: 5.w),
                              _buildTag("Beach Trip"),
                              SizedBox(width: 5.w),
                              _buildAddMoreTag(),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          SizedBox(
                            width: 350.w,
                            child: CustomTextField(
                              label: "Add Note",
                              controller: TextEditingController(),
                              backgroundColor: const Color(0xFF2A2E52),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            width: 350.w,
                            child: CustomRoundedButton(
                              text: "Save",
                              backgroundColor: FontColors.button_color,
                              textColor: Colors.white,
                              onPressed: () {
                              // context.push('/home_page');
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
  Widget _buildTag(String text) {
    return GestureDetector(
      onTap: () {
        print("$text badge tapped");
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2E52),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
  Widget _buildAddMoreTag() {
    return GestureDetector(
      onTap: () {
        print("Add more badge tapped");
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2E52),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: FontColors.button_color),
        ),
        child: Row(
          children: [
            Icon(Icons.add, color: FontColors.button_color, size: 13.sp),
            Text(
              "Add more",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
