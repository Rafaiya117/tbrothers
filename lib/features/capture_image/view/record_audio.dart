import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/capture_image/controller/audio_recording_controller.dart';
import 'package:appsoleum/features/capture_image/custom_widget/custom_audio_video_recorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class RecordAudio extends StatefulWidget {
  const RecordAudio({super.key});

  @override
  State<RecordAudio> createState() => _RecordAudioState();
}

class _RecordAudioState extends State<RecordAudio> {
  @override
  Widget build(BuildContext context) {
    final recordingController = Provider.of<RecordingController>(context);
   return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        //height: double.infinity,
          decoration: BoxDecoration(
            gradient: AppGradientColors.background_color
          ),
          child: Padding(
            padding:EdgeInsets.symmetric(vertical: 32.h),
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/arrow_back.svg',
                      width: 16.w,
                      height: 10.h,
                    ),
                    SizedBox(width:100.w),
                    Align(
                      alignment: Alignment.center,
                        child: Text(
                          "Record Message",
                        style: GoogleFonts.inter(
                          color: FontColors.text_colors,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    SizedBox(width:50.w),
                    IconButton(
                      onPressed: (){}, 
                      icon: Icon(Icons.more_vert_outlined, color:Color(0xFFFFFFFF) ,)
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Stack(
                  children: [
                    Container(
                      width: 350.w,
                      height: 528.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: FontColors.background_color,
                    ),
                  ),
                ],
              ),
              SizedBox(height:20.h),
               RecordControlPanel(
                onRecord: () => recordingController.record(),
                onReset: () => recordingController.reset(),
                onDelete: () => recordingController.delete(),
                isRecording: recordingController.isRecording,
                progress: recordingController.progress,
              ),
            ],
          ),
        ),
      ),
    );
  }
}