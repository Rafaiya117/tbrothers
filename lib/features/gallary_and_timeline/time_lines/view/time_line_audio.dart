import 'package:appsoleum/core/components/custom_media_toogle.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/controller/time_line_audio_controller.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/widget/audio_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TimeLineAudio extends StatelessWidget {
  const TimeLineAudio({super.key});

  @override
  Widget build(BuildContext context) {
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
                    SizedBox(width:100.w),
                    Align(
                      alignment: Alignment.center,
                        child: Text(
                          "Tony Martinez",
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
              // Consumer<TimeLineAudioController>(
              //   builder:(context,controller,_){
              //     return 
              //       MediaToggle(
              //         controller: controller,
              //           onSelectionChanged: (value) {
              //             switch (value) {
              //               case 'Photos':
              //                 context.push('/time_line_image');
              //               break;
              //               case 'Videos':
              //                 context.push('/video_time_line');
              //                 break;
              //               case 'Audios':
              //                 context.push('/time_line_audio');
              //               break;
              //             default:
              //               print('Unknown selection: $value');
              //           }
              //         },
              //       );
              //     }
              //   ),
              //SizedBox(height: 10.h),
              Consumer<TimeLineAudioController>(
                builder: (context, controller, _) {
                  return CustomNavTab(items: controller.navItems, currentScreen: this,);
                },
              ),
              Expanded(
                child: Consumer<TimeLineAudioController>(
                  builder: (context, controller, _) {
                    return ListView.builder(
                      itemCount: controller.audioList.length,
                      itemBuilder: (context, index) {
                        final audio = controller.audioList[index];
                        final isPlaying =
                            controller.currentlyPlayingIndex == index &&
                            controller.isPlaying;
                
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: AudioCard(
                            title: audio.title,
                            isPlaying: isPlaying,
                            onPlay: () => controller.toggleAudio(index),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}