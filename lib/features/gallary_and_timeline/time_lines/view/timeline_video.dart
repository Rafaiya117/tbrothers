import 'package:appsoleum/core/components/custom_media_toogle.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/controller/timeline_video.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/widget/video_card.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/widget/videoplayer_expand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TimelineVideo extends StatelessWidget {
  const TimelineVideo({super.key});

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
              // Consumer<TimelineVideoController>(
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
              Consumer<TimelineVideoController>(
                builder: (context, controller, _) {
                  return CustomNavTab(items: controller.navItems, currentScreen: this,);
                },
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: Consumer<TimelineVideoController>(
                  builder: (context, controller, child) {
                    final videoList = controller.videoList;

                    return GridView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: videoList.length,
                      gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1.2,
                        ),
                      itemBuilder: (context, index) {
                        final video = videoList[index];
                        return VideoCard(
                          thumbnailPath: video.thumbnail,
                          duration: video.duration,
                          onTap: () {
                           showDialog(
                            context: context,
                              builder: (_) => Dialog(
                                backgroundColor: Colors.black,
                                child: SimpleVideoViewer(
                                  videoPath: video.videoPath,
                                ),
                              ),
                            );
                          },
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