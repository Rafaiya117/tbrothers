import 'package:appsoleum/core/components/custom_navigation_bar.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/gallary_and_timeline/gallery/controller/gallary_and_timeline_controller.dart';
import 'package:appsoleum/features/gallary_and_timeline/commons/widgets/custom_emotional_card.dart';
import 'package:appsoleum/features/gallary_and_timeline/commons/widgets/media_selector.dart';
import 'package:appsoleum/features/gallary_and_timeline/commons/widgets/selectable_text_button.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/widget/time_line_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TimeLineView extends StatelessWidget {
  const TimeLineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: AppGradientColors.background_color,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32.h, horizontal:16.w),
            child: Column(
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Memories",
                      style: GoogleFonts.inter(
                        color: Color(0xFFFFFFFF),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width:190.w),
                    CircleAvatar(
                        radius: 15.r,
                        backgroundColor: Color(0xFFFFFFFF),
                        child: SvgPicture.asset(
                          'assets/icons/grid_icon.svg',
                          width: 16.67.w,
                          height: 15.h,
                      ),
                    ),
                    SizedBox(width:5.w),
                    CircleAvatar(
                        radius: 15.r,
                        // ignore: deprecated_member_use
                        backgroundColor:FontColors.icon_color.withOpacity(0.84),
                        child: SvgPicture.asset(
                          'assets/icons/gridTwo.svg',
                          width: 16.67.w,
                          height: 15.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(height:20.h),
                Consumer<GalleryTimelineController>(
                  builder:(context,controller,_){
                    return 
                    MediaToggle(
                          controller: controller,
                          onSelectionChanged: (value) {
                            switch (value) {
                            case 'Gallery':
                              context.push('/gallary_view');
                            break;
                            // case 'Videos':
                            //   context.push('/videos_view');
                            //   break;
                            case 'Timeline':
                              context.push('/timeline_view');
                            break;
                          default:
                            print('Unknown selection: $value');
                        }
                      },
                    );
                  }
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 60.h,
                  child: SearchBar(
                    hintText: 'Search...',
                    hintStyle: WidgetStateProperty.all<TextStyle>(
                      TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                    leading: Icon(Icons.search, color: Color(0xFFFFFFFF)),
                    onChanged: (value) {
                      print('Search text: $value');
                    },
                    onSubmitted: (value) {
                      print('Submitted search: $value');
                    },
                    shape: WidgetStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    elevation: WidgetStateProperty.all<double>(1.0),
                    backgroundColor: WidgetStateProperty.all<Color>(
                      Color(0xFF2A2E52),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "All memory highlights",
                    style:GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: FontColors.text_colors,
                    ),
                  ),
                ),
                SizedBox(height: 5.h,),
                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 150,
                        child: EmotionalCard(
                          title: "Emotional",
                          imageUrls: [
                            "assets/images/image1.png",
                            "assets/images/image2.png",
                            "assets/images/image3.png",
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 150,
                        child: EmotionalCard(
                          title: "Happy",
                          imageUrls: [
                            "assets/images/image1.png",
                            "assets/images/image2.png",
                            "assets/images/image3.png",
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 150,
                        child: EmotionalCard(
                          title: "Memories",
                          imageUrls: [
                            "assets/images/image1.png",
                            "assets/images/image2.png",
                            "assets/images/image3.png",
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    // Left-aligned text
                    Expanded(
                      child: Text(
                        "All Memories",
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w), 
                    SvgPicture.asset(
                      'assets/icons/settings.svg',
                      width: 32.w,
                      height: 32.h,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SelectableTextButton(
                      label: "All Media",
                      isSelected: true,
                      onPressed: () {
                        // Handle tap
                      },
                      textColor: Colors.white,
                      backgroundColor: Color(0xFF2A2E52),
                      borderRadius: 30.r,
                      borderColor: Colors.orange,
                      selectedGradient: LinearGradient(
                        colors: [Color(0xFF592F17), Color(0xFFFE8641)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    SelectableTextButton(
                      label: "Photos",
                      isSelected: true,
                      onPressed: () {},
                      textColor: Colors.white,
                      backgroundColor: Color(0xFF2A2E52),
                      borderRadius: 30.r,
                    ),
                    SelectableTextButton(
                      label: "Videos",
                      isSelected: false,
                      onPressed: () {
                        context.push('/video_time_line');
                      },
                      textColor: Colors.white,
                      backgroundColor: Color(0xFF2A2E52),
                      borderRadius: 30.r,
                      //borderColor: Colors.orange,
                    ),
                    SelectableTextButton(
                      label: "Notes",
                      isSelected: true,
                      onPressed: () {},
                      textColor: Colors.white,
                      backgroundColor: Color(0xFF2A2E52),
                      borderRadius: 30.r,
                    ),
                  ],
                ),
                SizedBox(height:5.h),
                Consumer<GalleryTimelineController>(
                  builder: (context, controller, _) {
                    final entries = controller.entries;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(16),
                      itemCount: entries.length,
                      itemBuilder: (context, index) {
                        return TimelineCard(
                          entry: entries[index],
                          isFirst: index == 0,
                          isLast: index == entries.length - 1,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:Consumer<GalleryTimelineController>(
        builder: (context, controller, child) {
          return CustomBottomNavBar(
            currentIndex: controller.selectedIndex,
            onTap: (index) => controller.onNavItemTapped(index),
          );
        },
      ),
    );
  }
}