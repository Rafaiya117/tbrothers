import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/gallary_and_timeline/commons/widgets/media_selector.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/controller/timeline_image_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TimeLineImage extends StatelessWidget {
  const TimeLineImage({super.key});

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
                    SvgPicture.asset(
                      'assets/icons/arrow_back.svg',
                      width: 16.w,
                      height: 10.h,
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
              Consumer<TimelineImageController>(
                builder:(context,controller,_){
                  return 
                    MediaToggle(
                      controller: controller,
                        onSelectionChanged: (value) {
                          switch (value) {
                            case 'Photos':
                              context.push('/time_line_image');
                            break;
                            case 'Videos':
                              context.push('/video_time_line');
                              break;
                            case 'Audios':
                              context.push('/time_line_audio');
                            break;
                          default:
                            print('Unknown selection: $value');
                        }
                      },
                    );
                  }
                ),
              SizedBox(height: 20.h),
              Expanded(
                child: Consumer<TimelineImageController>(
                  builder: (context, controller, child) {
                    final imagePaths = controller.imagePaths;
                    return GridView.builder(
                      padding: const EdgeInsets.all(12),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 167 / 148, 
                      ),
                      itemCount: imagePaths.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 167,
                          height: 148,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              imagePaths[index],
                              fit: BoxFit.cover,
                            ),
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