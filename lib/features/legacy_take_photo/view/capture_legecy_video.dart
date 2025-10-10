import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/capture_message/custom_widget/custom_audio_video_recorder.dart';
import 'package:appsoleum/features/legacy_take_photo/controller/legecy_video_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';


class LegecyCaptureVideo extends StatelessWidget {
  final String? filterContext;
  const LegecyCaptureVideo({super.key, this.filterContext});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF2B78E4);
    const Color scaffoldBackground = Color(0xFF1E2129);
    const Color orangeButton = Color(0xFFFF7A00);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = Provider.of<LegecyCaptureVideoController>(context, listen: false);
      if (controller.cameraController == null ||
        !controller.cameraController!.value.isInitialized) {
        controller.initCamera();
      }
    });

    Future<void> _disposeCamera(BuildContext context) async {
      final controller = Provider.of<LegecyCaptureVideoController>(context, listen: false);
      controller.dispose();
    }

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
            padding: EdgeInsets.symmetric(vertical: 32.h),
            child: Column(
              children: [
                Stack(
                  children: [
                    Consumer<LegecyCaptureVideoController>(
                      builder: (context, controller, _) {
                        final containerHeight = 528.h; // Fixed height

                        return Container(
                          width: 350.w,
                          height: containerHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black,
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Stack(
                            children: [
                              // Video preview or camera preview
                              controller.hasRecording
                                  ? controller.videoController != null &&
                                            controller
                                                .videoController!
                                                .value
                                                .isInitialized
                                        ? AspectRatio(
                                            aspectRatio: controller
                                                .videoController!
                                                .value
                                                .aspectRatio,
                                            child: VideoPlayer(
                                              controller.videoController!,
                                            ),
                                          )
                                        : const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                  : (controller.cameraController != null &&
                                        controller
                                            .cameraController!
                                            .value
                                            .isInitialized)
                                  ? CameraPreview(controller.cameraController!)
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    ),

                              // Recording timer overlay while recording
                              if (controller.isRecording)
                                Positioned(
                                  top: 12.h,
                                  left: 12.w,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                      vertical: 4.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Text(
                                      controller.formatDuration(
                                        Duration(
                                          milliseconds:
                                              (controller.progress *
                                                      LegecyCaptureVideoController
                                                          .maxDuration
                                                          .inMilliseconds)
                                                  .toInt(),
                                        ),
                                      ),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),

                              // After recording overlay duration at bottom center
                              if (!controller.isRecording &&
                                  controller.hasRecording)
                                Positioned(
                                  bottom: 12.h,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 6.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                      ),
                                      child: Text(
                                        controller.videoController != null &&
                                                controller
                                                    .videoController!
                                                    .value
                                                    .isInitialized
                                            ? controller.formatDuration(
                                                controller
                                                    .videoController!
                                                    .value
                                                    .duration,
                                              )
                                            : "",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Consumer<LegecyCaptureVideoController>(
                  builder: (context, controller, _) {
                    final isVideoPlaying = controller.isPlayerReady
                      ? controller.videoController!.value.isPlaying
                      : false;
                    return RecordControlPanel(
                      onRecord: () => controller.recordVideo(),
                      onReset: () => controller.reset(),
                      onDelete: () => controller.delete(),
                      isRecording: controller.isRecording,
                      progress: controller.progress,
                      hasRecording: controller.hasRecording,
                      isPlayerPlaying: isVideoPlaying,
                      onPlay: () => controller.playVideo(),
                      onPause: () => controller.pauseVideo(),
                    );
                  },
                ),
                //SizedBox(height: 30.h),
                Consumer<LegecyCaptureVideoController>(
                  builder: (context, controller, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xFF353953),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/icons/micro_phone.svg'),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        SizedBox(
                          width: 300,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: orangeButton,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    contentPadding: const EdgeInsets.all(24),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Success!',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          'Hey, your image is all set in the Education Capsule!',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        SizedBox(height: 24),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: orangeButton,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                            onPressed: () {
                                              context.push('/legecy_home');
                                            },
                                            child: const Text(
                                              'OK',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
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
