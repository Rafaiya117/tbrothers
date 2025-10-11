import 'package:appsoleum/core/components/custom_button.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/capture_message/controller/audio_recording_controller.dart';
import 'package:appsoleum/features/capture_message/custom_widget/custom_audio_video_recorder.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
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
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppGradientColors.background_color,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 32.h),
          child: Column(
            children: [
              /// Top AppBar Row
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                  child:SvgPicture.asset(
                      'assets/icons/arrow_back.svg',
                      width: 16.w,
                      height: 10.h,
                    ),
                  ),
                  SizedBox(width: 100.w),
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
                  SizedBox(width: 50.w),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert_outlined,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              /// Main Container (Waveform appears here)
              Stack(
                children: [
                  Container(
                    height: 530,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: FontColors.background_color,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      children: [
                        /// Background loader if nothing yet
                        if (!recordingController.isRecording &&
                            !recordingController.isPlayerReady)
                          const Center(child: CircularProgressIndicator()),

                        /// Center waveform display
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (recordingController.isRecording)
                                Column(
                                  children: [
                                    AudioWaveforms(
                                      enableGesture: false,
                                      size: const Size(double.infinity, 120),
                                      recorderController: recordingController.recorderController,
                                      waveStyle: WaveStyle(
                                        waveColor: Color(0xFF1E88E5), 
                                        extendWaveform: true,
                                        showMiddleLine: false,
                                        waveThickness: 2,
                                        spacing: 3,
                                        backgroundColor: Color(0xFF2B3A61), 
                                      ),
                                    ),
                                    const SizedBox(height: 8),                                    
                                  ],
                                )
                              else if (recordingController.isPlayerReady)
                                Column(
                                  children: [                          
                                    AudioFileWaveforms(
                                      size: const Size(double.infinity, 120),
                                      playerController:recordingController.playerController,
                                      enableSeekGesture: true,
                                      waveformType: WaveformType.long,
                                      playerWaveStyle: PlayerWaveStyle(
                                        fixedWaveColor: Color(0xFF2B3A61),
                                        liveWaveColor: Color(0xFF1E88E5),
                                        spacing: 5,
                                        waveThickness: 4,
                                        showSeekLine: true,
                                        seekLineColor: Colors.white,
                                        seekLineThickness: 1,
                                        backgroundColor: Color(0xFF2B3A61),
                                      ),
                                    ),
                                  const SizedBox(height: 8),
                                ],
                              )                             
                            ],
                          ),
                        ),
                        Positioned(
                          top: 12,
                          right: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                            decoration: BoxDecoration(
                              // ignore: deprecated_member_use
                              color: Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.mic, color: Colors.white, size: 18),
                                SizedBox(width: 6),
                                Text(
                                  "Audio",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        /// Bottom-center timer
                        Positioned(
                          bottom: 16,
                          left: 120,
                          right: 120,
                          child: Container(
                            width: 62,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (recordingController.isRecording)
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  const SizedBox(width: 6),
                                  Text(
                                    recordingController.formatDuration(
                                      Duration(
                                        milliseconds: (recordingController.progress *
                                          RecordingController.maxDuration.inMilliseconds).toInt(),
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),
              /// Bottom control panel (unchanged)
              RecordControlPanel(
                onRecord: () => recordingController.record(),
                onReset: () => recordingController.reset(),
                onDelete: () => recordingController.delete(),
                isRecording: recordingController.isRecording,
                progress: recordingController.progress,
                isPlayerPlaying: false,
                onPlay: () {},
                onPause: () {},
              ),

              SizedBox(height: 20.h),
              /// Done button
              CustomRoundedButton(
                text: "Done",
                backgroundColor: FontColors.button_color,
                textColor: Colors.white,
                onPressed: () {
                  // context.push('/home_page');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}